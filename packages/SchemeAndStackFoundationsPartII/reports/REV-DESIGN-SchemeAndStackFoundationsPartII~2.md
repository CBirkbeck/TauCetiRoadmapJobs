<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/420#issuecomment-6404677225 -->
Review (claude) of 9022ef2

Verdict: accepted
Conditional on the announced gaps: `animation-composition`, `general-square-zero`, `finite-group-ext`, `henselian-stack-lifting`, `henselian-torsor-cohomology`, `cauchy-algebraization`, `punctured-h2-injectivity`, `adic-flat-module-limits`, `char-p-etale-dimension`, `flat-cohomology-continuity`, `torsor-limit-descent`, `complete-torsor-effectivity`, `complete-module-hyperdescent`, `koszul-geometric-support`, `syntomic-presentations`, `classical-affine-group-adapter`, `flat-group-cotangent-amplitude`, `ample-global-generation`, `noetherian-completion-flat`, `begueri-resolution`, `animated-flat-cohomology`, `cohomology-deformation`, `perfection-covers`, `torsion-arc-hyperdescent`, `formal-glueing`, `complete-etale-hyperdescent`, `complete-valuation-product-basis`, `integral-perfectoid-hyperdescent`, `brauer-class-injective`, `henselized-formal-fibres`

1. **F01** (P3) Two gaps ask in part for what SchemeAndStackFoundations already states

   **Location.** README line 132: "the henselization A of a finite-type ℤ-algebra along a finite ideal I, A is Noetherian and A→lim_n A/I^n has geometrically regular fibres"; line 90: "every p-primary torsion abelian étale sheaf F, H^i_et(X,F)=0 for i≥2". Same `needs` in `plan.json` gaps `henselized-formal-fibres` and `char-p-etale-dimension`.

   **Claim.** Both clauses are new work for the supplier.

   **Witness.** SchemeAndStackFoundations §0.12 on main (README line 1043) states `henselization_noetherian`: for Noetherian R, R^h is Noetherian and R^h→R^∧ is faithfully flat. §2.11 (line 3671) states `artinSchreier_sequence` with H^q(X_ét, ℤ/p)=0 for q≥2 and X affine in characteristic p.

   **Repair.** Shrink `henselized-formal-fibres` to the regular-fibre clause ("A→lim_n A/I^n is a regular map, Stacks 0AH2 and 0AH3") and add "SchemeAndStackFoundations §0.12 `henselization_noetherian`" to the Needs of §9.2. In `char-p-etale-dimension` say that it extends §2.11's constant-sheaf vanishing to every p-primary torsion sheaf (this is the form §5.4's route needs for the sheaves R^jε_*G). Tested on §9.2's route for (ℤ_(p)^h, p): Noetherianity and faithful flatness of ℤ_(p)^h→ℤ_p come from §0.12; only geometric regularity of the fibres (here: the characteristic-zero generic fibre is a separable field extension) is the supplier's remaining obligation.

2. **F02** (P3) §4.1's route uses quasi-coherent affine vanishing that its Needs line omits

   **Location.** README line 570: "On affine W_n(S), quasi-coherent M has no positive cohomology. The mapping fibre of V−1 therefore occupies degrees zero and one." Needs (line 572) and Layer 4 Dependencies (line 580) list only `perfectDieudonneComparison`.

   **Claim.** The vanishing H^i(S,G)=0 for i≥2 follows from the supplier's triangle alone.

   **Witness.** CS24 line 1594 (proof of Corollary 4.1.9, p.39): the proof is "affines have no higher quasi-coherent cohomology", applied to the quasi-coherent W_n(O_S)-module M(G) on the étale site. That input is SchemeAndStackFoundations §2.6 (quasi-coherent cohomology), which the contract at line 60 already imports but §4.1 does not list.

   **Repair.** Add "SchemeAndStackFoundations §2.6" (affine vanishing of quasi-coherent cohomology and its étale–Zariski comparison) to §4.1's Needs and to the Layer 4 Dependencies. Tested on G=ℤ/p over 𝔽_p: M(G)=𝔽_p, V−1=0, fib(0) has H⁰=H¹=𝔽_p, and the bound i≥2 is exactly the affine vanishing of H^j(S_ét, M(G)) for j≥1.

3. **F03** (P3) "weight-one sheaf on a G_m-gerbe" is used without a definition in reach

   **Location.** README line 224: "Then 𝒢 has a finite locally free weight-one sheaf of constant positive rank"; Checks at lines 228–230; Examples line 252; Worked examples line 1030.

   **Claim.** The object is supplied.

   **Witness.** HeightsRationalPointsAndObstructions §2.6a (its README line 956) defines `TwistedModule(𝒢,i)` only for noetherian X and a μ_n-banded gerbe; AlgebraicModuliForArithmeticGeometry Layer 4 supplies banded gerbes, not the weight decomposition; this README's Conventions (lines 15–35) do not define weights on a G_m-gerbe. The term is standard (Lieblich's 𝒢-twisted sheaves, L08 §3.1.1), but §1.1 is a target over an arbitrary quasi-compact separated X.

   **Repair.** Add one sentence to Conventions: for a G_m-gerbe 𝒢 (AlgebraicModuliForArithmeticGeometry Layer 4) a quasi-coherent sheaf on 𝒢 (SchemeAndStackFoundations §1.22) has weight i when its inertia G_m acts through the i-th power of the standard character; "finite locally free" is tested after a flat presentation. Tested on the neutral gerbe BG_m over ℙ¹_ℤ: O with the standard character has weight 1 and O with the trivial action weight 0, which is Check 3 of §1.1 and the Layer 1 Example.

4. **F04** (P3) Precision and locator slips in four statements

   **Location and witness.** (a) Line 756: "satisfies hyperdescent for maps whose derived reduction modulo p is faithfully flat". CS24 line 2942 (Corollary 5.5.3): the hypothesis is a cosimplicial algebra A→A^• with A/^Lp→A^•/^Lp an fpqc hypercover; "maps" does not say which diagrams are totalized. (b) Line 536: "C→D an étale neighborhood inducing V(J)≃V(JD)". The convention of SchemeAndStackFoundations §0.12 and CS24's footnote 24 (line 2473, Milne III 1.27) is an étale C→D with C/J≅D/JD; a homeomorphism of vanishing loci is weaker (residue fields may grow). (c) Line 456: "Corollary 5.3.8, p.62". The statement is on printed p.61 (CS24 line 2560, page 61); line 642 has it right. (d) Line 108: "de Jong §§3.2–3.7, pp.4–6". DJ lines 160–193 place §§3.2–3.7 on printed pp.4–5.

   **Repair.** (a) "satisfies hyperdescent for cosimplicial animated A-algebras A^• such that A/^Lp→A^•/^Lp is an fpqc hypercover". (b) "C→D étale with C/J≅D/JD". (c) "p.61". (d) "pp.4–5". Tested on (b): ℤ→ℤ[1/(1+p)] has 𝔽_p≅𝔽_p mod p, so Check 3 of §3.12 still applies; 𝔽_p[t]→𝔽_{p²}[t] with J=(t) is a homeomorphism on V(J) but not an étale neighbourhood in the §0.12 sense, and §3.12 is not meant to apply to it.

5. **F05** (P3) Manifest locators mix works; C19 is cited nowhere

   **Location.** `sources.toml`: `locator` of BG80 ("BG80 Proposition 2.2.1, pp.25–27; R70 Lemma 6.2.2, p.51; … CS24 §§1.4,5.1.11, pp.8,52 …"), of DJ ("… CS24 Lemma 5.3.1, Claim 5.3.5.3 and Corollary 5.2.10, pp.57–60; de Jong §3.1, p.4 …"), of BC22 ("… CS24 Corollary 5.6.13, p.77"), of SP ("… CS24 proof of Theorem 5.7.2, p.81; CS24 proof of Corollary 5.6.9, p.76 …"). README line 1043 lists C19 under References; no target, convention or gap cites C19 (grep: the only occurrence is the reference entry); the manifest records it as `cited_for = ["Brauer conventions and scope"]`.

   **Claim.** Each `locator` names places in its own work; every reference is cited.

   **Witness.** The strings are the gap citation parentheses copied whole; R70 Lemma 6.2.2 is not in BG80, and CS24's corollaries are not in de Jong's note. C19 line 215 (Lemma 3.1, p.6) and line 91 (§1.5, p.3) are legitimate texts for the Br/Br′ conventions at README line 25, which carry no citation.

   **Repair.** Keep each `locator` to its own work (BG80: "Proposition 2.2.1 and proof, pp.25–27; §§2.1–2.2, pp.22–27"; DJ: "Theorem 1.1, p.1; §§2.13–2.14, pp.3–4; §§3.1–3.22, pp.4–9"; BC22: "Lemma 2.1.3, pp.6–7; Proposition 2.1.4 and Theorem 2.1.6, pp.7–8; §§2.1.12–2.1.15, pp.11–13; Corollary 2.3.5(c), pp.30–31"; SP: the tags only). Either cite C19 §1.5, p.3 at line 25 for the three Brauer objects, or delete the C19 entry from References and the manifest. Tested: the sources check must still report 0 problems after the edit, and every remaining manifest key is then cited at least once.

Reviewed at head 9022ef2 of the design pull request (the checkout matched the pull request's current head; nothing was fetched or changed). Files read: `packages/SchemeAndStackFoundationsPartII/design/README.md` (1044 lines, 11 layers, 48 targets), `design/plan.json` (48 nodes, 30 gaps, 0 requests), `sources.toml` (9 works). Findings: 5, all P3; blocking: 0. Acceptance is conditional on the 30 declared supplier gaps listed in `design/review.json`.

## Round-1 findings, verified at this head

| Id | Status | Witness at head 9022ef2 |
|---|---|---|
| F01 (P1) re-planned PrismaticCohomologyPartIII §6.0 | repaired | README line 9: "PrismaticCohomologyPartIII §6.0 owns the perfect-base classification … `perfectDieudonneComparison` … `pContinuity` and … `excision`". Layer 4 is the single target §4.1 (line 560); the six deleted targets are absent from `plan.json` (48 nodes; none named `dieudonne-*`, `perfect-pro-fppf-*`, `perfect-base-key-formula`, `p-adic-continuity`, `principal-excision`). Supplier contract line 62. The four proof-route constructions are gaps at lines 112–118, at the generality "smooth or finite locally free" asked for. PCIII §6.0 at its open head (lines 111–134 of its README) states all three names: `perfectDieudonneComparison` (perfect 𝔽_p-scheme, finite locally free commutative G of p-power order), `pContinuity` (discrete B, p-power-order G, animated T with p-henselian π₀T), `excision` (equivalence modulo a derived principal ideal gives a cartesian square). |
| F02 (P1) re-planned HeightsRationalPointsAndObstructions §§2.6a–2.6c | repaired | README line 11 and contract line 64 import `TwistedModule`, `endomorphismAzumaya`, `localEtale_finiteFree_domination`, `twistedBundle_affine_glue`, `Brauer.affine_comparison`; Layer 1 holds only §1.1 and §1.2 (lines 222–248). HRPO at its open head, README lines 954–997, defines these in §§2.6a–2.6d; §2.6a is for noetherian X, and line 11 here routes through "Noetherian models after SchemeAndStackFoundations §0.9 approximation and gap:flat-cohomology-continuity". |
| F03 (P1) unowned gap G1 | repaired | `plan.json` `gaps` holds 30 entries, none without `supplier`; the Check about a Popescu field-case gap is gone. §9.1 line 898 and §9.2 line 912 cite `popescu_colimit_of_geometricallyRegular` and `henselian_smooth_lifting`, which exist in SchemeAndStackFoundations on main (README lines 1094 and 1086). |
| F04 (P1) undeclared supplier requests | repaired (the repair report's "not actionable" label covers only the placement of ArcTopologyAndDescent, see below) | 30 gaps, each with `slug`, `supplier`, `section`, `needs`; the same 30 slugs appear as "What X must provide (gap:…)" at README lines 74–132; every gap is a prerequisite of a node or of another gap (`finite-group-ext` is consumed by `begueri-resolution`, line 112). Compound asks were split: `henselian-stack-lifting` (line 80) and `henselian-torsor-cohomology` (line 82); `flat-cohomology-continuity` (line 92) and `torsor-limit-descent` (line 94); the gerbe-module ask became an HRPO §2.6a import (line 64). |
| F05 (P1) unowned injectivity and PD.6 | repaired | `gap:brauer-class-injective` at line 130, consumed by §1.2 (line 248); the README contains no "PD.6", "DD.1", "R23" or "SF." label (grep). |
| F06 (P2) asks for what the pins provide | repaired | line 102 asks only for the global predicate, composition and limit descent; line 110 asks only for faithful flatness and the quotient comparison and cites `AdicCompletion.flat_of_isNoetherian`; line 100 has no totalization-exchange clause and §10.2 (line 1006) cites `tot_filteredColimit_of_bounded`; line 70 cites DerivedModuleAlgebra §0.5, §1.7, §1.9. Residual non-minimality in two other gaps is R01 below. |
| F07 (P3) principal descent for a ∈ R | repaired | line 822: "an animated R-algebra A and a∈π₀A. If A→A^• is a cosimplicial animated A-algebra"; Check line 826 uses t ∈ ℤ[[t]] over ℤ. CS24 line 3082 quantifies a in A. |
| F08 (P3) invented supplier labels | repaired | every supplier citation is in prose form; the gate now resolves the last supplier as PotentialModularityAndCompatibleSystems; gerbes are cited to AlgebraicModuliForArithmeticGeometry Layer 4 (line 66), characteristic-p Kummer to §2.11 `fppf_kummer_sequence` (line 60), PMCS §2.8 `moret_bailly_integral_point` (line 72). |
| F09 (P3) wrong baseline | repaired | lines 39–56 give Mathlib 6b7abb3c… and Tau Ceti a91d3aaf…; all 14 file:line entries re-read at the pins (Verified sound). |
| F10 (P3) README shape | repaired | `# Roadmap: …`, `**Summary.**`, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, Layers 0–10 each ending with Examples and Dependencies, Downstream consumers, Worked examples, References. No field lists; Checks are prose; no backticked name of this roadmap's own; no process vocabulary (grep for removed/deferred/optional/so far/checkpoint/handoff/packet/pull request/job numbers: no hit). |
| F11 (P3) two wrong wordings | repaired | line 344: "faithfully flat when it is flat and π₀M is faithfully flat"; line 232: "their tensor product has weight n+1 … transport weight n+1 back to weight one with a chosen invertible weight −n sheaf, or make the construction on a μ_n-gerbe lift". |
| F12 (P3) locators | repaired, one slip remains (R04c) | line 680 "Lemma 5.4.3, p.67"; line 456 "§5.2.5, p.55 and Corollary 5.3.8"; line 562 "Corollary 4.1.9, p.38"; lines 100 and 996 "Tag 0A6R, Lemma 47.9.1"; line 78 attributes the Ext¹ vanishing to R70 Lemma 6.2.2, p.51 (R70 line 978, printed p.51); line 104 "Bégueri §§2.1–2.2, pp.22–27" (BG80 line 632 lies on printed p.22). C19 is no longer cited for affine Gabber (R05 notes it is now cited nowhere). |
| F13 (P3) omitted route inputs | repaired | new §9.1 (line 886) with `gap:henselized-formal-fibres` (line 132) consumed at line 912; §9.6 Needs (line 968) lists §6.3. |
| F14 (P3) no manifest | repaired, with a quality slip (R05) | `sources.toml` records 9 works with url, sha256, licence class, status, `cited_for`; the sources check reports 0 problems. |

ArcTopologyAndDescent: the five gaps at lines 120–128 name sections §6.4, §8.6, §11.2, §11.5, §12.7. That roadmap is a board package (jobs issue 271, package submitted), present in the board checkout under `packages/ArcTopologyAndDescent/design/README.md`, where those sections exist at lines 804, 1017, 1368, 1411, 1493 and state what the gaps ask (`torsion_arc_hyperdescent`, `formal_glueing`, `complete_valuation_product_basis`, `complete_etale_hyperdescent`, `integral_perfectoid_hyperdescent`). It is in neither `ORDER.txt` nor the content repository's main, so the intake must place it before this roadmap when it inserts either; until then the five gaps are contracts on an open board job, which the brief treats as declared supply, not as a finding.

## Verified sound

**Principles.** No route-specific shortcut (all statements are at CS24's generality: arbitrary ordinary R, animated A, finite locally free commutative G; §5.4–§5.5 and §7.2 are p-primary exactly where the source is). No re-planning: the Dieudonné, continuity and excision theorems are imported from PrismaticCohomologyPartIII §6.0, the twisted-sheaf calculus and affine Gabber from HeightsRationalPointsAndObstructions §§2.6a–2.6c, and ownership of the remaining objects was checked by object (below). No copied passages: every restated theorem was compared with its source line and is paraphrased. No computational algorithm. No Lean file at the design stage, so no sorry'd data or `set_option`.

**Dependency gate** (run as the brief gives it, exit 0):

    candidate: SchemeAndStackFoundationsPartII is not in the merge order yet; checked as if placed after PotentialModularityAndCompatibleSystems (the intake inserts it when its design is accepted)
    depcheck: 56 roadmaps, 637 edges, 0 problem(s)

No UPWARD or CYCLE line. Suppliers' merge-order lines: SchemeAndStackFoundations 2, DerivedModuleAlgebra 6, EnhancedDerivedSheaves 14, DerivedDeRhamCohomology 17, PerfectoidQuotients 19, ReductiveGroupsPartII 20, AlgebraicModuliForArithmeticGeometry 30, PrismaticCohomologyPartIII 53, HeightsRationalPointsAndObstructions 104, PotentialModularityAndCompatibleSystems 127; AlgebraicVectorBundles is on main. The citation resolver reports no cross-roadmap citation and no Lean name found nowhere.

**Sources: the seeded sample** (every locator read at its line in the cache; printed page = pdf page for CS24, BC22, DJ, L08, Y18; BG80 and R70 printed pages read from the page footers).

| Target | Source line, page | Hypotheses and statement agree? |
|---|---|---|
| 0.1 Ind-fppf ring maps | CS24 980–988, p.24, footnotes 12–13 at 993–997 | yes: filtered colimit of faithfully flat finitely presented algebras; factorization criterion; composition, base change, finite products, filtered colimits |
| 3.6 Henselization of an animated ring | CS24 3088–3089 (proof of Lemma 5.6.5, p.74) and 2256 (Prop 5.2.4, p.54) | yes: defined through the étale equivalence of Prop 5.2.4 |
| 3.8 Fppf hyperdescent and Postnikov convergence | CS24 2318–2323, p.56 | yes: G smooth or finite locally free; (5.2.6.1) and (5.2.6.2) |
| 3.12 Fppf supports in étale neighborhoods | CS24 2459–2475, Claim 5.3.5.3 and footnote 24, p.59 | yes, modulo R04(b) wording |
| 4.1 Higher vanishing over perfect affine rings | CS24 1589–1591, p.38 | yes: perfect 𝔽_p-algebra, p-power order; R02 for the route input |
| 5.2 Derived Beauville–Laszlo glueing | CS24 2422–2424, p.58 | yes: a ∈ A (π₀A), no torsion hypothesis, also in D(ℤ) |
| 5.3 Square-zero defect of completed π₀ | CS24 2433–2443, pp.58–59 | yes: kernel lim¹ π₁(A/^La^n), square-zero since lim²=0 |
| 5.4 Cohomological dimension, primary case | CS24 2537–2541, p.61 | yes: p-henselian π₀A, i≥3; i≥2 when (π₀A/p)^red perfect |
| 5.5 Primary invariance under derived completion | CS24 2560–2565, pp.61–62 | yes: opens containing D(p), supports |
| 7.1 Fpqc hyperdescent of flat cohomology | CS24 2893–2895, p.69 | yes |
| 8.1 Derived completeness implies henselianity | CS24 2974–2975, p.71 | yes (derived I-complete = derived a-complete for all a ∈ I) |
| 8.2 H² invariance over a henselian pair | CS24 2982–2994, p.71 | yes; route (BC22 2.1.6, Bégueri, Gabber on Γ(G*,O)) matches |
| 8.5 Continuity over complete animated rings | CS24 3138–3141, p.75 | yes |
| 9.1 Finitary functors and henselian completion | BC22 253–267, pp.6–7 | yes: Noetherian henselian pair, regular fibres of A→Â, filtered-colimit functor; proof by Popescu and Gruson |
| 9.6 Comparison on Noetherian open neighborhoods | CS24 3239–3244, p.77; BC22 1247–1261, pp.30–31 | yes; BC22 2.3.5(c) has no flatness hypothesis, as the gap says |

Also read at their lines and found to agree: CS24 §4.1.2 (1495, p.36), §4.1.5 (1538, p.37), Lemma 4.1.6 (1547), Prop 5.1.5 and Ex 5.1.6 (2016–2034, p.49), §5.1.9–5.1.10 (2114, 2134, p.51), §5.1.11, Prop 5.1.12, Thm 5.1.13, Rem 5.1.14 (2149–2192, pp.52–53), §5.2.1 and Lemma 5.2.2 (2200–2218, p.53), §5.2.3, §5.2.5 (2241, 2279), Cor 5.2.7 (2345), Thm 5.2.8 (2356), Cor 5.2.9–5.2.10 (2366–2383), Lemma 5.3.1 and Rem 5.3.2 (2408–2420), Lemma 5.4.1 (2591–2595), Lemma 5.4.3 and Thm 5.4.4 (2800–2820, p.67), Cor 5.4.5 (2832), Cor 5.5.3 (2939–2942), Lemma 5.6.4 (3000–3006), Ex 5.6.7 (3162–3180), Cor 5.6.9–5.6.12 and Ex 5.6.11 (3190–3235), Lemma 5.7.1 (3261–3263), Thm 5.7.2 (3288–3296); BC22 Prop 2.1.4 (283), Thm 2.1.6 (306–316), Thm 2.1.15 (458–472); BG80 Prop 2.2.1 (746, printed p.25) and the Ext¹ attribution to [20]=Raynaud (789, 3526); R70 Lemme 6.2.2 (978, printed p.51); DJ Thm 1.1 (10, p.1; standing hypothesis "ample invertible sheaf, hence quasi-compact separated" at 8–9), §§2.13–2.14 (117–140, pp.3–4), §3.1 (158), Claim 3.22 (323, p.8); L08 Lemmas 3.1.3.5–3.1.3.6 (413, 422, p.10), 3.1.4.1–3.1.4.5 (495–561, pp.11–13); C19 §1.5 (91, p.3), Lemma 3.1 (215, p.6); Y18 Thms 1.8 (217, p.5), 4.3 (587, p.14), 5.9 (704, p.16); SP tags 0954 (dualizing 507), 0A6R (dualizing 589), 0AH2 (more-algebra 6106), 0AH3 (6126). The author flagged no locator as unverified (`plan.json` contains no "unverified"/"uncertified").

**Library at the pins** (Mathlib 6b7abb3c…, Tau Ceti a91d3aaf…, files read through the GitHub contents API at those commits): `Algebra.FinitePresentation` FinitePresentation.lean:43 (class); `Module.FaithfullyFlat` Flat/FaithfullyFlat/Basic.lean:63 (class extending Flat); `Scheme.fppfTopology` and `fpqcTopology` Sites/Fpqc.lean:53 and :75 (abbrevs); `HenselianRing` Henselian.lean:94 (class; Jacobson containment plus simple-root lifting); `IsAzumaya` Azumaya/Defs.lean:60 (extends Projective, FaithfulSMul, Finite); `AdicCompletion.flat_of_isNoetherian` AdicCompletion/AsTensorProduct.lean:378 (instance, flatness only — no `FaithfullyFlat` anywhere under RingTheory/AdicCompletion, so `gap:noetherian-completion-flat` is genuine); `TauCeti.CommAlgCat.fppfTopology` CommAlgCat/Fppf.lean:51; `pointsPresheaf_isSheaf` Fppf/Basic.lean:61 and `pointsFppfSheaf` (declared at :76, body through :78; `GrpCat`-valued as line 58 says); `IsStandardSyntomicOfRelativeDimension` StandardSyntomic.lean:81 (class with `flat` field) and `.baseChange` :168 (instance); `cartierDualBaseChangeNatIso` CartierDuality/BaseChange.lean:174; `cartierDual` FiniteLocallyFree.lean:331 (abbrev). No animated ring, gerbe, scheme Brauer group, Bégueri resolution or flat cohomology of animated rings exists at the pins (greps), so the ownership of those objects is as the Scope section says.

**Cross-roadmap citations resolved** (on main at 56b9472 or at the open heads the brief lists). SchemeAndStackFoundations (main): §§0.8, 0.9, 0.12, 0.14 (`henselian_pair_characterisations` 1070, `_permanence` 1075, `henselian_finiteEtale_equivalence` 1080, `henselian_smooth_lifting` 1086), §0.15 (`popescu_desingularization` 1092, `popescu_colimit_of_geometricallyRegular` 1094: for flat R→S with geometrically regular fibres — which is why §9.1 also needs `flat_of_isNoetherian`), §0.21 (1394), §§1.13–1.15 (`torsorRepresentability` 2520), §§1.18–1.22, §§2.1–2.6 (§2.4 abelian boundaries 3364, §2.5 filtered colimits 3388, §2.6 3437), §2.10 (`smoothGroup_fppf_etale_comparison` 3642), §2.11 (`fppf_kummer_sequence` 3661), §2.15 (`gabber_affine_proper_base_change` 3869, `etale_cohomology_limits` 3877), §2.22 (`SchemeBrauerGroup` 4459, `CohomologicalBrauer`, `Azumaya.trivializationGerbeClass` 4474, `toH2` 4478, `toCohomologicalBrauer` 4479 for quasi-compact or connected X; no injectivity statement, so `gap:brauer-class-injective` is genuine), Layer 4 (5033). EnhancedDerivedSheaves (main): E1.3 (549), E2.3 (2125), E2.7 (2375), E2:towers.1 (1294), E3.2 (1153), E5:animation.1–.4 (1900–1994; `animatedAlgebras` 1937, `tot_filteredColimit_of_bounded` 1980 with the uniform lower bound, `animatedModules` 2010), E5:cotangent-export.1 (2869; `cotangentComplex`, `cotangentComplex_ordinary` 2883); animation.1 has no Ani(H)∘Ani(F) comparison and cotangent-export.1 no Postnikov square-zero classification, so those two gaps are genuine. DerivedModuleAlgebra (main): §0.K.1 (516), §0.5 (888), §§0.10–0.13 (1093–1151), §§1.1–1.9 (1573–2028; §1.7 complete flatness 1973, §1.9 p-adic Čech descent with bounded torsion 2028, "hyperdescent is not asserted" — so `complete-module-hyperdescent` and `adic-flat-module-limits` are genuine). AlgebraicVectorBundles (main): L0A–L0C (215–254). PrismaticCohomologyPartIII (head d797991): §6.0 as above. HeightsRationalPointsAndObstructions (head 82cf8af): §§2.6a–2.6d (954–997). DerivedDeRhamCohomology (head 83d00dd): §1.22 `DerivedDeRham.completionExchanges` (883, 902). PerfectoidQuotients (head 502f1d5): Layer 0 §0.1, §§0.4–0.6 (549, 768–906). ReductiveGroupsPartII (head 1383569): RG2.0a.1–.3 (964–1380). PotentialModularityAndCompatibleSystems (head 29f6025): §2.8 `moret_bailly_integral_point` (779–783); its Skolem datum (597) admits an open of affine space over ℤ, surjective, with Σ=∅, as §1.1's route uses. AlgebraicModuliForArithmeticGeometry (head 0b84954): Layer 4 §§4.1–4.8 (1744–3620). ArcTopologyAndDescent (board design): §6.4, §8.6, §11.2, §11.5, §12.7 as above.

**Declared gaps** (30): each has a named supplier (none is `none`), a section that exists at the supplier (checked above), the same slug and `needs` in `plan.json` and the README (mechanical compare: 30/30, differing only in Unicode versus ASCII symbols), and a consumer. Precision: each `needs` states its hypotheses; the two partly non-minimal ones are R01. The compound-looking `flat-cohomology-continuity` and `complete-module-hyperdescent` are single themes (continuity of fppf cohomology along limits; completed-tensor hyperdescent of connective complete modules, which is the step CS24 uses at lines 3271 and 3358–3359).

**Ownership against open work.** `roadmaps grep` over main and the 367 open roadmap pull requests (index 2026-10-25T22:20Z), by object: ind-fppf/pro-fppf, Bégueri, CS24 citations, Beauville–Laszlo, henselian invariance of flat cohomology, ample Brauer comparison, Cauchy nets, derived excision and fpqc hyperdescent of flat cohomology. Hits outside this roadmap are PrismaticCohomologyPartIII §6.0 (imported), classical Beauville–Laszlo glueing in RelativeFarguesFontaine/BunGAndNewtonStrata/PrismaticCohomologyPartIII (not the derived animated lemma), PrismaticCohomology and PerfectoidQuotients citing CS24 for other theorems, and Gabber–Ramero or unrelated "Gabber" mentions. No roadmap owns the ample extension of Gabber's theorem, the derived Beauville–Laszlo lemma, fpqc hyperdescent, finite-ideal excision, complete continuity, henselian invariance, algebraization or adic descent with supports; no roadmap cites SchemeAndStackFoundationsPartII, so no cycle arises. The board index lists 17 packages, none overlapping.

**Shape.** 10 definitions/constructions (0.1, 0.2, 0.3, 2.1, 2.2, 3.1, 3.4, 3.6, 3.7, 6.2) each with an API list and 3–5 Checks (counts 4, 3, 4, 3, 3, 5, 4, 3, 3, 4); every one of the 48 targets has a locator in parentheses at the claim and a Needs line; every layer ends with Examples and Dependencies; no LaTeX delimiters; the only backticked non-supplier token is `GrpCat` (Mathlib).

**Elaboration.** Not available (this lane does not elaborate), and the design stage has no `Suggested.lean`. For the package stage: the headline theorems are §1.2 (Gabber's comparison with an ample bundle), §6.3 (finite-ideal excision), §7.1 (fpqc hyperdescent), §8.5 (complete continuity), §9.2 (henselian invariance), §9.3 (algebraization) and §10.2 (adic descent with supports). At the pins, animated rings do not exist, so §6.3, §7.1, §8.5 and §10.2 are not statable; Br_Az of a scheme does not exist, so §1.2 is not statable; §9.2 and §9.3 (ordinary rings, fppf cohomology of a finite locally free commutative group) look statable through `CommAlgCat.fppfTopology`, `pointsFppfSheaf` and Mathlib `Sheaf.H` once an abelian-group-valued adapter is written as a real definition.

## Adversarial pass

One row per statement; "✓" means the computed values agree with the statement as written at this head.

| # | Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|---|
| C1 | Conventions: covariant F, V | ℤ/p and μ_p over 𝔽_p | M(ℤ/p)=𝔽_p, V=σ⁻¹=id, V−1=0, fib has H⁰=H¹=𝔽_p; M(μ_p): V=pσ⁻¹=0, V−1=−1, fib=0; agrees with H¹(𝔽_p,ℤ/p)=𝔽_p and H¹(𝔽_p,μ_p)=𝔽_p^×/p=0 and with PCIII §6.0's Checks | ✓ | — |
| C2 | Conventions: A/^La is the cone | A=ℤ/p², a=p | ker p = pℤ/p² ≅ 𝔽_p = π₁, coker = 𝔽_p = π₀; ordinary quotient has π₁=0 | ✓ | — |
| C3 | Conventions: henselian pair | (ℤ,2ℤ), (ℤ₂,2ℤ₂) | Jac(ℤ)=0 ⊉ 2ℤ; ℤ₂ complete so henselian; Dorroh (1,0)(n,y)=(n,y), (0,x)(0,y)=(0,xy) | ✓ | — |
| C4 | Conventions: support is the fibre of restriction | I=(1), I=(0) | fib(id)=0; fib(RΓ→RΓ(∅)=0)=RΓ | ✓ | — |
| 1 | 0.1 ind-fppf | ℤ/4→(ℤ/4)[X]; ℤ→ℚ; R≠0→0 | free fp so ind-fppf; ℤ[1/2]→ℚ through faithfully flat fp S forces S/2S=0, impossible; 0 not faithful over R≠0 | ✓ | — |
| 2 | 0.2 ind-syntomic | ℤ→ℤ[1/2]; 𝔽_p→𝔽_p[x]/x^p; ℤ→ℤ/4 | one regular relation, flat, fibre over 2 empty: ind-syntomic not ind-fppf; x^p regular and faithfully flat: both; Tor₁^ℤ(ℤ/4,ℤ/4)≠0: neither | ✓ | — |
| 3 | 0.3 pro-fppf site | Spec(k×k) | two component inclusions jointly cover the two points; one does not; identity covers | ✓ | — |
| 4 | 1.1 ample twisted bundles | n=2 on a G_m-gerbe; neutral gerbe on ℙ¹_ℤ | three weight-one factors give weight 3, weight −2 line brings it to 1; O with standard character is weight 1 rank 1 | ✓ (vocabulary R03) | R03 |
| 5 | 1.2 ample Brauer comparison | X=Spec ℝ; X=ℙ¹_k | M₂(ℝ)=End(ℝ²) class 0, ℍ class 1 in Br(ℝ)=ℤ/2; Br(ℙ¹_k)=Br(k)=Br′(ℙ¹_k); X quasi-compact so `toCohomologicalBrauer` applies | ✓ | — |
| 6 | 2.1 animated points | G_a on k⊕k[1]; G_m on discrete A | π₁G_a(A)=k; π₀G_m(A)=A^×, π_{>0}=0 | ✓ | — |
| 7 | 2.2 cotangent at the identity | μ_p/𝔽_p | [𝔽_p →0 𝔽_p] in degrees −1,0 (d(x^p−1)=0) | ✓ | — |
| 8 | 2.3 amplitude | μ_p/ℤ | [ℤ →p ℤ]; h=id is a null-homotopy of p·id; C[1/p]=0 | ✓ | — |
| 9 | 2.4 point deformation | μ_p, 𝔽_p[ε]→𝔽_p, M=𝔽_p | RHom(C_G,M[1]) has H^(−1)=H⁰=𝔽_p; π₀G(A′)=1+ε𝔽_p→π₀G(A)=1→π₀Map=𝔽_p not surjective, so no untruncated D(ℤ) fibre sequence (Rem 5.1.14) | ✓ | — |
| 10 | 3.1 flat animated modules | A=k⊕k[1], M=k; M=0 over k | π₁A⊗π₀M=k≠π₁M=0: not flat although π₀M faithfully flat; 0 flat, not faithful | ✓ | — |
| 11 | 3.2 tensor with flat M | A=ℤ, M=ℤ_p, N=ℤ/p | π_*(N⊗M)=𝔽_p=π₀N⊗ℤ_p | ✓ | — |
| 12 | 3.3 nilpotent thickening | ℤ/4→𝔽₂, M=𝔽₂; ℤ→ℚ | Tor₁^{ℤ/4}(𝔽₂,𝔽₂)=𝔽₂: not flat on either side; ℤ/2⊗ℚ=0 so localization is not a detector | ✓ | — |
| 13 | 3.4 animated sites | k⊕k[1]→k; ℤ/4 | étale π₀ but not flat (π₁ lost); every flat algebra over a discrete ring is discrete | ✓ | — |
| 14 | 3.5 étale algebras see π₀ | A=𝔽_p⊕𝔽_p[1] | lift of 𝔽_{p²} is A⊗𝔽_{p²}, π₀=π₁=𝔽_{p²} | ✓ | — |
| 15 | 3.6 animated henselization | I=0; π₀A already henselian | (π₀A)^h_0=π₀A so A^h=A; equivalence | ✓ | — |
| 16 | 3.7 supports | G_a on k[t], I=(t), (t²) | H⁰_(t)=ker(k[t]→k[t^±])=0, H¹_(t)=k[t^±]/k[t]; same for (t²) | ✓ | R04(c) locator |
| 17 | 3.8 hyperdescent, Postnikov | G_a, A=k⊕k[1]; G_m ordinary | τ≤nA=A for n≥1, limit keeps H^(−1)=k; Pic_fppf=Pic_ét | ✓ | — |
| 18 | 3.9 ring towers | A_n=τ≤nA; A_n=A | recovers 3.8; constant tower | ✓ | — |
| 19 | 3.10 truncation comparison | G_a on k⊕k[1]; μ_p on 𝔽_p⊕𝔽_p[1] | H^(−1): k→0 onto not injective, H⁰ bijective; μ_p: H⁰ kernel 𝔽_p so flf bijectivity starts at 1 (Cor 5.2.9: surjective all i) | ✓ | — |
| 20 | 3.11 nil ideals | μ_p on 𝔽_p[ε]→𝔽_p | (1+ε)^p=1, 1+ε not a p-th power: H¹ kernel 𝔽_p, surjective not injective | ✓ | — |
| 21 | 3.12 étale-neighbourhood supports | ℤ→ℤ[1/(1+p)], J=(p); J=(1) | 𝔽_p≅𝔽_p mod p; both supports 0 | ✓ | R04(b) |
| 22 | 4.1 perfect affine vanishing | ℤ/p, μ_p, α_p over 𝔽_p; 𝔽_p(s) | H⁰=H¹=𝔽_p, H²=0; 0; 0; H²(𝔽_p(s),μ_p)=Br[p]≠0 shows perfection is needed | ✓ | R02 Needs |
| 23 | 5.1 split-cover refinement | algebraically closed k; R≠0 | every nonempty fp cover has a point; faithful refinement nonzero; global sections exact so H^{>0}=0 | ✓ | — |
| 24 | 5.2 derived Beauville–Laszlo | ℤ→ℤ_p, a=p; a=1; a=0 | ℤ_p∩ℤ[1/p]=ℤ, ℤ_p+ℤ[1/p]=ℚ_p; identities; A/^L0≃A′/^L0 forces A≃A′ | ✓ | — |
| 25 | 5.3 completed π₀ | ℤ, a=p; ℤ/p² | π₁=0, kernel 0, ℤ_p; π₁ tower ℤ/p² →p ℤ/p² →… →𝔽_p is pro-zero (p²=0), lim¹=0, completion ℤ/p² | ✓ | — |
| 26 | 5.4 primary dimension | ℤ_p, μ_p (p odd, p=2, p=3) | H¹=ℤ_p^×/p=ℤ/p; p=2: (ℤ/2)² from −1 and 5; p=3: ℤ/3; H²=Br(ℤ_p)[p]=0; 𝔽_p perfect gives i≥2 | ✓ | — |
| 27 | 5.5 primary invariance | A=ℤ_p, A′=ℤ_p×ℚ_p | mod-p reductions both 𝔽_p; pA′=pℤ_p×ℚ_p ⊄ Jac=pℤ_p×0 so π₀A′ not p-henselian: excluded | ✓ | — |
| 28 | 6.1 semiperfect perfection | A′=𝔽_p[t^{1/p^∞}]/(t), a=1 | colimit perfection is 𝔽_p, kernel contains t^{1/p}, multiplication by 1 bijective, both quotients 0 | ✓ | — |
| 29 | 6.2 derived residue condition | ℤ→ℤ_p, I=(p); ℤ/p²→𝔽_p; I=(1) | 𝔽_p⊗^Lℤ_p=𝔽_p ✓; Tor₁=𝔽_p ✗; 0→0 ✓; n=1 Koszul equivalence implies all n (Lemma 5.4.3) | ✓ | — |
| 30 | 6.3 finite-ideal excision | I=(1); I=(0); ℤ→ℤ_p | both 0; rings equivalent and support full; p-supports agree | ✓ | — |
| 31 | 6.4 Noetherian completion | ℤ_(p)→ℤ_p; field | residue 𝔽_p; identity | ✓ | — |
| 32 | 7.1 fpqc hyperdescent | A→A×A; identity on 𝔽_p, ℤ/p | split Čech contracts; H¹=𝔽_p kept | ✓ | — |
| 33 | 7.2 primary descent mod p | 𝔽_p; ℚ_p; ℤ_p→𝔽_p | own p-henselization, H¹(ℤ/p)=𝔽_p; V(p)=∅ supports 0; Tor₁^{ℤ_p}(𝔽_p,𝔽_p)=𝔽_p excludes | ✓ | R04(a) |
| 34 | 8.1 complete ⇒ henselian | ℤ_p,(p); ℤ,(p) | henselian; ℤ not derived p-complete and Jac(ℤ)=0 | ✓ | — |
| 35 | 8.2 H² invariance | ℤ_p, μ_p; ℂ[[t]], μ_n | Br(ℤ_p)[p]=0=Br(𝔽_p)[p] while H¹: ℤ/p→0; Pic=Br=0 on both sides | ✓ | — |
| 36 | 8.3 bounded continuity | ℤ_p, a=p, μ_p; a=1 | H^{≥2}=0 for ℤ_p and 𝔽_p; a=1 forces A=0 | ✓ | — |
| 37 | 8.4 principal complete descent | ℤ[[t]] over ℤ, a=t | t∈π₀A not in R; identity cosimplicial algebra | ✓ | — |
| 38 | 8.5 complete continuity | empty tuple; ℤ_p,(p),μ_p | constant; lim (ℤ/p^n)^×/p=ℤ/p | ✓ | — |
| 39 | 8.6 ordinary quotients | ℤ_p, μ_p, p odd | μ_p(ℤ/p^n)=1+p^{n−1}ℤ/p^n with zero transitions, lim¹=0; H¹(R/I^n) tower has surjective transitions (Cor 5.2.10) so lim¹ H¹=0 and H²(R)→H²(R/I) injective; matches (5.6.7.1) | ✓ | — |
| 40 | 8.7 henselian is not complete | 𝔽_p{t} vs 𝔽_p[[t]], μ_p | Pic=0 on both; henselization countable; 1+t·h(t^p) classes distinct for uncountably many h | ✓ | — |
| 41 | 9.1 finitary completion comparison | (ℤ_(p)^h,p), F=id; F constant | injective, 1 lifts on both sides; identity | ✓ | R01 cite §0.12 |
| 42 | 9.2 henselian invariance | (ℤ_(p)^h,p), μ_p | H¹: ℤ/p→0 onto; H²: 0→0 | ✓ | — |
| 43 | 9.3 algebraization | 𝔽_p{t}, t-adic; discrete B | B̂=𝔽_p[[t]], H²(μ_p)=0 both; B̂=B | ✓ | — |
| 44 | 9.4 Laurent puncture | R=𝔽_p, μ_p | Br[p]=ℤ/p for 𝔽_p{t}[1/t] and 𝔽_p((t)); H¹ countable vs uncountable so i≥2 needed | ✓ | — |
| 45 | 9.5 punctured animated comparison | ℤ_(p)^h→ℤ_p, I=(p); I=(1) | generic H²(μ_p)=ℤ/p both; henselian for (1) forces 0 | ✓ | — |
| 46 | 9.6 Noetherian opens | same, U=D(p) | ℤ/p→ℤ/p; BC22 2.3.5(c) gives injectivity without flatness | ✓ | — |
| 47 | 10.1 perfectoid discreteness | 𝔽_p, I=0, M=A[1] | 𝔽_p is integral perfectoid (ϖ=0, ker θ=(p) in W(𝔽_p)); reduction A[1] not flat: excluded | ✓ | — |
| 48 | 10.2 adic supported descent | I=(1); empty tuple; dual Koszul bound | 0; reduces to 7.1; RHom(K_J^n, M) on a Witt ring sits in [0,r+1] so b=0 uniform for E5:animation.3 | ✓ | — |
| G1 | gap:finite-group-ext | X=ℤ/n; X=0 | R70 6.2.2: extension class killed fppf-locally by an n-th root; Ext¹(0,G_m)=0 | ✓ | — |
| G2 | gap:henselian-torsor-cohomology | Q=G_m over ℤ_p; μ_p | H¹=Pic=0 both; H¹: ℤ/p→0 onto, H²: 0→0 injective (BC22 2.1.6(b): kernel trivial, commutative so injective) | ✓ | — |
| G3 | gap:punctured-h2-injectivity | ℤ_(p)^h→ℤ_p, U=D(p) | ℤ/p→ℤ/p injective; BC22 2.3.5 has no flatness hypothesis | ✓ | — |
| G4 | gap:adic-flat-module-limits | C=ℤ, J=(p), M_n=ℤ/p^n | M′=ℤ_p, reductions ℤ/p^n, Tor_{>0}(N,ℤ_p)=0 for p-power torsion N; Y18 1.8 needs only f.g. J, 4.3/5.9 weak proregularity, as stated | ✓ | — |
| G5 | gap:noetherian-completion-flat | ℤ_(p)→ℤ_p; ℚ_p | pℤ_p≠ℤ_p faithful; pℚ_p=ℚ_p not faithful; no FaithfullyFlat at the pin | ✓ | — |
| G6 | gap:koszul-geometric-support | T=k[t], b=t, N=T; b=1; b=0 | [T→T[1/t]]: H⁰=0, H¹=T[1/t]/T; 0; T; dual Koszul in [0,s] (SP 0A6R) | ✓ | — |
| G7 | gap:general-square-zero | B=k⊕k[1], m=0 | B→k with ideal k[1], τ≤2 L_{k/B}=k[2] | ✓ | — |
| G8 | gap:henselized-formal-fibres | ℤ_(p)^h | Noetherian and ℤ_(p)^h→ℤ_p faithfully flat already by §0.12; generic fibre a separable extension of ℚ: regular | partly provided | R01 |
| G9 | gap:char-p-etale-dimension | ℤ/p on 𝔽_p; R^jε_*G | H¹=𝔽_p, H²=0 (already §2.11 for ℤ/p); the route needs non-constant p-primary sheaves | partly provided | R01 |
| G10 | gap:begueri-resolution | G=1; μ_n | H=Q=G_m, δ(s)=s; H=G_m^n, ζ↦(ζ^k) with trivial coboundary | ✓ | — |
| G11 | gap:cohomology-deformation | G_a, k[ε]→k | fibre kε in degree 0, matches `pContinuity`'s route Check in PCIII | ✓ | — |
| G12 | gap:perfection-covers | 𝔽_p[t]→𝔽_p[t^{1/p}] | perfects to an isomorphism; Lemma 4.1.6 | ✓ | — |
| G13 | gap:brauer-class-injective | M₂(ℝ); ℍ | class 0 and End(ℝ²); class 1, not an End | ✓ | — |
| G14 | gap:complete-torsor-effectivity | trivial torsor; μ_p over ℤ_p | identity transitions; classes lim (ℤ/p^n)^×/p=ℤ/p; torsor condition is an isomorphism of finite projective modules, detectable mod a over a complete ring | ✓ | — |
| G15 | five ArcTopologyAndDescent gaps | identity hypercover on 𝔽_p; I=(1) | H¹(ℤ/p)=𝔽_p kept; punctured spectra empty; sections resolved at the board design | ✓ | placement note |

## Not verifiable

- Illusie, *Complexe cotangent et déformations* I, VII (3.1.1.3) (group cotangent amplitude): paywalled volume; the roadmap cites only CS24 §5.1.11 and Prop 5.1.12, which I read.
- Gabber, LNM 844, Chapter II, Theorem 1, and Gabber–Ramero: not opened; used only through CS24 line 2992 and L08 Cor 3.1.4.2.
- HTT/SAG (animation, D.6.3.4): not opened; CS24 lines 2303–2307 and Prop 5.1.5 were read instead.
- Moret-Bailly, *Groupes de Picard et problèmes de Skolem* I–II: not opened; the integral-point theorem is consumed from PotentialModularityAndCompatibleSystems §2.8, whose Skolem datum I read.
- ArcTopologyAndDescent is read only in the board checkout's design; its package submission was not opened.

## Source issues

- **Misprint** in CS24 at Example 5.6.7, printed p.75: the display is introduced as a statement for degrees at least two but asserts surjectivity in degree one; it should carry no opening restriction (surjective for i≥1, bijective for i≥2); affects a stated result. Already recorded as the plan's source issue E3; confirmed at CS24 lines 3166–3170.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "9022ef2", "job": "REV-DESIGN-SchemeAndStackFoundationsPartII~2", "model": "fable", "worker": "fable-rev158"} -->
