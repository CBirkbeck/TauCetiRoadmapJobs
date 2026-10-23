<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/252#issuecomment-6363123444 -->
Review (claude) of 948c94c

Verdict: needs_changes

1. **F01** (P1) The seven supplier gaps are unowned and not declared where the intake reads them

   **Location:** `packages/CompletedCohomologyAndLocalGlobalCompatibilityPartII/design/plan.json:1963` (`gaps`; entries at lines 1965–2021 have only `title`, `detail`, `neededBy`). Also `design/README.md:560–572` (G1–G7). For example, line 560: “their proofs and formal interfaces belong to the proposed local-ring components/normality extension. R08.1 does not yet supply them.”

   **Claim:** G1–G7 are supplier contracts that the board can announce.

   **Witness:** No gap has `slug`, `supplier`, `section` or `needs`, so the intake reads every gap as `gap:?` with supplier `none`. G1 and G3 name "proposed" owners with no board job and no roadmap (R13). G7 asks nothing of anyone.

   **Exact repair:** Give each gap in plan.json `gaps` a slug, a supplier roadmap, a section and a one-sentence `needs`. Mirror each in the README under `## Exact supplier contracts` as `What <Supplier> must provide (gap:<slug>): …`. Per gap:

   - **G1** becomes `gap:framed-ring-components`, supplier LocalGaloisDeformationRings §1.1 (owner of R□; its README line 1293). Needs: R□_ρ̄ is reduced, O-flat and equidimensional. After a finite coefficient extension, its minimal primes are the components R□,χ for χ: μ_{p∞}(F)→O×, each a geometrically integral normal domain (BIP Corollaries 4.19, 4.21–4.22, pp. 39–40).
   - **G3** goes to SmoothRepresentationsOfLocalGroups §SR.5.2, which already owns simple strata, simple characters and maximal distinguished cuspidal types (its README line 3764). This contradicts README line 31. Split G3 into one slug per object:
     - the K-type σ(τ) of CEGGPS Theorem 3.7, with N=0 recognition and coefficient descent;
     - the EP §3.3 family V_χ with Proposition 3.7;
     - the EP §3.4 family V(α,θ) with Proposition 3.19.
   - **G4 and G5:** keep only the parts R06 shows are still missing, one slug each.
   - **G2 and G6:** delete (R06, R04).
   - **G7:** delete. The parent's globalisation inputs are its own §5.1 contracts, and the Emerton–Gee input is handled in R03.

   Tested on G1: BIP Corollaries 4.19–4.22 are exactly what PD.1/patched-components and PD.3/local-faithfulness consume.

2. **F02** (P2) Four suppliers exist only as unbuilt package jobs, yet the design consumes them as available

   **Location:** `design/README.md`:
   - line 82 cites `PotentialAutomorphyInfrastructurePartII:PL.1`;
   - line 17 cites `LocallyAnalyticDistributionsPartII:ND.6/banach-iwasawa-duality`;
   - lines 202, 216, 286 and 583–584 cite `LocallyAnalyticRepresentationsOfLocalGroups:LR.0` and `LR.1`;
   - lines 29, 433, 447 and 585 cite `TriangulineVarietyAndItsLocalModel:G/refined-crystalline-space`.

   **Claim:** These sections can be imported now, like those of any earlier supplier.

   **Witness:** Each is an available board package job (#473, #500, #499, #448), and its design on the board's main contains the cited node. None has a roadmap README, an open head, a merge-order line or a package-index entry.

   **Why P2, not P1:** every cited node exists in its roadmap's board design, so the design cites nothing that does not exist. The defect is that it consumes four unbuilt suppliers without contracts.

   **Exact repair:**

   - **(a)** Every reliance that stays on one of these four becomes a declared gap (R01): a slug, the supplier and its section, and a one-sentence `needs`. Record each in plan.json `gaps` and under `## Exact supplier contracts`.
   - **(b)** While any such gap remains, this roadmap cannot be packaged or ported before that supplier is. State this ordering for the intake.

   I recommend removing four of the five reliances by repointing them to existing earlier owners:

   | Reliance | Existing earlier owner |
   | --- | --- |
   | ND.6/banach-iwasawa-duality (ST Theorem 3.5) | CompletedCohomologyPartII F.1 (its README line 180) |
   | LR.1, density of analytic vectors. Line 583 says LR.1 lacks it; that design's own LR.2/admissible-banach-analytic-vectors states it (ST03 Theorem 7.1). | PadicLocalLanglandsForGL2Qp §0.1 (line 228); CompletedCohomologyPartII F.4 for the definition (line 233) |
   | PL.1, the potential-diagonalizability predicate | ModularityAndLanglandsExtensions §2.1 (line 823) |
   | G/refined-crystalline-space | Parent §5.2a; this also deletes PD.5/benign-points and PD.5/benign-open (R04) |

   That leaves LR.0: continuous finite-index induction and its Frobenius adjunction for finite-dimensional continuous H-representations. Either make it a small PD.2 target here (the smooth case is SmoothRepresentationsOfLocalGroups §SR.2.1), or declare `gap:continuous-finite-index-induction` with supplier LocallyAnalyticRepresentationsOfLocalGroups, Layer LR.0, and accept the ordering in (b).

   Tested: after these repoints, every remaining supplier is on main or earlier in ORDER. ModularityAndLanglandsExtensions then produces a `moved:` line in the gate, not an UPWARD one.

3. **F03** (P1) The Emerton–Gee lift theorem is an unowned prerequisite of every density theorem

   **Location:** `design/README.md:84`: “retain Emerton–Gee as the authorized source-bound input”. Also lines 74 and 578.

   **Claim:** PD.0/unconditional-patching-input may rest on EG Theorem 1.2.2 as an external citation.

   **Witness:** The parent's §5.1 (its README line 1705) keeps the potentially diagonalisable regular lift as a hypothesis. `roadmaps grep` finds no roadmap that states EG Theorem 1.2.2 or Theorem 6.4.4. A citation is not a supplier.

   **Exact repair:** Declare `gap:pd-crystalline-lift`, supplier ModularityAndLanglandsExtensions §2.1 (owner of potential diagonalizability and its criteria). Needs: for every finite F/ℚ_p and continuous ρ̄: G_F→GL_d(k), after a finite coefficient extension, ρ̄ has a crystalline lift of regular labelled Hodge–Tate weights that is potentially diagonalizable (EG Theorem 1.2.2, p. 3; Theorem 6.4.4(1), pp. 168–169). PD.0/unconditional-patching-input then cites this gap.

   Tested: EG Theorem 6.4.4(1) (EG line 6961) is exactly the hypothesis of the parent's §5.1.

4. **F04** (P2) PD.5 re-plans the parent's benign-point theory (blocking: re-planned roadmap)

   **Location:** `design/README.md:406–447` (`PD.5/benign-points`, `PD.5/benign-open`) and gap G6 at line 570.

   **Claim:** Benign points and their open dense locus are new here, and the Nakamura chart interface has to be requested from a supplier.

   **Witness:** Parent §5.2a (its README line 1802) already does both. It defines benign points by the same three conditions. It proves that every component of (Spf R∞^h)^rig has a nonempty Zariski-open benign locus (EP Definition 6.8, Proposition 6.9).

   **Exact repair:** Delete both targets and G6. Cite parent §5.2a ("Benign points and tangent spanning") under the supplier contracts. PD.5/benign-density keeps its statement and cites parent §5.2a together with PD.4/density-from-testing.

   Tested: the parent's paragraph covers every component of each fixed-weight crystalline quotient, which is exactly the input the benign-density argument uses.

5. **F05** (P2) Supplier citations use explorer node ids that are not sections of the cited roadmaps

   **Location:** `design/README.md:23–29` and every "Direct inputs" line (for example lines 68, 102 and 320). The node-id prefixes are `…:R31.5/`, `PadicHodgeTheory:R06.2/`, `LocalGaloisDeformationRings:R08.1/R08.3`, `DeformationAndDerivedPatchingAlgebra:R03.1/R03.4`, `CompletedCohomologyPartII:CC.3/` and `EndoscopicTransferAndUnitaryTraceComparison:ET.6/`.

   **Claim:** These sections supply the named objects.

   **Witness:** None of the labels R31.5, R06.2, R08.x, R03.x or CC.3 occurs in the cited READMEs at their heads. Layer 6 of EndoscopicTransferAndUnitaryTraceComparison (its line 1935) is the stable and twisted unitary trace comparison, not the local Langlands correspondence.

   **Exact repair:** Cite every supplier as "Roadmap §n.m", never by node id:

   | Cited node | Repoint to (README line) |
   | --- | --- |
   | R31.5/ceggps-patched-module | Parent §5.1 (1698) |
   | R31.5/type-specialised-patched-modules | Parent §5.2 (1753) |
   | R31.5/patched-support-is-a-union-of-components | Parent §5.3 (1812) |
   | R06.2 (both nodes) | PadicHodgeTheory §3.6 (739); its line 749 already carries the corrected BIP Lemma 6.5 |
   | R08.1/local-lifting-ring | LocalGaloisDeformationRings §1.1 (1293) |
   | R08.1/rank-one-ring | LocalGaloisDeformationRings §1.19 (1603) |
   | R08.3/pst-deformation-ring | LocalGaloisDeformationRings §3.4 (2415) |
   | pcris-generic-smooth | LocalGaloisDeformationRings §3.9 (2529) |
   | R03.1 | DeformationAndDerivedPatchingAlgebra §1.12 (276) |
   | R03.4 | DeformationAndDerivedPatchingAlgebra §4.6 (979) |
   | CC.3/qualified-biduality | CompletedCohomologyPartII §3.2 (833) |
   | ET.6 (both nodes) | EndoscopicTransferAndUnitaryTraceComparison §§10.21, 10.26, 10.30 (3873, 3985, 4068) |
   | PadicMeasuresIwasawaAlgebras:L1 | That roadmap's Layer 1 (main, line 567) |

   Also add the missing needs of PD.0/local-point-sets: the potentially semistable and Weil–Deligne functors (PadicHodgeTheory §§3.3–3.5; LocalGaloisDeformationRings §3.1).

6. **F06** (P2) Several gaps ask for what earlier roadmaps already provide, and three are compound

   **Location:** `design/README.md:562` (G2), 566 (G4), 568 (G5), and the requests at lines 577, 580 and 583.

   **Claim:** No earlier owner supplies rational GL_d representations over L, density of analytic vectors, or the Jacobson and component-pair interfaces.

   **Witness:** ReductiveGroups (main) lines 474 and 1775–1781 give char-0 complete reducibility and the classification of rational simples by X⁺. PadicLocalLanglandsForGL2Qp line 228 covers analytic-vector density. DeformationAndDerivedPatchingAlgebra lines 934, 983 and 996 cover the Jacobson and component interfaces.

   **Exact repair:**

   - **G2:** delete. Cite ReductiveGroups Layers 6 and 10B for (Res_{F/ℚ_p}GL_d)_L, which is split over L. The one missing fact is an irreducible representation with any prescribed algebraic central character, using highest weight (n_σ,0,…,0) at σ. State it as an API bullet of PD.2/fixed-centre-projective-detection.
   - **G4:** drop the analytic-vector request (PadicLocalLanglandsForGL2Qp §0.1) and the Banach–Iwasawa request (CompletedCohomologyPartII F.1). Keep one slug: every projective pseudo-compact O[[H]]-module, and every projective of the fixed-central-character category, is a product of indecomposable summands of the corresponding regular module.
   - **G5:** drop three requests that are already provided:
     - the Jacobson generic fibre (DeformationAndDerivedPatchingAlgebra §4.4);
     - detection of reduced O-flat quotients by integral points (§4.7);
     - component pairs under geometric integrality (§4.6; LocalGaloisDeformationRings F.0.1, line 127).

     Keep two separate slugs on DeformationAndDerivedPatchingAlgebra §4.6:
     - reducedness and equidimensionality of completed tensor products of geometrically reduced O-flat factors;
     - a finite coefficient extension that makes every minimal-prime quotient geometrically integral.

   Tested on G2: for d=2, the standard representation has central exponent 1 and is covered by ReductiveGroups §10B.

7. **F07** (P2) The pinned-library comparison misstates the pins and what Tau Ceti has

   **Location:** `design/README.md:609`: “The baseline is Mathlib `082e2d37…` and Tau Ceti `f790474…`” and “Neither tree contains these compact Iwasawa-module … constructions”. Also lines 582 and 623.

   **Claim:** Compact O[[H]]-modules and completed group rings are missing at the pins.

   **Witness:** The content repository pins Mathlib 6b7abb3c and Tau Ceti a91d3aaf. At that Tau Ceti commit, `TauCeti.completedGroupAlgebra` (`TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean:145`) and `TauCeti.IsCompactModule.completedGroupAlgebraModule` (`…/CompletedGroupAlgebra/Module.lean:344`) exist. Together they make a compact module with a continuous Γ-action into an R[[Γ]]-module.

   **Exact repair:**

   - State the actual pins.
   - Under `From Tau Ceti`, cite both declarations as the carrier of compact O[[H]]-modules in PD.2. PadicMeasuresIwasawaAlgebras §1.7 (main, line 909) already uses the same carrier.
   - Remove the completed-group-ring part of the request at line 582.
   - Rewrite the omission ledger (lines 619–628) to match.

   The ten Mathlib declarations listed at line 613 do exist at the actual pin (see "Verified sound"), so only the commit and the Tau Ceti claim change.

8. **F08** (P2) Prescribed-type density is stated below what the design's own targets prove

   **Location:** `design/README.md:499`: “The theorem does not assert unrestricted density for an arbitrary symbol τ”. Also lines 467, 476–478 and 503, and line 554: “For each prescribed τ verify the nonempty type and capture/component certificate before asserting full support.”

   **Claim:** Full density of type-τ points needs a separate certificate for each τ.

   **Witness:**
   1. σ(τ) is nonzero for every inertial type (CEGGPS Theorem 3.7, p. 41).
   2. PD.2/algebraic-capture with W=σ(τ) (EP Corollary 3.2, p. 351) therefore captures M∞.
   3. PD.3 then gives J_τ = Ann_R M∞ = 0, that is, C_τ = X□.

   **Exact repair:** State the theorem: for p∤2d and every inertial type τ, the potentially crystalline points of inertial type τ with regular weights varying are Zariski dense in X□ (BIP Remark 6.2, p. 46). Its proof uses PD.2/algebraic-capture, PD.4/density-from-testing, PD.3 and parent §5.2. Delete the "nonempty type support", "certificate" and "incompatible type datum" wording. Keep the W=0 degenerate Check.

   Tested at d=1: the type-τ points τ′·∏σ^{n_σ} meet every component χ, because σ(ζ)^n runs through all characters of the cyclic group μ_{p∞}(F).

9. **F09** (P2) The "wild" minimal-stratum case is empty under the standing p∤2d

   **Location:** `design/README.md:544`: “In particular the theorem applies to every totally ramified degree-d extension, including wild extensions.” Also lines 392, 402, 513, 522 and 530.

   **Claim:** PD.5/minimal-stratum-density covers wildly ramified E/F, where only simple strata describe the points.

   **Witness:** d = e·f, so p∤d forces p∤e: every degree-d E/F is tame, and EP Proposition 3.19, second part (p. 356), gives the induced-character description for all of them. Wildness needs p | d (e.g. p = d = 3), excluded.

   **Exact repair:**

   - Replace the sentence with: "every degree-d E/F is tamely ramified when p∤d".
   - State the density with the induced-character description (ψ restricted to U_E^{m+1} equals θ) for every E that contains a minimal element.
   - Keep the simple-stratum predicate and the MinimalStratumSet.wildDistinction test only in the definition. Mark them as outside the density theorem, with the instance F=ℚ_3, d=3, E=ℚ_3(3^{1/3}).
   - Drop the Check at line 392.

10. **F10** (P3) Convention Checks do not test the dual or the Artin normalisation

   **Location:** `design/README.md:59` (LocalPoint.weightZeroGL2), line 64, and line 126: “For d=1 and ψ=1, δ=1”.

   **Claim:** These Checks pin the dual highest-weight convention and the geometric Artin map.

   **Witness:** Weights (1,0) give a=(0,0), which is self-dual, and d=1 with ψ=1 gives δ=1 under either Artin normalisation, so neither Check can fail. The discriminating instances are computed below.

   **Exact repair:** Add two computed Checks:

   - d=2 with weights (2,0): the highest weight of π_alg is (0,−1); the undualised convention would give (1,0) (CEGGPS §1.8, pp. 12–14).
   - d=2, F=ℚ_p, ψ=1: δ(u)=u with the geometric Artin map and u^{−1} with the arithmetic one (ClassFieldTheory, main line 468, states χ_cyc(Art_K(u)) = N(u)^{−1} for the arithmetic map).

11. **F11** (P3) A PD.1 Check is false in the statement's own coefficient convention

   **Location:** `design/README.md:98`: “When A is a domain there is one patched component over each χ.”

   **Claim:** A domain A gives one component of R∞ over each χ.

   **Witness:** A = O[[x]]/(x²−ϖ) ≅ O[√ϖ] is complete local, O-flat, reduced, equidimensional, and a domain. Geometric integrality requires adjoining √ϖ to L. After that, A⊗O_{L′} has two minimal primes, (x−√ϖ) and (x+√ϖ), so there are two components over each χ.

   **Exact repair:** Write "When A is geometrically integral …", and add this A as a non-example.

12. **F12** (P3) The README and plan.json are not in the board's design shape

   **Location:** `design/README.md:1`: “# Patched modules and density in local deformation rings”. Line 41: “Packet target:”. Field lists **Argument / API / Definition tests / Uses / Checks / Sources / Direct inputs / Layer acceptance** throughout. `design/plan.json:3`: `"protocol": "blueprint-v1"`.

   **Claim:** The design follows the house README and plan schema.

   **Witness:** Sibling designs use the house shape (`packages/QWittVectors/design/README.md:1`; plan.json keys layers, suppliers, consumers, gaps). This README lacks Summary, Scope and ownership, Exact supplier contracts, How to read the build, `Layer k`, Examples, Dependencies and Downstream consumers.

   **Exact repair:** Rewrite the README in the house shape, in this order:

   1. `# Roadmap: …` and `**Summary.**`
   2. `## Scope and ownership`
   3. `## Conventions`
   4. `## Exact supplier contracts`, per supplier, including the gap contracts
   5. `## How to read the build`
   6. `## Layer k: …` with `### k.n` prose subsections, API bullets and `**Checks.**`, each layer ending with `### Examples` and `### Dependencies`
   7. `## Downstream consumers` and `## References`

   Then regenerate plan.json in the board schema.

13. **F13** (P3) Process narrative, internal identifiers and owners that exist nowhere

   **Location:** `design/README.md`:
   - line 5: “Its current R31.5 packet”;
   - line 33: “implementation status **unchecked**”;
   - lines 84, 132, 302, 336, 398 and 554: “the layer is not declared closed”;
   - line 558: “retained for independent review”;
   - line 564: “not read in this run”;
   - line 589: “PAPER-BOCKLE-IYENGAR-PASKUNAS-23/E7 in the atlas extraction review”;
   - lines 591 and 593: “Status: new”;
   - lines 599–605, 609 (“AUDIT-31”), 615 (“WORKERS.md”) and 632;
   - lines 601 and 603 name `LocalGlobalCompatibilityPartIIEigenvarietyCompanions` and `LocallyAnalyticCompletedCohomology` (“whose existing LA.0–LA.12 layers own …”);
   - lines 560 and 579 name `LocalGaloisDeformationRingsPartIIComponentsAndNormality`.

   **Claim:** The text is timeless, and the owners it names for excluded work exist.

   **Witness:** Process labels cannot be interpreted a year on. The three named roadmaps have no board job, package folder, pull request or main folder. ComponentsAndNormality is only proposed, in the design of LocalGaloisDeformationRingsPartII (job #502, whose tame GL₂ scope is as stated).

   **Why P3:** nothing in this roadmap consumes the Ding, Newton–Thorne, BHS or Pan routes. The false “existing” claim is therefore a scope-wording defect, not a supply defect.

   **Exact repair:** Delete the process labels. Keep the three source corrections as timeless mathematics: the corrected step, its counterexample and the locator. In the ownership section, say only that those routes are outside this roadmap: do not call layers “existing” that no roadmap has. Give G1 a real supplier (R01).

14. **F14** (P3) The planned Suggested.lean is padding and does not name the unstatable headlines

   **Location:** `design/README.md:615`: “It states the two algebraic forms of PD.2/capture-scalar-detection … Four native-carrier examples check identity/zero kernels, the empty family and the existing vanishing-ideal density comparison.” Also `design/plan.json:2582`.

   **Claim:** These declarations are the acceptance test.

   **Witness:**
   - Scalar detection follows directly from `Submodule.mem_iInf`, `LinearMap.mem_ker` and `Module.annihilator_eq_bot` (Mathlib `RingTheory/Ideal/Maps.lean:900`).
   - The density comparison is `PrimeSpectrum.zeroLocus_vanishingIdeal_eq_closure` (`RingTheory/Spectrum/Prime/Topology.lean:159`).
   - The four examples only compute values.

   **Exact repair:** Leave these out of Suggested.lean; the README keeps them. The headline theorems are:
   - the three density theorems of BIP Theorem 6.1;
   - the local faithfulness of Theorem 6.8;
   - the benign, prescribed-type and minimal-stratum densities.

   None of them is statable at the pins: there is no framed deformation ring, no crystalline or potentially semistable predicate (PadicHodgeTheory line 14 lists only B_dR-level period rings in Mathlib), and no patched module. So the module docstring should name each headline with its missing carrier and state nothing.

15. **F15** (P3) No sources manifest, and three page locators are slightly off

   **Location:**
   - The package had no `sources.toml`.
   - `design/README.md:66`: “DPS, Remark 5.14, pp. 37–38”.
   - Lines 394 and 536: “Proposition 3.19, pp. 355–356”.
   - Line 380: “EP, proof of Theorem 5.1, pp. 362–363”.

   **Claim:** Every cited work is recorded, and the page numbers are exact.

   **Witness:**
   - DPS Example 5.13 (DPS line 1742) and Remark 5.14 (DPS line 1756) are both on p. 38.
   - EP Proposition 3.19 (EP line 824) is on p. 356.
   - EP Theorem 5.1 (EP line 1126) is on p. 363, and its proof ends on p. 364.

   **Exact repair:**
   - Change the locators to "p. 38", "p. 356" and "pp. 363–364".
   - The manifest the service created in this review has entries EP, BIP, CEGGPS, DPS, ST, EG and NAK. I completed their authors, titles, years and version notes. BIP is recorded from arXiv v2: its numbering agrees with the published version, and the README's page numbers are the published ones. The fix worker keeps these entries.

16. **F16** (P3) Duplicated targets and boilerplate Checks within the design

   **Location:**
   - `design/README.md:206–216`: PD.2/testing-comparisons restates the PatchedTest API bullets at lines 181–187.
   - Lines 220–244: PD.2/capture-scalar-detection and PD.2/capture-duality-and-projectives restate the Capture API at lines 148–154.
   - The identical Check appears at lines 212, 226 and 240.

   **Claim:** Each target and Check adds a distinct test.

   **Witness:** The five sentences of PD.2/testing-comparisons are the API bullets lattice_independent, dual_hom, openInduction, fibre_nonzero and scalar_action. The repeated Check names no instance and would hold for any object.

   **Exact repair:**
   - State each fact once: as API of its definition or as a theorem, not both.
   - Replace the boilerplate Check with computed ones. For openInduction: with M=O[[K]] and [K:H]=n, both sides have Hom-dimension n·dim V.
   - Widen PD.2/fixed-centre-evaluation to any nonzero finite-dimensional continuous T with central character δ, as DPS Corollary 7.8 (p. 43) allows. The algebraic T used in PD.2 is a special case.

17. **F17** (P3) Capture is used by the earlier parent but owned only here

   **Location:** `design/README.md:246–258` (PD.2/algebraic-capture) together with lines 138–169.

   **Claim:** This roadmap is the owner of capture.

   **Witness:** The parent's §5.3 proof (its README line 1823) already uses EP Proposition 3.1 (algebraic representations capture every projective) without an owner. This design comes later in the order, so a supplier would depend on its consumer.

   **Exact repair:** In Scope and ownership, record that capture and algebraic capture move down to the parent. Declare `gap:algebraic-capture`, supplier CompletedCohomologyAndLocalGlobalCompatibility §5.3. Needs: EP Definition 2.1 and Proposition 3.1 for G_L split, and Lemma 2.9 with W≠0. PD.2/capture and PD.2/algebraic-capture then import it, and the PD.2 extensions (fixed centre, smooth types, testing modules) stay here.

Reviewed 2026-10-23. Seventeen findings: two P1, seven P2 (nine blocking), eight P3. There is no previous review. The mathematics of the BIP density route is mostly sound, and the three source corrections E1–E3 are right. The blocking problems are about supply and ownership. Every declared gap is unowned. Four suppliers are consumed without contracts although they exist only as unbuilt package jobs. The Emerton–Gee input has no owner. Two PD.5 targets re-plan the parent's §5.2a. Two theorems are mis-scoped: one is narrowed below what the design itself proves, and one is overclaimed. Every fault can be repaired in place, and the design does not re-plan a whole roadmap, so the verdict is not "rejected". The package had no `sources.toml`; the sources service created `packages/CompletedCohomologyAndLocalGlobalCompatibilityPartII/sources.toml` with the seven works the README cites. Apart from that manifest and the two deliverables, I changed no file.

## Verified sound

### Dependency check (exact output)

```text
candidate: CompletedCohomologyAndLocalGlobalCompatibilityPartII is not in the merge order yet; checked as if placed after CompletedCohomologyAndLocalGlobalCompatibility (the intake inserts it when its design is accepted)
depcheck: 26 roadmaps, 214 edges, 0 problem(s)
```

The check shows no UPWARD or CYCLE line. However, it misses every `Name:Node` citation (see R02 and R05), and so does `roadmaps resolve`. In particular, it cannot see the reliance on four suppliers that are unbuilt package jobs and are not in ORDER. Until those reliances are repointed or declared as gaps, the ordering in R02(b) applies. I resolved each citation by hand; the table below records the results. After the R02 and R05 repoints, every supplier is on main or earlier in ORDER. ModularityAndLanglandsExtensions will produce a `moved:` line, which is expected.

### Seeded sample (15 targets)

- **"Direct inputs" (8 draws):** I resolved every Direct-inputs line (27 lines, 22 distinct citations). Outcomes are in the next table: 10 resolve to existing content under a different label (R05), 5 point to four roadmaps that exist only as unbuilt board package jobs, whose designs do contain the cited nodes (R02), and 7 are correct. A citation counts as "correct" if it names an existing section or a declaration that exists at the pin.
- **"Argument" (3 draws):**
  - PD.1/torsion-free-character-root matches BIP Lemma 6.4, p. 47: Teichmüller twist, then binomial roots on ℤ_p^{m+1}; recomputed at d=1 and d=p.
  - PD.3/hits-each-local-component matches the BIP Theorem 6.8 proof, p. 49, and the E2 repair is valid (BIP arXiv line 2781).
  - PD.4/density-from-testing matches EP Proposition 2.11, Lemma 2.7 and Remark 2.12, pp. 344–345. The Jacobson, reducedness and flatness steps were rechecked on the counter-instances in the adversarial table.
- **"Layer acceptance" (PD.0):** unowned Emerton–Gee input (R03), plus process wording (R13).
- **"Sources" (2 draws):**
  - PD.0/local-point-sets: BIP §6 p. 46, CEGGPS §1.8 pp. 12–15 and DPS Remark 5.14 are all correct, except that the DPS page is 38 (R15).
  - PD.2/capture: EP Definition 2.1 and Lemmas 2.2–2.8, pp. 342–344, are correct.
- **"Definition tests" (PD.2/capture):** all four tests recomputed and correct (adversarial table, row 9).

### Source locators checked against the text (58 locators; 3 page nits in R15)

| Source | Locators checked |
| --- | --- |
| **BIP** (published Forum Math. Pi; the arXiv v2 numbering agrees) | Theorem 6.1, Remark 6.2 (p. 46); Lemmas 6.3, 6.4 (p. 47); Lemma 6.5 (pp. 47–48); Lemma 6.6 (p. 48); Lemma 6.7 and Theorem 6.8 (p. 49); proof of Theorem 6.1 (pp. 49–50); Remarks 6.9, 6.10 (p. 50); Corollaries 4.19, 4.21, 4.22 (pp. 39–40) |
| **EP** (published pages 337–371) | Definition 2.1 and Lemmas 2.2–2.10 (pp. 342–344); Proposition 2.11, Remark 2.13 (pp. 345–346); §2.3; §2.5 and Proposition 2.23 (pp. 349–350); Proposition 3.1, Corollary 3.2 (p. 351); §3.3, Lemma 3.10, Proposition 3.11 (pp. 352–354); Definition 3.12, Example 3.15 (p. 354); Lemma 3.16 (p. 355); Proposition 3.19 (p. 356); Propositions 3.25–3.26 (p. 358); Theorems 5.1 and 5.3; Definition 6.8, Proposition 6.9 (p. 368); Theorem 6.12 (pp. 369–370) |
| **CEGGPS** (arXiv v5) | §1.8 (pp. 12–15); Lemma 2.2 (p. 16); Theorem 3.7 (p. 41); Lemma 4.18 (p. 65); §4.22 through Corollary 4.26 (pp. 67–70) |
| **DPS** (arXiv v1) | Theorem 7.4 (p. 41); Corollaries 7.5–7.7 (p. 42); Corollary 7.8 (p. 43) |
| **ST** (arXiv v1) | Lemma 2.1, Corollary 2.2 (p. 10); Theorem 2.3 (p. 12) |
| **EG** (author copy) | Theorem 1.2.2 (p. 3); Definition 6.4.2, Theorem 6.4.4 (pp. 168–169) |
| **NAK** | Lemma 4.2 and its proof (pp. 120–122) |

The three source corrections are verified:

- **E1:** the BIP Lemma 6.5 step at BIP arXiv lines 2714–2715 fails at the uniformizer. At F=ℚ_5 with κ(5) the Teichmüller lift of 2, the printed ψ has ψ(5)=1, but κ̄(5)=2.
- **E2:** a nonzero test support can meet two components, so the printed whole-support containment does not follow; choosing a component through a point of the fixed-ψ fibre is a valid repair.
- **E3:** with W=0, EP Lemmas 2.6 and 2.9 and Corollary 3.2 claim that {0} captures O[[K]]≠0, which is false.

### Adversarial table

| # | Statement | Instances tried | Computed values | Result | Change |
|---|---|---|---|---|---|
| 1 | HT(ε)=−1; a_{σ,i}=k_{σ,i}−(d−i); π_alg has highest weight −a_{σ,d+1−i} | d=2: k=(1,0), k=(2,0); d=1: k=(−1) | (1,0)→a=(0,0), hw (0,0); (2,0)→a=(1,0), hw (0,−1), undualised (1,0); d=1: hw 1 | Convention right; Check not discriminating | R10 |
| 2 | r_p(π)=rec_p(π⊗\|det\|^{(1−d)/2}); geometric Art_F | CEGGPS p. 13 (lines 496–497), p. 14 (lines 533–535) | Formula and normalisation match | Correct | — |
| 3 | Centre δ^{−1} on M becomes δ on Π(M) | (zf)(m)=f(z^{−1}m) with z^{−1} acting by δ(z) | (zf)=δ(z)f | Correct | — |
| 4 | PD.0/local-point-sets | d=1; d=2 Steinberg with N≠0 | d=1: Σspcd=Σprnc=Σ_k (E=F, every character abelian crystalline); Steinberg lies in Σ_k only | Correct (BIP p. 46) | — |
| 5 | PD.0/unconditional-patching-input | EG Theorem 1.2.2; semisimple ρ̄ | Gives a crystalline (hence pcris) regular PD lift; semisimple case is CEGGPS Lemma 2.2 | True but unowned | R03 |
| 6 | PD.1/patched-components | F=ℚ_p, p odd; A=O[√ϖ] | μ_{p∞}=1 gives one χ; for A=O[√ϖ], components over χ: 1 before enlargement, 2 after | Statement correct; Check false | R11 |
| 7 | PD.1/torsion-free-character-root | d=1; F=ℚ_p, ψ=ω, d=p−1; d=p | η=ψ; ω nontrivial on μ_{p−1}, so no η; (1+y)^p=ψ(γ) with y∈𝔪_{L′} | Correct; hypothesis needed | — |
| 8 | PD.1/algebraic-central-character | d=1, ψ=1; d=2, F=ℚ_p, ψ=1 | δ=1 under both normalisations; δ(u)=u (geometric) vs u^{−1} (arithmetic) | Correct; Check weak | R10 |
| 9 | PD.2/capture (definition and 4 tests) | H={1}, M=O, V=L; empty family; M=O/ϖ; H cyclic of order prime to p, M=O(χ), V=L | Common kernels 0, M, O/ϖ, O(χ) respectively (Hom_H(O(χ),L)=0) | All 4 tests correct; matches EP Lemma 2.2 | — |
| 10 | PD.2/testing-modules | M=O[[H]], Θ=O; M=O/ϖ; V=0; Θ replaced by ϖΘ | Testing modules O, 0, 0; rational module unchanged | Correct | — |
| 11 | PD.2/testing-comparisons (openInduction) | M=O[[K]], [K:H]=n | dim Hom_H(M,V*)=n·dim V=dim Hom_K(M,(Ind V)*) | Correct; duplicates API | R16 |
| 12 | PD.2/capture-scalar-detection | R=ℤ/4 acting on M=ℤ/2, a=2 | a kills M but a≠0, so faithfulness is needed | Correct; padding if put in Lean | R14, R16 |
| 13 | PD.2/capture-duality-and-projectives | M=O×O/ϖ | Product has torsion, so it is not captured, matching the factor O/ϖ | Correct (EP Lemmas 2.3, 2.5, 2.8) | R16 |
| 14 | PD.2/algebraic-capture | W=0; W=σ(τ) | {0} does not capture O[[K]]≠0; σ(τ)≠0 captures | W≠0 needed and present | R08 uses it |
| 15 | PD.2/smooth-type-capture | EP (18)–(19) | dim V_χ ~ q^{nN(N−1)/2}; \|X(n)\| ~ q^{nN}; sum ~ q^{nN²} = (I_{n0}:K_{n+1}) | Correct (Proposition 2.23 needs distinct classes) | — |
| 16 | PD.2/fixed-centre-evaluation | T=0; algebraic T vs continuous T | T=0 gives image 0, not dense; DPS allows any continuous T | T≠0 present; narrower than source | R16 |
| 17 | PD.2/fixed-centre-projective-detection | d=1; d=2 with central exponent 1 | d=1: θ itself; std rep has exponent 1, det^k gives 2k, so odd exponents need non-det reps | Correct (BIP Lemma 6.7) | R06 (G2) |
| 18 | PD.3/hits-each-local-component | Spec L[x,y]/(xy); χ≠χ′ mod ϖ | Support not inside one component; distinct χ agree residually, so a char-0 point is needed | Correct; E2 repair valid | — |
| 19 | PD.3/local-faithfulness | Non-reduced R=O[[x]]/(x²) | x lies in every minimal prime and x≠0 | Reducedness (BIP Cor. 4.22) essential and used | — |
| 20 | PD.4/density-from-testing | B=O[[x]]/(x²); B=O[[x]]/(ϖx) | x vanishes at all char-0 points but x≠0 in both | Reducedness and O-flatness essential and stated | — |
| 21 | PD.4/crystalline-density | d=1 | Crystalline exponents n_σ are Zariski dense in each χ-component | Correct (BIP Thm. 6.1) | — |
| 22 | PD.4/principal-series-density | d=1, fixed k | Finite-order twists of all conductors are dense | Correct | — |
| 23 | PD.4/unramified-supercuspidal-density | E unramified | Tame, so WD = Ind ψ (EP Prop. 3.19) | Correct | — |
| 24 | PD.5/benign-points | d=1; Jordan-block φ; scalar φ; ratio p^f | d=1 benign; Jordan block with v(α)=(k1+k2)/2 is weakly admissible and not benign; scalar φ not weakly admissible | Correct; duplicates parent | R04 |
| 25 | PD.5/benign-open | NAK Lemma 4.2 | Discriminant and flag minors are nonzero divisors | Correct; duplicates parent | R04 |
| 26 | PD.5/benign-density | BIP Remark 6.2 | Follows from parent §5.2a + PD.4 | Correct | — |
| 27 | PD.5/prescribed-type support and density | Trivial τ; any τ at d=1 | C_τ=X□ (README's own test); every χ met | Narrowed | R08 |
| 28 | PD.5/minimal-stratum-supercuspidal-set | Totally ramified; unramified; EP Ex. 3.15 | Uniformizer minimal; unit generating k_E minimal; e-th powers form 𝔽_{p^{f/2}}^× | Correct | — |
| 29 | PD.5/minimal-stratum-density | p∤2d, d=e·f | p∤e, so every E is tame | Wild case vacuous | R09 |
| 30 | E1 (BIP Lemma 6.5) | F=ℚ_5, κ(5)=[2] | ψ=1, ψ(5)=1, κ̄(5)=2 | Correction right | R13 (wording) |
| 31 | E3 (EP Lemma 2.6) | M=O, H={1}, W=0 | Premise holds vacuously; conclusion fails | Correction right | — |

### Library declarations opened at the pins

Mathlib 6b7abb3c:

| Declaration | File:line |
| --- | --- |
| `Module.annihilator` | `RingTheory/Ideal/Maps.lean:868` |
| `Module.mem_annihilator` | `RingTheory/Ideal/Maps.lean:870` |
| `Module.comap_annihilator` | `RingTheory/Ideal/Maps.lean:894` |
| `Module.annihilator_eq_bot` | `RingTheory/Ideal/Maps.lean:900` (needs `Ring R`, `AddCommGroup M`) |
| `PrimeSpectrum.zeroLocus` | `RingTheory/Spectrum/Prime/Basic.lean:137` |
| `PrimeSpectrum.vanishingIdeal` | `RingTheory/Spectrum/Prime/Basic.lean:157` |
| `PrimeSpectrum.zeroLocus_eq_univ_iff` | `RingTheory/Spectrum/Prime/Basic.lean:302` |
| `PrimeSpectrum.zeroLocus_vanishingIdeal_eq_closure` | `RingTheory/Spectrum/Prime/Topology.lean:159` |
| `LinearMap.ker` | `Algebra/Module/Submodule/Ker.lean:59` |
| `FaithfulSMul` | `Algebra/Group/Action/Faithful.lean:47` |

All ten exist as the README describes them. Tau Ceti a91d3aaf: `TauCeti.completedGroupAlgebra` (`…/CompletedGroupAlgebra/Basic.lean:145`) and `TauCeti.IsCompactModule.completedGroupAlgebraModule` (`…/CompletedGroupAlgebra/Module.lean:344`); see R07.

### Cross-roadmap citations resolved (main, or the open head)

| Cited by the design | Found |
| --- | --- |
| Parent R31.5 (3 nodes) | §§5.1, 5.2, 5.3 (lines 1698, 1753, 1812) |
| PadicHodgeTheory R06.2 (2 nodes) | §3.6 (line 739) |
| LocalGaloisDeformationRings R08.1, R08.3 | §§1.1, 1.19, 3.4, 3.9; the component extension is absent (G1) |
| DeformationAndDerivedPatchingAlgebra R03.1, R03.4 | §§1.12, 4.6, plus §§4.4, 4.7 |
| CompletedCohomologyPartII CC.3 | §3.2 |
| EndoscopicTransferAndUnitaryTraceComparison ET.6 | Layer 10, not Layer 6 |
| SmoothRepresentationsOfLocalGroups SR.2, SR.3 | Exist (SR.2.1 frobenius-reciprocity, line 1872; SR.3 Bernstein) |
| PadicMeasuresIwasawaAlgebras L1 | Layer 1 (main) |
| ClassFieldTheory Layer 7 | Main, line 1312; arithmetic normalisation with `geometricArtinMap` as precomposition with inversion (lines 475–476) |
| RepresentationTheory/ClassicalGroups Layer 3 | Main, line 237 (over ℂ) |
| PotentialAutomorphyInfrastructurePartII:PL.1, LocallyAnalyticDistributionsPartII:ND.6, LocallyAnalyticRepresentationsOfLocalGroups:LR.0/LR.1, TriangulineVarietyAndItsLocalModel:G | Available board package jobs #473, #500, #499 and #448, with designs on the board's main. The cited nodes exist there: `PL.1/potentially-diagonalizable`, `ND.6/banach-iwasawa-duality`, LR.0, LR.1, `G/refined-crystalline-space`. Density of analytic vectors is that design's `LR.2/admissible-banach-analytic-vectors`. None is packaged, on main or in ORDER (R02). |
| LocalGaloisDeformationRingsPartII (named in scope) | Board job #502 with a design on the board's main; its tame GL₂ scope is as the README says |
| LocalGlobalCompatibilityPartIIEigenvarietyCompanions, LocallyAnalyticCompletedCohomology, LocalGaloisDeformationRingsPartIIComponentsAndNormality | No board job, package folder, pull request or folder on main (R13) |

### Ownership and elaboration

**Ownership against open work:** I listed the board's jobs with `status --all` (all states) and read the designs on the board's main for the jobs this design cites (R02, R13). I also ran `roadmaps grep` over every open roadmap pull-request head (index 2026-10-23T10:17:06Z, 330 pull requests) and main for capture, benign points, patched faithfulness, and density of crystalline, crystabelline or supercuspidal points. Only the parent (§§5.2a, 5.3; see R04 and R17) and PadicLocalLanglandsForGL2Qp (the GL₂(ℚ_p) case) touch these objects. The sibling roadmaps named in the brief are on unrelated topics. No other roadmap states BIP Theorem 6.1 or 6.8, so with R04 and R17 applied, this roadmap is the right owner of the density and local-faithfulness applications.

**Elaboration:** not available (this lane does not elaborate). A design has no Suggested.lean, so the `#check @name` comparison does not apply. The padding decision in R14 is based on reading the definitions and the pinned library.

No suspicious instruction-like text was found in any file read.

## Not verifiable

- **Scope against the target:** the package has no `target.md`, and the job's target text was not supplied. So I cannot check that limiting the roadmap to the BIP route, and leaving the Ding, Newton–Thorne, BHS and Pan routes out, matches what was commissioned.
- **Inputs cited only inside BIP Lemma 6.3's proof:** CEGGPS Corollary A.2 and the Hellmann–Schraen appendix Lemmas A.1 and A.5. I did not read these; the two G5 slugs kept under R06 rest on them.
- **Bushnell–Kutzko book statements behind EP §3.4:** not read. The README already says it does not rely on them.
- **DPS and ST published versions:** their numbering was not compared with the arXiv versions the README cites. The README cites the arXiv versions consistently.
- **Lean elaboration:** not run; see above.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "948c94c", "job": "REV-DESIGN-CompletedCohomologyAndLocalGlobalCompatibilityPartII", "model": "opus", "worker": "fable-rev5"} -->
