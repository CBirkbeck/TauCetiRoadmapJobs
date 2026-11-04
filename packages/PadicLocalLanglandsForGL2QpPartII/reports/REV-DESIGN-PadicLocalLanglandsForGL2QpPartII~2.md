<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/392#issuecomment-6404258493 -->
Review (claude) of 642e432

Verdict: needs changes

1. **F01** (P1) §3.1 and §7.3 use two global inputs with no owner named

   **Location.** README line 421: "the Čerednik–Drinfeld uniformisation of the quaternionic Shimura curve"; line 419: "Arrange the residual Galois representation to be absolutely irreducible at p"; §3.1 `*Needs:*` line 430; §7.3 lines 1025–1030 (Teitelbaum's model, the Hyodo–Kato identification with M(π)) and `*Needs:*` line 1038.

   **Claim.** The route of §3.1 (DLB17 Théorèmes 5.1, 5.4, 5.5, 5.7) is covered by R17.3.12, CompletedCohomology §4.9 and the base §6.9.

   **Witness.** DLB17 line 1004 ("l'argument repose sur le théorème d'uniformisation p-adique et un ingrédient global"), Théorème 5.7 line 1119 (the uniformisation of the tower, used at line 1191) and Théorème 5.5 line 1071 (the quaternionic form with r̄_f absolutely irreducible at p, proved through the CM form of Lemme 5.6, line 1077). Neither is a target, a cited section or a pin: parent §6.9 lists both as "explicit hypotheses" (parent line 2467), R17.3.12 constructs Π with Π_𝔭 = τ but says nothing about r̄ (`TauCetiRoadmap/GL2AutomorphicRepresentationsAndTransfer/README.md` lines 1755–1775), and CompletedCohomology §4.9 assumes r̄|G_ℚ_p absolutely irreducible (its line 1612). Both have owners earlier in the order: HilbertModularVarietiesAndShimuraCurves §R18.5.21 "All-level Drinfeld tower uniformisation" (its line 2380, the CDN20 §5.2.1 tower with its Ǧ_n levels) and §R18.5.16 for F = ℚ (line 2261), order position 114; CompletedCohomologyAndLocalGlobalCompatibility §6.4 "Globalising a supercuspidal π on a definite quaternion algebra" (its line 2161, which states DLB Théorème 5.5 with Lemme 5.6 and notes at its step 4 that R17.3 "is not used" for this), order position 142. For §7.3, the (φ,N,G_ℚ_p)-structure of the Shimura-curve cohomology (DLB17 line 2745–2747, Saito) is HilbertModularVarietiesAndShimuraCurves §R18.4.24a `quaternionCurveSemistableComparison` (its line 3760), through WeightsInEtaleCohomology R34.3.

   **Repair.** In §3.1 replace step 1–2 by "CompletedCohomologyAndLocalGlobalCompatibility §6.4 gives a weight-two form f on the definite algebra with π(f)_p ≅ π⊗ξ∘det, ξ unramified, and r̄_f|G_ℚ_p absolutely irreducible", and step 4 by "the tower uniformisation of HilbertModularVarietiesAndShimuraCurves §R18.5.21 (DLB17 Théorème 5.7 is its Hecke-module reformulation)"; add both to the `*Needs:*` line, to the Layer 3 Dependencies and to Exact supplier contracts (a `### From TauCetiRoadmap.HilbertModularVarietiesAndShimuraCurves` block). Keep R17.3.12 only in §3.3, where the central-character adjustment is used, and say so. In §7.3 cite §R18.5.16 for the first-cover model and §R18.4.24a for the Hyodo–Kato identification with M(π), and add both to its `*Needs:*`. The gate is unaffected: both suppliers precede the insertion point.

2. **F02** (P1) §7.2 uses Colmez's weight-change theorems, which nobody owns

   **Location.** README line 1013: "Prove that the preimages of the lines ℒ⊗(π′⊗Sym^k) describe the duals of the locally analytic vectors of the Banach representations of weights {0,k+1} attached to M. This is COLMEZ19POIDS Conjecture 0.10 …, which its Remarque 0.11(iii) … derives from the case k = 0 and its Théorèmes 0.6 and 0.8."; `*Needs:*` line 1021.

   **Claim.** The claim follows from §3.3, the operators of §7.1 and DLB17 Remarque 11.12.

   **Witness.** COLMEZ19POIDS lines 337–340 derive the k ≥ 1 case from Théorème 0.8(iii) (lines 266–271: the action v ↦ (−c∂+a)^k(g·v) on Π(Δ) is Π(M,k)) and Théorème 0.6(ii) (lines 220–225: Π(M,k)^alg = M_dR⊗(LL_p(M)⊗Sym^{k−1}) for k ≥ 1). No target states them; the parent's §§4.1–4.2 (cited at line 1021) are the locally algebraic vectors of one Π(V), and §4.11 is the analytic quotient for one weight; `roadmaps grep 'changement de poids'` over main and all 367 open pull requests: no match. §7.1 gives only the first half of DLB17 Remarque 11.12 (the twisted action realises O(k)); it does not identify the twisted representation with Π(M,k) or compute its algebraic vectors.

   **Repair.** Add a target (Layer 2, after §2.2) "Weight change": for M supercuspidal and k ∈ ℤ, the G-action g⋆_k v = (a−c∂)^k(gv) on Π(Δ) is Π(M,k), and for k ≥ 1 the locally algebraic vectors of Π(M,k) are M_dR⊗(LL_p(M)⊗Sym^{k−1}) (COLMEZ19POIDS Théorème 0.6(ii), lines 220–225, and Théorème 0.8(iii), lines 266–271), with `*Needs:*` §2.2, parent §§3.11, 4.2a, 4.11, and three Checks (k = 0 recovers Π(Δ); the central character of Π(M,k) is x^kω; at k = 1 the algebraic vectors are M_dR⊗LL_p(M), two copies of π). Make §7.2 consume it. Otherwise cut §7.2 to the exact row and the O(k) realisation and drop the analytic-vectors clause.

3. **F03** (P2) gap:halfplane-module-continuity and gap:two-sided-resolvents ask for what the parent states

   **Location.** README lines 87 and 89; plan.json `gaps[0]`, `gaps[1]`; consumers §3.3 line 467.

   **Claim.** Parent §6.9 states uniqueness of the O(Ω)-module structure without continuity, and constructs only one-sided inverses of a−c∂.

   **Witness.** Parent line 2435: "`DrinfeldComparison.halfPlaneModule`, the unique continuous `O(Ω)`-module structure on `Π(π,0)*` for which the coordinate acts by … ∂", and "construct `∂` and its resolvents"; a resolvent is a two-sided inverse, and the parent nowhere asserts a one-sided one. E1 and E7 are corrections of DLB17's proofs (Théorème 9.9 line 2005 omits continuity; the proof of Théorème 9.7 lines 1973–1978 gives one identity), not of the parent's statements. COLMEZ19POIDS Théorème 0.8(ii) (line 265) is a published two-sided statement: a−c∂ is an isomorphism of Π(Δ) for (a,c) ≠ (0,0).

   **Repair.** Withdraw both gaps from plan.json `gaps` (and from `nodes[].gaps`, `coverage[3].remaining`) and from the README (lines 87, 89; the two slugs in §3.3's `*Needs:*` and in the Layer 3 Dependencies). Keep E1 and E7 under Source corrections, each ending "the base roadmap's statement already carries the needed form" and, for E7, "COLMEZ19POIDS Théorème 0.8(ii) proves the two-sided statement".

4. **F04** (P2) E9 is not an error in DLB17, and gap:smooth-kernel-twisted-coefficients rests on it

   **Location.** README line 1122 (E9), line 91 (the gap), line 434 (§3.2 "source correction E9"); plan.json `sourceIssues` E9 and `gaps[2]`.

   **Claim.** DLB17 Proposition 11.2 and Théorème 11.3 treat t⁻¹N⁺_dif/N⁺_dif as a locally constant coefficient module and forget the Tate twist.

   **Witness.** DLB17 line 2449 writes α_dif: t⁻¹N⁺_dif(V)/N⁺_dif(V) ≅ L_∞(−1)⊗M_dR(π); the diagram of Théorème 11.3 (lines 2464–2466) has LC(ℚ_p^×, L_∞(−1)⊗M_dR(π))^Γ on top and LC(ℚ_p^×, t⁻¹N⁺/N⁺)^Γ below; the untwisted LC(ℚ_p^×, L_∞⊗M_dR(π))^Γ appears only for Π(π,2) (line 2469), justified at lines 2470–2472 by the twist of Π(π,2). That is exactly the procedure the README prescribes. The parent imports Théorème 11.7 as stated (parent line 2451), so nothing is missing there.

   **Repair.** Delete E9 from the README and from plan.json `sourceIssues` (it must not reach the errata register); withdraw gap:smooth-kernel-twisted-coefficients from plan.json and the README (line 91, §3.3 `*Needs:*`, Layer 3 Dependencies, `coverage`); in §3.2 (line 434) replace "(source correction E9)" by "(DLB17 lines 2449 and 2469–2472)". The mathematics of §3.2 is unchanged.

5. **F05** (P3) a false Check in §7.6

   **Location.** README line 1075: "The full O(Σ_r) is an infinite sum over types and is not coadmissible as a D(G)-module."

   **Claim.** Infinitely many Ǧ-types occur in O(Σ_r), and the sum is not coadmissible.

   **Witness.** Gal(Σ_r/Σ₀) = O_D^×/(1+p^rO_D) is finite (DLB17 line 106; README line 44), so Ǧ acts on O(Σ_r) through the finite group Ǧ/(p^ℤ(1+p^rO_D)) and finitely many types occur (§0.2's own API bullet, line 164). Each sector is coadmissible: the supercuspidal ones by the base's `DrinfeldComparison.functions_dual`; the trivial and one-dimensional ones are finite sums of copies of O(Ω) (gap:drinfeld-components), and O(Ω) is coadmissible because dO(Ω) is the kernel of Ω¹(Ω) ≅ (St^an)′_b → H¹_dR(Ω) ≅ (St^sm)′_b (§4.2), both coadmissible. A finite sum of coadmissible modules is coadmissible.

   **Repair.** Replace the Check by: "The trivial and one-dimensional sectors of O(Σ_r) are coadmissible by §4.2 and gap:drinfeld-components, not by DLB17 Théorème 10.1; the fixed-sector category is a choice, not a necessity, and E8 concerns the source's justification only."

6. **F06** (P3) §12.21 is cited for a finite-level Stein covering it does not supply

   **Location.** README line 491: "Fix a Stein covering of M^p_{n,C} by affinoids, taken from EndoscopicTransferAndUnitaryTraceComparison §12.21"; line 637: "the Čech sequence of the Stein covering (… §12.21)".

   **Claim.** §12.21 supplies an affinoid Stein covering of the finite-level M^p_{n,C}.

   **Witness.** `TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md` lines 4711–4716: §12.21 is the Mittag–Leffler property of Stein affinoid perfectoid covers of the infinite-level Lubin–Tate tower (CDN23 Lemma 3.10, Corollary 3.11), transported to the Drinfeld tower by duality.

   **Repair.** For the finite-level cover cite §12.4 (the tower as finite étale covers of Σ₀ = Ω⊔Ω, Ω Stein) and add the one clause "a finite étale cover of a Stein curve is Stein" with its locator in §4.1; keep §12.21 only for the p-primary Mittag–Leffler input of the limit step in §4.9.

7. **F07** (P3) the product clause of §6.3 lacks its hypotheses

   **Location.** README line 920: "The same statement holds for representations of a product E×G_ℚ_p with a finite-dimensional algebra E acting compatibly."

   **Claim.** The rigidity lemma extends to E×G_ℚ_p for a finite-dimensional algebra E.

   **Witness.** The consumer §6.5 (line 954) applies it to E_{B,M}, which is not finite-dimensional over L but finite over R_{B,M}, with F⊗_{R_{B,M}}E_{B,M} finite-dimensional over each fraction field F (CDN23 footnote 32, lines 2861–2866); the trace argument needs E finite as an A-module and A-linear, acting commuting with G_ℚ_p, and joint absolute irreducibility at closed points.

   **Repair.** Write: "for an A-algebra E, finite as an A-module, acting A-linearly and commuting with G_ℚ_p, when the specialisations are absolutely irreducible as E×G_ℚ_p-modules; the generic irreducibles of F⊗_A E ⊗ F[G_ℚ_p] are determined by their traces since F has characteristic zero."

8. **F08** (P3) M_dR versus M*_dR in a Layer 7 Check

   **Location.** README line 1018: "H¹_dR(Σ_r)^ρ⊗Sym¹ ≅ π′⊗M_dR⊗Sym¹".

   **Claim.** H¹_dR(Σ_r)^ρ ≅ π′⊗M_dR.

   **Witness.** DLB17 line 2716 and README line 1027 write π*⊗M_dR(π)*; the two agree only through the trivialisation of ∧²M_dR of §0.4(c), which the README itself keeps distinct (line 451).

   **Repair.** Write M*_dR at line 1018 (the count of four copies of π′ is unchanged).

Reviewed at head 642e432 of the board pull request (the checkout was at that head; the pull request's current head was confirmed to be the same). Files: `packages/PadicLocalLanglandsForGL2QpPartII/design/README.md` (1140 lines), `design/plan.json` (50 nodes, 8 gaps, 0 requests, 20 source issues, 137 routing rows, empty `restructure`) and `sources.toml` (4 certified entries). The parent was read at the current head of its open pull request (9971d01, not the 29fce9f of round 1); every other supplier at the head listed in the roadmap index of 2026-10-25; the two board designs on the board's main branch; Mathlib at 6b7abb3c and Tau Ceti at a91d3aa.

Eight findings: two P1, two P2, four P3. Both P1 findings are missing owners for proof inputs, not false mathematics; the repairs are citations and one new target.

## Round-1 findings, repair by repair

| Finding | Status | Witness at 642e432 |
| --- | --- | --- |
| F01 gaps unowned | repaired | plan.json `gaps`: 8 entries, each with `supplier`, `section`, `needs`, `neededBy`; README lines 87–93, 122, 126–130 "What X must provide (gap:slug)"; slugs agree with every `*Needs:*` line (checked by script). Three of the eight are redundant or ill-founded: R03, R04. |
| F02 re-planned §6.9 | repaired | README lines 22–34 import the §6.9 names (all ten exist at parent lines 2417–2467); the fourteen duplicate targets are gone (50 nodes, none of the old ids); `restructure` empty; refinements §§2.1–2.3, 3.2 each carry a "beyond the base" clause (lines 30–34). Keeping §3.1 as a discharge of the parent's explicit hypothesis `DrinfeldComparison.global_nonzero_map` (parent line 2467 calls it a hypothesis) is a legitimate extension. |
| F03 board packages as suppliers | repaired | No `LR.`/`SZ.`/`MP.` citation outside the gap sentences; gaps on LocallyAnalyticRepresentationsOfLocalGroups and ScholzeFunctorAndModpCohomologyOfTheLubinTateTower name sections that exist in `packages/<Name>/design/README.md` on board main (LR.0 "The derived action of the Lie algebra" line 144; SZ Layer 0 Strauch line 226; Layer 5 finite length line 1136, whose statement (a)–(c) is what the gap asks). |
| F04 atlas labels | repaired | `roadmaps resolve`: nothing found nowhere. Every cited section was opened at its head (table under Verified sound). |
| F05 general central character | repaired | §3.3 (lines 444–467); the p = 7 Check at line 463 and the Layer 0 example line 221; consumers §§4.1, 4.7, 4.12–4.14, 6.4, 7.2, 7.5 cite §3.3. |
| F06 ΦNᵖ_n | repaired | lines 686–687, 704–705, 722–723 require M ∈ ΦNᵖ_n and δ(p)² = 1; negative control (χ(p) = 1+p) at lines 154, 694, 714, 737; E16 line 1129 with CDN23 line 2434 as witness (verified: the proof decomposes over ΦNᵖ). |
| F07 gaps ask for provided results | partly repaired | G2, G5, G7, G8, G10, G13, G14, G17 now cite their providers (lines 112, 78, 36/101, 117–118, 62–65, 82/882, 83/879, 108/1042). But the four new gaps on the parent's §6.9 include two that the parent already states (R03) and one resting on a non-existent source error (R04). |
| F08 compound needs | repaired | each `needs` is one sentence naming one result; "has no stage/node in this checkout" is gone. |
| F09 orbit criteria | repaired | lines 62–65, 617, 631 cite the four pinned theorems; §4.8 API (lines 621–623) keeps only subspace, functoriality and the isometric case. Declarations verified at the pin (Bounded.lean 61, 495; WithSeminorms.lean 575, 595; Barrelled.lean 164). |
| F10 pins | repaired | README lines 60, 68; plan.json `baseline` = 6b7abb3c / a91d3aa; `leanStatus` says no Lean file at design stage. |
| F11 process narrative | repaired | house headings in order; grep for round labels, pull-request numbers, atlas ids, "removed", "optional", "deferred", LaTeX delimiters and machine paths: none. |
| F12 irreducibility locator | repaired | §2.3 line 394: COLMEZ19POIDS Théorème 0.3(ii) is at line 179–180 and Remarque 0.2(ii) at lines 161–166 as cited; DLB17 Remarque 1.8 at line 410. |
| F13 annihilator exponent | repaired | §1.6 lines 309–317, 322; E4 line 1117. Recomputed below (table row §1.6). |
| F14 manifest | repaired | four entries, `status = "certified"`, no local path; DLB17 is arXiv v2 (the numbering I checked agrees with the README). |

Adversarial pass over the repaired passages (§§0.4, 1.6, 2.1–2.3, 3.1–3.3, 4.8, 4.12–4.14, the gap sentences, E1–E20): rows below. Looking for the repaired patterns elsewhere found R03/R04 (a gap on a statement the supplier already makes) and R01 (a route input written as supplied without an owner).

## Verified sound

**Principles.** No route-specific shortcut beyond the sources' own hypotheses (p > 2 in Layer 5 from CDN23 line 1776; p > 3 in §§6.5–6.6 from CDN23 line 93 and footnote 32; trivial centre only in Layers 1–2 and 7, removed in §3.3); no re-planning (F02 verified); no copied passage (about forty statements compared with the French text in the sample below: all are paraphrases); no algorithm; no Lean file, hence no sorry'd data or `set_option`; cross-roadmap citations by name and section only.

**Dependency check** (verbatim):

    candidate: PadicLocalLanglandsForGL2QpPartII is not in the merge order yet; checked as if placed after CompletedCohomologyAndLocalGlobalCompatibility (the intake inserts it when its design is accepted)
    depcheck: 56 roadmaps, 637 edges, 0 problem(s)

No UPWARD or CYCLE line. `roadmaps resolve`: no cross-roadmap citation and no Lean name found nowhere. Internal order: all 50 nodes' prerequisites name existing earlier nodes or declared gap slugs (checked by script, none missing or forward); the 8 slugs agree between plan.json and the README, and each `neededBy` matches the `*Needs:*` lines. Every numbered section has a `*Needs:*` line (50), a locator and at least three Checks (counted by script; no section below three).

**Seeded source sample** (every locator opened at the line cited):

| Target | Text checked | Result |
| --- | --- | --- |
| 0.1 | CDN23 lines 2343–2349 (ΦN, ΦNᵖ, ΦNᵖ_n, decomposition over types); DLB17 lines 104–106, 115–116 (Σ_n, Galois group, Σ₀ two copies) | correct; DLB level r = CDN level 2r recomputed: 1+pO_D = 1+ϖ_D²O_D |
| 0.3 | CDN20 lines 857–858 (M[k]), 879–885 (V_{M,ℒ}, weights 0,1, D_pst = M[−1]), 889–913 (Rem. 2.6, Lemme 2.7), 914 (Rem. 2.8) | correct |
| 1.6 | DLB17 lines 1550–1569 (pairing, Prop. 7.7(a),(b)) | correct; (b) prints t^k; recomputed below |
| 2.3 | COLMEZ19POIDS lines 161–166, 179–180; DLB17 line 410 | correct |
| 4.3 | CDN20 lines 1171–1194 (Lemme 2.18 and proof) | correct; the companion column at line 1186 is all-positive (E14); the complement step at 1188–1193 checks AS′ ∩ (S_v+AS_v) = 0 only |
| 4.5 | CDN20 line 822 (Prop. 2.4); CDN23 lines 2401–2413 (Lemmes 5.4, 5.5) | correct |
| 4.10 | CDN23 lines 2381–2396 (Lemme 5.3 a–c); CDN20 line 1078 (Cor. 2.13) | correct; (c) is cited there to a separate paper, consistent with the README's route through the base §2.5 |
| 4.13 | CDN23 lines 2465–2473 (Thm 5.8, printed "niveau ≤ n"), 2474 (decomposition over ΦNᵖ_n), 2481–2488 (Lemme 5.9) | correct; E16 confirmed |
| 5.1 | CDN23 lines 2627–2639 (§5.3.1, Prop. 5.16) | correct, n fixed |
| 5.5 | CDN23 lines 2746–2756 (Thm 5.22 and proof) | correct; the finite-dimensionality input is Cor. 4.21 (gap:modp-drinfeld-finite-length (c)) |
| 5.6 | CDN23 lines 2762–2776 (Rem. 5.23 (i),(ii)) | correct, including the inverse centres |
| 6.2 | CDN23 lines 2553–2557 | correct |
| 6.4 | CDN23 lines 2779, 2783–2797 (Thm 5.24(i), p > 2 at 2786, O[M]^b = 0 at 2791–2793) | correct |
| 6.5 | CDN23 lines 2780–2782, 2861–2868 (footnote 32) | correct; E12 (Ř = Hom(Ř,L) at line 2623–2624) and E13 confirmed |
| 7.3 | DLB17 lines 2731–2781 (Rem. 11.13) | correct; K = ℚ_{p²}((−p)^{1/(p²−1)}) at 2734–2735; E11 confirmed (lines 2776–2781 use two lines) |

Further locators opened: DLB17 Thm 1.2 (154), Rem. 1.3(a) (159), M_dR (189), Thm 1.4 (232), Thm 1.9 (434), Thm 1.10 (447), Thm 4.8 (928), Thm 5.1 (999), Thm 5.4 (1063), Thm 5.5 (1071), §5.3 (1184, twist ignored at 1198), Lemme 6.3 (1250), Prop. 6.4 (1259), Ex. 6.5–6.6 (1288, 1335), Thm 7.3 (1460), Déf. 7.4 (1473), Rem. 7.5 (1500), Prop. 7.6 (1535), Thm 7.8 (1581), Prop. 7.9 (1593), Thm 7.11 (1615), Prop. 8.2 (1661), Thm 8.3 (1690), Prop. 8.4 (1768), Thm 8.6 (1828), Thm 8.8 (1864), Prop. 9.6 (1946), Thm 9.7 (1967), Lemme 9.8 (1980), Thm 9.9 (2005), Prop. 9.16 (2179), Thm 10.1 (2192), Prop. 11.1 (2427), Prop. 11.2 (2432), Thm 11.3 (2461), Thm 11.7 (2568), Prop. 11.10 (2685), Rem. 11.11 (2707), Rem. 11.12 (2718), Rem. 12.1 (2807), §12.2 (2810), Prop. 12.2 (2819), Rem. 12.3 (2823), §12.3 (2861), Conj. 12.4 (2876); CDN20 Thm 0.2 (130), types (242–252), Thm 0.4 (268), Thm 0.8 (323), §1.3 (614), Prop. 1.5 (650), Prop. 1.6 (659), Thm 1.7 (678), O[M] (749), Cor. 2.1 (762), Kummer (779–791), Rem. 2.2 (792), Rem. 2.3 (817), Prop. 2.5 (859; E15 at 875–876), Prop. 2.9 (952), Prop. 2.10 (962), bounded vectors (1009–1019), Prop. 2.12 (1020), Thm 2.15 (1090), Cor. 2.16 (1108); CDN23 Thm 0.1 (121), p > 3 (93), Thm 4.1 and p > 2 (1776–1779), Thm 5.1 (2357), Rem. 5.2 (2366), Prop. 5.6 (2420), Prop. 5.7 (2424, footnote 30 at 2447), diagram (2501–2514), Thm 5.10 (2541), Lemme 5.12 (2574), Déf. 5.14 (2606), Thm 5.15 (2620), Cor. 5.17 (2658), Prop. 5.19 (2673), Prop. 5.21 (2716); COLMEZ19POIDS Thm 0.6 (215), Thm 0.8 (262), O_n(k) twist (310–321), Conj. 0.10 (328), Rem. 0.11 (333–340). All agree with the README except as recorded in R04.

**Adversarial pass** (values computed by the reviewer; sampled targets, headline theorems and every target a finding touches):

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions: inverse pullback | u(s), diag(e^s,1), diag(1,e^s), (1 0; s 1) on f | f(z−s), f(e^{−s}z), f(e^{s}z), f(z/(1−sz)); derivatives −f′, −zf′, zf′, z²f′ | agrees with line 46 and DLB17 Lemme 3.5 | — |
| Conventions: dual action | z acting by χ(z) | (zℓ)(v) = ℓ(z⁻¹v) = χ(z)⁻¹ℓ(v) | sound | — |
| §0.1 levels, ΦNᵖ | r = 1; χ(p) = 1+p | 1+pO_D = 1+ϖ_D²O_D (ϖ_D²O_D = pO_D); χ(Nrd p) = (1+p)² ≠ 1 | sound | — |
| §0.2 multiplicity | Z = W⊗JL(M), dim JL = 2 | Hom_Ǧ(JL,Z) = W⊗End_Ǧ(JL) = W; finite group Ǧ/(p^ℤ(1+ϖ_D^nO_D)) has finitely many irreducibles, all JL(M) for M ∈ ΦNᵖ_n | sound | — |
| §0.3 V_{M,ℒ} | ℚ_p(1); weights | φ on D_cris(ℚ_p(1)) is p⁻¹, [1] gives 1; C⊗V = C⊕C(1) | sound | — |
| §0.4(c) | e₁,e₂, ℒ = Le₁ | e₁ ↦ (w ↦ e₁∧w) = e₂*⊗(e₁∧e₂); Le₁ ↦ Le₂*⊗∧² = ℒ^⊥⊗∧² | sound | — |
| §1.1 sandwich | jumps (−1,0); (0,1); (−k,0) | Σt^{−i}Fil^i = tN⁺ + L[[t]]ℒ ⊂ N⁺; N⁺ + t⁻¹L[[t]]ℒ ⊄ N⁺; t^kN⁺ + L[[t]]ℒ ⊃ t^kN⁺ | sound | — |
| §1.2 | rank-one trivial; R(δ); h = 1 | ∇1 = 0; ∇e = κ(δ)e; (∇−1)(tx) = t∇x = t²∂x | sound | — |
| §1.5 Lie action | (a,b) = (0,1) | Casimir 0; ∂² = t⁻²∇(∇−1), so u⁻ = −t⁻¹∇(∇−1) = −t∂² | sound | — |
| §1.6 orthogonal | V = L; V of weights {0,k}, t^mN⁺(V) against N⁺(V̌) = L_∞[[t]]⊗D_dR(V)*t⁻¹dt | products in t^{m−1}L_∞[[t]]dt; residue vanishes for all partners iff m ≥ 1; te orthogonal at k = 2, te ∉ t²N⁺ | sound; DLB17 line 1569 wrong for k ≥ 2 | E4 kept |
| §2.1 | Le₁ ≠ Le₂ | same E_π ⊂ tN_rig⊠ℙ¹ (Thm 8.6), different Π(V)^an | sound refinement of parent §4.11 | — |
| §2.2 covariance | ∂ = z on O(Ω); w; u(b); aI₂ | ∂u⁺−u⁺∂ = f; g∂g⁻¹f = (g⁻¹z)f = (dz−b)/(a−cz)·f; w∂w = (−1)(−∂)⁻¹ = ∂⁻¹, wu⁺w f = z²f′ = −∂²u⁺f; u(b): ∂−b; aI₂: a²/a² = 1 | sound | — |
| §2.3 | V trianguline; Π(V)^an | not asserted; reducible with sub π; quotient Π(M,−1) | sound | — |
| §3.1 | zero map; twist η | excluded; sector JL(π)⊗η∘Nrd ≠ ρ | sound statement; route inputs unowned | R01 |
| §3.2 twist | γ on t⁻¹e | χ(γ)⁻¹; DLB17 line 2449 carries L_∞(−1) | sound; E9 unfounded | R04 |
| §3.3 | p = 7, ω; ζ = 1; χ(p) = 1+p | characters of μ₆ squared have order ∣ 3, ω∣μ₆ order 2: no square root; ω(7) = 1 gives M ∈ ΦNᵖ; ζ = 1 recovers Le₂* under §0.4(c); zero sector | sound | — |
| §4.1 | slope 1/2 vs 0; M ∉ ΦNᵖ | (B⁺_cris⊗M)^{φ=1} = 0 iff slope > 0; all terms 0 | sound | R06 (citation) |
| §4.2 | δ_x−δ_y; (z−a)/(z−b); aI₂ | mass 0; symbol δ_a−δ_b (CDN20 line 652); δ(a²) on both sides; δ(p)² = 1 | sound | — |
| §4.3 | d = 2, Ae₁ = e₂; S = 0; S = E | column (−λ₁λ₂, λ₁+λ₂): trace λ₁+λ₂, det λ₁λ₂; all-positive column: det −λ₁λ₂; S = E violates the hypothesis; S ∩ (S_v+AS_v) = S_v by maximality of k(v), so S′ ∩ (S_v+AS_v) = 0, but (S′+AS′) ∩ (S_v+AS_v) = 0 is not checked by the source | sound; E14 real | — |
| §4.4 | V = L; V = 0 | H_C(L) = C^{G_F}⊗L = F⊗L; 0 | sound | — |
| §4.6 | F = ℚ_p; [F:ℚ_p] = 2 | κ₁+κ₂ = 1 forces {0,1}; (0,0),(1,1) sums to 2 | sound | — |
| §4.8 | ℤ on ℚ_p by pⁿ; trivial action | ∣pⁿx∣ = p^{−n}∣x∣ unbounded; orbit a point | sound; pins verified | — |
| §4.9 | constants | G-bounded, trivial sector; supercuspidal JL has dim ≥ 2 | sound | R06 (citation) |
| §4.10 | Π = L; π₀ = St^sm | L; (St^cont)′ | sound | — |
| §4.12 | χ(p) = 1+p; ordinary Π; ℒ′ ≠ ℒ | 0 versus printed ℒ⊗JL(M); 0; bound 1 | sound; E16 | — |
| §4.13 | dimensions | 2·dim JL(M) versus dim JL(M) | sound | — |
| §4.14 (headline) | dim 3; δ with δ(p)² = 1; χ(p) = 1+p | 0; Steinberg branch; 0 on M^p_n, nonzero on M_n (CDN23 Thm 5.1 is on M_n) | sound | — |
| §5.1 | L⊗lim vs lim(L⊗) | L⊗ℤ/p^k = 0 | sound | — |
| §5.6 | Sp⊗δ | ω_{JL}(z) = δ(z²), so δ_M = δ⁻² | sound | — |
| §6.3 | DVR, ρ vs ρ⊗χ, χ ≡ 1; Smith form | isomorphic reductions, not isomorphic; a non-unit λ_i with prime 𝔭 gives a nonzero non-isomorphism between absolutely irreducible reductions, impossible by Schur | sound; product clause under-hypothesised | R07 |
| §6.4 | N = L[T]/(T²), I = (T) | kills every fibre, T·1 ≠ 0 | sound | — |
| §6.5 | R = L | Ř = L, formula reads m_B(Π(ρ_x)′)⊗ρ_x | sound; p > 3 from footnote 32 | — |
| §6.6 (headline) | Steinberg block, M = Sp | (St^cont)′⊗1⊗1 | sound | — |
| §7.1 cocycle | gg′; k = 0; aI₂ | (a−c∂)(a′−c′·g∂g⁻¹) = a′(a−c∂) − c′(d∂−b) = (aa′+bc′) − (ca′+dc′)∂, the left column of gg′; identity; a^{−k} | sound | — |
| §7.2 | k = 0, 1; central characters | row is the de Rham sequence; cokernel four copies of π′; aI₂ acts by a^k on O(−k), by a^{−(k+2)}a^{2k+2} = a^k on the middle term, by a^k on H¹_dR⊗Sym^k | row sound; analytic-vectors clause unowned | R02, R08 |
| §7.3 | diag(1,c) in basis (ℒ,ℒ′) | fixes 0, ∞; moves 1 unless c = 1 | sound; E11 real | R01 (inputs) |
| §7.5 | Σ₀ = Ω⊔Ω, f = (1,−1) | primitives (z^j/j!, −z^j/j!); not of the form (h,h) | sound; E2 real | — |
| §7.6 | ρ = 1; the full O(Σ_r) | H⁰_dR ≠ 0, excluded; finitely many types, each sector coadmissible | Check at line 1075 false | R05 |
| §7.7 | ∅; B_{i+c}; U₁⊔U₂ | 0; same germs; product | sound | — |
| gap:halfplane-module-continuity, gap:two-sided-resolvents | parent line 2435 | "unique continuous O(Ω)-module structure", "resolvents" | already provided | R03 |
| gap:fixed-radius-divisibility | parent line 2451 | "infinite t-divisibility" with no fixed radius; DLB17 Rem. 11.11 | real gap | — |
| gap:cuspidal-projectivity-coefficients | SmoothRep SR.3.2 line 2638; SR.3a.1 line 2255 | both over ℂ; compactness mod centre kept separate | real gap, precise | — |
| gap:derived-lie-action | board LR.0 line 144 | target exists with the stated content | precise | — |
| gap:modp-drinfeld-finite-length, gap:drinfeld-components | board SZ lines 1136–1172, 226–262 | statements (a)–(c) and the component description match the `needs` | precise | — |

**Library declarations opened** (Mathlib 6b7abb3c): `Bornology.IsVonNBounded` (Mathlib/Analysis/LocallyConvex/Bounded.lean:61; context `[SeminormedRing 𝕜] [SMul 𝕜 E] [Zero E] [TopologicalSpace E]`, no Hausdorff or local convexity, as the README says); `NormedSpace.image_isVonNBounded_iff` (Bounded.lean:495, `[NontriviallyNormedField 𝕜] [SeminormedAddCommGroup E] [NormedSpace 𝕜 E]`); `WithSeminorms.isVonNBounded_iff_seminorm_bounded` (WithSeminorms.lean:575) and `…image…` (595), bound `∃ r > 0` per index i; `WithSeminorms.banach_steinhaus` (Barrelled.lean:164, barrelled source). Tau Ceti a91d3aa: no carrier for the roadmap's objects (as round 1 found; unchanged pin).

**Cross-roadmap citations resolved** (at the heads of the index of 2026-10-25): parent §§0.1 (208), 0.2 (245), 1.1–1.4, 1.6 (359–566), 1.7 (605), 2.5 (775), 2.7 (854), 3.1–3.8 (937–1176), 3.11 (1247), 4.1k (1331), 4.2a (1453), 4.9 (1665, p ≥ 5 as the README says), 4.11 (1712), 5.1–5.6 (1745–1917), 5.8 (1965), 5.12 (2089), 6.7 (2371), 6.9 (2415–2467), and the fifteen backticked names; PhiGammaModulesAndIwasawaCohomology §§2.4 (931, `oneSubPhiOnPsiOne`), 5.4 (1865), 5.6a (1950, `deRhamDiffEq`), 5.7 (1997, the four names at 2046–2047, hypothesis `geometricallyNontriangulineLocalized` as the README states); PadicHodgeTheory §§3.3 (677), 4.4 (888), 5.1–5.4 (982–1049), 8.1 (1383); PadicDifferentialEquationsAndRigidCohomology §RD.1.73 (4288), §RD.2.43 (5605; its step 4 is DLB Prop. 6.4 from Lemme 6.3, consistent with §1.2 proving Lemme 6.3 here); EndoscopicTransferAndUnitaryTraceComparison §§12.4 (4338), 12.5 (4367), 12.7 (4419), 12.14 (4575, inverse central character and trivial diagonal centre as stated), 12.19 (4677), 12.21 (4711; see R06); LocallyAnalyticDistributions §§0.0 (247), 0.2 (399), 0.3 (662; "Strong duality for analytic compact-type spaces" at 753), 0.CR.6.6 (457); GL2AutomorphicRepresentationsAndTransfer R16.3 (811), R17.3.12 (1755); CompletedCohomologyAndLocalGlobalCompatibility §4.9 (1609, DLB Thm 5.4 with r̄ absolutely irreducible at p); LocalGaloisDeformationRings §3.8 (2504); SmoothRepresentationsOfLocalGroups SR.0 (552), SR.2 (1826), SR.3.2 *cuspidal-splitting* (2604, 2638). Board designs on board main: LocallyAnalyticRepresentationsOfLocalGroups LR.0 `derived-lie-action` (line 144); ScholzeFunctorAndModpCohomologyOfTheLubinTateTower Layer 0 Strauch (226), Layer 5 finite length (1136). Supplier drift found: R01 (uncited owners), R06.

**Ownership against open work.** `roadmaps grep` over main and the 367 open pull-request heads for the Čerednik–Drinfeld uniformisation (owner HilbertModularVarietiesAndShimuraCurves §§R18.5.15–R18.5.21, cited in R01), Colmez's weight change (no owner: R02), DLB Théorème 5.5 (owner CompletedCohomologyAndLocalGlobalCompatibility §6.4: R01); round 1's searches for Breuil–Strauch, Π(π,0), P-finite vectors, the fundamental diagram and PID rigidity were not repeated beyond the parent (unchanged at 9971d01 on these points). The brief named the sibling checkouts without paths; the grep tool covered their heads.

**Shape.** 50 targets in 8 layers; every definition has an API list and three or more Checks; every layer has Examples and Dependencies; Scope and ownership, Conventions, Exact supplier contracts, How to read the build, Downstream consumers, Source corrections, References present; no LaTeX, no `lemma`, no `set_option`, no process words, no pull-request numbers, no machine paths.

**Headline theorems.** The Galois-socle theorem (§4.14), the factorisation (§6.6), the general-central-character realisation (§3.3), the irreducibility of Π(π,0) (§2.3), the Iwasawa invariants (§7.4), the infinite-primitives containment (§7.5) and the filtered derived realisation (§7.6). None is statable at the pins (no Drinfeld tower, Banach or locally analytic representation, Robba ring or (φ,Γ)-module carrier in Mathlib 6b7abb3c or Tau Ceti a91d3aa); the README (line 68) and plan.json `leanStatus` say so. Padding: not applicable at the design stage (no Lean file).

**Lean.** Not available (this lane does not elaborate); the design has no Lean file, so no `#check` binder comparison was possible.

## Not verifiable

- CDN20 published (JAMS) and COLMEZ19POIDS published (JEMS) numbering against the authors' copies: the paywalled versions were not read; the README cites the copies it read, as the manifest records.
- DLB17 printed pages: not cited by the README; arXiv v2 was read.
- LocallyAnalyticDistributions §0.CR.6.6's clause on "Hyodo–Kato cohomology of semistable curve towers in ind-Fréchet spaces": the section's opening (lines 457–475) was read; the tower clause further down was not re-read this round.
- E5, E6, E8, E13, E17, E18, E20: located (lines 1690, 1768, 2810, 2620/2779, 2438–2448, 2779, 2785) but not re-derived beyond what the table records.
- Board job issues were not queried; the two board designs were read from the board's main branch at a8e9d34.

## Source issues

- **Error** in DLB17 at Théorème 1.10, arXiv v2 p. 11: the source says an infinitely primitivable function on Σ_n lies in O(Ω); it should be a locally constant function on components times a function on Ω, since Σ₀ is two copies of Ω; affects a stated result.
- **Gap** in DLB17 at §5.3, proof of Théorème 5.1, arXiv v2 p. 30: the source says the unramified twist of the globalised component may be ignored; it should be removed by a global character before taking isotypic parts; affects the proof.
- **Error** in DLB17 at Proposition 7.7(b), arXiv v2 p. 38: the source says the orthogonal of N⁺_dif,n(V̌) is t^kN⁺_dif,n(V) for weights 0, k; it should be tN⁺_dif,n(V) for every k ≥ 1; affects a stated result.
- **Gap** in DLB17 at Remarque 11.13, arXiv v2 pp. 65–66: the source says agreement on two filtration lines forces the comparison; it should use three distinct lines, two leaving a diagonal projectivity; affects the proof.
- **Misprint** in DLB17 at Théorème 1.9, arXiv v2 p. 11: the source says n for both the cover level and the cyclotomic level; it should be two indices; affects nothing.
- **Misprint** in CDN20 at Lemme 2.18, proof, authors' copy p. 30: the source says the completing column is σ_ne₁ + ⋯ + σ₁e_n; it should alternate in sign, the coefficient of e_{n+1−k} being (−1)^{k+1}σ_k; affects the proof.
- **Gap** in CDN20 at Lemme 2.18, proof, authors' copy p. 30: the source says AS′ meets S_v + AS_v in 0; it should also show that S′ + AS′ meets S_v + AS_v in 0 before gluing the two inductive extensions; affects the proof.
- **Misprint** in CDN20 at Proposition 2.5, proof, authors' copy p. 22: the source says the Hom has dimension 0 or 1 according as D_pst(V*) is or is not M[−1]*; it should be 1 or 0 respectively; affects nothing.
- **Misprint** in CDN23 at Théorème 5.15, HAL copy: the source says Ř_{B,M} = Hom(Ř_{B,M}, L); it should be the continuous L-dual of R_{B,M}; affects nothing.
- **Error** in CDN23 at Proposition 5.7 and Théorème 5.8, HAL copy: the source says the case condition on the p-central quotient is M of level ≤ n; it should be M ∈ ΦNᵖ_n, as the proof's decomposition shows; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "642e432", "job": "REV-DESIGN-PadicLocalLanglandsForGL2QpPartII~2", "model": "fable", "worker": "fable-rev152"} -->
