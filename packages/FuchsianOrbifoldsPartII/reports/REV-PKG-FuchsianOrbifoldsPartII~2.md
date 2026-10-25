<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1236#issuecomment-6395511558 -->
Review (claude) of 51e4db9

Verdict: needs changes

1. **F01** (P2) §4.1 re-plans CongruenceSpectralGap §0.1's level-one quotient measure

   - **Location.** README:577: "define μ_mod=(π_mod)₊(volume.restrict fdo). Prove that this is its Borel quotient area measure, has total mass π/3 and is independent of the measurable almost-everywhere fundamental domain." The same material appears in the Checks at README:600–601 and the *Needs:* at README:606.
   - **Claim.** The level-one quotient measure, its independence of the fundamental domain and its mass π/3 are targets of this roadmap.
   - **Witness.** CongruenceSpectralGap (head 2fdf27d; merge position 106, before 275), §0.1 "Hyperbolic quotient measure": μΓ is the pushforward of restricted area, for every congruence Γ, with F-independence. Its Check gives π/3 for Γ(1), with the same 2π/3 double-count control.
   - **Repair.**
     - In §4.1, take μ_mod to be CongruenceSpectralGap §0.1's μΓ at Γ=SL₂(ℤ), and say only that it equals (π_mod)₊(volume.restrict fdo).
     - Keep these as targets here: F_DIT, its almost-everywhere equality with fdo, null points, and path-connectedness of M_reg.
     - Add a contract subsection "From TauCetiRoadmap.CongruenceSpectralGap" for §0.1, and add CongruenceSpectralGap §0.1 to §4.1's *Needs:*.
     - Delete the π/3-triangle Check at README:600, which mirrors that roadmap's Check.
   - **Tested.** CongruenceSpectralGap §0.1 at Γ(1) gives 2π(−2+1+1/2+2/3)=π/3. That is the mass §§4.3–4.5 use, since (3/π)(π/3)=1. The citation points earlier in the merge order, so the depcheck stays clean.

2. **F02** (P2) gap:completed-critical-line-c1-bounds asks for an expansion that AutomorphicSpectralTheory §2.17 already exports

   - **Location.** README:76: "§§1.15 and 4.18 must export, for the regular value E*(z,1/2), a termwise C¹ Fourier expansion on high strips with exponentially decaying nonconstant modes and first derivatives." The plan's `gaps` entry has the same `needs` text. Related passages: README:14, README:70 and the *Needs:* at README:780.
   - **Claim.** The Fourier expansion of E*(z,1/2) is missing from AutomorphicSpectralTheory and must be added to §§1.15 and 4.18.
   - **Witness.** AutomorphicSpectralTheory at head c5cfb92, §2.17 `completed_eisenstein_fourier`, exports the full Fourier expansion of E*(z,s) with K_{s−1/2} terms, proving local convergence and parameter continuation. Its §§0.27–0.28 give K_ν=√(π/2y)W_{0,ν}(2y) and the decay of W. The README cites none of these.
   - **Repair.**
     - Add AutomorphicSpectralTheory §2.17 `completed_eisenstein_fourier`, together with §2.18 for "poles only at s=0,1", to the contract at README:70 and to §5.3's *Needs:*.
     - At s=1/2 the nonconstant part is 2√yΣ_{n≠0}σ₀(|n|)K₀(2π|n|y)e(nx). Using K₀′=−K₁ and the decay from §§0.27–0.28, prove the termwise C¹ bound O(e^{−2πy}) on y≥1 as a step of §5.3 here.
     - Then either delete the gap from both the README and the plan's `gaps`, or re-point it to section 2.17 with this `needs`: "§2.17 must export, at s=1/2, locally uniform convergence of the x- and y-differentiated expansion and an O(e^{−2πy}) bound on y≥1 for its nonconstant part and first derivatives."
   - **Tested.**
     - K₀(2π)≈9.17·10⁻⁴ and K₀(4π)≈1.22·10⁻⁶. The first derivative K₁ takes 9.87·10⁻⁴ and 1.27·10⁻⁶ at the same points. The decay is therefore e^{−2πy} times a power, as claimed.
     - The constant term from §1.15's Laurent cancellation, √y(log y+2c_Λ), matches the expansion's limit numerically: 5.148394 on both sides at y=7, ε=10⁻⁴.

3. **F03** (P3) §3.4 has one *Needs:* line for two theorems with different needs

   - **Location.** README:563: "*Needs:* §3.2; §3.3; §1.4; AutomorphicSpectralTheory §4.17a (primitive cycles, Pell word and orientation contracts)." This one line covers both the class statement (README:547) and `cycleGroup_conj_iff_isRotated` (README:549).
   - **Claim.** The raw-list headline needs §3.2's covering lift and the AutomorphicSpectralTheory cycle contracts.
   - **Witness.** README:553 proves the forward direction from §1.3 (unique cusp class and cusp period) with §3.3, and the converse from §1.4. §3.2 and gap:primitive-minus-cycle-interface are used only for A=B. §1.3 itself is missing from the line.
   - **Repair.** Split the line in two:
     - "Raw-list headline: *Needs:* §1.3; §1.4; §3.3."
     - "Class statement: *Needs:* §3.2; §3.3; §1.4; AutomorphicSpectralTheory §4.17a (gap:primitive-minus-cycle-interface)."
   - **Tested.** [3,6] against [6,3] needs only T⁻³ (§1.4) and the cusp and height data (§§1.3 and 3.3). [4] against [4,4] is refuted by the widths 4≠8 from §1.3.

4. **F04** (P3) Scope credits AnalyticNumberTheoryPartI §2.1 with a cusp-form application it does not state

   - **Location.** README:14: "AnalyticNumberTheoryPartI §2.1 owns Stokes under absolute integrability and vanishing cusp flux, including its uncompleted critical-line and smooth cusp-form applications".
   - **Claim.** AnalyticNumberTheoryPartI §2.1 states the cusp-form specialization.
   - **Witness.** AnalyticNumberTheoryPartI §2.1 (head 4ba2e21) states `core_stokes` for a general integrable eigenfunction with vanishing flux. It discharges the hypotheses only "for Eisenstein series on Re s=1/2", through AutomorphicSpectralTheory §§4.18 and 4.20.
   - **Repair.** Write "…owns Stokes under absolute integrability and vanishing cusp flux, and its uncompleted critical-line Eisenstein application; its general identity with AutomorphicSpectralTheory §4.18 cusp-form decay gives the cusp-form case." This wording matches README:766.
   - **Tested.** AutomorphicSpectralTheory §4.18 states that cusp forms decay exponentially. Their horizontal mean is 0, so the `core_stokes` hypotheses hold and the cusp-form case follows.

5. **F05** (P3) §0.1 cites LU23 line 275 for the limit set

   - **Location.** README:120: "(DIT16, §2 p.952, limit-set paragraph, DIT16 line 149; LU23, §3.1 pp.194–195, LU23 line 275.)"
   - **Claim.** LU23 line 275 supports the definition of the limit set and of nonelementarity.
   - **Witness.** LU23 line 275 is Proposition 3.5: finite generation holds iff D∩NΓ has finite area. The limit-set definition and the elementary criterion |Λ|≤2 are at LU23 lines 252–254, on printed p.195.
   - **Repair.** Write "LU23, §3.1 p.195, LU23 line 253".
   - **Tested.** LU23 line 253 defines Λ(Γ) as boundary accumulation points of an orbit, matching README:116. Line 262 (perfect, nowhere dense) remains correctly cited at README:124.

6. **F06** (P3) The sources manifest says SERIES05 is cited for Layer 3

   - **Location.** `packages/FuchsianOrbifoldsPartII/sources.toml` line 53: `cited_for = ["Layers 0 and 3"]`.
   - **Claim.** SERIES05 supports a Layer 3 statement.
   - **Witness.** The README cites SERIES05 only at README:149 (§0.2), at README:177 (§0.3) and under References. It had no Layer 3 citation at 4be8459 either.
   - **Repair.** `cited_for = ["Layer 0"]`.
   - **Tested.** A grep of the README for SERIES05 returns exactly lines 149, 177 and 798.

7. **F07** (P3) A module docstring line is 103 characters long

   - **Location.** Lean:17: "Complementarity and exact family/genus covering lack class-indexed arithmetic surfaces, projections and". The line was created when the F02 repair re-wrapped the docstring.
   - **Claim.** The file keeps to the 100-character line limit.
   - **Witness.** `awk 'length>100'` on the file reports line 17 with 103 characters. It is the only such line.
   - **Repair.** Re-wrap docstring lines 15–19 at no more than 100 characters.
   - **Tested.** After re-wrapping, no line exceeds 100 characters and the elaboration output is unchanged (five sorry warnings).

This review covers board head 51e4db9, which repairs 4be8459. Files are cited as `packages/FuchsianOrbifoldsPartII/README.md` (README) and `packages/FuchsianOrbifoldsPartII/Suggested.lean` (Lean), with line numbers at that head. There are seven findings: two P2 (blocking) and five P3. All ten round-1 findings are repaired, although F04 only partly. Both blocking findings are new. R01 was introduced by the F03 repair. R02 is in the gap wording that the F04 repair installed.

## Round-1 findings, one by one

| Id | Status | Repaired passage | What I checked |
| --- | --- | --- | --- |
| F01 (P1) | repaired | README:19 "Hyperbolic volumes and gonality of higher-dimensional arithmetic quotients are outside this roadmap." | The nonexistent roadmap name no longer appears in the README or the Lean. It survives only in the design plan's `restructure` and `importAudit` entries, which are design-stage text outside this review. |
| F02 (P2) | repaired | Lean:97–101 `cycleGroup_conj_iff_isRotated`; README:549 "their subgroups embedded in PSL₂(ℝ) are conjugate by an element of PSL₂(ℝ) if and only if n and n′ are cyclic rotations." | The statement is true: route checked, values in rows 14–15 of the table. The repair also gave §3.4 a single *Needs:* line for two theorems (R03). |
| F03 (P2) | repaired, new defect | README:66 "Layer 4, item 5 (cofinite signature and area), Layer 5, item 1 (topological genus), and Layer 6 (… signature (0;2,3;1;0) and cone charts)"; README:577 local μ_mod | The Part I contract now matches FuchsianOrbifolds on main (Layer 4 item 5, Layer 5 item 1, Layer 6 item 1). The new local measure duplicates CongruenceSpectralGap §0.1 (R01). |
| F04 (P2) | partly repaired | README:764 "For the regular holomorphic value E₀(z)=E*(z,1/2), prove L¹ core integrability, vanishing horizontal flux…"; README:766 t≠0 from `core_stokes` | Correctly narrowed: t≠0 and cusp forms come from AnalyticNumberTheoryPartI §2.1 (open head 4ba2e21). The narrowed gap still asks for an expansion that AutomorphicSpectralTheory §2.17 exports (R02). |
| F05 (P3) | repaired | Lean:65–77, a marked existential sending `inl 1` to `T ^ n.sum` and factor k to `T^Nₖ S T^-Nₖ` | It elaborates. The three new §1.3 Checks were recomputed (row 11). |
| F06 (P3) | repaired | README:483, 513, 529 now label §§3.1–3.3 as this roadmap's route | DIT16 line 387 is no longer cited. |
| F07 (P3) | repaired | README:35 "Δ gives −2y²"; README:688, 690 "MultiquadraticPartII §2.4, `J_square_iff_sumTwoSquares`" | A grep finds no "RQ.2", "fundamentalDiscriminant", "corrected", "older" or "the the". |
| F08 (P3) | repaired | README:328, 370 and 606 *Needs:* lines; README:44 and 60 contracts | Opened at the pins: Mathlib `CoprodI.lean:903`; Tau Ceti `MeasureTheory/Group/FundamentalDomain.lean:322`, `Fuchsian/LevelOne/Basic.lean:73` and `NumberTheory/Modular.lean:196`. |
| F09 (P3) | repaired | README:74 "§4.17a must identify the full primitive parametrized modular cycle C_(JA⁻¹) with C_A traversed in the opposite orientation."; README:86 | IntegralLattices B2 (√Δ sign clause) and B3 (opposite form maps to the inverse class) give all three actions (row 9). The plan's `gaps` entry matches. |
| R08 (P2) | repaired | README:539 "fixed by S S₁ S⁻¹, the conjugate of the involution S₁ centred at 3"; README:656 "equal weights give ν_I(E)/(4π)+ν_J(E)/(10π) instead of (ν_I(E)+ν_J(E))/(7π)" | [[−3,−1],[10,3]] fixes −3/10+i/10. Equal weights give 1/(4π) and 1/(10π), and length weights give 1/(7π) (rows 13 and 18). |

## Verified sound

### Principles

- There is no `set_option` and no sorry'd data. The three definitions (`AdmissibleCycle`, `cycleGroup`, `cyclePolygon`) have real bodies on native carriers.
- The imports are `import Mathlib` plus `TauCeti.Analysis.Complex.UpperHalfPlane.PSL.Action`, which exists at the pin with its object file.
- There is no computational algorithm and no copied source passage.
- The roadmap is a genuine Part II of FuchsianOrbifolds. Scope (README:7) says where Part I stops.
- A grep for process words, LaTeX delimiters, "optional" or "deferred" finds nothing. There are 6 layers, each ending with Examples and Dependencies.

### Depcheck (brief's command, exit 0)

```text
depcheck: 50 roadmaps, 578 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. FuchsianOrbifoldsPartII is at position 275, after AutomorphicSpectralTheory (97), AnalyticNumberTheoryPartI (98), CongruenceSpectralGap (106) and MultiquadraticPartII (274). `roadmaps resolve` on the README reports no citation and no Lean name that is found nowhere.

### Cross-roadmap citations resolved (12)

Each was resolved on main or at the open head given:

- FuchsianOrbifolds (main): Layers 0–3; Layer 4 item 5; Layer 5 item 1; Layer 6 item 1. Neither it nor the suppliers below cite Part II.
- AutomorphicSpectralTheory (#925, c5cfb92): §1.14 at README line 1158; §1.15 `constantTerm`, residues −1/2 and +1/2; §4.17a, which constructs Γ_A, F_A, area and length but states neither the complete-invariant property nor the reversal law; §4.18 `cusp_decay` with "horizontal derivative integral tends to 0"; §4.20.
- AnalyticNumberTheoryPartI (#1126, 4ba2e21): §2.1 `core_stokes`, `core_signature` and `core_boundary_period`, plus the Re s=1/2 Eisenstein discharge.
- IntegralLattices (main): Layer B, B2 (𝔞_f=aℤ+((−b+√Δ)/2)ℤ, with the √Δ clause for a<0) and B3.
- GlobalNumberFields (main): Layer 11.
- MultiquadraticPartII (#1420, 0bf098b): §2.3 `fundamental_sumTwoSquares_iff`; §2.4 `J_square_iff_sumTwoSquares` (its Lean, line 109); §§3.1–3.2.
- ConformalMapping (main): L2 and L4.
- ComplexCurveModuli (main): D0.1, D0.4, and D6.2 "Geodesic-cut metric".
- AlgebraicTopology (main): Stages 1 and 7.
- DifferentialGeometry (main): §§5.3, 5.5 and 5.6.3.
- Completed/UniversalCovers (main): Stage 2.
- CongruenceSpectralGap (#1504, 2fdf27d): §0.1, read for R01.

### Declared gaps

- **Matching.** All three slugs match exactly between the README's "What … must provide" lines and the plan's `gaps` (checked by script). Every gap's supplier is AutomorphicSpectralTheory, which is earlier in the order, so none has supplier `none`.
- **`primitive-minus-cycle-interface`.** AutomorphicSpectralTheory §4.17a constructs the minus cycle but does not state it as a complete invariant, its Pell word, or its compatibility with the dictionary.
  - It is minimal. A `roadmaps grep` for minus continued fractions and reduced cycles over main and all 354 open heads finds only AutomorphicSpectralTheory §4.17a.
  - It is not compound: all three clauses are properties of one exported map, from a class to its cycle.
- **`oriented-quadratic-cycle-reversal`.** This is the reversal law of DIT16 lines 238–239. No supplier states it, and the gap is precise.
- **`completed-critical-line-c1-bounds`.** See R02.

### Library declarations opened at the pins (Mathlib 6b7abb3, Tau Ceti a91d3aa)

- **Mathlib.**
  - `Monoid.CoprodI.lift_injective_of_ping_pong` (CoprodI.lean:903). Its hypotheses at 804–813 match README:44.
  - `MeasureTheory.IsFundamentalDomain.quotientMeasure_eq` (FundamentalDomain.lean:630). It requires `Countable G`, an invariant measure and `MeasurableConstSMul`, and states nothing about mass.
  - `completedRiemannZeta_eq`, `differentiable_completedZeta₀` and `completedRiemannZeta_residue_one` (RiemannZeta.lean:84, 89, 110).
  - `ModularGroup.im_smul_eq_div_normSq` (MoebiusAction.lean:471, namespace ModularGroup).
  - `Subgroup.index_eq_zero_iff_infinite` (Index.lean:561).
  - `IsCoveringMap.existsUnique_continuousMap_lifts_of_range_le` (Lifting.lean:499).
- **Tau Ceti.**
  - `ModularGroup.fd_ae_eq_fdo` (NumberTheory/Modular.lean:196) and `ModularGroup.isFundamentalDomain_fdo` (:234, for PSL(2,ℤ), almost everywhere).
  - `TauCeti.ModularGroup.isCofinite_psl2zToPSL2RRange` (Fuchsian/LevelOne/Basic.lean:73).
  - `MeasureTheory.covolume_eq_card_mul_covolume` (MeasureTheory/Group/FundamentalDomain.lean:322: covolume Δ = [Γ:Δ]·covolume Γ in ℕ∞).
  - `Subgroup.isCofinite_iff_isCofinite_and_finiteIndex` (Fuchsian/Covolume.lean:149) and `Subgroup.exists_isFundamentalDomain` (:101).
  - `UpperHalfPlane.volume_preimage_coe_null` and `UpperHalfPlane.volume_setOf_re_mem_Ico_and_lt_im` (UpperHalfPlane/Measure.lean:77, :91).
  - `psl2zToPSL2R_injective` (ProjectiveSpecialLinearGroup.lean:138).
  - `UpperHalfPlane.pslMk_smul` and `UpperHalfPlane.psl2zToPSL2R_smul` (PSL/Action.lean:140, :184).
  - `OnePoint.pslMk_smul` (ProjectiveLine.lean:194).
  - `TauCeti.UpperHalfPlane.isProperMap_psl_smul_I` (UpperHalfPlane/ProperAction.lean:58).
  - `Subgroup.instIsCyclicStabilizer` (Fuchsian/Stabilizer.lean:45).
  - `TauCeti.Deck.conjMulEquiv` (Deck/Conjugation.lean:129).
  - `NumberField.NarrowClassGroup.mkPrincipal_sq` (NarrowClassGroup/Basic.lean:224) and `.instFinite` (Finite.lean:38).
- **Not at the pins.** Neither pin has a limit-set, convex-core or Nielsen-region carrier (grep for limitSet, convex core and Nielsen). Tau Ceti has no theorem that the free locus is connected and no π/3 area theorem.

### Lean form

- **Elaboration.** I ran `lake env lean` on the Lean file from the content checkout. It exits 0 with exactly five "declaration uses sorry" warnings, at lines 56, 65, 81, 88 and 97, and nothing else.
- **Binders.** A scratch file ran `#check @` on all eight declarations. There are no section variables, so no binder is lost. Each elaborated type matches its README statement: the marked presentation at README:312, and conjugacy in PSL(2,ℝ) iff `n ~r n'` at README:549. I changed nothing.
- **`decide` probes.** In the same file, `decide` proves `[3,6] ~r [6,3]`, `¬([3,4,5] ~r [5,4,3])`, `AdmissibleCycle [4,4]` and `¬AdmissibleCycle [2,2]`.
- **One-tactic probe.** On scratch copies, `simp`, `rfl`, `decide`, `infer_instance`, `norm_num`, `aesop` and `exact?` close none of the five theorems. Nothing in the file mirrors a Check, so there is no padding.
- **Statability.** These headlines are not statable at the pins, and the docstring names each with the carrier it lacks: §0.3 finite-area core; §0.5 bordered Gauss–Bonnet; §§2.1–2.2; the §3.4 class form (it needs the minus period of a class, gap 1, and bordered conformal orbifolds); §§4.4–4.5; §§5.2–5.3.
- **Stated headlines.** §1.3 (three declarations), §1.6 and the raw-list form of §3.4.

### Ownership (by object, `roadmaps grep` over main and all 354 open heads)

- **Searches.** Minus continued fractions and reduced cycles; `IsRotated` and cycle groups; quotient measure with mass π/3; Nielsen region, convex core, Ford polygon, second kind and complementary covers; connectedness of the regular locus.
- **Owners found.**
  - CongruenceSpectralGap §0.1 owns the level-one quotient measure (R01).
  - AutomorphicSpectralTheory §4.17a owns Γ_A and F_A.
  - AnalyticNumberTheoryPartI §2.1 owns the arithmetic signature.
  - FreeGroupsAndLimitGroups `isConj_iff_isRotated` concerns free groups only.
  - The FuchsianOrbifolds revision #1168 uses a "minimal limit set" only for a Bader–Furman boundary. It is a revision, so it is not a dependency.
- **This roadmap's ownership.** It owns the raw-list Ford-polygon theorems, which generalize the arithmetic case its suppliers state; Scope (README:7) says how they differ. It also owns the raw-list conjugacy classification and the regular-locus connectedness.
- **Names.** No fully qualified name in the Lean occurs in another roadmap.

### Source sample (15 targets; text read at the locator)

- **0.1.** DIT16 lines 149–151 (p.952) give first and second kind. LU23 is cited at the wrong line (R05).
- **0.2.** DIT16 lines 152–156 (p.952) define the Nielsen region. LU23 line 266 gives the side away from I_j. SERIES05 line 1126 (p.32) gives the convex hull of the limit set.
- **0.3.** LU23 Proposition 3.5, line 275 (p.195). LU23 §3.3, line 370 (p.198), assumes no elliptic elements, as the README says. SERIES05 Theorem 3.33, line 733 (p.21), and the Fuchsian paragraph at lines 1143–1149 (p.33).
- **1.1.** DIT16 (3.1)–(3.2), lines 250–252 (p.954).
- **1.2 and 1.3.** DIT16 lines 333–341 (p.957): the Poincaré-theorem domain and Γ_A ≅ ℤ∗(ℤ/2)^∗ℓ. The one cusp comes from the signature at lines 323–329.
- **1.5.** DIT16 (3.4), line 349, and (3.5), line 357 (pp.957–958).
- **2.2.** DIT16 lines 384–385 (p.959) identify F_A with the domain above the boundary curve.
- **2.3.** DIT16 lines 394–401 (p.959) give V.
- **3.3.** This is this roadmap's route, through `ModularGroup.im_smul_eq_div_normSq`. No source locator is needed.
- **4.1.** DIT16 lines 195–199 (p.953) give F and area π/3.
- **4.2.** DIT16 (4.3), lines 416–426 (p.959).
- **4.3.** DIT16 (4.1)–(4.2), lines 410–415.
- **4.5.** DIT16 lines 438–448 (p.960).
- **4.6.** DIT16 lines 262–307 (pp.955–956). The cycles are [3,6] and [3,3,2,2,2], with areas 2π and 5π and length 2log(8+3√7).
- **Manifest.** The three entries match the texts (authors, titles, DOIs, pages), apart from R06.

### Adversarial table

Rows 1–22 cover passages changed or added by the repair. Rows 23–35 cover the sampled targets and the Lean. For sections the repair did not touch (§§0.4–0.6, 1.4, 1.6, 2.1, 3.1, 3.2, 4.4, 5.1 and 5.2), I rely on the round-1 rows, which carry computed values.

| # | Statement | Instances tried | Values computed (each side) | Result | Change |
| --- | --- | --- | --- | --- | --- |
| 1 | Conventions Check, Δ (README:35) | F=y²; F=log y on [0,1]×[1,2] | Δy²=−y²·2=−2y², while the inverse-square factor gives −2y⁻²; ∮dz/(2y)=1/2−1/4=1/4=(1/2)∫1·y⁻² | pass | — |
| 2 | Ping-pong contract (README:44) | [4]: factors ℤ and C₂ | #ι=2, #ℤ≥3, so `hcard` holds; the other hypotheses are as listed at CoprodI.lean:810–813 | pass | — |
| 3 | Λ Laurent constant (README:46) | Λ(1+u) | Λ₀(1+u)−1/(1+u)+1/u, so c_Λ=Λ₀(1)−1 | pass | — |
| 4 | quotientMeasure_eq contract (README:48) | fdo against F_DIT | Pushforwards are equal; the lemma has no mass clause | pass | R01 |
| 5 | Part I contract (README:66) | Layers 4.5, 5.1, 6.1 on main | Area formula, χ=2−2g genus, and the level-one signature are all present | pass | — |
| 6 | AutomorphicSpectralTheory contract (README:70) | t≠0 | E*=Λ(1+2it)E; Λ(1+2it) is finite because Λ has poles only at 0 and 1 | pass | R02 |
| 7 | Gap 2 (README:74) | D=28 | DIT16 lines 238–239 give the same image with opposite orientation; AutomorphicSpectralTheory §4.17a is silent | genuine | — |
| 8 | Gap 3 (README:76) | AutomorphicSpectralTheory §2.17 at s=1/2 | Nonconstant part 2√yΣσ₀K₀(2π\|n\|y)e(nx); K₀(2π)=9.17e−4, K₀(4π)=1.22e−6 | already supplied | R02 |
| 9 | IntegralLattices dictionary (README:86) | Q=[a,b,c], a>0; D=12 | [a,−b,c]↦𝔞σ=A⁻¹; [−a,b,−c] has lattice 𝔞_Q and sign clause √D𝔞_Q, giving JA; −Q has lattice 𝔞σ, giving JA⁻¹; x²−3y² is in I and −x²+3y² in J | pass | — |
| 10 | §0.4 *Needs:* (README:210) | genus | Part I Layer 5 item 1 defines genus by χ=2−2g | pass | — |
| 11 | §1.3 marked presentation (Lean:65; README:312, 322–324) | [4]; [3,6]; [4,4]; swapped factors; T⁻ᵐ | inl 1↦T⁴ sends i to 4+i; factor 1↦[[3,−10],[1,−3]] fixes 3+i; SS₁=[[−1,4],[4,−17]] ≠ ±S₁S=[[−17,−4],[−4,−1]]; the swap and inverse models fail the marking | pass | — |
| 12 | §1.6 *Needs:* (README:370) | [4] | covol Γ([4]) = ∫₀¹y⁻²dy·(width) = ∞, while covol PSL₂(ℤ) is finite, so [PSL₂(ℤ):Γ]=∞ and the native index is 0 | pass | — |
| 13 | §3.3 Check (README:539) | S S₁ S⁻¹ for [3,6] | [[−3,−1],[10,3]]; 10z²+6z+1=0, so z=−3/10±i/10; height 1/(3²+1)=1/10 | pass | — |
| 14 | `cycleGroup_conj_iff_isRotated`, small cases | [3,6]/[6,3]; [5,3]/[3,5]; [4]/[4,4]; [3,4,5]/[5,4,3]; [3,3,4,4]/[3,4,3,4]; [3,6]/[3,3,2,2,2] | conj/rot: T/T (T⁻³); T/T (T⁻⁵); F/F (m 4≠8); F/F (gaps 3,4,5 against 5,4,3); F/F; F/F (m 9≠12) | pass | R03 |
| 15 | Same theorem, exhaustive core step | all 226 admissible lists with sum ≤12 | Integral translation of (centres mod m, m) holds iff the lists are rotations: 0 mismatches. The heights force a=1 and the cusp forces b∈ℤ | pass | — |
| 16 | §4.1 F_DIT and μ_mod (README:577–602) | i; ±1/2+2i; ±1/2+(√3/2)i; triangle | Memberships in/out as stated; interior = fdo; mass π−2π/3=π/3=2π·(1/6) | true, duplicated | R01 |
| 17 | §4.1 M_reg path-connected | ℍ minus the orbits of i and ρ | The removed set is closed and discrete, so a compact path meets finitely many points, each detoured; the continuous image is M_reg | pass | — |
| 18 | §4.3 Check (README:656) | D=28, ℓ_I=2, ℓ_J=5 | Equal weights give 1/(4π) and 1/(10π); length weights give (2/7)/(2π)=(5/7)/(5π)=1/(7π) | pass | — |
| 19 | §4.5 criterion (README:688–690) | D=12, 28, 136 | 3∣12 and 7∣28 give J non-square; 136=6²+10² gives J square, and MultiquadraticPartII's ε=35+6√34 Check shows J≠1 | pass | — |
| 20 | §5.3 endpoint (README:764, 776–777) | s=1/2+ε; Y=100 and 50; c=0.3 | Pole coefficients ±√y/2; at y=7, ε=10⁻⁴: 5.1483944 against 5.1483943; derivative 0.3452585 against 0.3452585; tail per unit m 1.757024 against 1.757025; coefficient (1/4)/2=1/8 | pass | — |
| 21 | §5.3, t≠0 and cusp forms (README:766) | s=1/2+it | s(1−s)=1/4+t²; both sides are scaled by the finite Λ(1+2it); at t=0 the multiplier has a pole | pass | R04 |
| 22 | Lean docstring (Lean:10–23) | line lengths | Line 17 has 103 characters; every other line ≤100 | style | R07 |
| 23 | §0.1 limit set | trivial; ⟨T^m⟩; ⟨diag(2,1/2)⟩; PSL₂(ℤ) | ∅; {∞}; {0,∞}; the whole circle | pass | R05 |
| 24 | §0.2 hull | Λ⊂[−1,1], ∞∉Λ | The away side is \|z\|≤1: i/2 is in, 2i is out | pass | — |
| 25 | §0.3 finite core | Γ([4]); ⟨T⟩ | Core area π=π·ℓ with ℓ=1; ⟨T⟩ has \|Λ\|=1 and is excluded | pass | — |
| 26 | §1.1 admissibility and group | [], [2], [2,2], [4], [4,4], [3,6] | F, F, F, T, T, T; for [3,6], m=9 and S₁(3+i)=3+i | pass | — |
| 27 | §1.2 polygon | [4]; [3,2]; [3,6] | I₁=(1,3) of length 2; I₂=(4,4)=∅, a tangency; normSq(i), normSq(3+i−3) and normSq(9+i−9) are all 1, on P | pass | — |
| 28 | §1.5 endpoints | [3,6] | Word [[17,−3],[6,−1]], trace 16, ε=8+3√7; 0<0.1771<1≤2<2.8229<3 and 3<3.3542<4≤8<8.6458<9 | pass | — |
| 29 | §2.2 cutoff | [3,6]; 3/2+(6/5)i | Arcs (x−3/2)²+y²=7/4 (maximum 1.3229) and (x−6)²+y²=7 (maximum 2.6458), so Y₀=3; 1.44<1.75 puts the point outside Q_A though inside P | pass | — |
| 30 | §2.3 V | x=0, 2, 4 | 0; 2arsinh1=1.7627=log(3+2√2) with cosh 3; 2arsinh2=2.8873 with cosh 9=1+16/2 | pass | — |
| 31 | §3.3 heights | γ=1 and S at 3+i; [4,4] | Heights 1 and 1/10; c=±1, d=∓Nₖ is the only equality; the set 4ℤ+i has period 8 | pass | — |
| 32 | §4.2 ν_A | D=28 I; ∅; A²=J | ν(M)=2π; ν(∅)=0; 2ν_A=6ℓ_Aμ_mod | pass | — |
| 33 | §4.6 examples | D=12, D=28 | (2,3+√3)=(1+√3) with N=−2; minus continued fractions of 2+√3 and (3+√3)/2 are [4] and [3,2]; (2,3+√7)=(3+√7) with N=2; (3,5+√7)=(2+√7) with N=−3; 4+5=9 and 9+12=21 | pass | — |
| 34 | Lean `#check @` (8 declarations) | elaborated types | No section variables; the types equal the README statements | pass | — |
| 35 | One-tactic probe (5 theorems) | simp, rfl, decide, infer_instance, norm_num, aesop, exact? | 0 of 35 attempts close a goal | no padding | — |

## Not verifiable

- **DIT16 Figures 1–7 (pp.955–958).** The figures are embedded images, and the text extraction (pdftotext) does not contain them. The sources service's OCR applies to image-only scans, not to figures inside a text PDF. I recomputed the polygon, arcs and cutoffs instead (rows 27 and 29).
- **The scope of AutomorphicSpectralTheory §2.17's "local convergence".** The README sentence does not say whether this includes locally uniform convergence of the differentiated series. R02's repair covers both readings.
- **Sources.** I fetched no new source and added nothing to the sources manifest.

## Source issues

- **Misprint** in DIT16 at §2, definition of the standard domain F, p.953: the source puts the real-part bounds on "Re x"; it should be Re z (equivalently x); affects nothing.
- **Misprint** in DIT16 at §2, Nielsen-region paragraph, p.952: the source keeps the half-planes lying above each complementary geodesic; it should keep the side away from each interval, which differs for an interval containing ∞; affects nothing.
- **Gap** in DIT16 at the proof of Theorem 1, last paragraph, p.959: the source treats distances in ℍ between chosen successive elliptic lifts as conformal invariants; it should first lift and normalize the conformal equivalence, since for ℓ=1 both lifts are one cone point; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "51e4db9", "job": "REV-PKG-FuchsianOrbifoldsPartII~2", "model": "opus", "worker": "fable-rev104"} -->
