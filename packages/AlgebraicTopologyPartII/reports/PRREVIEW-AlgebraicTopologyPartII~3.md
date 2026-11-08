# Review of AlgebraicTopologyPartII (pull request #1694 at c182acb)

**Verdict:** needs changes

The gate passes and the mathematics checks out (results below). What blocks is one ownership defect: the latest commit plans a second copy of a layer that another open roadmap owns. The other five findings are P3. Of the previous review's two findings, R01 is not repaired (it is R02 here) and R02 is partly repaired (its remainder is R05 here).

## R01 (P2) — §§16.1a–16.1e duplicate StratifiedSpacesAndTameTopology Layer 5, so the material has two owners

**Location.** `TauCetiRoadmap/AlgebraicTopologyPartII/README.md` line 21: "Sections 16.1a–16.1e own smooth stratified spaces and Whitney stratifications of closed subsets of manifolds, Thom–Mather control data with their existence …, controlled vector fields … and Thom's first isotopy lemma". The same claim is at line 7, the material is §§16.1a–16.1e (lines 1501–1617), and `Suggested.lean` lines 236–448 state the five Mather theorems.

**Claim.** This roadmap owns tubes and control data, Whitney's condition (b), Mather's existence theorem, controlled vector fields with their lifts and flows, and the first isotopy lemma (controlled and embedded forms).

**Witness.** StratifiedSpacesAndTameTopology (#1519, head 75f45e5) `README.md` line 36 owns "Thom–Mather control data …, Whitney's condition (b), Mather's existence theorem, controlled vector fields and Thom's first isotopy lemma". Its lines 61–63 and 1177 say AlgebraicTopologyPartII 16.2 consumes 5.1, 5.4 and 5.5.

**Why it is the owner.** StratifiedSpacesAndTameTopology is not in the merge order. Every one of its suppliers is on main, so it is placed before this roadmap and is the earlier owner. At 5ba2f00 this README consumed it correctly (line 21, the supplier contract at line 136 and the §16.2 *Needs:* line), and depcheck reported 0 problems.

**Repair.**
1. Restore the 5ba2f00 form: the scope bullet naming StratifiedSpacesAndTameTopology §§5.1, 5.4 and 5.5 as owner, and the "From TauCetiRoadmap.StratifiedSpacesAndTameTopology" contract. That contract reduces A∩f⁻¹(U), over a relatively compact chart ball, to the supplier's finite-stratum Thom–Mather spaces.
2. Delete §§16.1a–16.1e and the line-7 clause. Point §16.2's *Needs:* at the supplier's §§5.1, 5.4 and 5.5.
3. In `Suggested.lean`, delete `ControlData.exists_flow`, `ControlData.exists_isControlledVectorField_lift`, `ControlData.exists_trivialization`, `exists_controlData_isCompatible` and `firstIsotopyLemma`, which are the supplier's headlines. Also delete the definitions only they use: `IsSmoothStratification`, `ControlData.IsControlledVectorField` and `ControlData.IsControlledSubmersion`.
4. Keep `equivariantStratifiedTransport` with the carriers its statement needs (`StratumLT`, `WhitneyB`, `IsWhitneyStratification`, `ControlData`, `ControlData.IsCompatible`, `ControlData.IsInvariant`). Describe them in §16.2 as the acceptance carriers for the supplier's notions. The supplier's `Suggested.lean` declares none of them, so no name clashes.
5. If you want the general form here (locally finite strata, ambient manifold, manifold base) as a library theorem, ask StratifiedSpacesAndTameTopology §5 for it as a declared gap rather than owning a second copy.

**Test.** After the repair, `roadmaps grep -i 'isotopy lemma|control data|Whitney stratif'` shows this roadmap only citing the supplier, and the supplier's line 61 sentence is true again.

## R02 (P3) — Gap `configuration-cover-comparison` still differs from the plan (previous R01, not repaired)

**Location.** `README.md` line 128: "Expose §§3.5–3.7 on the ordered-root S_m torsor … compatible in one comparison diagram with InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T2–IG.0.T4."

**Claim.** This is the gap contract the intake reads.

**Witness.** The plan's `gaps` entry in `packages/AlgebraicTopologyPartII/design/plan.json` has section "3.5–3.8 and 6.5" and needs "Expose §§3.5–3.8 and §6.5 … compatible in one comparison diagram." The board package README line 108 carries the plan's text. The other 13 gap sentences match the plan exactly.

**Repair.** After the design stage the plan's existing gaps are fixed, so make README line 128 the plan's sentence verbatim (§§3.5–3.8 and §6.5). If you want the IG.0.T2–T4 compatibility, state it in a separate sentence outside the gap contract.

**Test.** The script comparing each "What X must provide (gap:slug):" sentence with `plan.json` then reports 14 of 14 equal.

## R03 (P3) — The §16.1 and §16.2 routes use a Riemannian exponential chart that no *Needs:* line names

**Location.** `README.md` line 1492: "Average source and base metrics over C₂. In an invariant exponential ball about the fixed base point, lift the radial paths". Line 1623: "Its exponential chart at b linearizes σ_B, as in §16.1". The *Needs:* line at 1499 lists GeometricTopology Layer 1, AlgebraicTopology Stage 5, SmoothBundlesConnections §B1 item 5 and DifferentialGeometry Layer 3 only.

**Claim.** Every input of the route is owned by a named supplier.

**Witness.** The exponential map and normal neighbourhoods are HopfRinow Layers 1–2 (completed, on main; SmoothBundlesConnections' table at line 203 routes them there). Metric existence is DifferentialGeometry 12.1. None of these is cited.

**Repair.** Either add HopfRinow Layers 1–2 and DifferentialGeometry Layer 12.1 to §16.1's *Needs:* line and to the supplier contracts, with the fact that an isometry fixing b commutes with exp_b. Or replace the step with the averaged-chart linearization ψ=½(φ+L⁻¹∘φ∘σ), where φ is a chart centred at b and L=d(φσφ⁻¹)(0); that needs only charts.

**Test.** For σ(t)=−t on ℝ and φ(t)=t+t², ψ(t)=½(t+t²−(−t+t²))=t and ψ∘σ=−ψ, so the involution is linearized.

## R04 (P3) — Mather is cited by section, not by theorem, at §§16.1c–16.1e

**Location.** Line 1554: "…The theorem `exists_controlData_isCompatible` states this. (MATHER §7.)". Line 1575 cites "(MATHER §§9–10.)" for integration and lifting. Line 1599 cites "MATHER Corollary 10.2" and "Proposition 11.1" with no page.

**Claim.** Each theorem carries its exact locator.

**Witness.** The results are MATHER line 488 (Proposition 7.1, compatible control data), line 512 (Lemma 7.3, the (π,ρ) submersion from condition (b)), line 727 (Proposition 9.1, lifting), line 825 (Proposition 10.1, the local one-parameter group), line 887 (Corollary 10.2) and line 969 (Proposition 11.1).

**Repair.** For whatever remains of these sections after R01, cite these numbers with page and line, as §16.2 already does for Proposition 11.1.

## R05 (P3) — Layers 6 and 8 still have no numbered target (previous R02, partly repaired)

**Location.** `README.md` lines 825–835 (Layer 6) and 916–926 (Layer 8): each is a paragraph, then `### Examples` and `### Dependencies`.

**Claim.** Every layer has `### k.n` targets.

**Witness.** `grep -n '^### 6\.\|^### 8\.'` gives 0 hits. The rest of the previous R02 is repaired: §§2.1–2.3, 7.1–7.4 and 12.1–12.2 are consecutive, and there are 0 stale references to §2.4, §7.5, §12.3, §12.4 or "Stage 5 item 5".

**Repair.** Either give each layer one subsection (6.1, 8.1) stating the consumed interface with its hypotheses, or fold both paragraphs into the MotivesAndAlgebraicCycles supplier contract and delete the two layers. The README cites them only as "Layers 6–8" in prose, so neither repair breaks a citation.

## R06 (P3) — Lean section titles do not match the README layer titles

**Location.** `Suggested.lean` line 125: "Layer 4: tame bouquets and rational homotopy". Line 236: "Layer 16: smooth stratified spaces, control data and the first isotopy lemma".

**Witness.** The README headings are "Layer 4: tame fibres and rational homotopy" (line 606) and "Layer 16: equivariant transport and derived chases" (line 1484).

**Repair.** Copy the README titles into the two section comments.

## Verified sound

**Gate and build.**
- Gate run at c182acb: every counter is 0, result OK. The diff outside `TauCetiRoadmap/AlgebraicTopologyPartII` is empty.
- Dependency check: `depcheck: 239 roadmaps, 2366 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- `lake env lean` on `Suggested.lean` takes 10 s; the only warnings are the 13 `declaration uses 'sorry'`.
- `#check @name` on all 36 declarations, in a scratch copy: each elaborated type agrees with `signatures.md` and with its README statement. The 7 "looks dropped" leads are false: each type carries `[inst : ∀ i, TopologicalSpace (S i)]` and `[inst_1 : … ChartedSpace …]`, and `StratumLT` precedes the `variable` line and uses neither.
- One-tactic probe (`rfl | simp | infer_instance | trivial | intro; simp`) on all 13 theorems: all 13 fail, so none is padding.
- Definitions have real bodies, imports are `Mathlib` plus three existing `TauCeti.*` modules, there is no `set_option`, and every declaration is a `theorem` with a docstring.

**Previous findings.**
- R01 is not repaired (it is R02 here).
- R02 is partly repaired: the renumbering is done and its cross-references are updated, but Layers 6 and 8 remain (R05 here).

**Adversarial table** (values computed on both sides).

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §2.2 character (BS lines 2279–2286) | m=2,N=2; (123),N=2; m=N=0 | id 4; (12): 2·(−1)^{ε_n} = −2 for even n (=2s_n), 2 for odd n; (123): 2; id on 3 letters: 8; 0⁰=1 | holds |
| `configurationTraceFormula` | m=0; m=2 with χ≡1 at q=2,3; m=2 with χ=sgn | m=0: χ(∅)=χ(∅); χ≡1: q²−q = 2, 6 versus q²·1 − q·Tr(swap on H¹(ℂ×ℂ*))=q²−q; sgn: (q²−q)/2 − (q²−q)/2 = 0 versus q²·½(1−1) − q·½(1−1) = 0 | holds |
| `stableConfigurationDiagonal` | (s,N,j,d)=(0,2,2,2), (0,1,1,1), (0,1,1,0) | ½(4−2)=1 = [t²](1+t)²(1+t³); H⁰(ℂ)=1 = [t](1+t); third: `hd` fails, and without it 0 ≠ 1 | holds; hypothesis needed |
| `doubleLoopFactor` | n=4,N=1,r=1; n=5,N=1,r=1,2 | substitute X into (1+X)¹ to get 1+t; −X² into (1+X)⁻¹ to get (1−t²)⁻¹; X⁵ into (1+X)¹ to get 1+t⁵ | matches (1−(−t)^{r(n−2)−1})^{−e_r} |
| §4.2 `tameFibreBouquet` (BROUGHTON lines 115–117) | x³−3x+y²; z^k at a≠0 and a=0; n=0, f=c | J=ℂ[x]/(x²−1), f acts by ∓2, μ=2, μ^{±2}=1: one circle versus two; k points = wedge of k−1 S⁰; one point = empty wedge; n=0: empty fibre versus one S⁰ (2 points) | holds; n≥1 needed |
| §4.3 Hilton (via BS lines 2369–2373) | N=2 | L₁,L₂,L₃ = 2, (4−2)/2 = 1, (8−2)/3 = 2 | holds |
| §4.4 (SERRE lines 2700, 2852) | s=2, 3 | S²: ℚ at 2 and 3, 0 at 4; S³: ℚ at 3 only | holds |
| §4.5 `rationalBouquetRanks` (BS line 2359) | (s,N)=(0,1),(1,1),(0,2) | e(3,1)=(1,−1,0) gives ranks 1,1,0 at k=0,1,2; e(4,1)=(−1,0): k=1 gives 1, k=0 gives 2∤1 so 0; e(3,2)=(2,−3,2) gives 2,3,2 = Hilton's 2, 2+1, 2 | holds |
| `doubleLoopBetti` | S⁴; n=4,N=2; j=0 | (1+t⁵)/(1−t²): 1,0,1,0,1,1,1 = ℚ[y₂]⊗Λ(z₅); (1+t)²(1+t³): 1,2,1,1; empty product 1 = H⁰ of connected Ω²X | holds |
| §5.2 joins (PHAM lines 196–221) | (2,2); (2,2,2); (1,3) | K₂,₂: 4−4+1 = 1 circle; S²: 1 = ∏(k−1); singleton factor gives a cone, ∏ = 0 | holds |
| `phamStrongRetraction` | k=(2,2): (1,0), (√2,i), (0,0); k=(3); n=0 | fixed; powers 2,−1 sum to 1, so in X but not S; sum 0 ∉ X; X=S=μ₃; X=S=∅ | holds |
| `fermatDoubleLoopSimplyConnected` | n=5, k≡2; n=4 | S⁴: π₂=π₃=0; S³: π₁Ω² = ℤ | n≥5 needed |
| §7.3 (BW lines 553–573) | pt: j=0,i=0; j=1,i=1 | ℤ→𝔽₂ is not an iso (i ≤ dim, j even); 𝔽₂→𝔽₂ is an iso | holds |
| §7.4 (B19 line 436) | pt, a=ω^k, k=1,2 | b₀=k, b₁=β(1)=0: ω² for k=1 (Sq¹x = x²), 0 for k=2 | holds |
| §11.5 (BW line 1012) | 𝔾_m/ℝ, 𝔽₂, i=2; A¹ | ω ↦ (1,1), square cover ↦ (0,1), det 1, so restriction is onto and relative H² = 0; (ℂ,ℝ) contracts equivariantly, all 0 | holds |
| §13.2 (BW line 1838) | ℙ¹; d=0 | ℤ→ℤ/2 reduction with kernel 2ℤ = norm image; 0→H⁰(G,ℤ(1))=0 and 0→H¹(G,ℤ(2))=0 | holds |
| §13.3 (BW line 2471) | quartic threefold | Betti 1,0,1,60,1,0,1; even traces 1,−1,1,−1; 0 − Tr(H³) = 0; a+b=60, a−b=0, so 30 | holds |
| §15.3 (B19 line 1422) | n=2 fixed sheets; exchanged sheets; n=1 | H²(G,ℤ(1)²)=0 and δ(p*a)=(1,1)≠0, no lift; Q(1)=ℤ trivial, −φζ=1=a, H³_G(G)=0, lifts; all zero | holds |
| §15.4 (B19 line 1444) | n=4, η=0, ζ=[(1,0,0,0)] | a=3; ψζ=(−3,1,1,1), Tr=0; −ψζ ≡ (3,3,3,3) = p*a; +ψζ ≡ (1,1,1,1) | the README's minus sign holds; the source's plus fails |
| §16.1a–b definitions | sin(1/t) curve; {0,3},{1},(0,1); tube (x+y²,y²); a={0}, b={5} on ℝ | at t=1/(2πk) the secant is horizontal and the tangent (1,−2πk) tends to vertical, so (b) fails; closure of (0,1) contains 0 but not 3, so the frontier condition fails; Jacobian det 2y ≠ 0 off the axis but x+y² ≠ x, so not compatible; T_a∩X_b={5} is allowed because the conditions are imposed for i<j only, and shrinking to (−1,1) normalises | definitions discriminate |
| §16.1c `exists_controlData_isCompatible` (MATHER lines 488, 512) | unit circle; sin-curve; y-axis with f=x | ∂_rρ = 2(r−1) ≠ 0; d/dt[t²(1+sin²(1/t))] = 2t(1+sin²(1/t)) − sin(2/t) changes sign; f restricted to the axis is constant, and f∘π=f would force f=0 | holds; hypotheses needed |
| `exists_flow` (MATHER line 825) | {0} < ℝ²∖0, ρ₀ = x²+y²; rotation; inward unit radial | dρ₀(rotation) = −2xy+2xy = 0, flow on ℝ×ℝ²; radial: dρ₀ ≠ 0, and the domain {t<\|v\|} ∪ ℝ×{0} is not open at (t,0) | holds |
| `exists_isControlledVectorField_lift` (MATHER line 727) | ℝ with {0}, m=1; m=0 | the point stratum has rank 0 ≠ 1, so there is no controlled submersion; for m=0 the zero field lifts | holds |
| §16.1e `exists_trivialization`, `firstIsotopyLemma` (MATHER lines 887, 969) | ℝ²∖{x≥0,y=0}→x; x²+y²; ℝ×F | not proper: a line versus two half-lines; not a submersion at 0: point, circle, ∅; lift ∂_x gives h = id | both hypotheses needed |
| `equivariantStratifiedTransport` | ℝ×S¹, σ(x,z)=(x,z̄); one stratum with T=A, π=id, ρ=0 | the lift ∂_x+∂_θ gives h(π/2,1) = (π/2,−i) while (σ_B×σ_M)h(π/2,1) = (π/2,i); the averaged ∂_x gives h = id; the hypotheses are satisfiable | holds, not vacuous |
| Gap (R02) | README line 128 versus `plan.json` | "§§3.5–3.7 … with IG.0.T2–T4" versus "§§3.5–3.8 and §6.5"; 13 others equal | mismatch |
| §16.1 route (R03) | σ(t)=−t, φ=t+t² | ψ=t, ψσ=−ψ | the averaged chart suffices |

Not a finding (unused hypothesis): `equivariantStratifiedTransport` keeps condition (b) inside `IsWhitneyStratification`, although with the invariant control data given, only those data are used (Mather Corollary 10.2). The README says why: (b) is the setting in which applications construct the control data.

**Sources (15-target sample), each confirmed at its locator.**
- 2.2: BS lines 2279–2286.
- 4.2: BROUGHTON lines 115–117 (Theorem 1.2, p.219) and 152 ((2.1)).
- 4.3: through BS lines 2369–2373, which quote Hilton Cor. 4.10.
- 4.4: SERRE lines 2700 (Prop. 3, p.494) and 2852 (Cor. 2, p.498).
- 4.5: BS line 2359.
- 5.2: PHAM lines 196–221 (Théorème 1 and its lemma, pp.337–338).
- 7.3: BW lines 553–573.
- 7.4: B19 line 436 and BW lines 581–603.
- 11.5: BW line 1012.
- 13.2: BW lines 1838–1886.
- 13.3: BW line 2471.
- 15.3: B19 lines 1422–1440.
- 15.4: B19 lines 1444–1466.
- 16.1c: MATHER lines 474–489 and 512.
- 16.1e: MATHER lines 887–905 and 969–976.

The hypotheses match, with two deliberate deviations:
- §13.2 assumes the conclusion that BW derives from Pic(X_C)[2]=0, namely that H^{2d−1} is finite of odd order.
- §3.5 widens BS Corollary 7.5's d(n−3)>j to ≥. This is valid: m>d gives m(n−3)>j.

**Library declarations opened at the pins.**
- Tau Ceti: `TauCeti.SmoothEmbedding.exists_diffeomorph_normalBundle_subset` (`TubularNeighborhood/Existence.lean:53`); `TauCeti.TopCat.serreFibrations` (`SerreFibration/Basic.lean:107`); `mem_serreFibrations_proj` (`SerreFibration/FiberBundle.lean:395`).
- Mathlib: `Manifold.IsSmoothEmbedding` (`SmoothEmbedding.lean:70`, an immersion plus a topological embedding); `Manifold.IsSubmersionAt` (`Submersion.lean:172`); `IsMIntegralCurveOn` (`IntegralCurve/Basic.lean:65`); `isMIntegralCurveOn_Ioo_eqOn_of_contMDiff_boundaryless` (`ExistUnique.lean:228`); `IsProperMap` (`Proper/Basic.lean:77`); `Bundle.Trivialization` (`Trivialization.lean:376`); `extChartAt` (`ExtChartAt.lean:437`); `SmoothPartitionOfUnity` (`PartitionOfUnity.lean:123`); `tangentConeAt` (`TangentCone/Defs.lean:66`); `Metric.infDist` (`HausdorffDistance.lean:464`).
- Neither pin has stratifications, Whitney (b) or control data.

**Cross-roadmap citations resolved.** All are on main or earlier in the order, at their heads:
- DGFloer Layer 1 item 2, which owns `arbitraryCWSerreSpectralSequence`, `arbitraryBaseSerreSpectralSequence` and their cohomological versions.
- GeneralizedCohomology G2.10 (the based path fibration is Hurewicz, hence Serre).
- AlgebraicTopology Stage 5: it consumes DGFloer item 2, and has the Kunneth spectral sequence and the trivial-monodromy E² page.
- SchemeAndStackFoundations §§0.1, 0.2, 0.7, 2.5 (`cohomology_filtered_colimits`), 2.7, 2.19 and 2.23 (`forget_injective`, `coind_injective`).
- CharacteristicClasses C2 item 3 and C3 item 2.
- MorseNovikov N6, which is "Layer 6 (N6)" on main and at #1161.
- AffineMorseLefschetz A2, A3, A4.0 and A4.1.
- RealAnalyticGeometry R2.1.
- DifferentialGeometry Layers 2, 3 and 10 (10.2 Sard).
- SmoothBundlesConnections B1.5.
- MotivesAndAlgebraicCycles §§7.6a and 7.6b.
- InverseGalois §§IG.5.1 and IG.0.T2–T4.
- EtaleDuality §§3.5–3.8, 4.7 and 6.5.
- StableHomotopyKTheory §§3.36, 3.37 and 4.6.
- ComplexComparisonPartII C-1.1.
- TangentialBordism B4.3, which has w(TM)=Sq(v).
- QWittVectors §1.4a.

The four "found nowhere" names in `citations.md` are this file's own `ControlData.*` declarations.

**Overlap.** No open pull request changes this roadmap or drops an id it cites. The ids others cite all still exist:
- §13.3, cited by MorseNovikov on main, line 1416.
- 16.2, cited by StratifiedSpacesAndTameTopology.
- Layer 4, cited by EllAdicHomotopyTypesAndWeights.

The renumbered ids are cited by no other roadmap.

**Gaps.** All 14 are declared with a named supplier; 13 match the plan exactly (see R02 for the fourteenth).

## Not verifiable

- HILTON (Theorem A and Cor. 4.10), DIMCA (Lemma 4), BRUMFIEL (pp.163–169), SCHEIDERER (Cor. 18.11) and BCR (Thm 9.3.2) are uncertified, and KRASNOV is waived. Hilton and Scheiderer were checked through BS lines 2369–2373 and BW line 1012.
- MATHER is OCR-garbled. Line 488 reads as "f : M → P a submersion", so I could not tell whether Proposition 7.1 assumes a submersion on M or on each stratum. §16.1c follows either way, by restricting to the open set where df is onto, which contains A.
- BROUGHTON line 117 is upside-down OCR; I read it reversed.
- GM, EP, CEF §4 and MILNOR-STASHEFF were not reopened: they are outside the sample.
- Ownership against open pull requests was checked only through the `roadmaps` tools, at the index of 2026-11-07.

## Source issues

- **Error** in BS at Lemma 7.6, printed page 944: the source says the double-loop Betti product holds for every n>2; it should be n≥4, since at n=3 π₀(Ω²X)=ℤ^N and the k=1 factor is 0^(−e₁); affects a stated result.
- **Error** in B19 at Lemma 7.3, printed page 98: the source says p*α̃ is the reduction mod n of p*η+ψ(ζ); it should be p*η−ψ(ζ), since (7.2) uses (1,−φ) and ψ≡p*φ mod n by (7.4); affects a stated result.
