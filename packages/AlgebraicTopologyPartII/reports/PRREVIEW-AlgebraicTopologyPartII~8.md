# Review of AlgebraicTopologyPartII (pull request #1694 at 674154f)

**Verdict:** needs changes

This head is the one the previous review read (674154f), and the folder has not changed. The gate passes, `Suggested.lean` elaborates with `sorry` as the only warning, and the dependency check reports no problem. There are two P3 findings and nothing blocking:
- R01 is the previous review's R01, still unrepaired.
- R02 is new. It is leftover bookkeeping from moving the old local §14.4 Ext-stalk target to a supplier.

## R01 (P3) — Gap `configuration-cover-comparison` still differs from the plan (previous R01, not repaired)

**Location.** `TauCetiRoadmap/AlgebraicTopologyPartII/README.md` line 132 reads: "What EtaleDualityAndPerverseSheaves must provide (gap:configuration-cover-comparison): Expose §§3.5–3.7 on the ordered-root S_m torsor … compatible in one comparison diagram with InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T2–IG.0.T4."

**Claim.** The intake reads this sentence as the declared contract for the gap. It must equal the plan's `needs`.

**Witness.** In `packages/AlgebraicTopologyPartII/design/plan.json`, this gap has section "3.5–3.8 and 6.5" and the needs "Expose §§3.5–3.8 and §6.5 … compatible in one comparison diagram." I compared the README sentence with the plan for all 14 gaps: 13 are equal word for word, and this one differs.

**Repair.**
1. Replace the text after "(gap:configuration-cover-comparison): " with the plan's `needs`, word for word.
2. Change nothing else. Line 130 already states the compatibility with §§IG.0.T2–IG.0.T4 as ordinary prose.

Both added supplier sections exist at the EtaleDualityAndPerverseSheaves head (#1040): §3.8 "Analytic smooth trace compatibility" and §6.5 "Contraction and Frobenius twisting".

**Test.** After the repair, the README-versus-plan comparison reports 14 of 14 equal.

No repair report marks this finding not actionable.

## R02 (P3) — The Ext-stalk gap is attached to Layer 14, but its consumer is §15.6

**Location.** Four places in `TauCetiRoadmap/AlgebraicTopologyPartII/README.md`:
- Line 1397, Layer 14 Dependencies: "TauCetiRoadmap.MotivesAndAlgebraicCycles §7.6a (gap:semialgebraic-ext-stalk); … §7.2."
- Line 30: "Layers 8, 12 and 14 apply those interfaces."
- Line 1509, the §15.6 *Needs:* line: "TauCetiRoadmap.MotivesAndAlgebraicCycles §7.6a (finite-group Ext-stalk comparison)".
- Line 1521, the Layer 16 opening: "finite-index invariant lattices, finite-group Ext stalks and the exact double-cover diagram comparison".

**Claim.** The internal Ext-stalk comparison used to be a local Layer 14 target (§14.4) and now lives behind `gap:semialgebraic-ext-stalk`. Its only consumer is §15.6. The README still sends it to Layer 14 and to Layer 16, and §15.6 cites it as if §7.6a already supplied it.

**Witness.**
- None of the three Layer 14 *Needs:* lines (1352, 1365, 1389) uses the gap.
- The gap contract (line 205) and §15.6 both rest on B19 Lemma 7.5. In `plan.json`, node `AT2.14/equivariant-ext-stalk` is a prerequisite only of `AT2.15/circle-extension`, which is §15.6.
- MotivesAndAlgebraicCycles §7.6a at its open head (#1313) never mentions Ext or stalks.
- No §16 target states an Ext stalk.

**Repair.**
1. Line 30: replace "Layers 8, 12 and 14 apply those interfaces" with "§§8.1, 12.1 and 15.6 apply those interfaces".
2. Line 1397: delete " (gap:semialgebraic-ext-stalk)".
3. In the §15.6 *Needs:* line (1509) and in the Layer 15 Dependencies (1517): replace "(finite-group Ext-stalk comparison)" with "(gap:semialgebraic-ext-stalk)".
4. Line 1521: replace "finite-index invariant lattices, finite-group Ext stalks and the exact double-cover diagram comparison" with "finite-index invariant lattices and the exact double-cover diagram comparison".

**Test.**
- `grep -n "gap:semialgebraic-ext-stalk"` should then hit only the contract (line 203), §15.6 and the Layer 15 Dependencies.
- The Layer 14 Dependencies should no longer name a gap that none of its targets uses.

## Previous findings

- **R01 — not repaired.** README line 132 still reads "Expose §§3.5–3.7 on the ordered-root S_m torsor … with InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T2–IG.0.T4." It is R01 above.
- **R02 (fibre model of §16.1) — still repaired.** Lean lines 260–268 model the fibre on `Fin (n - k) → ℝ`. README lines 78 and 1525 name the rewrite by `finrank_euclideanSpace_fin`.

## Verified sound

**Gate, build and order**
- **Gate**, run at 674154f: `gate AlgebraicTopologyPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The worker's gate also reports `build=0`.
- **Outside the folder:** `git diff --stat origin/main...HEAD` shows 3 files, all in the folder.
- **Dependency check:** `depcheck: 238 roadmaps, 2323 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- **Merge order:** AlgebraicTopologyPartII is at line 225 of the merge order. Every open-PR supplier comes earlier:
  - SmoothBundlesConnections (12), TangentialBordism (14), StableHomotopyKTheory (16);
  - ComplexComparisonPartII (39), InverseGaloisAndArithmeticFundamentalGroups (54);
  - MotivesAndAlgebraicCycles (91), EtaleDualityAndPerverseSheaves (107).

  The other suppliers are on main: AlgebraicTopology, DGFloer, GeneralizedCohomology, SchemeAndStackFoundations, AffineMorseLefschetz, RealAnalyticGeometry, CharacteristicClasses, MorseNovikov, DifferentialGeometry, GeometricTopology, and RealAlgebraicGeometry (under `Completed/`).
- **No cycle with MorseNovikov.** MorseNovikov on main lists "AlgebraicTopologyPartII §13.3" under its Downstream consumers (line 1416), and §13.3 consumes MorseNovikov N6.
- **Elaboration:** `lake env lean` on a scratch copy gives 14 `declaration uses 'sorry'` warnings, at lines 69, 108, 165, 174, 189, 215, 231, 250, 374, 403, 418, 472, 489 and 505, and no error.
- **`#check @name` for all 38 declarations**, in one file: every type matches its README statement.
  - The 7 "looks dropped" leads in `signatures.md` are false. `ControlData`, `IsCompatible`, `IsInvariant`, `IsNormalized`, `IsControlledSubmersion`, `WhitneyB` and `IsWhitneyStratification` all carry `[(i : ι) → TopologicalSpace (S i)]` and `[(i : ι) → ChartedSpace (EuclideanSpace ℝ (Fin (d i))) (S i)]`.
  - The 4 Lean-name leads in `citations.md` are this roadmap's own declarations.
- **Padding probe:** every one of the 14 `sorry`s was replaced by `intros; first | rfl | trivial | infer_instance | simp | (constructor <;> simp) | aesop`. All 14 fail, so nothing is padding.

**Sources: the seeded sample, read at the locator.** All 15 targets hold.

| Target | Source line(s) read | Agreement |
|---|---|---|
| 2.1 | CEF line 860 (Proposition 3.3, p.19); Frobenius q^i at line 871; BS lines 650–666 (Lemma 2.8 proof, p.907) | Range m+1≤i≤2m |
| 2.3 | CEF line 964 (Theorem 3.7, p.21) | Any ℚ-valued class function; the source has n≥1, and m=0 is a trivial extension that a README Check covers. Character inner product at line 955. |
| 3.1 | BS line 2211 (Definition 7.3, p.941) | Product equal to 1+(−1)^(n−1)NT, the README's 1+s_nNT |
| 3.5 | BS line 2322 (Corollary 7.5, p.943) | BS assumes d(n−3)>j. The README's ≥ is justified by its own truncation argument, since m>d forces m(n−3)>j. (7.3) is at line 2332. |
| 4.5 | BS line 2359 (Lemma 7.6 proof, p.944) | Rank (−1)^(k(n−2)−1) e_k(N) |
| 5.2 | PHAM lines 175–221 (Part I §2, pp.337–338) | Simplex model line 183; Theorem 1 line 196; equivariant retraction lemma line 207. The homotopy type of the join is the roadmap's own deduction, as its locator says. |
| 7.2 | B19 line 413, (2.6), p.73 | Differentials 1−σ, 1+σ, 1−σ. The pinned `homResolutionIso` complex is `ρ(g)−1` in even degrees and `N` in odd degrees, so the native convention is right. |
| 7.3 | BW lines 553–573 (§1.2.2, (1.29)–(1.31), p.15) | F is locally constant with stalks ℤ (line 510); isomorphism if i>dim X or j odd |
| 9.5 | BW line 749 (Proposition 1.8, pp.19–20); line 798 (Remark 1.9) | The x·γ̃+β(x)β(γ̃) formula is stated without proof, as the README says |
| 10.1 | BW line 809 (Proposition 1.10, p.21) | Trace and perfect pairing for finite M |
| 10.5 | BW line 876 (Theorem 1.12, p.22); proof through Lemma 1.13, line 901, pp.23–24 | Window pairing (1.47) at line 872 |
| 11.4 | BW line 1006 (Remark 1.17(i), p.25) | Stated without proof; the proof is a target here |
| 13.2 | BW line 1838 (Lemma 3.15, p.46; proof p.47) | The README takes the lemma's first conclusion, H^(2d−1) finite of odd order, as its hypothesis in place of Pic(X_C)[2]=0, and says so |
| 15.2 | B19 lines 1382–1394 (§7.1, p.97, ψ and Tr∘ψ=0); lines 1461–1466 (diagram (7.4) proof, p.99) | The source's step is a gap, see Source issues; the README repairs it |
| 16.2 | MATHER line 887 (Corollary 10.2, PDF p.31); line 915 (Corollary 10.3, PDF p.32); line 969 (Proposition 11.1, PDF p.34) | Equivariance is the roadmap's own target |

**Other sources read**
- BROUGHTON line 115 (Theorem 1.2, p.219; the OCR is inverted): every fibre c, μ−μ^c spheres.
- BW line 1659 (Lemma 3.5, p.41) for §13.1.
- MATHER lines 622–677 (axioms (A1)–(A11)) and line 727 (Proposition 9.1).

**Headline theorems** (read from the README) and how `Suggested.lean` handles them:
- Stated:
  - `configurationTraceFormula` (§2.3) and `stableConfigurationDiagonal` (§3.5), both in ordinary cohomology;
  - `tameFibreBouquet` (§4.2);
  - `rationalBouquetRanks` (§4.5), which at N=1 contains §4.4 for spheres of dimension ≥2;
  - `doubleLoopBetti` (§5.1), `phamStrongRetraction` (§5.3) and `fermatDoubleLoopSimplyConnected` (§5.4);
  - `equivariantEhresmannTransport` (§16.1);
  - Mather's flow, lift, control-data existence and isotopy lemmas (§§16.1c–e);
  - `equivariantStratifiedTransport` (§16.2).
- Named in the module docstring as not statable, with the missing carrier:
  - §2.1 and the compact-support forms;
  - Hilton (§4.3) and the double-loop algebra (§4.6);
  - the join (§5.2);
  - every semialgebraic real-locus theorem;
  - γ against Stiefel–Whitney, and the surface loops;
  - the quartic;
  - §§14.3, 15.4, 15.6, 16.3 and 16.4.

  At the pins there is no topological join (Mathlib's `Analysis/Convex/Join.lean` is the convex join) and no Whitehead product.

**Library declarations opened at the pins**
- Tau Ceti:
  - `TauCeti.FiniteField.fullCycleType_eq_map_natDegree_normalizedFactors` (`FieldTheory/GaloisGroups/FrobeniusOrbits.lean:106`): squarefree g, π acting as x↦x^card F;
  - `Equiv.Perm.fullCycleType` (`GroupTheory/Perm/Partition.lean:111`);
  - `TauCeti.IsRegularValue` (`Geometry/Manifold/RegularValue.lean`): every fibre point is regular;
  - `TauCeti.exists_regularFiber_smoothEmbedding` (`RegularValue/ManifoldLevel.lean:257`);
  - `TopCat.singularCohomology` (`AlgebraicTopology/Cohomology/Basic.lean`): with `ModuleCat ℚ`, R=ℚ and M=ℚ this is H^n(X;ℚ);
  - also present: `TauCeti.WedgeSum`, `TopPair`, `HomotopyGroup.zerothHomotopyEquiv`, `HomotopyGroup.loopSpaceEquiv`, `HomotopyGroup.piLoopSpaceMulEquiv`, `TauCeti.IsSemialgebraic`, `AbstractSimplicialComplex.Realization`, `TauCeti.SmoothEmbedding`, `exists_diffeomorph_normalBundle_subset`, `TauCeti.TopCat.serreFibrations` and `mem_serreFibrations_proj`.
- Mathlib:
  - `PowerSeries.binomialSeries` (`RingTheory/PowerSeries/Binomial.lean`): `mk fun n => Ring.choose r n • 1`, that is (1+X)^r. So `doubleLoopFactor` is (1+(−1)^(r(n−2)) t^(r(n−2)−1))^(−e_r) = (1−(−t)^(r(n−2)−1))^(−e_r), and the substituted series has zero constant term because r(n−2)−1≥1;
  - `Rep.FiniteCyclicGroup.homResolutionIso`, `groupCohomologyIsoEven` and `groupCohomologyIsoOdd` (`GroupCohomology/FiniteCyclic.lean:58, 80, 114`);
  - `finrank_euclideanSpace_fin` (`PiL2.lean:225`);
  - also present: `Representation.char_tensor`, `card_inv_mul_sum_char_eq_finrank`, `ArithmeticFunction.sum_eq_iff_sum_smul_moebius_eq`, `IsArtinianRing.quotNilradicalPowEquivPi`, `isNilpotent_nilradical`, `Manifold.IsSmoothEmbedding`, `Manifold.IsSubmersionAt`, `IsMIntegralCurveOn`, `tangentConeAt`, `intrinsicInterior`, `Geometry.SimplicialComplex`, `Module.End.maxGenEigenspace` and `CategoryTheory.Sheaf.H`.
- No pinned duplicate: neither pin has a Milnor algebra of an `MvPolynomial`, control data, a Whitney condition, a configuration space or an isotopy lemma. Tau Ceti's `jacobianIdeal` is the node algebra's, a different object.

**Cross-roadmap citations resolved**
- On main:
  - SchemeAndStackFoundations §§0.7, 2.5 (`cohomology_filtered_colimits`, line 3402), 2.7, 2.19 and 2.23 (`forget_injective` and `coind_injective`, lines 4570–4571);
  - AffineMorseLefschetz A4.0 (line 616) and A4.1 (line 946); RealAnalyticGeometry R2.1 (line 429);
  - RealAlgebraicGeometry Layers 3 and 6;
  - CharacteristicClasses C2 item 3 and C3 item 2;
  - SmoothBundlesConnections §B1; GeneralizedCohomology G2.10;
  - DGFloer Layer 1 item 2, with the four `arbitrary…SerreSpectralSequence` names.
- At open heads:
  - MotivesAndAlgebraicCycles §7.6a (README line 1401) and §7.6b (line 1412);
  - StableHomotopyKTheory §§3.36, 3.37 and 4.6;
  - EtaleDualityAndPerverseSheaves §§3.5, 3.6, 3.7, 3.8, 4.7 and 6.5;
  - InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T2–T4 and IG.5.1;
  - ComplexComparisonPartII §C−1.1; TangentialBordism §4.3 (B4.3).

**Gaps.** All 14 have a named supplier and the same slug in `plan.json` and the README. Thirteen sentences equal the plan's word for word; the fourteenth is R01.
- `finite-group-ext-stalk` is minimal: SchemeAndStackFoundations §2.23 on main has global equivariant Ext and its spectral sequences, but no internal Ext stalks.
- `semialgebraic-ext-stalk` is not already in MotivesAndAlgebraicCycles §7.6a.

**Ownership and overlaps.** These were checked through the `roadmaps` tools against the heads indexed on 2026-11-09.
- StratifiedSpacesAndTameTopology (#1519), the closest roadmap in vocabulary, names AlgebraicTopologyPartII §§16.1a–16.1e as the owner of smooth stratified spaces, Whitney (b), control data, controlled fields and Thom's first isotopy lemma, and consumes them (its README lines 46–49 and 195–209). So there is one owner. This roadmap cites no forbidden roadmap.
- Every id that other roadmaps cite here exists: §13.3 and §§16.1a, b, c and e.
- `overlaps.md` lists no PR that changes this folder and no dropped id.
- Hilton's decomposition, Milnor numbers, tame bouquets and Pham have no other owner.
- The Layer 4 rational sphere ranks use, rather than restate, StableHomotopyKTheory §3.37 (rational Hurewicz for H-spaces).

**Shape.** Every layer ends with Examples and Dependencies. Every definition of this roadmap has at least 3 Checks: §1 has 3, §4.1 has 4, §4.3 has 4, §5.3 has 6, §9.2 has 4, §15.2 has 4, and §16.1b has 5. There are no process words, and all 62 *Needs:* lines are present.

**Adversarial table.** The values were computed in this review.

| Statement | Instances | Values (left / right) | Result |
|---|---|---|---|
| `configurationTraceFormula` | q=2, m=2, χ≡1 | #{x²+x, x²+x+1} = 2 / 4−2·1 = 2 | holds |
| same | q=2, m=2, χ=sgn | (+1)+(−1) = 0 / 4·0−2·⟨sgn,H¹⟩ = 0, since the swap is trivial on H¹ | holds |
| same | q=2, m=3, χ≡1 | q³−q² = 4 / 8−4·1+2·0 = 4, since Conf₃(ℂ) has rational ranks 1,1,0 | holds |
| same | m=0 | χ(∅), from f=1 / χ(∅), from S₀ and the point | holds |
| `eulerExponent` (§§3.1–3.2) | (4,2,r) and (5,2,r) for r=1..3; (5,1,r) for r=1..4; r=0 | −2,−1,−2 and 2,−3,2 / BS (7.2) the same; 1,−1,0,0; 0 at r=0 (0/0 junk value) | holds |
| §3.1 product | N=1, n even / n odd | (1−T)¹ = 1−T / (1−T)⁻¹(1−T²) = 1+T, which is 1+s_nNT | holds |
| `doubleLoopFactor` | n=5, N=1, r=1,2 | subst gives (1−t²)⁻¹ and 1+t⁵ / README (1+t⁵)/(1−t²) | holds |
| `stableConfigurationDiagonal` | (s,N,j,d) = (0,3,2,2) | dim Λ²ℚ³ = 3 / [t²](1+t)³ = 3 | holds |
| same | (0,3,3,3) | Λ³ gives 1, plus m=2 on the trivial H¹ giving 3, total 4 / [t³](1+t)³(1+t³)³ = 1+3 = 4 | holds |
| same | (1,1,2,1); j=0 | 1 / [t²](1−t²)⁻¹(1+t⁵) = 1; and 1 / 1 | holds |
| same | (0,1,1,0) | `hd` fails; LHS 0 / RHS 1 | `hd` needed |
| `tameFibreBouquet` | z^k, a≠0 / a=0 | k points / wedge of k−1 copies of S⁰, k points; 1 point / empty wedge, 1 point | holds |
| same | x³−3x+y² | J_f = ℂ[x]/(x²−1), f ≡ −2x, μ=2, μ^(±2)=1 / one circle at ±2, two at 0 | holds |
| same | n=0, f=c, a≠c | empty fibre / one S⁰, two points | `hn` needed |
| `rationalBouquetRanks` | s=1 (S³), N=2, k=1,2,3 | (−1)·e₁(4,2)=2; 0 since 2∤3; (−1)³·e₂(4,2)=1 / Hilton: two S³, then 0, then L₂(2)=1 copy of S⁵ | holds |
| same | s=0, N=2 | ranks 2,3,2 in degrees 2,3,4 / Hilton the same | holds |
| `doubleLoopBetti` | S⁴ (s=1,N=1); N=0 | 1,0,1,0,1,1,1 / coefficients of (1+t⁵)/(1−t²); 1,0,0 / empty product 1 | holds |
| `phamStrongRetraction` | n=0; n=1, k=3; k=(2,2) | ∅ / ∅ (vacuous); μ₃=S, r=id; (1,0) is fixed, (√2,i) ∈ X∖S | holds |
| `fermatDoubleLoopSimplyConnected` | n=5, k≡2; n=4 | π₂S⁴=π₃S⁴=0 / connected and simply connected; π₁Ω²S³=ℤ | n≥5 needed |
| `equivariantEhresmannTransport` | x² on ℝ, b=1; b=0 | h(−x) = (x²,−x/\|x\|) = (σ_B×σ_M)h(x); fibres of 0,1,2 points across 0 | `hreg` needed |
| `equivariantStratifiedTransport` (§16.2) | ℝ×S¹, σ_M(x,z)=(x,z̄) | unaveraged lift: h(π/2,1)=(π/2,−i) / (σ_B×σ_M)h = (π/2,i); averaged lift ∂_x gives h=id | averaging needed |
| `ControlData`, `WhitneyB` (§§16.1a–b) | 3 strata of ℝ²; cusp; t·sin(1/t) | Jacobian 2xy/√(x²+2y²) ≠ 0; distance ≤ \|t\|/2 → 0 / distance → 1 | holds |
| §2.1 | PConf₂ | ordinary ranks 1,1 in degrees 0,1 / compact ranks 1,1 in degrees 4,3, inside [3,4] | holds |
| §5.2 | K₂,₂; K₂,₃; three copies of S⁰ | E−V+1 = 1 and 2 / ∏(k_i−1) = 1 and 2; octahedron S² | holds |
| §7.2 | u_q | u₁(σ−1) = 1−σ = (1−σ)u₀; u₂(1+σ) = −(1+σ) = (1+σ)u₁ | holds |
| §7.3 | S¹ trivial, j=0, i=1 / i=2 | ℤ against target 𝔽₂, not an isomorphism, and none is claimed since i = dim Y; 𝔽₂ / H⁰⊕H² = 𝔽₂, an isomorphism | holds |
| §9.5 | d=2: i=4, j=1 and i=3, j=1 | window {1} / {0} | holds |
| §10.1 | Spec C; Spec R | H⁰_G(orbit;M)=M paired with M^∨ / zero paired with zero | holds |
| §10.5 | RP², x=1, y=a | deg(a+a²) = 1 / uncorrected deg(a) = 0 | γ needed |
| §11.4 | ℙ¹, real point, i=3, j=0 | H¹(G,ℤ(1)) = 𝔽₂ / H³_G(ℂP¹,ℤ) ≅ H¹(RP¹,𝔽₂) = 𝔽₂, real Gysin 1↦1 | injective |
| §13.2 | ℙ¹; Spec R | ℤ→ℤ/2 with kernel 2ℤ, then 𝔽₂≅𝔽₂≅𝔽₂ (Hochschild–Serre E₂^(1,0), E₂^(2,0), E₂^(3,0)) / all zero | holds |
| §15.2 | n=2, n=3 | ψ[(1,0)] = (−1,1), trace 0, reduction (1,1) / ψ[(1,0,0)] = (−2,1,1) ≡ (1,1,1) | holds |
| R02 | Layer 14 *Needs:* versus Dependencies | {§7.6a, AT Stage 5, §14.1, §7.4, §2.23} / that set plus the ext-stalk gap and §7.2; §7.6a at head #1313 has 0 occurrences of "Ext" | finding |

## Not verifiable

These are settled and cited by locator only, so I did not read them:
- uncertified: HILTON (Theorem A and Corollary 4.10), DIMCA (Lemma 4), BRUMFIEL (pp.163–169), SCHEIDERER (Corollary 18.11) and BCR (Theorem 9.3.2);
- waived: KRASNOV (Theorem 2.1).

MATHER and BROUGHTON are OCR scans. I read the theorem numbers and page markers through the noise; BROUGHTON line 117 is printed upside down.

## Source issues

- **Misprint** in BS at Lemma 7.4 proof, printed p.942 (BS lines 2266–2268): the source writes the first two weighted sums with compactly supported cohomology; it should use ordinary H^i and H^(m−i), then apply Poincaré duality to compact degree m+i; affects the proof.
- **Misprint** in BS at Lemma 7.4 proof, printed p.943 (BS line 2319): the source writes the final product as ∏(1−qU^k) with no exponent; it should carry the exponent −e_k(N), as in the lemma; affects nothing.
- **Error** in BS at Lemma 7.6, printed p.944 (BS line 2354): the source assumes n>2; it should assume n≥4, because at n=3 Ω²X has infinitely many components and the k=1 factor has base 0; affects a stated result.
- **Misprint** in BS at Lemma 7.6 proof, printed p.944 (BS line 2363): the source uses the smash symbol for the bouquet; it should be the wedge of N spheres; affects nothing.
- **Misprint** in BS at Lemma 2.8 proof, printed p.907 (BS line 665): the source says PConf_m is affine of dimension m−1; it should say the quotient PConf_m/G_a; affects nothing.
- **Error** in B19 at Lemma 7.3, printed p.98 (B19 lines 1444–1445): the source reduces p*η+ψ(ζ); it should be p*η−ψ(ζ), given (1,−φ) in (7.2) and ψ ≡ diag∘φ mod n; affects a stated result.
- **Gap** in B19 at the proof of diagram (7.4), printed p.99 (B19 line 1465): the source extends equality from S* using injectivity of Q→j_*j*Q; it needs injectivity of the target restriction on p_*(ℤ/n); affects the proof.
- **Misprint** in BW at §1.2.6, internal p.17 (BW line 645): the source writes the coordinatewise pushforward as starting from H^p(X(R)); it should start from H^p(Y(R)); affects nothing.
