<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/428#issuecomment-6367498411 -->
Review (claude) of 57dc0a4

Verdict: needs changes

1. **F01** (P1) Twenty-seven supplier contracts are undeclared gaps, and most cite sections that do not make the statement

   **Location.** `packages/ShimuraVarietiesPartII/design/README.md:1447`: “there are 27 open requests. This is planned coverage, not a claim that the suppliers have already proved the inputs.” `plan.json` top-level `"gaps": []`; the 27 entries sit in `"requests"`.

   **Claim.** Each `**Direct prerequisites:**` citation of a supplier section (for example `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6`, 9 uses) names a section that supplies the input.

   **Witness.** At its open head, `TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md:8068` Layer R07.6 is “Deformation and ramification consequences” (Fontaine bounds, Raynaud); the file never mentions very-good embeddings, adapted deformations or ordinary lifts. README line 1571 itself: “not assertions about current RG2.1”.

   **Repair.** Re-route every request using the map below. Where the input is owned by an unbuilt board package or is missing from an existing roadmap, declare it as `gap:<slug>` in both `plan.json` `gaps` and the README. Give each gap a supplier and section, and a one-sentence `needs` with its hypotheses. Then delete the “Closure register” prose. Tested on R07.6: after the repair, its nine users cite FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII TD.2 `very-good`, TD.3 `nonexceptional-embedding`/`D-central-cover`/`A-central-cover`/`polarized-chain`, TD.4 `versal-adapted`/`crystalline-tensor-integrality` and TD.6 `ordinary-adapted-lift`. These are declared gaps, because that package lives on the board's main as `packages/FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII/design/README.md`, lines 794, 1077–1169, 1236, 1388, 1963. After the repair nothing cites base R07.6.

   | Contract (README line) | What the supplier says at its head | Verdict | Re-route |
   | --- | --- | --- | --- |
   | A5 (1451) | AbelianSchemes Layer A5 is complex uniformization. Finite-rank Hom, descent of endomorphisms and quasi-isogenies are §§A6.7, A6.20, A6.22 | misrouted | cite A6.7, A6.20, A6.22 |
   | R09.1 (1457) | Layer 1 is projective parameter spaces; no Bertini/Poonen statement on main or any open head | missing | gap to AlgebraicModuliForArithmeticGeometry (Layer 1), or own (R03) |
   | R09.3 (1463) | quotient stacks are SchemeAndStackFoundations §§1.17–1.23; free-quotient descent at finite level is KP's argument | partly misrouted | cite SchemeAndStackFoundations; own the Δ-quotient here |
   | R09.4 (1469) | Layer 4 is gerbes and bands; no smooth presentation with a rational lift over the same F_q (LMB Théorème 6.3) | missing | gap or own (R03) |
   | R09.6 (1475) | Layer 6 “G-rings and algebraic approximation” | supplied | cite Layer 6 by section |
   | R01.5 (1481) | ArithmeticGaloisRepresentations Layer 5 has function-field Chebotarev and Recognition (README:3504–3546, citing KZ 5.3.5); auxiliary primes: Chebotarev (main) | supplied | cite those sections |
   | R01.6 (1487) | Layer 6 is Tate modules; “Noot's specialization” is routed to NeronModelsAndSemistableAbelianVarieties §6.0 (AGR README:166); no Noot 2009 anywhere; CM potential good reduction is ShimuraVarieties §5.6 | missing + misrouted | cite ShimuraVarieties §5.6; Noot: R03 |
   | B2 (1493) | AutomorphicBundles §§B2.4–B2.7: full-group Betti, étale, de Rham coefficients and their comparison | supplied | cite §§B2.4–B2.7 |
   | BG1 (1499) | BunGAndNewtonStrata §§1.22, 1.26 supply detection and the ordinary class. Grothendieck–Katz semicontinuity for families is PadicDifferentialEquationsAndRigidCohomology §RD.3.43 (README:7189) | misrouted | cite §RD.3.43 with BunG §1.22 |
   | CR.7 (1505) | the README says base CR.7 is insufficient (“extend through CrystallineCohomologyIntegralFamiliesPartII”) | missing | R03 |
   | R07.2 (1511) | Layer R07.2 Dieudonné theory | supplied | label as §R07.2 |
   | R07.4 (1517) | KZ 3.3.2 integral tensor comparison is FFG Part II TD.4 `crystalline-tensor-integrality`, `integral-tensor-frame` | misrouted | gap to FFG Part II |
   | R07.6 (1523) | see Witness | misrouted | gap to FFG Part II |
   | GS0:Witt-geometry (1529) | GeometricSatakeAndFusion Layer GS0 Witt Schubert geometry | supplied | label by section |
   | GS0:loop-geometry (1535) | GS0 has v-sheaf local models only (README:212); canonical flat local models and same-field Schubert curves are GeometricSatakeAndFusionPartII LM.3 `canonical-abelian-model`, LM.5 `same-field-curve` (board main, lines 458, 832) | misrouted | gap to GeometricSatakeAndFusionPartII |
   | GS.6 (1541) | supplier is the board package GlobalShtukasAndFunctionFieldLanglands (not in the merge order); the README says GS.6 covers only projective curves | undeclared gap | declare `gap:` with that supplier |
   | HS2 (1547) | Layer HS2 is local shtuka spaces (README:936); no global canonical integral models | missing | R03 |
   | MC.6 (1553) | MotivesAndAlgebraicCycles Layer 6 tensor reconstruction | supplied | label |
   | M4 (1559) | PELModuli M4 (`normalizedModel`, level changes) and M6 | supplied | label |
   | RG2.0 (1565) | README: “an extension contract, not part of the point-topology scope” | missing | R03 |
   | RG2.1, RG2.3 (1571, 1577) | ReductiveGroupsPartII README:65, 78–85 exclude R-smooth tori, adjoint association, R-smooth central extensions, torsors under smooth models with connected special fibre | missing | R03 |
   | C7 (1583) | exists nowhere | missing | R02 |
   | D4 (1589) | ShimuraData Layer 4 covers preabelian and abelian type and connected lifts; the KPZ §7.2.3 refinement is requested | undeclared gap | declare a gap to ShimuraData §4 |
   | V4, V6, V8 (1595–1607) | ShimuraVarieties Layers 4 (§4.5), 6 (§§6.3–6.6), 8 (§8.1) | supplied | cite by section |
   | RG3.0–RG3.3 (not in the register; lines 866, 961, 1360, 1407, 1423, 1439) | the targets exist in the board package ReductiveGroupsPartIII (design on the board's main, lines 109–610), not in the merge order | undeclared gaps | declare gaps (see R04) |

2. **F02** (P1) The integral model itself is imported from ShimuraCompactificationsPartII, which exists nowhere

   **Location.** `README.md:31`: “The normalized Hodge interior itself is already planned at ShimuraCompactificationsPartII:C7/normalized-interior-model; Zarhin’s self-dual enlargement is C7/zarhin-self-dual-replacement.” Also line 47 (“The associated normal model S is the imported C7 normalization”), line 1583, and the prerequisites of seven targets.

   **Claim.** ShimuraCompactificationsPartII §C7 supplies the normalized Hodge model S, the Zarhin enlargement and the MP19 component specialization.

   **Witness.** ShimuraCompactifications at its open head stops at Layer C6 (README:3036). ShimuraCompactificationsPartII is absent from main and from the 330 open heads (`roadmaps grep`), from the board index and packages, and from TauCetiRoadmapJobs issue titles (search: 0).

   **Repair.** Own the normalized Hodge model as an SV2.0 definition: the normalization of the Zariski closure of Sh_K(G,X) in the Siegel model at K_p = G^fix(Z_p) (KZ line 1293–1294; KPZ line 3188–3189; HT line 760–762). Give it API and three Checks; one Check: for GSp₂ = GL₂ at hyperspecial level it is the smooth modular curve, so normalization changes nothing. Cite PadicDifferentialEquationsAndRigidCohomology §RD.5.116 (Zarhin's trick, README:12141) and state the lattice form used at KZ line 1761–1763 as a Check. For MP19 Corollary 4.1.11 (HT line 917), declare a gap to ShimuraCompactifications with this `needs`: “a normal Hodge-type model with locally integral special fibre has irreducible special fibre on each connected component.” Alternatively, own it here. Tested: no `ShimuraCompactificationsPartII` string remains, and integral-hodge-data's prerequisites name the new target.

3. **F03** (P1) Inputs on the endpoint path have no owner anywhere

   **Location.** `README.md:1547`: “Supply the general connected adjoint local-model torsor reduction of KPZ Corollary 7.2.24 … Owner: HeckeStacksAndLocalShtukasIntegralPartII.” Also lines 1487 (Noot), 1505, 1457, 1565, 1571, 1577 (“see the Part IV proposal”).

   **Claim.** The named owners exist: HeckeStacksAndLocalShtukasIntegralPartII, ReductiveGroupsPartIV, ArithmeticGaloisRepresentationsFrobeniusComparisonsPartII, AlgebraicModuliForArithmeticGeometryFiniteFieldCurvesPartII and CrystallineCohomologyIntegralFamiliesPartII.

   **Witness.** None occurs on main, in 330 open heads, in the board index, or in TauCetiRoadmapJobs titles (each search: 0). The first appears only as a “proposed-continuation” row (`packages/HeckeStacksAndLocalShtukasPartII/design/README.md:1463–1492`). KZ Proposition 4.3.2, on the endpoint path, uses Pappas–Rapoport canonical models (KZ line 1646–1648).

   **Repair.** First, own the Shimura-specific inputs here as targets, each with its hypotheses and locator:
   - canonical integral models and datum functoriality (KPZ Theorem 7.1.8 and Remark 7.1.9(b), KPZ line 3254–3274; KZ Proposition 4.3.2 and Corollary 4.3.4). Declare the local input, the integral local Shimura variety with its completion comparison, as a gap to HeckeStacksAndLocalShtukas §HS2;
   - the global crystalline tensor sections of HT Proposition 1.3.12 and Appendix A, or a precise gap to CrystallineCohomology;
   - Noot's Conj′ comparison (HT line 1102), or a gap to ArithmeticGaloisRepresentations Layer 6 that states it.

   Second, declare the generic inputs as gaps to existing roadmaps, or own them:
   - R-smooth tori, adjoint association, R-smooth central extensions, connected-fixer criteria and the compact-quotient Borel lemma: to ReductiveGroupsPartIII;
   - Poonen's Bertini with a rational point and the LMB rational presentation: to AlgebraicModuliForArithmeticGeometry.

   For strongly acceptable data, route SV2.3/adjoint-local-model-diagram through KZ Theorem 4.2.6(3) and Remark 4.2.7(2) (KZ line 1560–1580). There the fixer is connected by KZ Lemma 4.2.4, so KPZ line 3336–3337 applies, and SV2.6 no longer waits on DvHKZ. Tested: integral-datum-maps and all-prime-tate-comparison then cite only targets here or declared gaps with existing suppliers.

4. **F04** (P2) Two-way supply with ReductiveGroupsPartIII

   **Location.** `README.md:9`: “The existing RG3.5 abelian-variety application imports this geometric theorem; it is not a prerequisite.” RG3.0–RG3.3 are prerequisites at lines 866, 961, 1360, 1407, 1423, 1439.

   **Claim.** ReductiveGroupsPartIII is a supplier, and its RG3.5 is a downstream consumer.

   **Witness.** `packages/ReductiveGroupsPartIII/design/README.md:1109` (board main): “For RG3.5, Kisin–Zhou Theorem 5.1.4 is the common-class input …”. Its target `RG3.5/common-frobenius-class` (line 917) uses that theorem, while this roadmap consumes RG3.0–RG3.3.

   **Repair.** Break the cycle by moving ownership. Keep RG3.0–RG3.3 as suppliers, as declared gaps naming `RG3.0/conjugacy-quotient`, `RG3.0/character-separation`, `RG3.0/faithful-quotient-finite`, `RG3.1/degree-one-residue-descent`, `RG3.2/elliptic-maximal-torus` and `RG3.3/cyclic-torus-and-neatness` (all present at board lines 109–610). Record in Scope that the KZ §6 targets of RG3.5 (`auxiliary-hodge-embedding`, `common-frobenius-class` and their consumers, KZ Proposition 6.2.4 to Theorem 6.2.7) move to a roadmap after this one. A final layer here is the natural owner. Tested: with both roadmaps in the order, the gate shows no CYCLE line.

5. **F05** (P2) The dependency lines are invisible to the gate, which places the roadmap above two suppliers

   **Location.** Every target, for example `README.md:53` “**Direct prerequisites:** `ShimuraVarieties:V8`, …”, and layer headers such as line 761 “**Layer prerequisites:** … `BunGAndNewtonStrata:BG1` …”.

   **Claim.** The dependency check certifies the supply direction.

   **Witness.** The prescribed gate places the design “after AutomorphicBundles” (ORDER line 134). The same README with these labels rewritten as `*Needs:*` places it “after HeckeStacksAndLocalShtukas” (line 140). BunGAndNewtonStrata (139) and HeckeStacksAndLocalShtukas (140) are cited suppliers.

   **Repair.** Write each target's dependencies as a `*Needs:*` line, item by item. With that rewrite the gate reports `depcheck: 27 roadmaps, 237 edges, 0 problem(s)`, after HeckeStacksAndLocalShtukas (scratch test). It also stops silently dropping the three cited names that are not in the order (ShimuraCompactificationsPartII, ReductiveGroupsPartIII, GlobalShtukasAndFunctionFieldLanglands), once R01, R02 and R04 turn them into gaps.

6. **F06** (P2) Hypotheses stronger than the sources, and one hidden in an undefined term

   **Location.** `README.md:206–208` (adapted-branch-interface: “assume the embedding is very good”, plus the global “Corrected Hodge setup (KPZ 7.1.2)”). Also lines 322–324 (pro-dvr-property), 710–712 (abelian-integral-model), 728–730 (adjoint-local-model-diagram), and 1169/1185 (“special Hodge model”).

   **Claim.** These statements need the global setup (A)–(C), and for abelian type also (D) and (E); the ordinary lift needs only very-goodness.

   **Witness.** KZ line 1361: Proposition 4.1.9 assumes only that K^p is neat and the embedding is very good at y. KPZ line 3735: Theorem 7.2.21 assumes only p>2, abelian type and a parahoric. KZ line 1273 and line 1122: Theorems 3.4.5 and 4.1.11 assume that the fixer equals the parahoric.

   **Repair.**
   - adapted-branch-interface and tensor-separation: neat K^p and very-good at the point y. With global hypotheses, ordinary-very-good (line 1169: “even if the embedding has only been assumed good globally”) cannot feed ordinary-hodge-special-lift.
   - pro-dvr-property: only the Hodge-type normalization; its proof is HT Lemma 1.3.6 (HT line 764) with Néron–Ogg–Shafarevich.
   - abelian-integral-model and adjoint-local-model-diagram: drop the (A)–(E) block, which is the output of general-abelian-cover. Applied to an abelian-type G₂ such as (PGL₂, ℍ^±), which has no Hodge embedding, it is meaningless.
   - Define “special Hodge model” as G^fix = G° with a good embedding, or add G^fix = G° explicitly to ordinary-very-good and ordinary-hodge-special-lift.

7. **F07** (P2) Hypotheses that assume a theorem is available

   **Location.** `README.md:906`: “the special fibre is locally integral with the connected-component specialization theorem of MP19 Corollary 4.1.11 available”. Line 206: “the corrected tensor-display deformation theorem applies”. Line 710: “compared with the canonical model only when the canonical-uniqueness supplier hypotheses are verified”.

   **Claim.** These are hypotheses of the statements.

   **Witness.** “A theorem is available” constrains no object. For the modular curve the content is the condition each connected component of S_K⊗F̄_p is irreducible: true, and checkable. HT line 915–918 states exactly this local-integrality condition and proves irreducibility from it.

   **Repair.** In ordinary-density, state the condition on S (local integrality) and cite the irreducibility result as a supplier or gap (R02). In adapted-branch-interface, delete the clause and cite the FFG Part II versal theorem in its dependencies (R01). In abelian-integral-model, either state the comparison with the canonical model as a separate target with its hypotheses (KPZ Remark 7.1.9(b)) or delete the sentence.

8. **F08** (P2) Two owners for the very-good notion and for KZ 3.2.7, 3.3.2 and 3.4.5

   **Location.** `README.md:15` (definition of very-good, KZ §3.2.5). Line 224 (integral-crystalline-frames, KZ Proposition 3.3.2). Lines 206 and 211 (KZ 3.2.7 inside adapted-branch-interface). Line 1189 (KZ 3.4.5 inside ordinary-hodge-special-lift).

   **Claim.** These are statements this roadmap plans.

   **Witness.** Board main, `packages/FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII/design/README.md`: `very-good` (794, KPZ Definition 5.2.5); `versal-adapted` (1388, KZ 3.2.7); `crystalline-tensor-integrality` (1236, KZ 3.3.2(1)); `ordinary-adapted-lift` (1963, KZ 3.4.5).

   **Repair.** Cite those four FFG Part II targets as declared gaps (R01) and delete the restatements. Keep here only the Shimura specializations: the point-level comparison of KZ §4.1.7 (KZ line 1340–1355), the branch identification of KZ Proposition 4.1.9, and the global lift of KZ Theorem 4.1.11. Line 15's paragraph becomes a citation of the FFG Part II definition.

9. **F09** (P2) The ℓ-adic local system uses the dual of the tower's convention

   **Location.** `README.md:1324`: “At neat level it agrees with the tensor-frame torsor of the abelian H¹ realization”. Line 1336: “identifies L_ℓ with Isom_tensor(V_Qℓ,H¹_ét(A))”. Line 1373: “the standard H¹ polynomial has constant term q”.

   **Claim.** The tower's G(Q_ℓ)-local system is the frame torsor of H¹.

   **Witness.** KZ line 2077 sets L_ℓ = Isom(V_Qℓ, V_ℓ^∨) with V_ℓ = H¹ (KZ line 1864). PELModuli level structures are Isom(L/nL, A[n]) (README:273, 1651). For E/F₅ with trace 2, the tower gives γ = T²−(2/5)T+1/5; the README gives T²−2T+5.

   **Repair.** Adopt the tower convention: L_ℓ = tensor frames V_Qℓ → H₁ = V_ℓ(A). Then the geometric Frobenius in G(Q_ℓ) acts as on the Tate module, and for GL₂ it has constant term q⁻¹. State the H¹ version as its contragredient twisted by the multiplier, with the computed pair (2,5) ↔ (2/5,1/5) as a Check. Recompute ShimuraFrobeniusPoint.GLn/elliptic and ShimuraEtaleTensors.siegelMultiplier in that convention. Tell RG3.0/RG3.5, which use H¹ (board line 7), the same translation.

10. **F10** (P3) The README is not in TauCetiRoadmap form

   **Location.** `README.md:1` (title without “Roadmap:”), line 5 (“accompany this reader in the packet”), line 39 (“**Status:** planned; supplier contracts listed in the closure register remain open.”), lines 1611–1651, 1655, 1677 (“follows the 2026-10-12 shape”), 1693.

   **Claim.** This is the house README shape.

   **Witness.** The README has 407 field-label lines (Target, Planet, Construction/proof, Direct prerequisites, Consumers, API, Discriminating checks, Acceptance, Source, Status). It has no Summary, Exact supplier contracts, How to read the build, Examples, Dependencies or References. Its 143 API and Check bullets carry Lean names that no `Suggested.lean` will declare.

   **Repair.** Rewrite in the house shape: title and **Summary.**, Scope and ownership, Conventions, Exact supplier contracts (from R01–R04), How to read the build, Layers with `### k.n` prose targets, `**Checks.**`, `### Examples`, `### Dependencies`, Downstream consumers, References. Remove the Lean names from API bullets and Checks. Delete the process narrative (packet, closure register, Status lines, routed-identifier counts, read dates, “Independent review should collate”). Delete the ownership proposals for nine new roadmaps; record any deferral only in Scope.

11. **F11** (P3) Locators, labels, pins and the sources manifest

   **Location.** `README.md:25` (“Pins: Tau Ceti f790474…; Mathlib 082e2d37…”), 334, 1045, 1067, 1281, 1312, 1179, 1663, 1667, 1451.

   **Claim.** The locators and pins are exact.

   **Witness.** The content `lake-manifest.json` pins Tau Ceti a91d3aaf… and Mathlib 6b7abb3c…. HT line 764 has “Lemma 1.3.6”, not Proposition; HT line 1095 has “Corollary 2.1.9”, not Theorem. KZ line 1710 has “Corollary 4.3.4” and KZ line 2322 has “Corollary 5.2.7”.

   **Repair.** Correct the pins; the three baseline declarations exist at the true pins (Verified sound). Correct the four labels above, and cite KPZ Corollary 5.3.16 (KPZ line 2632) for ordinary-very-good: KZ line 1441 cites it under an earlier numbering. E6 should name KP Lemma 4.6.13 and Corollary 4.6.15 (KPZ line 3814), and say that (4.6.20) in Corollary 4.6.18 repeats the formula. E4 should name KP Theorem 4.2.7. Replace atlas labels by the suppliers' own sections: V4/V6/V8 are ShimuraVarieties Layers 4, 6, 8; D1/D4 are ShimuraData Layers 1 and 4; R09.x and R01.x are Layers x. The A4/A6 slugs are §§A4.1, A4.3, A4.8, A4.9, A6.14, A6.21, A6.28, A6.29. Complete authors, title and year for HT, KP, KPZ and K17 in `sources.toml`, and record the other cited works (PR24, PR26, DvHKZ, MP19, Chin, Noot, LMB, Poonen, Anschütz) or cite them only through suppliers.

12. **F12** (P3) Checks and conventions

   **Location.** `README.md:67` (`IntegralHodgeData.goodNotVeryGood`), 833 (`ShimuraNewtonStratum.kottwitz`), 832 (`emptyAllowed`), 192 (“A constant family has trivial geometric monodromy”), 923 (“I_x(Q)∩Aut(A_x), not I_x(Q_p)∩Aut(A_x)”), 616, 19.

   **Claim.** The Checks discriminate, and the conventions are pinned by computed examples.

   **Witness.** In B(G,{μ⁻¹}) the Kottwitz class is fixed (KZ line 434), so `kottwitz` never fires. Aut(A_x) ⊂ Aut_Q(A_x)(Q) gives I_x(Q_p)∩Aut = I_x(Q)∩Aut. For a constant ordinary elliptic family, ⟨D⟩ contains 1(−1), so H ⊇ G_m.

   **Repair.**
   - Replace `goodNotVeryGood` and `emptyAllowed`, which restate definitions, with computed instances.
   - Drop `kottwitz`, or use PGL₂ basic classes with κ = 0 and 1 outside B(G,μ).
   - Line 192: say geometric (Frobenius-forgetting) monodromy is trivial while the Tannakian group H of ⟨D⟩ contains the slope torus.
   - Delete “not I_x(Q_p)∩Aut”.
   - Pin, as computed Checks, the h/μ_h sign on H¹ (elliptic curve: μ_h acts by z⁻¹ on H^{1,0}; KZ line 2448 labels H¹ type (0,−1),(−1,0)) and the level transport γK^pγ⁻¹ (line 616).

13. **F13** (P3) The planned Lean file is padding and duplicates a pinned declaration

   **Location.** `README.md:1683`: “The light predicate `TauCetiRoadmap.ShimuraVarietiesPartII.HasMultiplier ψ g c` … Its three examples are `identityPlane`, `diagonalTwo`, and `unequalBlocks`”.

   **Claim.** These declarations belong in `Suggested.lean`.

   **Witness.** None of them makes a headline statable: every headline needs integral Shimura models, B(G) or Shimura local systems, none of which exist at the pins. Tau Ceti `TauCeti/LinearAlgebra/Matrix/SymplecticMultiplier.lean:76` `Matrix.transpose_mul_J_mul_eq_det_smul` already gives diag(2,1) multiplier 2 = det.

   **Repair.** Delete HasMultiplier, its four lemmas and its three examples from the plan; the README keeps the statements as Checks. Plan a `Suggested.lean` holding only the module docstring. It should name the headlines below as not statable and say what each lacks (an integral Shimura model or stack over O_E, B(G) with Newton strata, the conjugacy quotient evaluated on Shimura local systems): KZ Theorem 5.1.4, KPZ Theorem 7.2.21, KZ Theorem 4.4.6, KZ Corollary 4.4.13, HT Corollary 2.1.9, the density of the ordinary locus, and the same-field curves.

Reviewed on 2026-10-23. Thirteen findings: three P1, six P2, four P3 (nine blocking). There was no previous review. The design does not re-plan an existing roadmap: ShimuraVarieties (open head, Scope) lists integral and bad-prime models as downstream, so an integral-reduction Part II is in scope; the design is repairable. The design files were not changed. The package had no `sources.toml`; the sources service created it while fetching the five texts the README says it read (KZ, HT, KP, KPZ, K17). Every SHA-256 matches the README's record.

The worker's seeded sample listed field labels rather than targets. I resolved it deterministically as the k-th occurrence of each label in README order: “Source:” ×4 = the first four targets (lines 71, 101, 117, 147); “Additional hypotheses:” ×2 = lines 208, 258; “Target:” = line 45; “Acceptance:” ×4 = lines 69, 99, 115, 145; “Status:” = line 39; “Construction/proof” ×2 = lines 49, 79; plus E6. I also checked every item the author flagged for collation (E1–E9), the endpoint, and every other KZ, HT, KP, KPZ and K17 locator in the design (results under Verified sound).

## Verified sound

### Principles

There is no re-planned roadmap: ShimuraVarieties defers integral models, and FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII (realization-tensor-interface, line 1748) leaves the global Hodge tensors to “the Shimura integral-model owner”. I found no computational algorithm. No copied passage was found in the sampled statements, which I compared with the five texts; they are paraphrases. There is no `set_option` and no sorry'd data, because there is no Lean file. The supply direction is checked under R04/R05; route-specificity: the abelian-type construction is general and the endpoint is the source's theorem.

### Seeded sample and locators (counts)

- KZ: 31 locators opened. All match the text except the two Corollary labels (R11). Definition 4.2.2 (KZ line 1481–1490) matches the README's definition at line 364. Theorem 5.1.4 (KZ line 2104–2106) matches the endpoint; uniqueness is automatic because Conj_G(Q) injects into Conj_G(Q_ℓ). §5.3.6 (KZ line 2429–2439) is the Steinberg plus Chebotarev descent the design describes.
- HT: 15 opened, with two label errors (R11). Proposition 1.3.7 (HT line 774–777) is lift-independence at a point of the normalization, as the design scopes it. §2.1.1 states that the transition maps are finite étale (HT line 950).
- KPZ: 22 opened, all correct up to one-page drift (7.1.10 starts on p.75; 7.2.10 on p.79). The 7.1.2 setup (A)–(C) matches the “Corrected Hodge setup” sampled at lines 208 and 258 (KPZ line 3177–3180). Theorem 7.1.3(1)–(3), 7.1.8, 7.1.11, 7.1.14, 7.2.10, 7.2.16, 7.2.19, 7.2.21 and 7.2.24 match.
- KP: 10 opened (pp.189–205 mapped from page headers), all correct.
- K17: §2.1.2 is on p.29 and Corollary 2.1.7 on p.31 (K17 lines 1281, 1381).
- Sampled SV2.0 items (sources, acceptances, construction steps, Status): sources correct (KZ line 1257–1340, 1228–1303; HT line 940–968); the acceptances and steps agree with KZ §4.1 and KPZ Remark 7.1.4. The Status line is process text (R10).
- E1 (KZ line 1503 vs 1519, 1795): a misprint, confirmed. E2 (KZ line 2094–2096): confirmed; SL₂(ℝ) rotations by ±θ have trace 2cosθ, and any conjugator anticommutes with J, so det < 0. E3 (HT line 869–870): confirmed. E4 and E5 (KPZ line 3783–3813): confirmed. E6 (KPZ line 3814–3847): confirmed, locator imprecise. E7: the KPZ text (line 3849–3854) is confirmed; P23 not read. E8 (KPZ line 3207–3209; KZ line 1019–1021): confirmed. E9 (HT line 909–914; KZ line 437–443): confirmed. For the quaternion unit group, a putative ordinary point (0,−1) transfers to GL₂ slopes (½,−½), each once, which is impossible.

### Adversarial table

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Conv.: H¹ types, μ_h | E/ℂ | μ_h(z) acts on H^{1,0} by z⁻¹, on H^{0,1} by 1; μ_h⁻¹ weights (1,0), Fil¹=H^{1,0}; KZ line 986 weights (0,1) agree | consistent | add the Check (R12) |
| Conv.: multiplier q | E/F₅, a=2 | Frob on H¹: T²−2T+5; Q_ℓ(−1) has Frob 5, so the multiplier is 5 | holds | none |
| Conv.: Newton via μ_h⁻¹ | ordinary, supersingular E | D(Q_p/Z_p): F=σ; D(μ_{p^∞}): F=pσ; ν=(1,0)=μ⁻¹⋄, κ=1; ss ν=(½,½)≤(1,0), κ=1 | holds | none |
| Conv.: Frobenius norm | G_m over F₂₅, δ=Teichmüller ζ of order 24 | δσ(δ)=ζ⁶ ≠ δ²=ζ² | “never δ^r” correct | none |
| Conv.: Conj(G)(F) | SL₂(ℝ), θ=π/2 | both rotations give trace 0; any conjugator has det<0 | E2 correct | none |
| Conv.: residue extension | E/F₅, a=2 → F₂₅ | (a,q)=(2,5) → (a²−2q,q²)=(−6,25) | different points | none |
| Conv.: L_ℓ duality | E/F₅, a=2 | tower: (2/5,1/5); README: (2,5) | mismatch | R09 |
| Conv.: G^fix vs G° | KZ line 1265–1266, KPZ line 3174, 3290 | KZ: tilde=fixer, script=parahoric; KPZ: script=fixer, script°=parahoric | translation correct | none |
| SV2.0 integral-hodge-data | GL₂ hyperspecial; GL₂ Iwahori | closure is smooth Y(N), normalization identity; GL₂ facets have connected fixers (π₁ torsion-free) | holds | Check goodNotVeryGood (R12) |
| integral-shimura-stack | GL₂(Ẑ^p) ⊃ Γ(3) | [Y(3)/GL₂(F₃)]; [−1] lies in the inertia of every point | holds | none |
| prime-to-p-tower | Y(9)→Y(3), p∤3 | degree #ker(GL₂(Z/9)→GL₂(Z/3)) = 3⁴ = 81, finite étale | holds | none |
| etale-tensors | E₁×E₂ | e₁ is fixed by diag, moved by swap [[0,1],[1,0]] | Check correct | convention R09 |
| lift-independent-crystalline-tensors | canonical vs other lift of ordinary E | the only tensor is the polarization: equal | holds | none |
| global-crystalline-realization | constant ordinary family | ⟨D⟩∋1(−1), H⊇G_m; convergent monodromy trivial | ambiguous acceptance | R12 |
| adapted-branch-interface | good, ordinary-smooth point | KZ needs very-good at y; README needs global (A)–(C) | over-strong | R06 |
| integral-crystalline-frames | ordinary E, Z_p-lift | KZ 3.3.2 needs no very-goodness; integrality holds | holds; duplicate | R08 |
| tensor-separation | x≠x′ with the same Siegel image | KZ 4.1.9(3): equal tensors iff x=x′ | holds | hypotheses R06 |
| de-rham-frame-diagram | GL₂ hyperspecial | dim S̃=1+4=5, P¹ dim 1, rel. dim q=4=dim G | holds | none |
| same-field-henselizations | G^fix ≠ G° | KPZ 7.1.3(3) needs G=G°, as stated | holds | none |
| weaker-strict-comparison | GL₂, Γ₀(p) chain | strict henselization iso, no very-good needed (KPZ line 3251–3253) | holds | none |
| pro-dvr-property | E/Q_p with full prime-to-p level | Galois trivial on T^p ⇒ unramified ⇒ good reduction (NOS) | holds without (B)/(C) | R06 |
| special-fibre-geometry | GL₂ hyperspecial; Γ₀(p) | P¹_F_p integral; two P¹ crossing, not integral | holds | none |
| SV2.2 strongly-acceptable-triple | GU(1,1), p split; GSp_{2g} | Z^c=U(1)≅G_m over Q_p, induced, G^der=SL₂; GSp: Z^c=μ₂, not a torus | Checks correct | none |
| reflex-splitting-cover | G₂ Siegel, E₂=Q | condition vacuous, E′=E | holds | none |
| nonexceptional-cover | G₂^ad=PGL₂ | NE; KPZ 7.2.10(1)–(4) | holds (R-smooth via KPZ 7.2.5, 7.2.11) | none |
| exceptional-cover | PGL₁(D), deg D=3, p=3 | torsion-freeness not promised (KPZ line 3596) | holds | none |
| general-abelian-cover | same | KPZ line 3682–3683 restriction retained | holds | none |
| strong-auxiliary-cover | GU(1,1) | X_*(G^ab)_I torsion-free (KZ Lemma 4.2.4); E1 applied | holds | none |
| SV2.3 integral-component-groups | torus T=G_m | A°=1; A=A_f^{p,×}/closure(Z_(p)^×)≠1 | Check correct | none |
| reflex-units | GL₂, E=Q | det∘μ⁻¹(u)=u^{±1} ∈ Z_p^× = det K_p | trivial, as KP 4.3.2 says | none |
| connected-normalization-cover | GL₂ (G^fix=G°) | the cover is the identity | holds | none |
| adjoint-twisting-action | γ lifting to G(Z_(p))₊ | twist trivial (KP 4.5.7) | holds | pin γK^pγ⁻¹ (R12) |
| component-galois-extension | identity cover | kernel A_int° (KP 4.6.6) | holds | none |
| conjugate-level-gluing | GL₂, I Iwahori, j=diag(p,1) | jIj⁻¹ ∋ [[a,pb],[c/p,d]] ≠ I | dichotomy real | none |
| free-descent-kernel | any | Δ need not be finite (KP (4.6.20) remark) | holds | none |
| abelian-integral-model | (PGL₂, ℍ^±) | KPZ 7.2.21 needs only p>2; README's (A)–(E) is about a nonexistent Hodge embedding | over-strong | R06 |
| adjoint-local-model-diagram | strongly acceptable | G̃=𝒢 ⇒ 𝒢^{ad,◦}-torsor without DvHKZ | alternative route | R03 |
| SV2.4 point-newton-class | ordinary/ss E | b ↦ g⁻¹bσ(g) (HT line 813–815); (1,0) / (½,½) | holds | none |
| newton-admissibility | GL₂ | κ=v(det b)=1=κ(μ⁻¹) both classes | holds | none |
| newton-strata | modular curve | partition {ord, ss} | holds | Check R12 |
| newton-semicontinuity | modular curve | closure(S_ord)=S ⊇ S_ss; (½,½)≼(1,0) | direction correct | cite RD.3.43 (R01) |
| special-reduction-nonempty | GL₂ basic | ss points exist; place v′ must be induced by i_p | holds; HT gap | none |
| ordinary-locus | D^×, GL₂ | D^×: no μ-ordinary class (E9); GL₂: p-rank 1 | holds | none |
| ordinary-density | modular curve | ss points finite, ordinary dense | holds | R07 |
| tensor-isogeny-group | supersingular E/F̄_p | I=B^×, B ramified at {p,∞}; I(ℝ)/ℝ^× ≅ SO(3) compact | holds | prose R12 |
| isogeny-realizations | δ=[[0,−1],[5,0]] over F₅ | δ²=−5; centralizer Q₅(√−5)^×; J=D^×; over F₂₅ F²=−5 scalar, group D^× | Check correct | none |
| rosati-reductivity | ordinary CM by K | I=K^×, I(ℝ)/ℝ^×=S¹ compact | holds | none |
| hecke-orbit-tensor-injectivity | — | matches HT Lemma 2.1.4 (HT line 989–991) | holds | none |
| auxiliary-prime-rank | ss / ordinary E | rank B^× = 2 = rank GL₂; K^× rank 2 | holds | none |
| all-prime-tate-comparison | ordinary E | I_ℓ = torus (regular Frobenius), dim 2 = dim K^×⊗Q_ℓ | holds; Noot unowned | R03 |
| SV2.5 integral-datum-maps | f=id | trivial; KZ uses PR canonical models | holds; owner missing | R03 |
| matched-multiplier-datum | diag(2,1) ⊕ diag(3,1) | ψ₁ scaled 2, ψ₂ scaled 3: no common c | Check correct | Lean plan R13 |
| matched-integral-comparison | — | KZ Lemma 4.3.8: X_*(G₃^ab)_I torsion-free (KZ line 1785–1797) | holds | none |
| arbitrary-siegel-map | self-dual V₂ by Zarhin | KZ 4.3.6 | holds | none |
| product-abelian-comparison | — | A₃ ≅ j₁*A₁ × j₂*A₂ (KZ line 1966) | holds | none |
| isogeny-group-exact-sequences | G₁=G₃ | C₁=1, I_{x₃} ≅ I_{x₁} | holds | none |
| ordinary-very-good | GL₂ ordinary | smooth point; KPZ Corollary 5.3.16: good + smooth ⇒ very good at x | holds | locator R11 |
| ordinary-hodge-special-lift | disconnected fixer | KZ §3.4 needs 𝒢=G̃ (KZ line 1122) | missing hypothesis | R06 |
| ordinary-strong-special-lift | — | KZ 4.4.6 and §4.4.11 | holds | none |
| ordinary-rational-frobenius | ss E/F_p, p≡3 mod 4 | γ₀ with γ₀²=−p, eigenvalues ±i√p: elliptic in GL₂(ℝ) | holds | none |
| SV2.6 kr-stratification | GL₂ hyperspecial | Adm={t_μ}: one stratum; ordinary and ss both occur | Check correct | none |
| rational-local-model-lift | connected vs Z/2 | H¹(F_q, conn.)=0; H¹(F_q, Z/2)=Z/2 | holds | none |
| same-field-curves | λ≠μ | KZ Corollary 5.2.7; top stratum via ordinary curve (KZ line 2411–2418) | holds | label R11 |
| SV2.7 intrinsic-tower-local-system | E/F₅, a=2 | (2/5,1/5) vs (2,5) | convention wrong | R09 |
| frobenius-quotient-point | GL_n; E/F₅ | Conj(GL_n)=A^{n−1}×G_m; constant term is 1/q in the tower convention | Check depends on R09 | R09 |
| representation-unit-eigenvalues | Sym² of E/F₅, a=2 | eigenvalues (1±2i)², 5: units away from 5 | holds (stronger than KZ's ℓ-units, justified) | none |
| representationwise-independence | — | KZ 5.3.5: Chin and Chebotarev on curves | holds | GS.6 gap R01 |
| algebraic-common-class | SO(4) | rotations (θ₁,θ₂) and (θ₁,−θ₂): same char. poly, distinct SO(4)-classes | Acceptance correct | none |
| common-frobenius-class | F′/Q Galois | Gal(F′/F) meets every class ⇒ F=Q (Jordan) | holds | none |

### Library declarations at the true pins

- Tau Ceti a91d3aaf: `TauCeti.AlgebraicGeometry.AbelianVariety` (`TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95`; proper, geometrically integral group object; no polarization or dual); `TauCeti.AlgebraicGeometry.AbelianVariety.End` (`…/End/Basic.lean:83`, `Additive (A ⟶ A)`); `Matrix.transpose_mul_J_mul_eq_det_smul` (`TauCeti/LinearAlgebra/Matrix/SymplecticMultiplier.lean:76`, rank two only); `TauCeti.HopfAlgebra.conjugationAlgHom` (`TauCeti/Algebra/AlgebraicGroup/Hopf/Conjugation.lean:68`), which ReductiveGroupsPartIII consumes.
- Mathlib 6b7abb3c: `WittVector.Isocrystal` (`Mathlib/RingTheory/WittVector/Isocrystal.lean:113`, under `[IsDomain k] [CharP k p] [PerfectRing k p]`; pointwise only); `Matrix.symplecticGroup` (`Mathlib/LinearAlgebra/SymplecticGroup.lean:101`).
- Absent at the pins (by grep): Shimura data, p-divisible groups, Dieudonné modules, buildings, parahorics, Kottwitz maps, GSp. The design's “no integral Shimura or tensor-family carrier” is correct.

### Cross-roadmap citations resolved (at the open heads; board packages at the board's main)

- Resolved as supplied: ShimuraVarieties Layers 4, 6, 8; PELModuli M4, M6; AbelianSchemesAndArithmeticModuli §§A4.1, A4.3, A4.8, A4.9, A6.14, A6.21, A6.28, A6.29; BunGAndNewtonStrata anchors `g-isocrystals-and-B-of-G`, `families-of-g-isocrystals`, `finite-frobenius-norm-centralizer`, `admissible-pair`, `ordinary-class`, `ordinary-derived-isogeny`, `ordinary-integral-conjugacy`, `rational-newton-witness`, `torus-special-pair`; AutomorphicBundles §§B2.4–B2.7; MotivesAndAlgebraicCycles Layer 6; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2; ArithmeticGaloisRepresentations Layer 5; GeometricSatakeAndFusion GS0 (Witt geometry).
- Misrouted or missing: see the R01 table.
- Board packages read: ReductiveGroupsPartIII (all six cited RG3 slugs exist), FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII, GeometricSatakeAndFusionPartII, HeckeStacksAndLocalShtukasPartII, GlobalShtukasAndFunctionFieldLanglandsPartII, AlgebraicModuliForArithmeticGeometryPartII.

### Duplication audit

- Duplicated: the very-good definition and KZ 3.2.7, 3.3.2 and 3.4.5 (R08).
- Not duplicated:
  - Hodge-type Newton strata extend IgusaVarietiesAndTorsionConcentration's PEL hyperspecial strata (IG.0, IG.2). The design may add their agreement as a Check.
  - Conj(G) is imported from ReductiveGroupsPartIII.
  - The canonical models of ShimuraVarieties are imported (V8).
  - Abelian-type canonical-model descent (ShimuraVarieties §6.7) is generic-fibre; SV2.3 is integral.
- Ownership against open work was checked with `roadmaps grep` over all 330 open heads and main, and in the board packages, by object (integral canonical models, very-good, Newton strata, Conj quotient, Bertini, Grothendieck–Katz, R-smooth, Zarhin).

### Gate

With the prescribed command on the design README (exit 0):

```text
candidate: ShimuraVarietiesPartII is not in the merge order yet; checked as if placed after AutomorphicBundles (the intake inserts it when its design is accepted)
depcheck: 27 roadmaps, 224 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line, but the result is a false negative (R05). The placement is above two cited suppliers, BunGAndNewtonStrata and HeckeStacksAndLocalShtukas, and the three cited roadmaps outside the order are ignored. A scratch copy with the prerequisite labels rewritten as `*Needs:*` gives `checked as if placed after HeckeStacksAndLocalShtukas … depcheck: 27 roadmaps, 237 edges, 0 problem(s)`.

### Shape and Lean

There are 61 targets: 6 definitions, 18 constructions, 37 theorems. Every definition and construction has three API bullets and three Checks; every theorem has a locator. The shape is wrong (R10). There is no `Suggested.lean` at this stage. Lean elaboration: not available (this lane does not elaborate). The `#check @name` binder audit and the one-tactic padding probe could not be run. Padding was decided by reading the planned declarations against the pins (R13).

## Not verifiable

- The Annals text of KZ and the Duke text of HT: paywalled. The README cites arXiv v2 and the author copy, which I read; the version-scoped errata are not attributed to the journal texts.
- PR24, PR26, DvHKZ, MP19, P23, Chin 2004, Noot 2009, LMB, Poonen 2004 and Anschütz 2022 were not fetched. They are route inputs that R01–R03 send to suppliers, not statement sources of this design; E7's claim about P23 rests on KPZ §7.3.2 only.
- The board heads of GlobalShtukasAndFunctionFieldLanglands and CrystallineCohomologyPartII were not read; their pull-request heads are not in the local board checkout, and the REST quota is shared. The GS.6 verdict relies on the README's own statement (line 1541). Whether CrystallineCohomologyPartII owns HT Appendix A is unchecked; the fix worker must check it before routing CR.7.
- KZ cites KPZ by arXiv-era numbers (for example Proposition 7.2.14 and Corollary 4.3.9); I matched them to the published statements by content (Lemma 7.2.14 vs Proposition 7.2.19; Corollary 5.3.16), not by an arXiv copy.

## Source issues

- **Misprint** in KZ at Proposition 4.2.3(5), p.34: the source says the inertia coinvariants of the cocharacter group of G^ab are torsion; it should be torsion-free, as Lemma 4.2.4 and p.41 use; affects nothing.
- **Misprint** in KZ at §3.2.5, p.23: the source forms the first-order ideal from the maximal ideal and uniformizer multiples in A_E, just after introducing the maximal ideal of A_G̃; it should use A_G̃ throughout; affects nothing.
- **Error** in KZ at §5.1.3, p.47: the source says rational points of the conjugacy quotient are the semisimple rational conjugacy classes over any characteristic-zero field; it should say geometric points classify geometric classes, and rational points are Galois-stable geometric classes; affects nothing.
- **Error** in HT at the proof of Corollary 1.3.13, p.19: the source says the category generated by the isocrystal is equivalent to representations of the full tensor stabilizer; it should use the generated category's own group H ⊂ G and restriction from G; affects the proof.
- **Gap** in HT at §1.3.15, p.20: the source asserts a unique μ-ordinary class in the acceptable set with no existence hypothesis; it should assume existence, which holds for quasi-split groups and fails for the quaternion unit group; affects a stated result.
- **Gap** in HT at the proof of Proposition 1.3.10, p.18: the source fixes any place of the torus reflex field above v; it should take the place induced by the fixed p-adic embedding, so that Lemma 1.3.9 applies to the torus; affects the proof.
- **Gap** in KP at Theorem 4.2.7, p.186 (with §3.2): the source omits the very-good condition needed for the tensor-compatible local model diagram; it should assume a very-good embedding; affects a stated result; corrected in print at KPZ Remark 7.1.4(1), p.73.
- **Error** in KP at the proof of Theorem 4.2.7, p.186: the source calls the frame-to-filtration map a torsor; it should be the smooth action morphism; affects the proof; corrected in print at KPZ §7.3.1(1), p.85.
- **Gap** in KP at the proof of Lemma 3.1.17, p.169: the source deduces a limit from convergence in a non-complete τ-topology; it should prove p-adic completeness and logarithmic tail convergence; affects the proof; corrected in print at KPZ §7.3.1(2), p.86.
- **Error** in KP at Lemma 4.6.13 and Corollary 4.6.15, pp.202–203 (repeated in (4.6.20), p.205): the source uses one p-level connected component for every coset representative j; it should use the component at level jK°_pj⁻¹; affects a stated result; corrected in print at KPZ §7.3.1(3), pp.86–87.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "57dc0a4", "job": "REV-DESIGN-ShimuraVarietiesPartII", "model": "opus", "worker": "fable-rev13"} -->
