<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/170#issuecomment-6348311117 -->
Red team round 2 pass b (claude) of c5a54c1

Verdict: needs_changes

1. **F01** (P3) Stale cross-references to §3.6 left behind by the §3.5/§3.6 reordering

   **Location:** `packages/Polylogarithms/README.md:345`: “Here `M₃` is the geometric-to-symbol isomorphism constructed in §3.6, with its triangle and endpoint normalization fixed there.” Also `README.md:371`: “On the elementary triangle of §3.6 with parameter two”.

   **Claim:** The round-1 repair moved the geometric presentation (`geometricTrilogGroup`, `triangleSymbol`, `geometricTrilogComparison M₃`) into §3.5, ahead of the configuration maps, and left §3.6 as “Gale duality and top cohomology”. Two sentences of §3.5 still send the reader to §3.6 for objects that are now defined above them in §3.5; a reader following the locator finds Gale duality instead of the triangle map and its endpoint normalization. (The §3.6 Checks at lines 383–385 likewise test the triangle reduction and parameters of §3.5; harmless, but they belong with §3.5.)

   **Witness:** `README.md:309` (“Define the elementary triangle `triangleSymbol(z)` … ordered **`(x₁,x₂,x₃,y₁,y₂,y₃)`**”), `README.md:326` (“Define `geometricTrilogComparison M₃` by the inverse of the triangle-symbol map”), both inside `### 3.5`; `README.md:373` (“### 3.6 Gale duality and top cohomology”); `README.md:111` already says “§3.5 constructs the geometric presentation before the configuration maps”.

   **Exact repair text:** At line 345 replace “constructed in §3.6, with its triangle and endpoint normalization fixed there” by “constructed above in this section, with its triangle and endpoint normalization fixed there”. At line 371 replace “On the elementary triangle of §3.6 with parameter two” by “On the elementary triangle of §3.5 with parameter two”. Optionally move the three triangle Checks at lines 383–385 (“For a generic six-tuple the reduction …”, “A coincident-point configuration is zero …”, “The displayed triangle coordinates …”) into the §3.5 Checks list.

2. **F02** (P3) A consumed K3BlochGroups declaration no longer exists at that roadmap's head

   **Location:** `packages/Polylogarithms/README.md:87`: “K3BlochGroups Layer 3 supplies `preBloch`, the five-term class, `blochBoundary` with value `x∧(1-x)`, and its rational strict-exterior comparison.”

   **Claim:** The K3BlochGroups package on the board no longer declares or names `blochBoundary`. At its current head the boundary is stated in prose in §3.5 (“The boundary, its kernel and Matsumoto exactness”) as the homomorphism `P(F) → antisymSquare ℤ (Additive Fˣ)`, `[x] ↦ x ∧ (1 − x)`, and its `Suggested.lean` declares only `antisymSquare`, `antisymSquare_diagonal_exact`, `preBloch`, `preBlochRawSymbol`, `preBlochSymbol`. The value convention `x∧(1-x)` and the exterior composite still agree with what this README assumes; only the cited name has drifted (defect class 6). `preBloch` and the §4.21 names `k3ind_rationalFunctionField`, `bloch_rationalFunctionField`, `preBloch_rationalSpecialization`, `rationalCurve_relations_eq` exist at that head.

   **Witness:** Board pull request 162 head `cef8286`, `packages/K3BlochGroups/README.md:647` (“### 3.5 The boundary, its kernel and Matsumoto exactness”, boundary `[x] ↦ x ∧ (1 − x)`, no backticked name) and `packages/K3BlochGroups/Suggested.lean:30–66` (the five declarations above; no `blochBoundary`); at the earlier head `8ef92f5`, `README.md:531` and `Suggested.lean:392` did name `blochBoundary`.

   **Exact repair text:** Replace “`blochBoundary` with value `x∧(1-x)`, and its rational strict-exterior comparison” by “the §3.5 boundary `P(F) → antisymSquare ℤ (Additive Fˣ)` sending `[x]` to `x∧(1-x)`, and its composite to the exterior square”.

3. **F03** (P3) Two admitted Lobachevsky boundary values close from the pinned Mathlib

   **Location:** `packages/Polylogarithms/Suggested.lean:143–148`: “theorem lobachevsky_half_pi : lobachevsky (Real.pi / 2) = 0 := by sorry” and “theorem lobachevsky_pi : lobachevsky Real.pi = 0 := by sorry”.

   **Claim:** Stated as targets, but both follow from `integral_log_sin_zero_pi_div_two` and `integral_log_sin_zero_pi` at the pinned Mathlib after splitting `log |2 sin t| = log 2 + log (sin t)` off the discrete zero set of `sin`. Probe outcome: a probe copy of the definition with the proofs below elaborated with exit 0 and no diagnostics. The README keeps the values as a Check (`README.md:199`); under the acceptance-test rule the two declarations are boundary values rather than milestones, so deleting them is the alternative repair.

   **Witness:** A probe copy; `Mathlib/Analysis/SpecialFunctions/Integrals/Log.lean` at the pin (`integral_log_sin_zero_pi_div_two`, `integral_log_sin_zero_pi`, and the `integral_congr_codiscreteWithin` pattern used there).

   **Exact repair text:**
   ```lean
   theorem lobachevsky_key (b : ℝ) :
       ∫ t in (0:ℝ)..b, Real.log |2 * Real.sin t| =
         b * Real.log 2 + ∫ t in (0:ℝ)..b, Real.log (Real.sin t) := by
     have h : ∫ t in (0:ℝ)..b, Real.log |2 * Real.sin t| =
         ∫ t in (0:ℝ)..b, (Real.log 2 + Real.log (Real.sin t)) := by
       apply intervalIntegral.integral_congr_codiscreteWithin
       apply Filter.codiscreteWithin_mono (by tauto : Ι 0 b ⊆ Set.univ)
       have t₀ : Real.sin ⁻¹' {0}ᶜ ∈ Filter.codiscrete ℝ := by
         apply analyticOnNhd_sin.preimage_zero_mem_codiscrete (x := Real.pi / 2)
         simp
       filter_upwards [t₀] with y hy
       simp only [Set.preimage_compl, Set.mem_compl_iff, Set.mem_preimage,
         Set.mem_singleton_iff] at hy
       rw [Real.log_abs, Real.log_mul two_ne_zero hy]
     rw [h, intervalIntegral.integral_add intervalIntegrable_const
       (by exact intervalIntegrable_log_sin), intervalIntegral.integral_const, sub_zero,
       smul_eq_mul]

   /-- Lobachevsky's half-period integral vanishes, with the factor two inside the logarithm. -/
   theorem lobachevsky_half_pi : lobachevsky (Real.pi / 2) = 0 := by
     unfold lobachevsky
     rw [lobachevsky_key, integral_log_sin_zero_pi_div_two]
     ring

   /-- The full-period logarithmic integral vanishes. -/
   theorem lobachevsky_pi : lobachevsky Real.pi = 0 := by
     unfold lobachevsky
     rw [lobachevsky_key, integral_log_sin_zero_pi]
     ring
   ```
   (The probe used `open scoped Interval` for `Ι`; add it after `open NumberField`, or write `Set.uIoc 0 b`.) If the file keeps the acceptance-test form instead, delete the two theorems and change `README.md:199` to “`Λ(0)=Λ(π/2)=Λ(π)=0`; `Λ(-θ)=-Λ(θ)`.”

4. **F04** (P3) The Lobachevsky-function locator points to texts that do not contain the statements

   **Location:** `packages/Polylogarithms/README.md:193`: “prove `blochWigner_lobachevsky`: `D(z)=Λ(α)+Λ(β)+Λ(γ)`. … (Zagier [Z07], §4, pp.13–16; [G04], §5.1, pp.37–38.)”

   **Claim:** The paragraph defines `Λ`, states its oddness, periodicity, duplication, Fourier series and the angle formula `D(z)=Λ(α)+Λ(β)+Λ(γ)`, and cites only Z07 §4 and G04 §5.1. In the cached legal copies, Z07 §4 contains the volume statement `Vol(Δ)=D(z)` ((7)–(8)) and no Lobachevsky function or angle formula, and G04 nowhere defines `Λ` or states the angle formula (it refers to Lobachevsky's volume formula in its introduction only). The statements are in MIL: the definition of the function and its Fourier series (Lemma 7.1.2) in §7.1, and the angle formula as Theorem 7.2.1; the README already cites MIL for `idealTetrahedron_volume` at line 195 and says at line 1160 that MIL's Lemmas 7.1.2–7.1.4 use this normalization. Defect class 10 (a locator into a text that does not contain the statement).

   **Witness:** Z07 lines 571–585 (printed pp.13–14: hyperbolic model, (7), (8); no `Λ`), Z07 line 417 (printed p.11, `D(e^{iθ})` as a sine series); G04 lines 267–270 and 301–305 (Lobachevsky's formula mentioned, no definition of `Λ`); MIL line 64 (Lemma 7.1.2, Fourier series, printed p.158), MIL line 160 (Theorem 7.2.1, volume equals `l(α)+l(β)+l(γ)`, printed p.160).

   **Exact repair text:** Replace “(Zagier [Z07], §4, pp.13–16; [G04], §5.1, pp.37–38.)” at line 193 by “(Milnor [MIL], §7.1, the Lobachevsky function and Lemmas 7.1.2–7.1.4, printed pp.157–159, and Theorem 7.2.1, p.160; Zagier [Z07], §3, pp.10–11, for `D` on the unit circle, and §4, (8), p.13.)”

5. **F05** (P3) The Goncharov–Rudenko locator for the Bigrassmannian complex starts four equations and one page before §7.1

   **Location:** `packages/Polylogarithms/README.md:294`: “(Goncharov [G94], §3.1–3.2 and §3.10, manuscript pp.15–16 and 24–27; [GR], §7.1, (125)–(134), pp.61–63.)”

   **Claim:** In the cached copy of GR (v5; printed and PDF pages coincide, as the table of contents confirms: §7.1 on p.61, §7.2 on p.64), equations (125)–(126) are on p.60 and (125)–(128) precede the §7.1 heading; the displays inside §7.1 are (129)–(134), on pp.61–63. The cited section and page range do not contain (125)–(128).

   **Witness:** GR line 2726 ((125), p.60), line 2740 ((126), p.60), line 2779 (§7.1 heading, p.61), line 2826 ((129), p.62), line 2900 ((134), p.63), line 2906 (§7.2 heading, p.64); table of contents at GR lines 30–32.

   **Exact repair text:** Replace “[GR], §7.1, (125)–(134), pp.61–63” by “[GR], §7.1, (129)–(134), pp.61–63”.

## Verified sound

- Elaboration of `Suggested.lean` as submitted at the pinned Mathlib: exit 0, exactly seventeen `declaration uses 'sorry'` warnings (lines 116, 127, 143, 147, 151, 162, 167, 288, 383, 387, 471, 499, 512, 521, 527, 533, 538) and no other diagnostic. Single `import Mathlib`; no `TauCeti.*` import; no `set_option`; no `lemma`; no `#eval`/`#print`/`True` placeholder; no `def := sorry`; at most two proved examples per definition (24 examples over 15 definitions); the only English “lemma” in the README is prose at line 1009; no pull-request numbers, process words, LaTeX delimiters or machine paths; title lower-case with “Zagier” capitalised.
- Declarations read: all 62 (18 definitions, 20 admitted theorems, 24 proved examples). Signatures elaborated and compared with the README: every hypothesis is explicit (no `variable` block); `zagier_three_everyFamily` (new) has the all-places row equivalence, the `IsCycle3` family hypothesis and a possibly zero rational scalar, as §3.8 states; `zagierExistence_totallyRealEven` carries `[NumberField.IsTotallyReal F]`, `2 ≤ n`, `Even n` and `Fin 0` rows; `cycleLift_iff` now has only `p, a, x, y, hx`; `singleValued_three_derivative_one` is a `HasFDerivAt` statement, not a totalised `fderiv` value.
- README read in full (1175 lines; 42 numbered subsections; 47 Checks blocks). Round-1 repairs verified at this head, finding by finding: pass a F01 (no algorithm remains; §2.5 is “Uniform Fourier bounds and Kummer reduction”, §6.3 deleted), F02 (line 123: `1-w=w⁻¹`, strict-exterior kernel, antisymmetric boundary `-w⊗w` of order two; recomputed: the map `a⊗b ↦ ab mod 2` on the `μ₆⊗μ₆` summand kills every `x⊗y+y⊗x` and sends `w⊗w` to `1`), F03 (`zagier_three_everyFamily` at lines 127–134), F04 (all requested mirrors and named targets present, lines 174–179, 202–283, 293–406, 445–466, 484–492, 521–540), F05 (`sources.toml`, 19 keys, every `sha256` resolves to a cached extraction), F06 (§2.2 primitive adapter precedes §2.3; geometric presentation in §3.5 precedes the maps; conditional transfer in §4.7 after the homotopy conjecture; normalized dictionary and support cones in §5.2 before §5.3, Green/Wang comparison in §5.9; the only residue is F01 above), F07 (line 686: separately `∂`- and `bar∂`-closed; BUR line 3095 agrees), F08 (line 975: arbitrary characteristic; G04 line 2793 agrees), F09 (`ellipticFiveTermDescent`, line 982, with three Checks), F10 (`stableK_hurewiczPrimitive` isomorphism with inverse and `stableHomology_primitiveProjection` in §2.2; §3.8 projects the lift and applies the inverse; WEI4 lines 493–503 agree); pass b F01 (Conventions line 37: `∂_M`, `δ=-∂_M`, `J_q=(-1)^q`, `δJ_q=J_{q-1}∂_M`; §5.8 line 784 and Check line 790; BFT lines 86–88 confirm `δ=Σ(-1)^i(δ_i^0-δ_i^1)` with the infinity face killed in its normalized complex), F02 (`singleValued_inv`, line 69, exists at PolylogarithmFunctions head `6e452e5`, `Suggested.lean:426`; line 81 scopes agreement to `n≥2` with endpoint branches), F03 (Layers 3–4 / 3–5 / Layer 4, §9.1, §12.2; MotivesAndAlgebraicCycles §4.14 “Equidimensional cycles and transfers” exists at content pull request 1313 head `b618cef`, `README.md:798`), F04 (three proofs in place, lines 412–435 and 446–450), F05 (line 1124; G00 lines 141–143), F06 (catalogue deleted).
- Adversarial instances on every Lean statement and on the changed README passages: `n = 0, 1, 2, 3`; `z = 0, 1, -1, i, 1/2, 2`; real points beyond the cut (the branch jump of `Li₃ − log|z|Li₂ + ⅓log²|z|Li₁` across `x>1` is `-(πi/3)log²x`, purely imaginary, so `singleValued 3` equals `L₃` on the cut and the derivative formula applies at `2`); `|z|=1`; the expansion of `L₃(e^μ)` at `μ→0` (the `ζ(2)μ` terms cancel and the remainder is `O(|μ|²log|μ|)`, so the zero derivative at `1` is correct); `D(-1)=0` and `log|-1|=0` at `-1`; `Fin 0` rows; `ℚ`, `ℚ(i)`, `ℚ(√2)`, `ℚ(√−3)`; zero and doubled columns; `ZMod 2`; the one-dimensional obstruction square; the 22-term relation hypotheses (every denominator of `trilogCyclic` in the three cyclic blocks is covered by `a,c,d ≠ 0` and the three nonvanishing hypotheses). No false statement found.
- Checks recomputed (about 30): `Alt₃Tr(XYZ)=-3`, `-3/2`, `1/2`; `S₃(i)=8/9`, `S₆(i)=209/225`; the three Kummer arguments at `i` are `(-1,i,i)`, matching Z07 (2) and `blochWigner_kummer`; angles `π/2, π/4, π/4` at `i` and `D(i)=2Λ(π/4)`; circumcenter `(1+i)/2`, `R²=1/2`, heights `1` and `1/10` over `(1+i)/4`; cusp tail `A/(2H²)`; `R(1,1,1)=3[1]+4[-1]` and `3ζ(3)+4(-3ζ(3)/4)=0`; the `(2,2,2)` expansion; `R(1,1,c)≡-[c²]+4[c]+4[-c]` modulo inversion; `L₃(2)=L₃(1/2)=7ζ(3)/8`; `δ₂[3]=u(2)∧u(3)`; the §3.3 residues; by exact arithmetic: `r(1|2345)=6/5` and `5/6`, `T=10/9` on `(1,2,3,5,7,11)`, `T=1` on the generic tuple with all twenty minors nonzero, the triangle determinants `z,-z,z,-1` and parameter `2`, and `r₄=18u(5)∧u(67)∧u(197)` on `(1,8,2),(7,3,11),(1,3,2),(9,4,3)` both as `18f₀⁽³⁾` and as `-3Alt₄` over all 24 permutations; `Z₂(ℚ(i))=3ζ_F(2)`, `Z₃(ℚ(i))=16ζ_F(3)`, `Z₂(ℚ(√2))=24ζ_F(2)`, `Z₂=6ζ(2)`, `Z₄=90ζ(4)`; `e₃=3r₂`; `r(0,1,a,∞)=a/(a-1)` with `D`-value `-D(a)`; the tame products `-a, a⁻¹, 1` and signed product `1` on `ℙ¹`; `Res(t∧(t-1)∧(t-3))=3∧2`; kernel scaling `1/32`; `10²≡2`, `11⁶≡15 (mod 49)`; the Koszul cross term `a⊗b-b⊗a` for degree-one classes.
- Locators verified against the cached legal copies (about 45 anchors, 25 with page markers or running heads): Z07 (2) p.10 and the circle series p.11, §4 (7)–(8) p.13; Z90 (33) p.413, (36) p.414; G95 Theorem 1.1 p.203, Definition 1.5 p.211, Lemma 1.7 p.212, (3.5) p.266, §5.2 case (e) p.287 (with the auxiliary point placed last, as the README says), (5.20) p.293, Lemma 7.5 and Corollary 7.6 p.302, Theorem 8.1 p.304, §9.2 p.310; G04 Theorems 1.1, 2.4, 2.12, 5.7, 5.11, 6.5, 6.10, 6.12, 6.14 (arbitrary algebraically closed field), Lemmas 5.8, 6.9/(85), 6.15, Propositions 2.14, 6.1, Conjectures 6.2–6.3, Corollary 2.9/(26), Theorem–Construction 3.1, (75) located by number (no page markers in that copy); G00 `β₂=1/3` p.3 and Proposition 4.1/(28); WEI4 §1 pp.11–12; BUR Lemma 4.5; BOR77 Remark 6.3 (`k` totally real, `m` odd, `d_m=0`); MIL Theorem 7.2.1 p.160, Lemma 7.2.2 p.161 (running heads); GR Theorem 1.2 p.5, Conjecture 1.4 p.7, (19) p.9, Lemmas 5.1–5.2, Proposition 5.4, (109), (114) pp.54–55, (142) and (144) p.65, Proposition 7.2 p.67, §9.3 pp.90–94; G94 (3.3) p.17, Theorem 3.12 p.22, Proposition 3.13 p.24, Lemma 3.18 p.26, Conjecture 3.19 p.27, Theorem 5.11 p.46; SCH p.28 (Chern character and its signs).
- Supplier citations checked: PolylogarithmFunctions at content pull request 1320 head `6e452e5` (`polylog : ℤ → ℂ → ℂ`, `singleValued`, `blochWigner`, `singleValued_inv`, `singleValued_differential`, `singleValued_two`, `blochWigner_differential`, `blochWigner_fiveTerm`); K3BlochGroups at board pull request 162 head `cef8286` (Layers 3, 4, 6, §3.1, §4.21 and its four names, `preBloch`; `blochBoundary` missing: F02); K2SymbolsBrauer at pull request 1302 head `a969ec1` (all fourteen cited sections exist with the stated titles); MotivesAndAlgebraicCycles at pull request 1313 head `b618cef` (§4.14); ZagierConjecturePolylogarithms exists as a board design package; HabiroNahmSeries is board pull request 152 and merge-order line 165; DifferentialGeometry, GeometricTopology, SchemeAndStackFoundations and AlgebraicVectorBundles are on `main`; HodgeStructures is `Completed/` and is not headed `TauCetiRoadmap.HodgeStructures`. Merge order (board `main`): PolylogarithmFunctions 36, K2SymbolsBrauer 35, SchemeKTheoryOperations 33, AlgebraicModuliForArithmeticGeometry 31, IntegralIwasawaTheory 24, GeneralAlgebraicKTheory 4, StableHomotopyKTheory 3, ComplexComparisonPartII 37, K3BlochGroups 67, MotivesAndAlgebraicCycles 70, ColemanIntegration 115, all above Polylogarithms at 116; HabiroNahmSeries 165 is a consumer. Pinned names grepped: Mathlib `Complex.hasStrictFDerivAt_log_real`, `NumberField.discr_rat`, `integral_log_sin_zero_pi`, `Distribution.delta`, `Distribution.lineDerivCLM`, `AlgebraicGeometry.AlgebraicCycle`, `nrRealPlaces`, `IsTotallyReal`, `dedekindZeta`; Tau Ceti `hasSum_log_of_mem_unitFiltration_one`, `continuous_log_unitFiltration`, `valuation_log_sub_log`, `log_unitFiltration_injective`, `Place.residueUnit`, `finite_setOf_ord_ne_zero`, `riemannianVolume`, `HasContinuousLogOn`, `absoluteRamificationIndex`.
- Declared gaps: `borel-period-contract` (BorelRegulators) and `universal-deligne-contract` (MotivicEtaleKTheory) have the same slugs in `design/plan.json` and the README, each names one supplier, and each is used (§§2.3, 4.7 and §§5.2, 5.9). Not raised.
- Dependency check, verbatim:

```text
depcheck: 14 roadmaps, 112 edges, 0 problem(s)
```

  Exit status 0; no UPWARD, CYCLE or moved line. `grep -nx Polylogarithms merge-order/ORDER.txt` on the branch finds nothing (the branch carries the order as it was when the pull request opened); the board's current `merge-order/ORDER.txt` lists Polylogarithms at line 116.
- Not re-raised: round-1 pass a F01–F10 and pass b F01–F06 (all repaired at this head, as itemised above); the fix report's “not actionable in this package” item (placement of the two gap suppliers) is settled. No round-2 pass a comment was posted at the time of this pass.
- Note, not a finding: the proved `example` at `Suggested.lean:438–443` tests `LinearMap.id` on `ℚ` and no definition of this roadmap; it is the mirror pass a requested for the §4.6 obstruction square, so it is left as is.

## Not verifiable

- BorelRegulators (Layers 3–5, §7.1) and MotivicEtaleKTheory (§§4.2, 9.1, 12.2, including `cubicalOrientationChange`, `cubicalDeligneRegulator`, `beilinsonRegulatorComparison`) exist only as explorer packages; they are on neither `main`, the board, the merge order, nor an open content pull request, and the explorer repository exposes no folder by those names at a path this pass could read. Their contents are covered by the two declared gaps and were not re-verified.
- GeneralAlgebraicKTheory §§3.12–3.14, StableHomotopyKTheory §4.14, SchemeKTheoryOperations §§3.3, 4.5, 5.1–5.2 and Layer 6, AlgebraicModuliForArithmeticGeometry §§1.6, 7.10.1 and Layer 9, ComplexComparisonPartII §C5.4, IntegralIwasawaTheory §§2.2, 4.1–4.4 and ColemanIntegration L0.F, L0.15–L0.18: unchanged since round 1, where they were checked; not reopened here.
- EllipticRegulators is named only as a downstream consumer (`README.md:1148`); no roadmap of that name exists on `main`, in the merge order, on the board or among open content pull requests. Not a supplier, so not raised.
- G04 page numbers were not re-mapped (the cached copy carries no page markers); its anchors were located by theorem and equation number only. MIL printed pages are read from the running heads of the chapter PDF.
- Truth of the admitted analytic statements (`circlePartial_error`, `blochWigner_lobachevsky`, `blochWigner_kummer`, `singleValued_three_relations`, `etaJet_steinberg`, `singleValued_three_differential` and the four derivative values, `zagier_three_exists`, `zagierExistence_totallyRealEven`) is checked by hand and against the sources, not in Lean; `zagier_three_everyFamily` remains conditional on the all-configuration cycle-lifting obligation that §3.8 states; `not_isCycle3_single_three` and `not_isCycle4_single_two` need the five-term boundary functional and the trilogarithm descent respectively and are honest targets.
- The Layer 5 current-theoretic targets were checked for internal consistency of signs, degrees and normalisations only.
