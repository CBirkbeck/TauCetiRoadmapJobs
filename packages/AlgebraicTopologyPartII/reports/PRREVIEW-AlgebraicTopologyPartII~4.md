# Review of AlgebraicTopologyPartII (pull request #1694 at 8f6c413)

**Verdict:** needs changes

The gate passes, `Suggested.lean` elaborates with `sorry` as the only warning, and the dependency check reports no problem. The mathematics of the new and changed passages checks out (table below). Three P3 findings remain, all in the README text; none is blocking.

**Previous review (at c182acb), finding by finding:**

- **R01 (P2), §§16.1a–16.1e duplicated StratifiedSpacesAndTameTopology Layer 5: repaired.**
  - Line 21 now reads "TauCetiRoadmap.StratifiedSpacesAndTameTopology §1.3 owns the frontier condition and the incidence order, §5.1 Thom–Mather control data, …".
  - §§16.1a–16.1e are gone.
  - The supplier contract "From TauCetiRoadmap.StratifiedSpacesAndTameTopology" (lines 144–155) is back.
  - `Suggested.lean` no longer declares the five Mather theorems or the three definitions only they used.
  - The supplier's head (#1519) says the same thing at README lines 61–63 and 1176–1179: this roadmap consumes its §§1.3, 5.1 and 5.4.
- **R02 (P3), gap `configuration-cover-comparison` differs from the plan: not repaired.** It is R01 below. I found no repair report that marks it not actionable.
- **R03 (P3), §16.1 used an exponential chart that no *Needs:* line covers: repaired.** Line 1533 now linearizes σ_B by the averaged chart ψ=½(φ+L∘φ∘σ_B), and line 1539 adds the Check (ψ=t for φ=t+t², σ_B(t)=−t). The SmoothBundlesConnections contract (line 136) states that no metric and no exponential map enter.
- **R04 (P3), Mather cited by section: repaired.** The sections it concerned are deleted. §16.2 and the supplier contract cite Proposition 7.1, Corollaries 10.2–10.3 and Proposition 11.1 with PDF page and MATHER line.
- **R05 (P3), Layers 6 and 8 had no numbered target: repaired.** §6.1 (line 846) and §8.1 (line 949) each state the consumed interface with its hypotheses and a BW locator, and each has three Checks. I recomputed those Checks in the table below.
- **R06 (P3), Lean section titles: repaired.** `Suggested.lean` lines 125 and 236 now carry the README titles "tame fibres and rational homotopy" and "equivariant transport and derived chases".

## R01 (P3) — Gap `configuration-cover-comparison` still differs from the plan (previous R02, not repaired)

**Location.** `TauCetiRoadmap/AlgebraicTopologyPartII/README.md` line 126 reads: "Expose §§3.5–3.7 on the ordered-root S_m torsor … compatible in one comparison diagram with InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T2–IG.0.T4."

**Claim.** This sentence is the declared gap contract, which the intake reads from `design/plan.json`.

**Witness.** The plan's `gaps` entry for this slug has section "3.5–3.8 and 6.5". Its `needs` reads: "Expose §§3.5–3.8 and §6.5 … compatible in one comparison diagram." A sentence-by-sentence comparison finds the other 13 gap sentences equal to the plan.

Both of the plan's sections exist at EtaleDualityAndPerverseSheaves' head (#1040): §3.8 at line 3627 and §6.5 at line 6935. So the README's contract asks the supplier for something different from what the intake announces to it.

**Repair.** Replace the sentence at line 126 with the plan's `needs` sentence verbatim. After a blank line, keep the IG.0.T2–T4 compatibility as ordinary contract prose; line 124 already says it.

**Test.** The README-versus-plan comparison then reports 14 of 14 equal.

## R02 (P3) — Stale cross-reference "Section 12.3"

**Location.** `README.md` line 413, in the CharacteristicClasses contract: "Section 12.3 identifies the supplied tangent class with the real self-intersection γ and applies the Euler evaluation and Wu formula to surfaces."

**Claim.** An internal section of this roadmap does that.

**Witness.**
- Layer 12 has only §12.1 (line 1243) and §12.2 (line 1258).
- γ_X=w(TX(ℝ)) and the surface identities w₁=0 ⇔ orientable and deg w₁²=χ mod 2 are §12.1 (line 1245), as line 24 says.
- A scan of every internal "§k.n" and "Section k.n" reference finds this one as the only id without a heading.

**Repair.** Change "Section 12.3" to "Section 12.1".

**Test.** The same scan then finds no internal id without a heading.

## R03 (P3) — The `configuration-carrier-generality` gap paragraph runs on into contract prose

**Location.** `README.md` lines 161–162. Line 162 begins " The coordinatewise plane/interior-disc identification is the topological transport of its embedding functoriality." It directly follows the gap sentence of line 161, with no blank line.

**Claim.** The gap contract is the plan's sentence.

**Witness.**
- Markdown renders lines 161–162 as one paragraph.
- So the rendered gap contract carries two extra sentences that are not in `plan.json`.
- Each of the other 13 "What … must provide (gap:…)" lines is followed by a blank line.

**Repair.** Insert a blank line before line 162 and drop its leading space.

**Test.** Every gap line is then followed by a blank line.

## Verified sound

**Gate and build**
- **Gate at 8f6c413.** `gate AlgebraicTopologyPartII: … stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, every counter 0. The worker's `gate.md` records the same, with `build=0`.
- **Outside the folder.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/AlgebraicTopologyPartII'` is empty.
- **Dependency check.** `depcheck: 242 roadmaps, 2452 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
  - StratifiedSpacesAndTameTopology is a new roadmap in an open pull request by another author (#1519). It is not in `ORDER.txt`, so the check places it after its last supplier.
  - The pull request's merge-order paragraph names #1519.
- **Elaboration.** `lake env lean` on a scratch copy of `Suggested.lean`: the only warnings are 8 `declaration uses 'sorry'` (lines 69, 108, 165, 174, 189, 215, 231, 340), with no errors.
- **`#check @name` on all 28 declarations.** Each elaborated type agrees with its README statement. The five "looks dropped" leads in `signatures.md` (`StratumLT`, `ControlData`, `ControlData.IsCompatible`, `ControlData.IsInvariant`, `WhitneyB`) are false: `ControlData`, `IsCompatible`, `IsInvariant`, `WhitneyB` and `IsWhitneyStratification` all carry `[∀ i, TopologicalSpace (S i)]` and `[∀ i, ChartedSpace …]`, and `StratumLT` needs neither. No signature changed.
- **One-tactic probe.** `first | rfl | (simp; done) | infer_instance | trivial | (intro; simp; done) | exact ⟨⟩` fails on all 8 theorems, so none is padding.
- **Numerical evaluation of `eulerExponent` for r=0,…,3.** (n,N)=(4,2) gives 0,−2,−1,−2. (5,2) gives 0,2,−3,2. (3,1) gives 0,1,−1,0. (4,1) gives 0,−1,0,0. (5,1) gives 0,1,−1,0. These are the values of the README Checks in §§3.1–3.2, 3.5 and 4.5.
- **Form.** Imports are `Mathlib` plus three existing `TauCeti.*` modules. There is no `set_option` and no `lemma`, every declaration has a docstring, and the definitions have real bodies.

**Headline theorems and statability.** The headlines in the README Summary and Layers are:
- stated: `configurationTraceFormula`, `stableConfigurationDiagonal`, `tameFibreBouquet`, `rationalBouquetRanks`, `doubleLoopBetti`, `phamStrongRetraction`, `fermatDoubleLoopSimplyConnected` and `equivariantStratifiedTransport`;
- covered by stated ones: §4.4 is the N=1 case of `rationalBouquetRanks`, and the bouquet type of the Fermat fibre is f=∑zᵢ^kᵢ, a=1 in `tameFibreBouquet`;
- named in the module docstring with their missing carrier: §§2.1, 4.3, 4.6, 5.2, 9.3–9.5, 10.1–10.5, 11.x, 12.1–12.2, 13.x, 14.3, 15.4, 15.6, 16.1, 16.3 and 16.4.

The docstring's claims hold at the pins: grep finds no topological join, Whitney or control-data carrier, configuration space, or Milnor or Jacobian algebra in either library.

**Adversarial table** (both sides computed)

| Statement | Instances | Values computed (left / right) | Result |
|---|---|---|---|
| §2.1 split arrangement purity | PConf₂≅𝔾_a×𝔾_m; m=1; m=0 | ordinary ranks 1,1 in degrees 0,1; compact ranks in degrees 4,3, inside m+1..2m=3..4; m=1: H_c² only (2..2); m=0: degree 0; geometric Frobenius on H¹(𝔾_m) is q (arithmetic q⁻¹) | holds |
| `configurationTraceFormula` (§2.3) | m=2, χ=sgn; m=2, χ≡1, q=3; m=0 | sgn: split q(q−1)/2 (+1) plus irreducible (q²−q)/2 (−1) gives 0, against q²·0−q·⟨sgn,H¹⟩=0 (swap trivial on H¹(ℂ×ℂ*)); χ≡1: 9−3=6 against q²−q=6; m=0: 1=1 | holds |
| `eulerExponent` / §§3.1–3.2 | n even, N=2; n odd, N=2 | Σ_{d∣r} d·e_d=−2^r gives −2,−1,−2; the Möbius numerators −2,−2,−6 divided by r give the same; (1−T)²(1−T²)(1−T³)² = 1−2T+0T²+0T³ | holds |
| §3.3 weighted product | c=1; c=−1 | (1−qU)⁻¹(1−qU²): 1,q,q²−q = squarefree counts; c=−1: degree 2 gives q(q−1)/2−(q²−q)/2=0, the U² coefficient of 1−qU | holds |
| `stableConfigurationDiagonal` | (s,N,j,d)=(0,2,3,3); (0,2,2,2); (0,1,1,0) | first: m=2 gives ½(4−2)=1, m=3 gives (8−12+4)/6=0, total 1 = [t³](1+t)²(1+t³); second: 1=1; third: 0 ≠ 1, so `hd` is needed | holds |
| `tameFibreBouquet` (§4.2) | x³−3x+y²; z^k with n=1; n=0 | J=ℂ[x]/(x²−1), f acts by ∓2, μ=2, μ^{±2}=1 (one circle at a critical value, two at a regular one); z^k with s roots: wedge of s−1 copies of S⁰ has s points; n=0: empty fibre against one S⁰, so n≥1 is needed | holds |
| `IsTame` against BROUGHTON Def. 3.1 (line 354) | x²y−x | gradient (0,t²) along (t,1/(2t)), with no critical point: not tame | definitions agree |
| §4.4 through `rationalBouquetRanks` (N=1) | S² (s=0); S³ (s=1) | e(3,1)=(1,−1,0) gives ranks 1,1,0 at π₂,π₃,π₄; e(4,1)=(−1,0): π₃ rank (−1)¹(−1)=1, π₂: 2∤1 gives 0, π₅: e₂=0 | matches SERRE lines 2700, 2852 |
| `rationalBouquetRanks` (§4.5) | s=0, N=2 | e(3,2)=(2,−3,2) gives 2,3,2; Hilton: 2; 2+L₂=3; L₃=2 | holds |
| `doubleLoopBetti` (§5.1) | S⁴ (s=1,N=1); s=0,N=2; j=0 | (1+t⁵)/(1−t²) gives 1,0,1,0,1,1,1 = ℚ[y₂]⊗Λ(z₅); (1+t)²(1+t³) gives 1,2,1,1, with H¹=ℚ² from π₃⊗ℚ; empty product gives 1 | holds |
| `phamStrongRetraction` (§5.3) | k=(2,3); (√2,i) at k=(2,2); n=1,k=(3); n=0 | K₂,₃: 6−5+1=2=(1)(2); powers 2,−1 lie in X, not in S; X=S=μ₃; both empty | matches PHAM lines 196–221 |
| `fermatDoubleLoopSimplyConnected` (§5.4) | n=5,k≡2; n=4 | S⁴: π₂=π₃=0; S³: π₁Ω²=π₃=ℤ | n≥5 needed and stated |
| §6.1 (new) | Spec R; Spec C/R; A¹ | pair 0 and support ℤ,0,𝔽₂,0; free orbit gives ℤ,0,…; support sequence for A¹ gives 0,0,𝔽₂,0,𝔽₂ = H^{q−1}(G,ℤ(1)) | holds |
| §7.2 periodic convention | q=0…5 | u=1,−1,−1,1,1,−1; even q: u_{q+1}=−u_q; odd q: u_{q+1}=u_q; Mathlib's complex is ρ(g)−1 then N (`FiniteCyclic.lean` lines 126–133) | holds |
| §8.1 (new) | 0∈A¹; S¹ with reflection; RPˢ, s odd | purity H^{q−2}(G,ℤ(1)): 0 at q=2, 𝔽₂ at q=3; S¹: H¹_G=0, H²_G=𝔽₂², 𝔽₂→𝔽₂² diagonal gives the same 0, 𝔽₂; H^s(RPˢ)=ℤ ≠ H^s(G,ℤ)=0 | holds |
| §9.3 splitting | ℙ², i=3 | γ=(1+a)³=1+a+a², γ⁻¹=1+a, product 1; without γ⁻¹ the result is ω+a | holds |
| §10.3 windows (BW line 852) | d=2, i=2 | left H⁰⊕H¹, right H¹⊕H²; γ⁻¹ sends a to a+a² | holds |
| §10.4 (BW line 901) | ℙ¹; ℙ² | γ=1 on RP¹: a gives 1, unit gives 0; ℙ²: deg(a(1+a))=1 against deg(a)=0 | holds |
| §10.5 (BW line 876) | RP², x=1, y=a | deg(a(1+a+a²))=1 against uncorrected 0 | holds |
| §11.2 (BW line 951) | real-empty conic | X(C)/G=RP², whose groups vanish above degree 2; i=2: Gysin from H⁰_G(two swapped points)=ℤ | holds |
| §11.5 (BW line 1012) | 𝔾_m with 𝔽₂; A¹ | restriction matrix [[1,0],[1,1]], determinant 1, so relative H²=0; (ℂ,ℝ) contracts, all groups 0 | holds |
| §14.2 (B19 lines 375–378) | split cover; connected double cover of S¹ | e=0, β_L(1)=0; e≠0, β_L(1)=e | holds |
| §14.3 (B19 lines 559–599) | branch point of z↦z² | Tr = ×2; RΓ(punctured disc, L): H⁰=0, H¹=ℤ/2 = cohomology of the fibre of ×2 | holds |
| §15.4 (B19 line 1444) | n=4, ζ=[(1,0,0,0)] | ψζ=(−3,1,1,1); p*η−ψζ ≡ (3,3,3,3) = p*a; p*η+ψζ ≡ (1,1,1,1) ≠ p*a | the README's minus holds |
| §15.5 | n=2,4,6; n=0 | H² reduction n/2 mod 2 = 1,0,1; H¹ reduction 1; n=0: H¹=ℤ/2, H²=0 | holds |
| §15.6 (B19 lines 1472–1534) | n=2, one regular stalk | Q(1)=ℤ trivial; (φ₂,1+σ)(gen)=(1,2); (𝔽₂⊕ℤ)/⟨(1,2)⟩≅ℤ/4, as B19 says for 4∤n | holds |
| §16.1 (new route) | φ=t+t², σ(t)=−t; ℝ×S¹ with z↦z̄ | L=−1, ψ=t, ψσ=−ψ; projections (v−u)∂_θ and (v+u)∂_θ average to v∂_θ, whose kernel ∂_x gives commuting transport | holds |
| StratifiedSpacesAndTameTopology contract (new) | rotation field; σ(x,y)=(x,−y); ℤ×ℝ×S¹ | dρ₀=−2xy+2xy=0; σ_*ξ=(y,−x)=−ξ, averages 0 (ε=+1) and ξ (ε=−1); {0}×[−1,1]×S¹ meets X₀ only | holds |
| `equivariantStratifiedTransport` (§16.2) | ℝ×S¹, one stratum; b∉f(A) | unaveraged h(π/2,1)=(π/2,−i) against (π/2,i), not equivariant; averaged ∂_x gives h=id; empty fibre: the complement of the closed σ-invariant image is an invariant base set | holds, not vacuous |
| §16.4 (B19 lines 773–816) | split unramified cover | g=0, ζ=0, η₀=0 give 0=0; degrees: 3+1, 2+1+1 | holds |
| R01 gap | README line 126 against `plan.json` | "§§3.5–3.7 … with IG.0.T2–T4" against "§§3.5–3.8 and §6.5"; 13 others equal | mismatch |
| R02 reference | line 413 | "Section 12.3" against headings 12.1 and 12.2 only | stale |

Not a finding (unused hypothesis). `equivariantStratifiedTransport` keeps condition (b) inside `IsWhitneyStratification`, although the invariant control data are given. The README says why at line 148: (b) is where applications construct the control data (MATHER line 488).

**Sources: seeded sample, each confirmed at its locator.** For each, the theorem number, page and hypotheses match, and the source supports the statement as written.
- **2.1:** CEF line 860 (Proposition 3.3, p.19; Frobenius q^i at line 871). BS lines 650–666 (Lemma 2.8 proof, p.907) give the range m+1≤i≤2m.
- **4.4:** SERRE line 2700 (Proposition 3, p.494) and line 2852 (Corollary 2, p.498).
- **5.1:** BS lines 2354–2401 (Lemma 7.6, pp.944–945). See Source issues for its range n>2.
- **5.3:** PHAM lines 118–125 (setting, positive ν_i) and lines 175–221 (vanishing cell, Théorème 1, and the deformation-retraction lemma compatible with the group, pp.337–338).
- **7.2:** B19 lines 399–419 (equation (2.6), p.73).
- **10.3:** BW line 852 (equation (1.46), p.22), with the maps u, v, w as at lines 853–860.
- **10.4:** BW line 901 (Lemma 1.13, p.23). The README's "geometrically connected" loses nothing against BW's "irreducible", since the case X(R)=∅ is trivial.
- **10.5:** BW line 876 (Theorem 1.12, p.22).
- **11.2:** BW line 951 (Proposition 1.14, p.24).
- **11.5:** BW line 1012 (Remark 1.17(ii), p.26), via SCHEIDERER.
- **14.2:** B19 lines 362–378 (§2.2, equations (2.2)–(2.5), pp.72–73).
- **14.3:** B19 lines 559–599 (§3.2, diagrams (3.1)–(3.3), pp.77–78). κ is not unique, at line 582.
- **15.5, 15.6:** B19 lines 1472–1534 (equations (7.5)–(7.9), Lemma 7.5, pp.99–100).
- **16.4:** B19 lines 773–816 (diagrams (4.3)–(4.5), pp.82–83).

Also checked:
- **MATHER locators in §16.2 and its contract:**
  - line 206–215 (Whitney prestratification, PDF p.10);
  - lines 480, 485 and 488 (control data, compatibility, Proposition 7.1, PDF p.19);
  - line 715 (controlled submersion, PDF p.26);
  - lines 887–916 (Corollaries 10.2–10.3, PDF pp.31–32);
  - line 969 (Proposition 11.1, PDF p.34).
- **BW line 380 (equation (1.8))**, used by §6.1.
- **BROUGHTON lines 115–117 and 354.**

**Library declarations opened at the pins**
- Mathlib:
  - `PowerSeries.binomialSeries` (`RingTheory/PowerSeries/Binomial.lean:47`). Its exponent lives in `R=ℤ` here, so `doubleLoopFactor` is the integral binomial series.
  - `Rep.FiniteCyclicGroup.chainComplexFunctor` (`RepresentationTheory/Homological/FiniteCyclic.lean:137`).
  - `homResolutionIso`, `groupCohomologyIsoEven` and `groupCohomologyIsoOdd` (`RepresentationTheory/Homological/GroupCohomology/FiniteCyclic.lean:58, 80, 114`).
  - `GenLoop` (`Topology/Homotopy/HomotopyGroup.lean:98`).
  - `SimplyConnectedSpace` (`AlgebraicTopology/FundamentalGroupoid/SimplyConnected.lean:41`).
- Tau Ceti:
  - `TauCeti.WedgeSum` (`Topology/WedgeSum.lean:78`).
  - `Equiv.Perm.fullCycleType` (`GroupTheory/Perm/Partition.lean:111`).
  - `TauCeti.FiniteField.fullCycleType_eq_map_natDegree_normalizedFactors` (`FieldTheory/GaloisGroups/FrobeniusOrbits.lean:106`, with hypothesis `Squarefree g`).

**Cross-roadmap citations resolved**
- **StratifiedSpacesAndTameTopology (head #1519).** §1.3 (restriction of the frontier condition to open subsets) and §§5.1–5.5 as the contract states:
  - finite strata;
  - "open subsets of Thom–Mather spaces are Thom–Mather spaces";
  - lifting along a controlled submersion to ℝ^m;
  - Mather Corollary 10.2 and Proposition 11.1.

  Its `Suggested.lean` declares none of this roadmap's names.
- **MotivesAndAlgebraicCycles (head #1313).** §7.6a covers BW equations (1.1)–(1.9), including the non-free quotient in (1.8) used by §6.1; §7.6b covers duality, purity and Steenrod squares.
- **EtaleDualityAndPerverseSheaves (#1040).** §§3.5–3.8, 4.7 and 6.5.
- **InverseGaloisAndArithmeticFundamentalGroups (#850).** §§IG.0.T2–IG.0.T4 and IG.5.1.
- **StableHomotopyKTheory.** §§3.36, 3.37 and 4.6.
- **TangentialBordism.** B4.3.
- **On main:**
  - DGFloer Layer 1 item 2 (`arbitrary…SerreCohomologySpectralSequence`, line 553);
  - GeneralizedCohomology G2.10;
  - SchemeAndStackFoundations `cohomology_filtered_colimits` (line 3402), and `coind_injective` and `forget_injective` (line 4570);
  - AffineMorseLefschetz A4.0 and A4.1;
  - SmoothBundlesConnections B1.5;
  - CharacteristicClasses C2 item 3 (Euler evaluation) and C3 item 2;
  - RealAnalyticGeometry R2.1;
  - MorseNovikov Layer 6;
  - RealAlgebraicGeometry (under `Completed/`).

**Overlap.** No open pull request changes this roadmap or drops an id it cites. Other roadmaps cite these ids, which all exist: 16.2 (StratifiedSpacesAndTameTopology), Layer 4 (EllAdicHomotopyTypesAndWeights) and MorseNovikov's mention (#1161). The deleted §§16.1a–16.1e are cited nowhere.

**Gaps.** All 14 are declared, each with a named supplier and the same slug in `plan.json` and the README. 13 match the plan's sentence; see R01 and R03 for the other one and for the paragraph break.

## Not verifiable

- These are settled and cited by locator only, so their texts were not read:
  - uncertified: HILTON (Theorem A, Cor. 4.10), DIMCA (Lemma 4), BRUMFIEL (pp.163–169), SCHEIDERER (Cor. 18.11) and BCR (Thm 9.3.2);
  - waived: KRASNOV.

  Hilton and Scheiderer were checked through BS lines 2369–2373 and BW line 1012.
- MATHER and SERRE are OCR scans. I read the cited lines through the OCR noise; theorem numbers and pages are legible.
- GM, EP, MILNOR-STASHEFF and CEF Theorem 3.7 lie outside the sample and were not reopened.
- Ownership against open pull requests was checked through the `roadmaps` tools only (index of 2026-11-07), as the brief gives no checkout of #1519 or #1313.

## Source issues

- **Error** in BS at Lemma 7.6, printed page 944: the source assumes n>2 for the double-loop Betti product; it should be n≥4, since at n=3 Ω²X has π₀=ℤ^N and the k=1 factor (1−(−q)⁰)^(−e₁) has base zero; affects a stated result.
- **Error** in B19 at Lemma 7.3, printed page 98: the source says p*α̃ reduces from p*η+ψ(ζ); it should be p*η−ψ(ζ), because α̃ is the image under (1,−φ) and ψ≡p*φ mod n by (7.4); affects a stated result.
