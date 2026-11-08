# Review of PadicHodgeRegulators (pull request #1498 at 13305d8)

**Verdict:** needs changes

## R01 (P2) — The calibration "c₂ is a p-adic unit for p > 3" has no non-circular route, yet §§5.8–5.9, 6.1, 6.5 and 6.6 rest on it

**Location:** TauCetiRoadmap/PadicHodgeRegulators/README.md:1047, “Calibration: c₂ is a unit at every prime p > 3 … The inequality v_p(c₂) ≥ 0 is equivalent, given those sections, to the root generation of §5.9 (GSWZ Theorem 9)”. Also README.md:1220 (“The second follows because c₂ is a p-adic unit for p > 3 (§4.7)”), :1238 (§5.9's proof uses §5.8), :1265 and :1270 (the p² range of §6.1), :1332 (§6.5(b)–(d)) and :1347 (§6.6, D_p : K₃(K) → p²R^∧_p).

**Claim:** §4.7 proves only v_p(c₂) ≤ 0. It offers two routes for v_p(c₂) ≥ 0, and neither works.
- The first route is "c₂ is explicit through borelCalibration_two". But Polylogarithms §2.3 at its head (fc00043, its README:189–201) states no value: it calls the exact scalar "an explicit proof obligation". The README's own citation, dJ1995 printed p. 240 (dJ1995 line 1271–1273), says only that the two regulator factorizations agree "up to a non zero factor".
- The second route is §5.9 / GSWZ Theorem 9. But §5.9's proof uses §5.8, and §5.8's second statement uses this very claim, so the proof plan is circular.

GSWZ's own proof of Theorem 9 gets the containment in p²𝒪 from Lemma 3.1 (GSWZ2024 line 2022–2024). Lemma 3.1 only covers special-unit arguments (see Source issues).

**Witness:** Model c₂ = 1/5, p = 5: λ_L(K₃) = 25ℤ₅ (§1.10), D_L([ω(2)]) ≡ 25 mod 125 (§5.7) and v₅(c₂) = −1 ≤ 0 all hold. Then D_L's image is 5ℤ₅ and the roots span an index-5 sublattice, so §§5.8(2), 5.9, 6.1, 6.5 and 6.6 fail.

**Repair:** Give v_p(c₂) ≥ 0 a supplier.
1. Under the Polylogarithms paragraph of `## Exact supplier contracts` (README.md:74), add: “What Polylogarithms must provide (gap:borel-calibration-value): the exact rational value of the scalar computed by borelCalibration_two, expressed in the coordinate of BorelRegulators §6.2, so that κ₂ = c₂⁻¹ is a known rational number with no prime factor greater than 3.”
2. Add the same slug to the `gaps` of packages/PadicHodgeRegulators/design/plan.json, with supplier Polylogarithms and section §2.3.
3. In README.md:1047, derive v_p(c₂) ≥ 0 from that value alone. Delete “is equivalent … to the root generation of §5.9 (GSWZ Theorem 9)” as a route, keeping it only as a remark.
4. Mark the consumers of the unit property (§5.8's second statement, §5.9, and the p² bullets of §§6.1, 6.5 and 6.6) as resting on `gap:borel-calibration-value`.

Alternatively, cite a source that computes the Suslin–Borel constant and state it in §4.7. Repair test: after the edit, the c₂ = 1/5 model is excluded by the supplied value, and no proof edge leads from §4.7's unit claim back to §5.9.

## R02 (P2) — The plan's remaining gap `completed-bloch-comparison` asks KTheoryFiniteLocalFields for what it already provides, and the README declares no gap

**Location:** packages/PadicHodgeRegulators/design/plan.json, gaps[0], slug `completed-bloch-comparison`, supplier KTheoryFiniteLocalFields §§6.6–6.7. Also TauCetiRoadmap/PadicHodgeRegulators/README.md:385, “KTheoryFiniteLocalFields §§3.5,6.2,6.8–6.10 supply the ordinary-to-indecomposable and completed-to-inverse-limit steps … Composing these inputs gives the following contract.”

**Claim:** The README contains no `gap:` slug at all. It composes the supplier's existing sections itself, citing K3BlochGroups §6.6 for the finite-level Bloch step. The plan still declares the gap, which the intake would announce on KTheoryFiniteLocalFields' job. The previous round's repair kept this entry because it was "discharged by the supplier's targets". But a declared gap whose content is already supplied is exactly a P2 finding under the gap rules.

**Witness:** KTheoryFiniteLocalFields at 3c5b201 already supplies every piece: §6.2 gives 0 → lim K_n/p^ν → K_n(R;ℤ_p) → T_pK_(n−1) → 0; §3.5 gives K₂ = uniquely divisible ⊕ finite, so T_pK₂ = 0; §6.10 gives Kₙᴹ uniquely divisible for n ≥ 3.

**Repair:** Remove the `completed-bloch-comparison` entry from the `gaps` list of packages/PadicHodgeRegulators/design/plan.json. No README change is needed. Repair test: the plan's slugs equal the set printed by `grep -o 'gap:[a-z0-9-]*' README.md | sort -u`. That set is empty, or `{gap:borel-calibration-value}` once R01 is repaired that way.

## R03 (P3) — HabiroNumberFields §§3.0a–3.0b do not exist at its head

**Location:** TauCetiRoadmap/PadicHodgeRegulators/README.md:7, “HabiroNumberFields §§3.0a–3.0b and HabiroNahmSeries §6.3 consume these”. The same locator appears at :1404 and :2706.

**Claim:** This cites consumer sections that do not exist.

**Witness:** HabiroNumberFields at 84e120a has Layer 3 headings “### 3.0 Global degrees and completed presentations in local sections” followed by “### 3.1 …”. There is no 3.0a or 3.0b. Its PadicHodgeRegulators supplier contract (its README:85–88) consumes §§4.7, 5.6–5.9, 6.1 and 6.3.

**Repair:** At all three places, replace “HabiroNumberFields §§3.0a–3.0b” with “HabiroNumberFields §3.0 and its PadicHodgeRegulators supplier contract”.

## R04 (P3) — Three backticked SelmerIwasawaCohomology declaration names exist nowhere

**Location:** TauCetiRoadmap/PadicHodgeRegulators/README.md:51, “§4.9 supplies `blochKatoCondition`, `blochKatoCondition_T`, `blochKatoStructure` and propagation to discrete quotients”.

**Claim:** These are supplier declaration names that do not exist where they are cited. This is supplier drift, although the cited content does exist.

**Witness:** SelmerIwasawaCohomology §4.9 at ebadda3 (its README:1924–1945) defines H¹_f(K,V), the T-preimage, the A-image and L^BK_v under no such names. `roadmaps grep` over main and 476 open heads finds them only here.

**Repair:** Replace the clause with “§4.9 supplies the finite condition H¹_f(K,V), its preimage on T and image on V/T, the local-condition structure L^BK_v and its propagation to discrete quotients”, without backticks.

## R05 (P3) — §6.2(a) for an arbitrary root of unity is not a special case of the special-unit formula; its source is BdJ2003 Theorem 1.12

**Location:** TauCetiRoadmap/PadicHodgeRegulators/README.md:1287, “In particular: (a) for every root of unity ζ ≠ 1 of F, `D_{F,p}([ζ])` = Li_2(ζ ⊗ 1) componentwise”. The locators are at :1289.

**Claim:** "In particular" derives (a) from the special-unit hypothesis. That fails when ζ has p-power order. The cited locators (Theorem 1.10(2) and Remark 1.11) do not cover that case.

**Witness:** For F = ℚ(ζ₇) and p = 7, v₇(1−ζ₇) = 1/6 > 0, so [ζ₇] is not a special-unit presentation. BdJ2003 line 224–227 (Remark 1.11, p. 5) says Theorem 1.10 does not apply. Theorem 1.12 (BdJ2003 line 231–233, p. 6) covers every root of unity.

**Repair:** Replace “In particular: (a) for every root of unity …” with “Moreover, by the cyclotomic clause of §4.3 (BdJ2003 Theorem 1.12, p. 6): (a) for every root of unity …”. Add “BdJ2003 Theorem 1.12, p. 6” to the locator line. Items (b)–(c) stay under “In particular”.

## R06 (P3) — The §9.15 locator has no page

**Location:** TauCetiRoadmap/PadicHodgeRegulators/README.md:2239, “See LLZ2011 Section 3, equation (1) and Lemma 3.3.”

**Claim:** The locator has no page, unlike its neighbours (for example §9.14 at :2225).

**Witness:** In LLZ2011, equation (1) is line 950–965 (printed p. 1116) and Lemma 3.3 is line 973–991 (printed p. 1117).

**Repair:** Replace it with “See LLZ2011 §3A, equation (1), p. 1116, and Lemma 3.3, p. 1117.”

## R07 (P3) — dJ1995 and Nakamura2014 are cited throughout but are absent from the sources manifest

**Location:** TauCetiRoadmap/PadicHodgeRegulators/README.md:1030–1057 (§4.7 cites dJ1995 §§2.4–2.5, Proposition 4.1, Remark 5.2 and pp. 239–240) and :2527–2556 (§9.30a cites twelve Nakamura2014 locators). References are at :2743 and :2745. The manifest is packages/PadicHodgeRegulators/sources.toml.

**Claim:** Every cited work must be recorded in the manifest. Its 32 `id`s run GSWZ2024 … RJ2018 and include neither key.

**Witness:** Both are open (numdam CM_1995__96_2_197_0, arXiv:1201.6475v2) and were read without editing the manifest. dJ1995 p. 240 (line 1266–1273), Nakamura2014 Theorem 2.21 (p. 27) and Theorem 3.10 (pp. 36–37) are where the README says.

**Repair:** Record both works in packages/PadicHodgeRegulators/sources.toml with `sources fetch --manifest packages/PadicHodgeRegulators/sources.toml --id dJ1995 …` and `--id Nakamura2014 …`, giving the locators the README cites.

## Previous findings

- **R01 of the previous review (four stale gaps on CohomologyComparisonsPartII in plan.json): repaired.** It asked to “Retire the four entries from the `gaps` list … (remove only; `completed-bloch-comparison` stays)”. The board's plan.json now lists only `completed-bloch-comparison`. The slugs `dagger-syntomic-filtration`, `rigid-negative-weights`, `normalized-syntomic-boundary` and `semistable-period-descent` are gone. The README is unchanged and still declares no gap. The entry that was kept is the subject of R02 above.

## Verified sound

:robot: Independent AI full review of the README (2,745 lines, Layers 0–9 and all supplier contracts) and of Suggested.lean at 13305d8. The folder diff since the previous review's head is empty (the same head). There are seven findings, two of them blocking.

**Gate, dependency check, elaboration.**
- The gate rerun from the worktree prints `set_option=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK` and exits 0. The worker's gate at this head also has build=0.
- The diff outside the folder against origin/main is empty.
- The dependency check prints `depcheck: 243 roadmaps, 2457 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line.
- `lake env lean TauCetiRoadmap/PadicHodgeRegulators/Suggested.lean` exits 0. Its only warnings are the three `declaration uses 'sorry'` at lines 43, 81 and 102.

**Signatures and probes.** A scratch copy added `#check @name` for all seven declarations and was elaborated once.
- The elaborated types match README §§5.1–5.2, 5.5, 9.1 and 9.7–9.11 word for word: E a field, R a commutative E-algebra, `[IsDomain R]`, injectivity of x on J, ev_j(t) = x_j, q_j ≠ 0 and ker ev_j = (q_j) only on J. No section binder is lost.
- In the same copy each `sorry` was replaced by `first | simp | rfl | infer_instance | omega | decide`. Nothing closed. On `residueDilogValue_spans`, simp only rewrites ≠ to ¬=. The constraint theorems fall through every alternative.
- There is no padding: no declaration restates a definition, mirrors a Check or computes a value.
- The headline list (§§1.9, 4.2–4.7, 5.7–5.9, 6.1–6.6, 7.4–7.11, 8.13–8.19, 9.26–9.36) has no other member statable at the pins. Completed K-groups, continuous period cohomology, B_dR, Robba-ring (φ,Γ)-modules and Wach modules are absent from Mathlib and Tau Ceti at the pins. The module docstring names these families and the missing carriers.

**Library declarations opened at the pins** (all present with the stated content):

| Name | File:line at the pin |
|---|---|
| `TauCeti.teichmuller` | TauCeti/RingTheory/Henselian/Teichmuller.lean:92 |
| `TauCeti.unitsMap_residue_teichmuller` | same file:123 |
| `TauCeti.rootsOfUnityAlgebraMulEquivUnitsResidueField` | same file:258 |
| `TauCeti.unitFiltrationZeroEquivProd` | TauCeti/NumberTheory/LocalField/UnitsDecomposition.lean:281 |
| `TauCeti.unitFiltration` | TauCeti/NumberTheory/LocalField/UnitFiltration/Basic.lean:99 |
| `TauCeti.hasSum_log_of_mem_unitFiltration_one` | TauCeti/NumberTheory/LocalField/Logarithm.lean:97 |
| `TauCeti.continuous_log_unitFiltration` | same file:165 |
| `TauCeti.deepUnitExpLogEquiv` (hypothesis `absoluteRamificationIndex K p < (p − 1) * i`, type `unitFiltration K i ≃ₜ* Multiplicative (𝓂[K]^i)`) | TauCeti/NumberTheory/LocalField/DeepUnits/Basic.lean:117 |
| `TauCeti.frobeniusAlgEquiv_teichmullerLift` | TauCeti/NumberTheory/LocalField/Frobenius.lean:61 |
| `TauCeti.frobeniusAlgEquiv_rootsOfUnity` | same file:74 |
| `Submodule.comap` | Mathlib/Algebra/Module/Submodule/Map.lean:171 |
| `LinearEquiv.finrank_eq` | Mathlib/LinearAlgebra/Dimension/Finrank.lean:115 |
| `LinearEquiv.symm_apply_apply` | Mathlib/Algebra/Module/Equiv/Defs.lean:358 |
| `Matrix.det_mul` | Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean:141 |
| `Matrix.det_fin_two` | same file:809 |
| `GaloisField.finrank` (n ≠ 0) | Mathlib/FieldTheory/Finite/GaloisField.lean:80 |
| `GaloisField.card` (n ≠ 0) | same file:130 |
| `NormedSpace.log` | Mathlib/Analysis/Normed/Algebra/Logarithm.lean |

**Cross-roadmap citations resolved.** A mechanical pass checked every section number the README cites against the supplier's headings, at its open head or on main. All were found: K3BlochGroups §§2.3, 3.1, 3.3–3.6, 4.20, 6.3–6.6; ColemanIntegration §§L0.15, L0.18, L1.1, L1.19, L2.13, L2.18, L2.25, L2.Fb, L3.14, L3.15, L3.Fa.1, L3.Fa.4, L3.Fb.2, L3.Fb.5–6, L3.Fc.1, L3.Fc.3; BorelRegulators §§2.1–2.3, 6.0a, 6.2; CohomologyComparisonsPartII §§1.1–1.6, 2.1–2.3, 3.1–3.4, 4.1–4.4, 5.1–5.3, 6.1–6.7, 7.1–7.5; ColemanIntegrationPartII §§1.1–1.3, 2.1–2.3, 3.0a–3.0c, 3.1a, 3.2–3.4, 4.0c, 4.2–4.4, 5.1–5.5, 6.0–6.4, 7.1–7.6; PhiGammaModulesAndIwasawaCohomology §§1.0, 1.6, 3.1–3.2, 3.4, 3.4a, 3.9, 5.1–5.7, 5.6a, 6.2; PadicHodgeTheory §§4.2, 4.5, 5.2, 6.1–6.2; NoncommutativeAndEquivariantIwasawa §§F.3, F.6; SelmerIwasawaCohomology §§4.7, 4.9, 4.26; IntegralIwasawaTheory §§2.2, 4.1, 4.4; ArithmeticKTheory §§2.1, 3.2–3.4; SchemeKTheoryOperations §§2.3–2.4, 5.5, 6.4, 6.8–6.9, 6.11, 7.5; K2SymbolsBrauer §§9.2–9.4, 9.11, 9.13, 11.1, 11.3; PolylogarithmFunctions §§5.1–5.2, 5.7–5.8; LocallyAnalyticDistributions §§1.1, 1.4–1.5, 2.1, 2.3, 3.3; PadicPeriodRings §§1.5, 4.1–4.3; ArithmeticGaloisDuality §R02.1.2; FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.P2–P5, R07.3; NeronModelsAndSemistableAbelianVarieties §§3.10, 3.13–3.14, 5.3; AbelianSchemesAndArithmeticModuli §A4.3; CohomologyComparisons §§4.2–4.5; KTheoryFiniteLocalFields §§1.5, 1.8, 3.0a, 3.5, 6.2, 6.6–6.10, 7.6. Main hosts AlgebraicCurves, PadicMeasuresIwasawaAlgebras and Completed/{LocalGaloisGroups, NumberFieldArithmetic, EffectiveBounds, ProfiniteArithmetic}.

The backticked supplier names `KTheoryQ.localization`, `KTheoryQ.dvr_localization_iso` and `noLowWeightKTheory_of_algebraic_over_Fp` (ColemanIntegration README:2414–2418), `leopoldtDefect`, `LeopoldtConjecture`, `leopoldtLogMap`, `leopoldtDefect_eq_logKernel`, `leopoldt_iff_logMatrix_fullRank` and `abelianLeopoldt` (IntegralIwasawaTheory README:317–323, 549, 717), `earlyChern` and `etaleEdgeOne` (KTheoryFiniteLocalFields §§1.8, 6.6), and suslin_rational and rootClassPadic (K3BlochGroups README:1730, 2169) are present. The three exceptions are R04. Both resolver leads are benign: FontaineBPR1994 is a source key, and `KTheoryQ.dvr_localization_iso` is the ColemanIntegration §L3.Fa.1 target.

**Ownership and duplication.** Kontsevich's finite polylogarithm, the residue dilogarithm, the evaluation-constraint module, the Suslin–de Jeu constant and the normalized completed K₃ regulator appear in no other roadmap on main or at any of the 476 open heads (`roadmaps grep`). HabiroNahmSeries (its README:151), HabiroNumberFields (its README:85–88) and GrossZagierAndArithmeticHeights (its README:94, 138) import them by section and stand later in the merge order. Polylogarithms (position 304) supplies §§2.1/2.3 and cites nothing from here (position 325). The overlap tool lists no other pull request changing this roadmap and no dropped id.

**Seeded locators**, each read at the locator (page = printed page):

| Target | Source evidence | Result |
|---|---|---|
| 5.1 | GSWZ2024 line 1988–1992, (177), p. 38; line 2000–2003, (180), p. 38 | li_{n,p} = Σ_{k<p} x^k/k^n; (x−1)² ∣ li_{2,p} from li_{2,p}(1) ≡ li′_{2,p}(1) ≡ 0. Matches `finitePolylog` (Finset.Ico 1 p, coefficient (k^n)⁻¹). |
| 6.2 | BdJ2003 line 207–220, Theorem 1.10(2), p. 5; line 221–227, Remark 1.11, p. 5; GSWZ2024 line 1975, Lemma 3.1, p. 38 | Special-unit formula and "almost all p" confirmed. Clause (a) needs Theorem 1.12 (R05). |
| 7.10 | Besser2025 line 277 (3.5), 283 (3.6), p. 6; 297–298 (3.8), 324–326 Prop 3.3, p. 7; 345–363 Prop 3.5 and proof, 364–375 Remark 3.6 and Definition 3.7, 376–388 Theorem 3.8, pp. 8–9 | Complex, w=(φ−1)⁻¹x, ρ=y−Nw, β=z+I_πw, dβ/dlogπ = −I_πρ and I_π′ = I_π∘exp(λN) all as stated. The README's ker(1−pφ) corrects the source (Source issues). |
| 8.3, 8.4 | LLZ2011 line 1372 (§5A); line 1399–1406, Lemma 5.6 and proof, p. 1126 | (1−φ)⁻¹ = (φ+1+a)/(1+a+b) and φ⁻¹ = −(φ+a)/b. The README adds the implicit denominators. |
| 8.6 | LZ2014 line 1632–1638, p. 37 (before Proposition B.1) | Γ*(1+j) = j! or (−1)^(−j−1)/(−j−1)!. |
| 8.10 | Berger2003 line 853–860, Definition II.12, p. 120; 861–865, Theorem II.13, p. 120; 898–904, Remark II.14, p. 121 | Quotient by V^{H_F}; unquotiented if D_cris^{φ=p^{−h}} = 0 or ℚₚ(h) ⊄ V. |
| 8.12 | LZ2014 line 284 (Tw_η(g)=η(g)g); line 900–915, §4.4, p. 21; line 1764, (10), p. 39 | §4.4's Tw_{χ^j} is the README's T_{−j}. Equation (10)'s Tw_{−h} is a source misprint (Source issues); the README uses the right direction. |
| 8.17 | LLZ2011 line 933–943, §3A, p. 1116; LZ2014 line 886–891, Remark 4.16, p. 20 | 1−φ maps N(T)^{ψ=1} into (φ*N(T))^{ψ=0}; changing the roots multiplies by ω(γ̃)⁻¹. |
| 8.19 | LLZ2011 line 1086–1089, Definition 4.4 and Assumption 4.5, p. 1119; 1114–1118, Corollary 4.7, p. 1120 | det L_V = ∏_{i<r_d} ℓ_i^{d−n_i} with n_i = #{j : r_j ≤ i}. |
| 8.22 | Rubin2000 line 2170–2172, III §5.2, p. 47; 2357–2361, §5.8; 2392–2403, Proposition 5.14, p. 52 | Minimal Weierstrass differential, injective Col_∞, Gauss-sum and trivial-character values, split-multiplicative augmentation. |
| 9.15 | LLZ2011 line 950–965, (1), p. 1116; 973–991, Lemma 3.3, p. 1117 | Row times M. The page is missing from the README (R06). |
| 9.17 | LLZ2011 line 950–965; 1509–1518, Remark 5.12, p. 1129 | n ↦ An gives M ↦ AM, which is the B = I case of M′ = UMB⁻¹. |
| 9.26 | LLZ2011 line 1272–1297, Theorem 4.12, p. 1123; 1301–1307, Corollary 4.13, and 1325–1330, Corollary 4.15, p. 1124 | Image equal to S, det S = ∏(X−χ(γ)^i+1)^{d−n_i}, exact sequence under no eigenvalue in p^ℤ. |
| 9.32 | RJ2018 line 1161–1185, §IC2 and Proposition I.13, p. 911; 1187–1240, proof, pp. 912–913 | Series (2) identical to the README's; independent of N and representatives; rigid analytic. |
| 4.7 (route of R01) | dJ1995 line 1262–1273, pp. 239–240 | Only "up to a non zero factor"; no value. |

No locator is flagged as unverified in the README. No needs-references.toml exists for this job.

**Adversarial table** (seeded targets, headlines and every target a finding touches):

| Statement | Instances tried | Values computed on both sides / wrong model | Result; change |
|---|---|---|---|
| `residueDilogValue_spans` | Exhaustive over 𝔽_{p^s}, s=1,2, p=3,5,7,11,13 (scratch script) | Ranks (values, differences): p=3: (0,0) at s=1 and (1,1) at s=2. p=5,7,11,13: (1,1) at s=1 and (2,2) at s=2. 𝔽₅ values {0,1,4}. | Holds for p>3, fails at p=3, so `3 < p` is needed. Differences span because f_p(−1)=0 lies in the image (li_{2,p}(−1)=0 by k↔p−k). |
| §5.1 `finitePolylog` | p=5,n=2 at x=2,3,4; p=3 at x=1 | li_{2,5}(2)=2+1+2+1 ≡ 1, li_{2,5}(3)=3+1+3+1 ≡ 3, li_{2,5}(4)=0; li_{2,3}(1)=1+1=2 ≠ 0; f₅(3)=3/2⁵=3/2=4 in 𝔽₅ | Matches the Checks; p=3 is excluded. |
| §§3.4, 5.3 Li₂(ω(2)) at p=5 | ζ=ω(2), ζ⁵=ζ | Li₂^{(5)}(ζ) ≡ li_{2,5}(2)/(1−2⁵) = 1/4 ≡ −1 mod 5; Li₂(ζ)=25·Li₂^{(5)}/24 ≡ 25 mod 125; ℓ₂ ≡ −1 mod 5 | Matches §§3.4, 5.3, 5.7; Gros value is a unit. |
| `constraint_basis_and_determinant` | ℚ[X], d=2, V₀=ℚe₁ at 0, V₁=ℚe₂ at 5; d=1, V=0 at 0 and 5; d=0; general domain | Rows (X−5,0),(0,X), det X(X−5); basis X(X−5); empty det 1 = empty product. General case: t is transcendental when J≠∅ (else t−x_j is a unit with ev_j = 0); an E[t]-basis has det c·∏q_j^{d−dim V_j}, c ∈ Eˣ, and is an R-basis because M is locally (M_j) | True on its exact hypotheses; no hypothesis is missing. |
| `evaluationConstraints_coordinate_image` | Diagonal F(0)=G(0); V=0 at 0,5 in rank one; J=∅ | Both generators are 1, witness (r,r), and (1,0) is excluded from S; generator X(X−5) with r=1 excluded; g=1 with r·e_k. In general, CRT on the pairwise comaximal q_j builds F_i ≡ ev_j(r)v^{(j)}_i | Both directions hold. |
| §1.10 / §5.8 first statement | L=ℚ₅, r=2; p=3 | (1−σ/25)⁻¹𝒪 = 25𝒪, ∂²(1)=exp((25/24)d₂); H¹(L,ℤₚ(2)) is torsion-free as ω² ≠ 1 for p>3; ℚ₃ gives ℤ₃⊕ℤ/3 | λ_L ≅ p²𝒪_L stands without c₂. |
| §4.7 calibration / §§5.8(2), 5.9 | c₂=1/5 at p=5 (R01) | λ image 25ℤ₅; D_L image 5ℤ₅; root span 25ℤ₅ of index 5; v₅(c₂) = −1 ≤ 0 is consistent with §4.7's proved half | No stated law excludes it: R01. |
| §§6.1, 6.5, 6.6 p² ranges | Same model | D_{F,p}(K₃(F)) ⊂ 5(𝒪_F⊗ℤ₅) only | Depends on R01. |
| §6.2 | ζ₇ ∈ ℚ(ζ₇), p=7; ζ=ω(2), p=5 | v₇(1−ζ₇)=1/6, not special; Theorem 1.12 gives Li₂(ζ₇). The special case gives Li₂(ω(2)) ≡ 25 mod 125 | (a) is true, but its locator and derivation are wrong: R05. |
| §7.10 complex and coordinates | d∘d; coboundary d(a); nonsplit Tate curve over ℚₚ; N(a,b)=(b,0), ρ=(0,1), λ=2 | d∘d = Nφ−pφN = 0 by (3.5); ρ=Na−Na=0, β=−I_πa+I_πa=0; twisted D₋₂ has pφ=−1, so ker(1−pφ)=0 while D₋₂ is a line; −λIρ−(λ²/2)INρ = (−2,−2) | Pass; ker(1−pφ) is the correct carrier. |
| §8.3 / §8.4 | Φ=(2), a=−5, b=6; Φ=[[2,1],[0,3]]; Φ=(1), a=−3, b=2; Φ=(0) | Q=−1; Q=[[−1,½],[0,−½]] and (I−Φ)Q=I; s=0 gives total Q=0 and product 0; Q=1 | Pass. |
| §8.5 | Φ=2, a=−5, b=6, p=5; Φ=−1, a=2, b=1 | Both sides −9/10 (numerator 52−106=−54, denominator 60); both sides 3/5 | Pass. |
| §8.6 | j=0,−2,−3 | 1, −1, ½ (2 would be the wrong model) | Pass. |
| §8.10 | h=2 on t^k v, k=0,1,2 | ∇₁∇₀(v)=0, ∇₁∇₀(tv)=0·1·tv=0, ∇₁∇₀(t²v)=2t²v=2!t²v | Pass; the quotient is needed at k=h. |
| §8.12 | λ_m(χ^j); T_{−m}(ℓ_i); m=1 against LZ line 906 | j!/(j−m)!; ℓ_i(χ^{j+m}) = j+m−i = ℓ_{i−m}(χ^j); T_{−1}(ℓ₀L_V⊗t⁻¹e₁) = ℓ₋₁L_V⊗t⁻¹e₁ | Pass; T_m would be T_{2m}-semilinear. |
| §8.17 | a=2 then b=3 at p=5 | [σ₂]⁻¹[σ₃]⁻¹ = [σ₆]⁻¹, which is δ_{1/6} in the Dirac model (δ₆ would be wrong) | Pass. |
| §8.19 | Weights (0,2), (1,1), (0,0), (2) | ℓ₀ℓ₁; ℓ₀²; 1; ℓ₀ℓ₁ with value 2·1=2 at χ² | Pass. |
| §8.22 | α=1; α=−1, β=−5; ω ↦ 5^Nω and 2ω | Multipliers 0 and 2/(6/5)=5/3; coefficients 5^{−N} ∉ ℤ₅ and ½ | Pass. |
| §9.15 | M=[[1,2],[3,4]], c=(5,7); (½,⅓)·diag(2,3) | cM=(26,38) and cMᵀ=(19,43); (1,1) | Pass; page missing (R06). |
| §9.17 | c=(1,0), U=[[1,1],[0,1]], M=B=I; B=diag(2,3); rank one 3,2,5,7 | c′=(1,−1), M′=U, c′M′=(1,0); (½,0); c′M′ = (3/2)(10/7) = 15/7 = cM/B | Pass. |
| §9.26 | Rank one, V₀=0 at 0; weights (0,2), d=2 | Image XE[X] (1 excluded); det S = X(X−χ(γ)+1) since n₀=n₁=1 | Pass. |
| §9.32 | κ=x^k for k=0, 1, −1 | ∂((1+T)^iφ^Nw) = (1+T)^i·i·φ^N((1+p^N∂/i)w), so (2) gives ∂^k for every k ∈ ℤ: k=0 gives identity, k=1 gives ∂, k=−1 gives (1+p^N∂/i)⁻¹/i = ∂⁻¹ | Pass. |
| §1.8 dimensions over ℚ₅ | r=0,1,2 | (H¹_e,H¹_f,H¹_g,H¹) = (0,1,1,2), (1,1,2,2), (1,1,1,1) | Pass. |
| §3.3 inversion symbol | ∂⟨2⟩ over ℚ | 2⊗(−1)+2⊗2 = 2⊗(−2); the pairing v₂(u)s(v)+s(u)v₂(v) gives 1 | Pass; it lies outside B(ℚ). |
| §4.7 archimedean Checks | ℚ(i); ℚ(√−3) | D_BW(i) = Catalan's constant ≈ 0.91597; max D_BW = 1.01494 at e^{iπ/3}, so 2P₂ ≈ 2.02988i and Borel value ≈ −4.05977i | Pass. |
| R02 gap content | n=3, KTheoryFiniteLocalFields §§6.2, 3.5, 6.10 | T_pK₂(L)=0 gives K₃(L;ℤ_p) = lim K₃(L)/p^ν; K₃ᴹ divisible gives K₃/p^ν = K₃^ind/p^ν | Already supplied: R02. |

**Declared gaps.** The plan declares one gap, `completed-bloch-comparison`, and the README declares none (R02). R01 proposes one new gap with a named supplier.

## Not verifiable

- **Nakamura2014 Theorem 3.10(2), cited in §9.30a.** The extracted text (p. 37) shows the factor as "|Γ_{L,tor}|(−h−k)!p^{m(L)}", and no page renderer is available to tell a product from a fraction. The order of the factors suggests a fraction, which would agree with the README's 1/(j−h)! and with Berger2003's (−h−j)!⁻¹ (Berger2003 line 830–831). Not raised.
- **The inverse exponent on Γ* in RJ2018 Théorème I.10 (p. 909)** is not legible in the extraction. The README's correction for case (ii) rests on Nakamura2014, Berger2003 Theorem II.10 and RJ2018 Théorème I.15. Not raised.
- **Ownership against open pull requests** was checked through the roadmap index (476 open pull requests) and the sibling checkouts named in the brief. KTheoryFiniteLocalFields, SelmerIwasawaCohomology and the other suppliers without a listed checkout were read at their open heads through the roadmap tool.

## Source issues

- **Gap** in GSWZ2024 at Theorem 9, proof, printed p. 39: the source says the regulator image of K₃(K_p;ℤ_p) lies in p²𝒪 "using Lemma 3.1", which treats only arguments z with |z| = |1−z| = 1; it should supply an argument for every element of the completed Bloch group, or the unit value of the normalizing constant; affects a stated result.
- **Misprint** in GSWZ2024 at Proposition 3.3, (179), printed p. 38: the source says the span runs over all ζ in μ(ℚ_{p^s}), including ζ = 1, where D_p is undefined; it should exclude ζ = 1, as Proposition 3.2 does; affects nothing.
- **Error** in Besser2025 at Proposition 3.5, printed p. 8: the source says H¹ of the complex (3.9) is D₋₂ when D₀ = 0; it should say D^{pφ=1}, which its own proof yields and which is 0 on the twisted weight −2 line of a nonsplit Tate curve (pφ = −1); affects a stated result.
- **Error** in LLZ2011 at the proof of Proposition 5.11, printed p. 1129: the source says nonzero e₁, e₂ ∈ 𝒪_E with e₁e₂ ≠ 1 give a matrix in GL(2,𝒪_E); it should require 1 − e₁e₂ ∈ 𝒪_Eˣ (for example e₁ = 1, e₂ = −4 over ℤ₅ gives determinant 5); affects the proof.
- **Misprint** in LZ2014 at Appendix B, equation (10), p. 39: the source says Tw_{−h}; under its convention Tw_η(g) = η(g)g, its §4.4 formula (p. 21) and its denominator ℓ₋₁⋯ℓ₋ₕ, it should be Tw_{χ^h}; affects nothing.
