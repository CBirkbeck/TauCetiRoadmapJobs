<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/296#issuecomment-6407931597 -->
Review (claude) of dc0fd5b

Verdict: accepted
Conditional on the announced gaps: `qcqs-frobenius-factorization`, `h-descent-formalism`

1. **F01** (P3) Extraction line numbers used as source locators

   **Location.** `packages/CrystallineCohomologyPartII/design/README.md` line 981 ("CR11 Definition 1.1.14, p. 10, lines 430–435"), line 1577 ("BBE07, §6.5, p. 36, lines 1543–1546"), line 1585 ("(BBE07 lines 1543–1546)"); `plan.json` `sourceIssues` E6 locator ("line 233 of the extraction").

   **Claim.** A locator is a theorem, section or printed page.

   **Witness.** The line numbers are those of the worker's line-numbered extraction, which no reader of the roadmap has; the printed locators beside them (CR11 p. 10; BBE07 §6.5, p. 36; CR12 Introduction p. 6) already identify the passages.

   **Repair.** Delete the three "lines N–M" clauses and the "(line 233 of the extraction)" clause; keep the printed locators. Tested: each printed locator alone finds the passage (CR11 Definition 1.1.14 is on its p. 10; BBE07 §6.5 occupies p. 36; CR12 Theorem 4.7.4 restates the cone criterion on p. 93).

2. **F02** (P3) Process phrase in WV.0.5

   **Location.** README line 221: "topological connectedness of fibres at points is not enough (see the acceptance test)".

   **Claim.** Timeless prose.

   **Witness.** "Acceptance test" is the plan's field name; the reader sees Checks. The test meant is the first Check of WV.0.5 (line 234: Spec F_{q²} → Spec F_q).

   **Repair.** Write "(the Spec F_{q²} → Spec F_q Check below)".

3. **F03** (P3) HW23 locators use the published numbering while the certified text is arXiv v2

   **Location.** README line 116 ("Hacon–Witaszek 2023, Corollary 4.7, p. 19"), line 219 ("HW23, proof of Corollary 4.7, p. 19"), line 512 (same), line 1234 ("HW23, Corollary 4.7, p. 19: Q-factorial klt fourfolds … WO-rational"); manifest locator "§2; Corollary 4.6 and proof (v2)".

   **Claim.** The cited corollary is the WO-rationality of Q-factorial klt fourfolds with a log resolution.

   **Witness.** In the certified arXiv v2 that statement is Corollary 4.6, p. 21 (HW23 lines 953–955), and the exact sequence 0 → WI_{S,ℚ} → WO_{Y,ℚ} → u_\*WO_{S,ℚ} → 0 is in its proof (line 975); v2's Corollary 4.7 (line 993) is the existence of dlt modifications, and v2 p. 19 (lines 836–883) contains neither. The References entry (line 1776) already records the published/v2 shift, but the four in-text locators point into the wrong corollary and page of the text the manifest certifies.

   **Repair.** In the four places write "HW23, Corollary 4.6 and proof, p. 21 (arXiv v2; Corollary 4.7 in the published version)". Published Corollary 1.3, pp. 2, 19–20, stays cited by locator as the References entry says.

4. **F04** (P3) WV.5.9 proof step uses "S is Cohen–Macaulay" without a reason

   **Location.** README line 1320: "with 0 → W_{n−1}ω_X →(p) W_nω_X → ω_X → 0 (WV.4/witt-canonical-system) and duality on the CM scheme S, the same for Wω".

   **Claim.** A normal S with a rational resolution is Cohen–Macaulay.

   **Witness.** True but not stated anywhere in the roadmap; CR12 line 4087 also writes "Since S is CM" and relies on its Definition 4.4.1 reference. The one-line reason: Rf_\*O_X ≅ O_S and R^{>0}f_\*ω_X = 0 give, by Grothendieck duality for the proper f, RHom(O_S, ω_S^•) ≅ Rf_\*ω_X[d] = f_\*ω_X[d], so the dualizing complex of S sits in one degree.

   **Repair.** Insert after "duality on the CM scheme S": "(S is CM: Rf_\*O_X = O_S and R^{>0}f_\*ω_X = 0 give ω_S^• ≅ f_\*ω_X[d] by SchemeAndStackFoundations §2.21, sheafified grothendieck duality)". Tested on the quadric cone A²/{±1}, p odd: minimal resolution with exceptional P¹, R¹f_\*O = 0 = R¹f_\*ω, and the cone is CM; on the split nodal cubic the step never starts, since S is not normal (its negative-control Check).

5. **F05** (P3) Manifest and wording details

   - **`sources.toml` line 411, `cited_for = ["WV.6.10"]`.** Every other entry cites nodes by id (`WV.6/universal-chow-zero-triviality`); use the node id. The cached text (`fetched_from` the Weil-cohomology chapter) contains Lemma 45.8.2 (Stacks line 1074) but not Lemma 42.15.2, which lives in the Chow Homology chapter; add its tag URL to the entry's `locator` note so the second locator is also readable from the manifest. Both were read (below).
   - **README line 1333, WV.5.10.** "In particular the cone over … is WO-rational iff …" is not a particular case of the sentence before it: the cone need not be normal, and the proof route (step 3) argues condition (1) separately through connected fibres. Write "Separately, the cone over …".

Reviewed read-only at head dc0fd5b (the pull request's current head, confirmed): `packages/CrystallineCohomologyPartII/design/README.md` (1793 lines, 59 targets in seven layers), `packages/CrystallineCohomologyPartII/design/plan.json` (59 nodes, 2 gaps, no requests) and `packages/CrystallineCohomologyPartII/sources.toml` (25 entries: 17 certified, 8 uncertified). The round-2 repair was checked finding by finding first; then the adversarial pass was run over every passage the repairs changed or added, over the seeded sample and over every target a finding touches. Five findings, all P3; no P1 or P2. Acceptance is conditional on the two declared supplier gaps `qcqs-frobenius-factorization` and `h-descent-formalism` (checked below).

## Round-2 findings

Each round-2 finding was checked against the head.

| Round-2 id | Status | Repaired passage (head dc0fd5b) |
| --- | --- | --- |
| F01 (P2, normality in WV.5.9) | repaired | README line 1312 "(1) If S is normal and has rational singularities, that is, admits a resolution f: X → S (f projective and birational, X smooth) with R^if_\*O_X = 0 = R^if_\*ω_X for i > 0, then S is Witt-rational"; line 1314 "in (1) S is normal and a resolution exists"; step 1 (line 1320) "S is normal and f projective birational, so f_\*O_X = O_S"; negative control at line 1327 (split nodal cubic: f finite, higher direct images zero, f_\*O_{P¹} ≠ O_S, H¹(S, WO_S)_K = K ≠ 0); plan node `WV.5/rational-implies-witt-rational` `hypotheses` carry "S is normal"; WV.0.7 Check (line 278) and Example (line 312) now say "normal S". Matches CR12 Definition 4.4.1 (CR12 line 3881, "S a normal variety") and the proof at CR12 lines 4086–4088 |
| F02 (P2, compound gap) | repaired | README line 57: the gap asks for the h-topology generated by finitely presented v-covers (§1.3), Rydh's refinement (§1.6) and the universal-descent class with cancellation and composition (§1.1), and says the inductive level is `properSurjective_inductiveLevel` and §1.4 is not consumed; plan `gaps[1].section` = "1.1, 1.3, 1.6"; WV.1.5 *Needs:* (line 430) lists the gap once; step 2 (line 435) uses exactly those three inputs. Resolved in `packages/ArcTopologyAndDescent/design/README.md`: §1.1 (line 196; `UniversalDescent.comp`, `.cancel` at lines 206–207), §1.3 (line 243), §1.6 `rydh_refinement` (lines 287–289) |
| F03 (P3, MotivesAndAlgebraicCycles §2.2) | repaired differently, correctly | At head 79b02f6 (pull request 1313) §2.2 "Classical Weil cohomology" (its line 353) states at line 359: continuity of Chow groups over algebraic extensions as a filtered colimit of finite subextensions, torsion kernel of base change to an algebraic closure, for smooth projective schemes. So WV.5.11 (smooth projective X) keeps the citation (README line 1359, contracts line 51, now labelled with the right content and the smooth-projective scope), and WV.6.10 owns the two lemmas for proper X (lines 1618, 1627–1628, 1636) with Stacks Lemma 45.8.2 (0FH6) and Lemma 42.15.2 (02RH), both read: Stacks line 1074–1076 (CH_i(X_K) = colim over finite subextensions, X finite type over k, K/k algebraic) and tag 02RH (f finite locally free of degree d ⇒ f_\*f^\*α = dα on cycles). The round-2 witness was wrong about the head's content; the repair report's correction stands |
| F04 (P3, EnhancedDerivedSheaves names) | repaired | README lines 334, 627, 49 "§E5:descent, `moduleDescent`"; lines 354, 359–360 "§E5:animation.2, `simplicialWitt` and `wittFrobeniusLocalization`; `frobenius_zero_on_positive_homotopy`". On main 7dc0f1b: `TauCetiRoadmap/EnhancedDerivedSheaves/README.md` Layer E5:descent at line 1791 with `moduleDescent` (line 1809); E5:animation.2 at line 1949 with `frobenius_zero_on_positive_homotopy` (line 1951) and `simplicialWitt`, `wittFrobeniusLocalization` (lines 1963–1965) |
| F05 (P3, gap ids and WV.1.3) | repaired | plan `gaps[0].id` = `qcqs-frobenius-factorization`, `gaps[1].id` = `h-descent-formalism`; `gaps[0].neededBy` = WV.0.5 and WV.1.5 only; WV.1.3 *Needs:* (line 374) and plan prerequisites of `WV.1/witt-pushout` carry no gap; Layer WV.1 Dependencies (line 476) lists each gap once |
| F06 (P3, Tan18 locator) | repaired | line 1654 "(Tan18, Remark 5.3 (1), arXiv v3, p. 20, from Proposition A.4, p. 30)"; manifest locator "Remark 5.3 (1), p. 20; Proposition A.4, p. 30"; Tan18 lines 763–765 (Remark 5.3 (1)) and 1183–1186 (A.4: proper, geometrically normal, geometrically connected) |
| F07 (P3, dimension phrase) | repaired | line 817 "because each U_i, being étale over U, has dimension d and is a dense open of the union of the d-dimensional components of the smooth projective X_i, to which the case of opens of smooth proper schemes of dimension d applies"; BBE07 lines 1392–1394 |
| F08 (P3, shape) | repaired | gap listed once (lines 430, 476); no duplicate Checks remain in any section (script over all 59 `**Checks.**` lists: 0 repeats); `## Source corrections` deleted (headings at lines 7, 17, 37, 59, 75–1415, 1763, 1767 only); `## Downstream consumers` (line 1765) names no roadmap; "Correction carried", "design" and the quasi-projectivity boilerplate are gone (Conventions item 10, line 28; layer preambles at lines 868 and 1087); ClassicalAdicEtaleCohomology "§5.4, PlurinodalAlteration.exists" (lines 45, 1131), which is §5.4 "Base change and constructibility" at head dfcb6b7 (its lines 2709, 2722). Residual process phrase: R02 |

No round-2 finding was marked not actionable, so nothing is re-raised.

## Verified sound

**Gate output** (run verbatim at the head; no UPWARD or CYCLE line):

```
candidate: CrystallineCohomologyPartII is not in the merge order yet; checked as if placed after PadicDifferentialEquationsAndRigidCohomology (the intake inserts it when its design is accepted)
depcheck: 56 roadmaps, 641 edges, 0 problem(s)
```

The citation resolver (main 7dc0f1b, 367 open heads, index of 2026-10-26) reported no cross-roadmap citation and no Lean name found nowhere. Every supplier named is on main (SchemeAndStackFoundations, DerivedModuleAlgebra, EnhancedDerivedSheaves, EtaleCohomologyFoundations, AdicSpacesPartIII) or earlier in `merge-order/ORDER.txt` (SchemeAndStackFoundations 2, EnhancedDerivedSheaves 14, DerivedDeRhamCohomology 17, CrystallineCohomology 18, AbelianSchemesAndArithmeticModuli 36, NeronModelsAndSemistableAbelianVarietiesPartII 46, ClassicalAdicEtaleCohomology 49, MotivesAndAlgebraicCycles 65, PadicDifferentialEquationsAndRigidCohomology 94), except the gap supplier ArcTopologyAndDescent, a board design outside the order (declared gap). No board package and no open head cites this roadmap: no cycle. The principles hold: no route-specific shortcut (the general separated-finite-type, perfect-field statements of BBE07 and the quasi-projective setting of CR12 are kept at the sources' generality), the parent is imported and not re-planned (Witt schemes, smooth trace: Scope and ownership, lines 13–15), no copied passages, no algorithms, no sorry'd data or `set_option` (design stage).

**Supplier citations re-resolved this round** (main moved since round 2).

| Supplier | Resolved (copy read) |
| --- | --- |
| SchemeAndStackFoundations (main 7dc0f1b) | §0.20 (line 1302), §0.23 (1475), §0.26 `frobenius_factors_through_universalHomeomorphism` for finite-type 𝔽_p-schemes only (1677–1678: the first gap is real), §0.29 (1825), §2.6 `ample_serre_vanishing` (3445), `proper_fibreDimension_vanishing` (3456), §2.7 (3482), §2.19 `upperShriek_compactification_independence` (4094, 4118), §2.20 (4275), §2.21 `trace_finite` (4390, 4411), §4.9 (5448), §4.12 (5613), §4.14 (5706), §4.16 (6038), §4.19 (6372), §5.1 rational equivalence (6567), §5.2 proper pushforward with residue-degree weights, flat pullback, `localization_exact`, degree (6653–6700: `f_\*[V] = [K(V) : K(f(V))][f(V)]`, `test_pushforward_degree`), §5.5 refined Gysin (6768) |
| EnhancedDerivedSheaves (main) | E1.3 (549), E1.4, E2.6 (2293), E2.8 `properSurjective_inductiveLevel` (2415), `descendableCover_fppf` (2427), E5:descent `moduleDescent` (1791, 1809), E5:animation.1 (1900), .2 (1949–1965), .3 `tot_filteredColimit_of_bounded` (1978–1980) |
| EtaleCohomologyFoundations, DerivedModuleAlgebra, AdicSpacesPartIII (main) | `nagataCompactification` (line 107); §1.T.1 Mittag-Leffler (line 29 of its table); §F0.6 coherent formal modules (2729) |
| MotivesAndAlgebraicCycles (head 79b02f6) | §0.1 (line 80), §0.6 (178), §2.2 (353, 359) |
| ClassicalAdicEtaleCohomology (head dfcb6b7) | §5.4 `PlurinodalAlteration.exists` (2709, 2722) |
| NeronModelsAndSemistableAbelianVarietiesPartII (head e974688) | §1.1 ferrand geometric pushouts (its line 264), cited only in a WV.1.3 Check |
| ArcTopologyAndDescent (board design) | §1.1 (196–207), §1.3 (243), §1.6 (287–289) |
| CrystallineCohomology (013a921), PadicDifferentialEquationsAndRigidCohomology (5ea2fe1), AbelianSchemesAndArithmeticModuli (71ecc01), DerivedDeRhamCohomology (83d00dd) | heads unchanged since round 2; the round-2 resolution table (every cited section with its line) stands |

**Declared gaps.** `qcqs-frobenius-factorization`: precise (both composites, hypotheses finite, finitely presented, qcqs), minimal (§0.26 is finite type over 𝔽_p only; BS17 line 2454–2455 uses the factorization without any finiteness hypothesis, so nothing earlier provides the qcqs form), declared in both files with the same slug (plan `gaps[0]`, README line 55). `h-descent-formalism`: precise after the repair (three named deliverables, each at its section), minimal (the inductive level is taken from EnhancedDerivedSheaves §E2.8, the §1.4 criterion is dropped; round-2 row 29 and the repair's dimension-0/1 route check), declared with the same slug (plan `gaps[1]`, README line 57). Neither asks for what Mathlib, Tau Ceti or an earlier roadmap provides. Acceptance is conditional on both.

**Seeded sample (15 targets, seed = the job id, drawn from the 59 plan nodes).** All read at the locator.

| # | Target | Checked against | Result |
| --- | --- | --- | --- |
| 1 | WV.3/slope-subspace | BBE07 lines 1426–1440 (6.1, pp. 33–34: Newton polygon, P^λ, P^{<ρ}, Manin's identity) | faithful |
| 2 | WV.6/esnault-point-count | ESN03 lines 52–55 (Thm 1.1), 63–69 (slopes ≥ 1 and geometric connectedness give ≡ 1 mod q; Cor 1.2), 77–82 (Cor 1.3); GNT19 lines 51–53 (Thm 1.1), 58–61 (Thm 1.2), 68–70 (Thm 1.3) | faithful; the mod q^r strengthening is BBE07 Prop 6.3 with Φ = ζ(X, t)(1 − t) |
| 3 | WV.0/witt-universal-homeomorphism-invariance | BS17 lines 2454–2456; GNT19 lines 767–779 (Lemma 2.22: proper surjective, geometrically connected fibres); NT20 lines 650–674 (Lemma 2.17 and the converse's proof) | faithful; the README's (ii) ⇐ is NT20's argument verbatim in content |
| 4 | WV.2/simplicial-resolution | BBE07 lines 685–711 (Definition 3.1 a)–c), existence via de Jong componentwise and Deligne (6.2.5)) | faithful |
| 5 | WV.0/rational-witt-sheaves | CR12 lines 3364–3372 (Prop 3.7.7), 3441–3445 (Notation 3.7.9, with the warning that WΩ_{X,ℚ} ≠ WΩ_X ⊗ ℚ); GNT19 lines 669–692 (Remark 2.17 (1)–(5)) | faithful; the proper-scheme equivalence is Remark 2.17 (5) |
| 6 | WV.0/witt-closed-mayer-vietoris | BBE07 lines 285–311 (Prop 2.2, Cor 2.3); NT20 lines 677–689 (Lemma 2.18 (1)–(2), ideal version) | faithful |
| 7 | WV.0/witt-nil-invariance | BBE07 lines 259–282 (Prop 2.1 (i)–(ii)); CR12 lines 4277–4281 (Lemma 4.6.2); NT20 lines 275–285 (Remark 2.2) | faithful; (iii) is the roadmap's own, with its counterexample (row 12 below) |
| 8 | WV.6/rationally-chain-connected | GNT19 lines 1298–1312 (Def 4.5, Remark 4.6 (1)–(2)); Tan18 lines 763–769, 1183–1186 | faithful; hypotheses are A.4's |
| 9 | WV.6/serre-bockstein-vanishing | BBE07 lines 1543–1546 (injectivity of H^n(A, O_A) → H^n(A, W_{i+1}O_A) from Serre's Bockstein vanishing, citing [24, §1, 3] and [25, Théorème 2]); Ser58Top §3 (line 1134, p. 27) | faithful; locator form R01 |
| 10 | WV.5/isolated-singularity-criterion | CR12 lines 4301–4313 (Cor 4.6.4: integral S, isolated s, f projective birational, iso off s), 4444–4456 (Thm 4.7.4) | faithful; the README adds normality and smoothness of X, both needed for the "iff" (condition (1) and the quasi-resolution property) |
| 11 | WV.5/finite-quotients-witt-rational | CR12 lines 179–184 (Thm 3), 3965–3983 (Cor 4.4.7, Remark 4.4.8, Prop 4.4.9 with proof) | faithful; the WO-rational variant of (ii) follows from the same two displayed equivalences |
| 12 | WV.4/hodge-witt-pushforward | CR12 lines 1858–1932 (§2.3: (2.3.1)–(2.3.4), Def 2.3.1, Remark 2.3.2, Prop 2.3.3 (1)–(2), Prop 2.3.4) | faithful |
| 13 | WV.0/witt-limit-lemmas | GNT19 lines 696–763 (Lemmas 2.18–2.21 with proofs); CR12 lines 528–536 (Lemma 1.5.1) | faithful; GNT Lemma 2.20 is stated for every morphism (line 732–735) and its proof uses quasi-coherence only, so the README's properness in (3) is the needed correction (source issue below) |
| 14 | WV.6/rcc-chow-zero-triviality | ESN03 lines 72–76; GNT19 lines 1304–1312; Kol96 by locator | faithful |
| 15 | WV.6/low-degree-complete-intersections | BBE07 lines 177–180 (Cor 1.5), 1594–1633 (Prop 6.8 with proof; proof of Cor 1.5: congruence for all finite extensions) | faithful |

**Adversarial table.** One row per repaired or added statement, sampled target or target a finding touches; values computed on both sides.

| # | Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- | --- |
| 1 | WV.5.9 (1), S normal with a rational resolution | A²/{±1}, p odd; split nodal cubic; cusp | quadric cone: normal, minimal resolution with exceptional P¹, R¹f_\*O = 0 = R¹f_\*ω, H¹(P¹, WO_ℚ) = 0: Witt-rational; node: excluded by normality (f_\*O_{P¹} = O_S ⊕ (skyscraper k at the node) ≠ O_S); cusp: not normal, excluded, though its normalization is a universal homeomorphism and the cusp is WO-rational by WV.5.6 | holds | R04 (cite CM) |
| 2 | WV.5.9 negative control | split nodal cubic S, f: P¹ → S | f finite ⇒ R^{>0}f_\* = 0 on O and ω; H¹(S, O_S) = k, H¹(S, WO_S)_K = K (slope-0 part of H¹_rig(S) = K from the loop), H¹(P¹, WO)_K = 0; fibre over the node has two points, so WO_{S,ℚ} → f_\*WO_{P¹,ℚ} fails at the node (residue map k → k × k) | Check correct | — |
| 3 | WV.6.10 colimit lemma | X = P¹, L = F_q, L̄ = F̄_q; X = ∅ | [a] − [b] with a, b ∈ F_{q^m} lives over F_{q^m}; a rational equivalence between zero-cycles involves finitely many curves and functions, each over a finite subextension; for ∅ every group is 0 = colim 0 | holds (Stacks 0FH6, finite type X) | — |
| 4 | WV.6.10 π_\*π^\* = [L′ : L] | P¹_{F_q}, L′ = F_{q²}: rational x; degree-2 y; L′ = L | π^\*[x] = [x′] with κ(x′) = F_{q²}, weight [F_{q²} : F_q] = 2 ⇒ 2[x]; κ(y) ⊗ F_{q²} = F_{q²} × F_{q²}, two points of weight 1 ⇒ 2[y]; unweighted pushforward gives [x], 2[y] (refuted model); L′ = L gives the identity | holds (Stacks 02RH: finite locally free of degree d) | — |
| 5 | WV.6.10 reduction to algebraically closed L | X nonempty proper; X = ∅ | α of degree 0 dies in CH_0(X_{L̄}) ⊗ ℚ, hence N·α dies over a finite L′, hence [L′ : L]·N·α = 0 over L: injective after ⊗ℚ; surjective since a closed point has positive degree; for X = ∅, 0 → ℚ is not onto, so ∅ is not universally CH_0-trivial for any L (consistent) | holds | — |
| 6 | WV.6.10 genus ≥ 1 non-example | C of genus 1, L = algebraic closure of k(C); L = F̄_p | [η] − [0] ∈ J(L) of infinite order, so CH_0(C_L) ⊗ ℚ ≠ ℚ; over F̄_p, J(F̄_p) is torsion and CH_0 ⊗ ℚ = ℚ: the test needs transcendental L | Check correct | — |
| 7 | Gap h-descent-formalism | WV.1.5 route, dim Y = 0, 1 | dim 0: fppf descent (WV.1.1); dim 1: Rydh refinement to a proper surjection over affine Y, inductive level ≤ 1, blowup at points, pushout Y′ (WV.1.3), excision (WV.1.4); §1.4 never invoked | contract precise and minimal | — |
| 8 | Gap qcqs-frobenius-factorization | F_p(t) ⊂ F_p(t^{1/p}); A = F_p[t_1, t_2, …]/(t_i^{p^i}) → F_p | g\*(b) = b^p gives N = 1 for fields not of finite type; the second map is finite but not finitely presented (kernel not finitely generated), so the finite-presentation hypothesis is used and present; SF §0.26 states only the finite-type case (main line 1678) | contract precise | — |
| 9 | WV.3.6 step 3 | threefold X, X_0 = Bl_pt X | X_0 ×_X X_0 ⊃ P² × P² of dimension 4 > 3; U_1 étale over U has dimension 3 and is dense in the 3-dimensional components | wording now correct | — |
| 10 | WV.6.11 base change | E; P^n; Spec F_{q²}/F_q | MRCC bases of dimension 1 (E, not RCC) and 0 (P^n, RCC) before and after k′/k; Spec F_{q²} is not geometrically connected, excluded by the hypothesis | holds | — |
| 11 | WV.0.5 (ii) both directions | Spec F_{q²} → Spec F_q; cusp normalization; F_p(t^{1/p})/F_p(t) | W(F_q)_ℚ → W(F_{q²})_ℚ has dimensions 1 ≠ 2: fibre connected but not geometrically connected, not an isomorphism (⇐ direction's converse witness); cusp: finite universal homeomorphism, isomorphism; N = 1 for (i) | holds | R02 (phrase) |
| 12 | WV.0.4 (iii) | A = F_p[t_1, t_2, …]/(t_i^{p^i}) | x = (t_1, t_2, …) ∈ W(N); F^c(x)_i = t_i^{p^c} ≠ 0 for i > c, so no power of F kills x, yet x ↦ 0 in W(A_red) = ℤ_p: W(A)[1/F] → W(A_red)[1/F] not injective | Check correct; (iii) needs nilpotent nilradical | — |
| 13 | WV.0.6 | two axes in A²; X_1 = X_2 = X | H^0: W(k[x])_K ×_K W(k[y])_K; degenerate cover: 0 → WO → WO ⊕ WO → WO → 0 exact (diagonal, difference) | holds | — |
| 14 | WV.0.7 (3) | j: A² ∖ 0 → A²; X = A² ∖ 0 | fibres of dimension 0 but [x⁻¹y⁻¹] gives R¹j_\*WO ≠ 0 (properness needed); H^i = 0 for i > 2 = dim X | holds; E4 recorded | — |
| 15 | WV.6.6 | conic (n = 2, d = 2); cubic surface; r = 0 | q + 1 ≡ 1; 1 + aq + q² ≡ 1; r = 0 gives Z = P^n with H^{>0}(WO) = 0; r ≤ ∑d_j ≤ n gives dim Z ≥ 0, so Z ≠ ∅ and H^0 = K | holds | — |
| 16 | WV.6.14 (i) | P^n over F_{q^r}; cubic surface | 1 + q^r + ⋯ + q^{nr} ≡ 1 mod q^r; 1 + a q^r + q^{2r} ≡ 1 mod q^r | holds | — |
| 17 | WV.6.12 | cubic surface; E | every pair of points joined by chains of lines/conics, CH_0 = ℤ; E has no rational curves, hypothesis fails | holds | — |
| 18 | WV.6.8 | g = 0; g = 1, i = 1; g = 1, p = 2 supersingular | V^i(a) = (0, …, 0, a, 0, …) injective; W_2(k) → k onto ⇒ boundary 0; W_{i+1}(k) → W_i(k) onto for every i | holds | — |
| 19 | WV.5.10 | cone over a conic; over C of genus g ≥ 1; over Z = Spec F_{q²} | H¹(P¹, WO_ℚ) = 0: WO-rational; dim H¹(C, WO)_K ≥ g > 0: not; Z not geometrically connected: W(F_q)_ℚ → W(F_{q²})_ℚ has dimensions 1 and 2, condition (1) fails although H^{>0}(Z, WO) = 0 | holds | R05 (wording) |
| 20 | WV.5.6 | F_{X/k}; A²/{±1} | u_\*u^\* = p^{dim X}, isomorphism up to isogeny both ways; finite quotient of degree 2 | holds | — |
| 21 | WV.4.2 | π: P¹ → Spec k; F: A¹ → A¹ | π_\*: H¹(P¹, WΩ¹) = W(k) → W(k) isomorphism, zero on H⁰(WO) (bidegree shift (−1, −1)); F_\*F^\* = p ≠ 1 | holds | — |
| 22 | WV.2.5 | nodal cubic; identity nerve | P¹ → X proper surjective, étale over the smooth locus, X_1 = P¹ ×_X P¹ = P¹ ⊔ two points; the identity's nerve has singular terms, not a resolution | holds | — |
| 23 | WV.3.1 | E = K, F = p^aσ; H²_rig(P¹); elliptic P(t) = 1 − a_1t + pt² | slope a, E^{<1} = E iff a ≤ 0; K(−1) has slope 1, (H²)^{<1} = 0; p ∤ a_1: unit root α, P^{<1} = 1 − αt; p | a_1: both slopes 1/2, P^{<1} = P | holds | — |
| 24 | WV.0.2 | ⊕_{n≥1} ℤ/p^n; ℤ/3 at p = 2 | F ⊗ ℚ = 0 but q(F) ≠ 0; ℤ/3 ∈ T(X) though no power of 2 kills it (CR12 line 3441: Serre class by nonzero integers) | holds | — |
| 25 | WV.5.11 step 1 | ξ_0 of degree e | e[η_X] − [ξ_0] has degree e − e = 0; dies over Ω after ⊗ℚ, N·(e[η] − [ξ_0]) = 0 over Ω, N′N·(…) = 0 over k(X) by the torsion kernel (X_{k(X)} smooth projective, so §2.2 applies) | holds | — |

**Conventions recomputed.** W_2(F_2) = ℤ/4 with V(1) = 2 ≠ [1]; over F_4, F = (σ, 2σ) gives φ = (1, 4), slopes 0 and 1; P¹ exponents −1 in degrees 0 and 2; ⊕ℤ/p^n separates the two rationalizations.

**Duplication audit (by object).** `roadmaps grep` over main and the 367 open heads for universally CH_0-trivial, rationally chain connected, Witt vector cohomology / WO-rational / Witt-rational, quasi-resolution, theta-divisor and Ax–Katz congruences, and the zero-cycle field-extension lemmas (finite subextension colimit, π_\*π^\* = degree): no match outside this roadmap except the parent's bibliography line (CrystallineCohomology line 7390), GeometricSatakeAndFusion's "rational Witt category" (a Satake-category object, unrelated), one word in a PadicDifferentialEquationsAndRigidCohomology proof route (line 12035), and theta divisors as abelian-variety geometry in JacobianChallengePartII and MordellLawrenceVenkatesh (not point counts); "finite subextension" hits are Galois-theoretic (BelyiMaps, LocalFieldsRamification). MotivesAndAlgebraicCycles §2.2 states the two lemmas for smooth projective schemes only (line 359); the proper-scheme form is owned here. This roadmap is the owner of every target. Ownership against the open pull requests named in the brief was checked through the grep index (no sibling checkout paths were given).

**Shape.** Every definition and construction has its API list and at least three Checks (3 to 7 each; script over all 59 sections); every theorem has hypotheses and a locator; every layer ends with Examples and Dependencies; no LaTeX delimiters, no pull-request numbers, no target tables, no field lists, no `set_option`; the only process residue is R02 and the locator form of R01. Lean form: not applicable at the design stage (no `Suggested.lean`), so no padding probe and no `#check` comparison; elaboration: not available (this lane does not elaborate).

**Headline theorems for the package stage.** BBE07 Theorem 1.1 (WV.3.6), BS17 Proposition 11.41 and Theorem 11.40 (WV.1.5–1.6), BBE07 Corollary 1.3 (WV.6.2), Corollary 1.5 Ax–Katz modulo q (WV.6.6), Theorem 1.4 theta divisors (WV.6.9), CR12 Theorems 4.3.3 and 4.8.1 (WV.5.4, WV.5.12), Esnault's vanishing and point count (WV.6.13–14). At the pins only the Ax–Katz congruence modulo q^s is statable (Mathlib has the weaker `char_dvd_card_solutions_of_sum_lt`); the others need rigid cohomology, Witt sheaves on schemes, Chow groups of zero-cycles or abelian varieties and must be named in the module docstring as not statable.

**Pins.** `plan.json` `baseline` records TauCeti a91d3aaf and Mathlib 6b7abb3c, equal to the content repository's `lake-manifest.json`; the 23 Mathlib declarations it lists were opened at that pin in round 2 (file and line in that report) and are unchanged.

## Not verifiable

- **Kol96** (IV.3.2.5, IV.3.6, IV.3.13.3, V.2.13): paywalled, `uncertified`; cited by locator. The base-change statement is covered by Tan18 Proposition A.4 (read).
- **Eke84, EkeII**: paywalled, `uncertified`; the smooth trace is imported from the parent.
- **Ser58** (Théorème 2): paywalled, `uncertified`; the Bockstein vanishing is recorded in BBE07 lines 1543–1546 and Ser58Top §3 (both read).
- **Ax64, BS83, Tsu03, Tsu04**: paywalled, `uncertified`; used only through BBE07, CR12 and ESN03.
- **HW23 published Corollary 1.3, pp. 2, 19–20**: absent from the certified arXiv v2; v2 Corollary 4.6, p. 21, read (R03).
- **Stacks Lemma 42.15.2 (02RH)**: not in the cached chapter text; read online at the tag (R05).
- **ArcTopologyAndDescent**: a board design without a pull request head in the index; read from the board checkout.
- **Elaboration**: not available (this lane does not elaborate); no `Suggested.lean` exists at the design stage.

## Source issues

- **Misprint** in GNT19 at Proposition 2.23, printed p. 18: the source says the coherent ideal I ⊂ O_X is an ideal sheaf on Y; it should be an ideal sheaf on X; affects nothing.
- **Error** in GNT19 at Lemma 2.20, printed p. 16: the source bounds R^if_\*(WI) by the fibre dimension for every morphism of separated finite-type schemes; it should assume f proper (for j: A² ∖ 0 → A², R¹j_\*WO ≠ 0 with zero-dimensional fibres); affects a stated result (WV.0.7 (3) carries the properness).
- **Gap** in Tan18 at Remark 5.3 (1), printed p. 20: the source says rational chain connectedness is invariant under every field extension for every proper scheme, citing Proposition A.4; A.4 covers only proper geometrically normal geometrically connected varieties, so the general case rests on the uncited Kollár exercise; affects nothing (the roadmap states the restricted form).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "dc0fd5b", "job": "REV-DESIGN-CrystallineCohomologyPartII~3", "model": "fable", "worker": "fable-rev187"} -->
