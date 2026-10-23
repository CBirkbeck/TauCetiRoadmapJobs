<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/442#issuecomment-6366701674 -->
Review (claude) of b58d862

Verdict: needs changes

1. **F01** (P1) The almost C-representation category is imported from a supplier that does not plan it

   **Location.** `packages/VectorBundlesAndIsocrystalsPartII/design/README.md` line 17: "Finite-K Fontaine full faithfulness (CN25 Theorem 2.1) is imported from `PadicHodgeTheory:R06.2/almost-c-representation-category`, whose statement and Sen proof already include it." The same import appears at lines 54, 70, 180, 207, 236, 308 and 393, in routing rows 201, 203, 204, 43 and 44–50, and in Request 3 (line 1658).

   **Claim.** PadicHodgeTheory supplies three things, so AC.0–AC.1 only add Ext theory:

   - the category C(G_K);
   - its Dimension and height;
   - Fontaine's full faithfulness.

   **Witness.** PadicHodgeTheory at its pull-request head 2b343c5 has Layers 0–9 and no R06.2. Its supplier-identifier note (Downstream consumers) defines only R06.4, R06.6 and P8. A `roadmaps grep` for almost C or presque C finds no owner on main or in the 330 open heads.

   **Repair.** Make this roadmap the owner of the category.

   1. Add to AC.0 a definition target, almost C-representations C(G_K) (CN25 §2.2.1, p. 9; Fontaine03 §1.4 and Th. B, printed p. 291, proof §5.1).
      - Height is ht(W)=dim V₂−dim V₁ for W/V₂≅C^d/V₁.
      - Checks: ht(Q_p)=1; ht(C)=0; B₂ is almost isomorphic to C²; C(1) is almost isomorphic to C.
   2. Add theorem targets for Fontaine03 Th. A and A′ (CN25 Th. 2.1, printed pp. 290–291) and for Th. C.
   3. Import Sen theory from PadicHodgeTheory §4.4 (`senModule`, `senOperator`) and FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.P7.2.
   4. Delete the import claim at line 17, the routing rows listed above and Request 3. Point every `R06.2/almost-c-representation-category` input at the new targets.

   After this, every AC.1 input resolves to a target here or to a section that exists.

2. **F02** (P1) All eleven declared gaps are unowned

   **Location.** `packages/VectorBundlesAndIsocrystalsPartII/design/plan.json` lines 2764–2880: every gap entry has only `id`, `title`, `neededBy` and `detail`. The README lists the gaps at lines 1706–1770. Line 1714 reads: "Split proposal CCB.0–CCB.1 must supply it, or a proof of the exact lemma must be added".

   **Claim.** The eleven obligations are declared supplier contracts.

   **Witness.** No entry names a `supplier`, a `section` or a one-sentence `needs`, so the intake reads supplier `none` for all eleven. ClassicalBanachColmezCorrespondences, named for G-FUNDAMENTAL, exists nowhere: not on main, not among the open heads, not on the board, and in no TauCetiRoadmapJobs issue.

   **Repair.** Treat the gaps in three groups.

   (a) Eight gaps are proof obligations of this roadmap's own targets: G-ANALYTIC, G-TVS, G-TENSOR, G-DISC, G-FRECHET, G-COMPACT, G-SEPARABILITY and G-VS. Delete them as gaps. State each missing result as an owned target in its layer, with hypotheses and a locator. Examples:

   - TVS.0: boundedness of a left-heart value does not depend on the bicartesian presentation.
   - TVS.2: CN25 Prop. 4.18 for nuclear Fréchet W, plus a separate target for general separable Fréchet W.
   - H.0: VS Ext of the BC sources agrees with v-sheaf Ext against the B_dR lattice targets.

   Split each one into separately dischargeable targets; see R04(v). Delete the "Layer acceptance … obligations" lines.

   (b) G-HOM keeps its slug. Supplier: VectorBundlesAndIsocrystals. Section: Layer VB3, *VS Hom vanishing from torsion period modules*. Needs: for every BC W, each VS map W→B_dR has image in t^{−N}B_dR^+ for some N (CN25 Cor. 3.18 and its proof, p. 18).

   (c) For G-FUNDAMENTAL and G-GENERAL, first remove the parts that are already provided (R04). Each remaining part becomes an owned AC.0 target, or a gap with a named supplier and section.

   Each surviving gap must have the same slug in plan.json (with `supplier`, `section`, `needs`) and in the README under `## Exact supplier contracts`.

3. **F03** (P1) Cited supplier sections do not exist where they are cited

   **Location.**

   - README line 643: "`PerfectoidSpaces:P3`, `PerfectoidSpaces:P6`, `PerfectoidSpaces:P9`". P9 is cited again at lines 760 and 833 and in Request 7.
   - Line 477: "`LocallyAnalyticDistributions:L0/strict-derived-category-left-heart`, `LocallyAnalyticDistributions:L0/bounded-sets-strong-dual`".
   - Line 70: "`ArithmeticGaloisRepresentations:R01.1/continuous-representation`".
   - Line 114: "`PadicHodgeTheory:R06.1`, `PadicHodgeTheory:P7`".
   - Requests 1, 2 and 4–10, at lines 1646–1704.

   **Claim.** These sections supply the listed inputs, and the requests ask existing owners for refinements.

   **Witness.**

   - `TauCetiRoadmap/PerfectoidSpaces/README.md` line 43 on main: layers P8–P9 form PerfectoidTowers.
   - None of the 13 `L0/…` and `L1/…` slugs occurs in the LocallyAnalyticDistributions README (head 3a4526a).
   - ArithmeticGaloisRepresentations numbers this section §1.1.
   - PadicHodgeTheory has no R06.1, P7 or R06.5.

   **Repair.** Repoint each citation to the section that exists and owns the object:

   | Cited as | Repoint to |
   | --- | --- |
   | PerfectoidSpaces P9 | PerfectoidTowers Layer P9 (*almost-cohomology-of-tower*, *function-descent-along-tower*) |
   | LocallyAnalyticDistributions L0 slugs | §0.0 (NACvx, `naLeftHeart`, projective and completed tensors) and §0.2 (strict sequences, compact-type extensions, `naFunctionalExtension_countableType`, `naProjectiveLimit_cohomology_finiteDimensionalML`) |
   | LocallyAnalyticDistributions L1 | Layer 1 |
   | ArithmeticGaloisRepresentations R01.1 | §1.1 |
   | PadicHodgeTheory R06.1 (period rings, θ, t, fixed fields) | PadicPeriodRings §§1.5, 2, 4.1–4.3, which is earlier in the merge order |
   | PadicHodgeTheory P7 (Sen theory) | PadicHodgeTheory §4.4 |
   | ArithmeticGaloisDuality R02.1, R02.2, D7 | §§R02.1.3, R02.2.1, D7.4 |

   The intake does not read requests. Turn each request that is still needed after R04 into a `gaps` entry with a supplier and a section.

   The parent citations `VB3:general-BC/<anchor>` do resolve: all 26 anchors exist. They only need rewriting in the form "VectorBundlesAndIsocrystals, Layer VB3, *Sympathetic Vector Spaces*".

4. **F04** (P2) Several gaps and requests ask for provided results or bundle several results

   **Location.** README:

   - line 1708 (G-GENERAL): "prove the arbitrary-K density and twist-invariant statements";
   - line 1648 (Request 1): "Export the period-ring functors on the parent sympathetic category";
   - line 1714 (G-FUNDAMENTAL);
   - line 1750 (G-COMPACT): "The accepted L0 plan retains conditions … in compact-type-extension-duality";
   - lines 1726, 1732, 1738 and 1762.

   **Claim.** Each needs sentence asks only for what is missing.

   **Witness.**

   - PadicPeriodRings §2 already gives H⁰(G_K,C(i))=0 for i≠0, for every complete discretely valued K with perfect residue field.
   - The parent's `SympatheticVS.periodTargets` already builds B_dR^+(Λ) and B_m(Λ).
   - The parent's VB3 Dimension theorem and its subobjects-of-V₁ statement already give Colmez's lemma.

   **Repair.**

   (i) G-GENERAL: delete the twist-invariant half and cite PadicPeriodRings §2 instead. Keep as owned AC.0 targets the two parts nobody provides:

   - density of K̄ in B_dR^+ (CN25 Prop. 2.13(ii));
   - Hom_{G_K}(C,C)=K for arbitrary K (CN25 Prop. 2.13(i)).

   (ii) Request 1: drop the sympathetic period functors (parent VB3 `SympatheticVS.periodTargets`).

   (iii) G-FUNDAMENTAL: cite the parent's *Dimension and the abelian BC category* together with "subobjects of V₁ are V₁ or finite Q_p-spaces". Together they give the surjectivity and finite kernel of a BC map S→V₁ whose image is infinite-dimensional, with Dim(ker)=(1,h)−(1,0)=(0,h). Own Fontaine03 §4's analyticity of η here.

   (iv) G-COMPACT: cite LocallyAnalyticDistributions §0.2 *Extensions of spaces of compact type* (spherically complete K, or separable outer terms) and *Continuous functional extension in countable type*. What remains is to lift that subsection's hypothesis (a), finite K, for K=C. "compact-type-extension-duality" does not exist in that README.

   (v) When R02(a) turns them into targets, split the compound gaps into separate items:

   - G-TVS: presentation independence; the exact structure.
   - G-TENSOR: completion; injectivity of the c₀ realization.
   - G-DISC: normed decompletion; the p=2 character comparison.
   - G-VS: the exact comparison; filtered colimits; the inverse limit.

5. **F05** (P3) The README is not in TauCetiRoadmap form and contains process narrative

   **Location.**

   - Line 1: "# Isocrystals, vector bundles and Banach–Colmez spaces, Part II".
   - Line 5: "The definitive document is research/blueprint/readmes/VectorBundlesAndIsocrystalsPartII.md."
   - Lines 40–48: a status table.
   - The "**Target:** … **Hypotheses and conventions.** … **Planning API.** … **Unit tests.**" blocks, for example lines 62–102.

   **Claim.** This is the roadmap's README.

   **Witness.**

   - House style requires `# Roadmap:`, a Summary, `## Layer k:` sections written as prose, and Examples and Dependencies at the end of each layer.
   - It bans field lists and status words ("planned", "packet").
   - It allows backticked Lean names only for declarations in Suggested.lean, but 59 API names appear here.

   **Repair.** Rewrite in the shape of a main-branch roadmap such as `TauCetiRoadmap/PerfectoidSpaces/README.md`.

   1. Turn each target block into a `### k.n` prose subsection with a *Needs:* line.
   2. Merge each target's "Unit tests" and "Check" into one **Checks.** list with no Lean names.
   3. Delete the API-table Lean names unless Suggested.lean declares them.
   4. Delete line 5, lines 19–23, the "Status", "Planets" and "Layer acceptance" lines, and the process wording ("packet", "pass", and "the parent review left open" at line 1518).
   5. Add `## Downstream consumers`, naming CohomologyComparisons and CstConjectureForDaggerVarieties (whose gap G-QBC consumes the qBC theory), and add `## References`.
   6. Replace the E1–E17 log with one corrected statement at each affected target. The errata go to the register (see Source issues).

6. **F06** (P3) The routing ledger and four split proposals plan other roadmaps inside this README

   **Location.** Lines 1772–1983, for example line 1870: "`ClassicalBanachColmezCorrespondences` continues `VectorBundlesAndIsocrystals`. Create the stated continuation".

   **Claim.** The design assigns 293 extraction items, 209 of them to proposed new roadmaps.

   **Witness.** The four proposed roadmaps exist nowhere: ClassicalBanachColmezCorrespondences, AlgebraicVectorBundlesPartII, VectorBundlesAndIsocrystalsPartIII and VectorBundlesAndIsocrystalsPartIV. RR4's mention of VStackSheavesAndLisseCategories is why the gate places this roadmap after that roadmap.

   **Repair.**

   1. Delete the section and its item-id tables.
   2. Under Scope and ownership, keep one sentence per deferral that names an existing roadmap.
   3. Propose any split through the board, not in this README.
   4. Re-run the gate. The placement then follows the real last supplier.

7. **F07** (P3) The package had no sources manifest

   **Location.** `packages/VectorBundlesAndIsocrystalsPartII/` had no `sources.toml`, although README lines 1985–2055 record eight sources with URLs and hashes.

   **Witness.** During this review the service created `sources.toml` with seven entries: CN25, Colmez02, Schneiders99, FF18, Fontaine03, TVS25 and LeBras18. Each recorded hash equals the one the README records.

   **Repair.** Keep these entries and complete the manifest:

   - Add AnschutzLeBras25 with its JEMS DOI and arXiv identifier, and a `version_note` on the numbering.
   - Set each entry's `cited_for` to target ids.
   - Note that the CN25 and FF18 locators follow the author copies.

8. **F08** (P3) The baseline is not the pin, and library objects the design uses are not cited

   **Location.** Line 19: "The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`." The reuse table is at lines 25–32.

   **Witness.** The pins are Mathlib 6b7abb3 and Tau Ceti a91d3aa. At those pins:

   - `BDeRhamPlus` and `BDeRham`: `Mathlib/RingTheory/Perfectoid/BDeRham.lean`:75 and :88.
   - `CategoryTheory.Abelian.Ext`: `Mathlib/Algebra/Homology/DerivedCategory/Ext/Basic.lean`:118.
   - Tau Ceti `ExactStructure`: `TauCeti/CategoryTheory/Exact/ExactStructure.lean`:241.

   **Repair.**

   1. State the pins.
   2. Add reuse rows for:
      - the objects listed in the witness;
      - `Abelian.Ext.mapExactFunctor` (`Mathlib/Algebra/Homology/DerivedCategory/Ext/Map.lean`:129);
      - `PadicComplex` (`Mathlib/NumberTheory/Padics/Complex.lean`:137);
      - `fontaineTheta` (`Mathlib/RingTheory/Perfectoid/FontaineTheta.lean`:165);
      - `IsConflationExact` (`TauCeti/CategoryTheory/Exact/Functor.lean`:74).
   3. Use these declarations as carriers:
      - `ExactStructure` for the exact structures of AC.0 and TVS.0;
      - `Abelian.Ext` for Ext in the abelian C(G_K);
      - `mapExactFunctor` for the comparison maps of `yoneda-ext-comparison`, whose content becomes the bijectivity of those maps.
   4. Record what `BDeRhamPlus` requires of its base ring: `[Fact ¬IsUnit (p : R)]` and p-adic completeness.

   The six cited declarations do exist at the pin: Functor (Basic.lean:40), TopModuleCat (Topology/Basic.lean:41), `isOpenMap` (Banach.lean:228), `exists_preimage_norm_le` (Banach.lean:161), `torsionBy` (Torsion/Basic.lean:177) and LinearMap (Defs.lean:84).

9. **F09** (P3) Two conventions have no definition and no witness

   **Location.**

   - Line 9: "Height uses dim(V_2)−dim(V_1) in an almost presentation."
   - Lines 229 and 274: "γ(t′)=χ(γ)t′" and "d1(x,y)=t′y−(χ(γ)^(−1)γ−1)x".

   **Witness.**

   - Height. CN25 line 408 presents W/V₂≅C^d/V₁ and sets ht=dim V₂−dim V₁. The BC presentation of CN25 line 556, the parent, and H.0 (line 1628) put V₁ inside Y and set ht=dim V₁−dim V₂.
   - The factor χ(γ). The cyclotomic character χ does not factor through Gal(K∞/K): for K=Q₃, two lifts of γ have χ-values that differ by −1.

   **Repair.**

   1. Define the almost presentation in Conventions (V₂⊂W, V₁⊂C^d), with Checks ht(Q_p)=1 and ht(C/Q_p)=−1. State that H.0's BC presentation uses the opposite labels.
   2. Replace χ(γ) by Fontaine's χ^{(1)}(γ)=exp(log χ(γ̃)) (Fontaine03 line 896, printed p. 306), the character by which γ acts on t′.
   3. Add a Check: for K=Q_p with p odd, χ=χ^{(1)}ω and the factor does not depend on the lift.

10. **F10** (P3) The arithmetic fundamental theorem is narrower than its source

   **Location.** Line 387: "V a continuous Q_p-representation of dimension h, and 0→V→E→C→0 a strict Banach G_K extension".

   **Witness.** Fontaine03 Th. 4.1 (line 1816, printed p. 329) lets E be an extension of any one-dimensional C-representation by V. FF18 Preface Th. 2.25 states only the case where that representation is C.

   **Repair.** State the theorem for an extension of a one-dimensional C-representation W by V, with η:E→C and η(E)≠η(V), citing Fontaine03 Th. 4.1. Keep W=C as a Check. The original statement is the case W=C.

11. **F11** (P3) Attributions and locators

   **Location.**

   - Line 118: "Use the general-base Sen rigidity proof cited by CN25 Proposition 2.13(i)". G-GENERAL also says the source attributes these results to Sen.
   - Line 1134: Hom_TVS(Q_p,Pair)=M_2/M_1, cited to the proof of Lemma 4.24(i).
   - Lines 194–195, 222–223, 267–268, 295–296, 325–326 and 692–693: the same source appears in two bullets.
   - Lines 1048 and 1213: targets of kind "(lemma)".

   **Witness.**

   - CN25 line 494 credits (i) to Fontaine's proof [28], which works for every K, and (ii) to [12]. Sen is cited only for Theorem 2.1 (line 393).
   - The Pair formula appears in the proof of CN25 Prop. 4.25 (line 1425, p. 28), not in Lemma 4.24.

   **Repair.**

   1. Correct both attributions.
   2. Add the Prop. 4.25 proof (p. 28) as the locator for the Pair formula.
   3. Merge the duplicated source bullets.
   4. Change both "(lemma)" kinds to theorem.

12. **F12** (P3) The planned suggested file is padding and lives outside the package

   **Location.** Line 2265: "one genuine native linear-map target testing the inverse cyclotomic scalar in the differential, two special-case examples and three native torsion compatibility examples". The file path in plan.json line 6461 points outside the package.

   **Witness.** The Suggested.lean rules exclude examples that compute values, compatibility examples, and theorems about free variables whose conclusion is algebra on their hypotheses. The d₁∘d₀=0 identity described at line 286 is such an algebraic check.

   **Repair.** At the package stage, write `TauCetiRoadmap/VectorBundlesAndIsocrystalsPartII/Suggested.lean` with only the headline theorems that are statable at the pins.

   - These headlines need TVS, BC, VS and C(G_K) carriers that do not exist at the pins:
     - Ext¹_TVS(V₁,V₁)≅C;
     - full faithfulness of reasonable qBCs;
     - the height–rank formula;
     - Fontaine's duality.

     Name them in the module docstring as not statable.
   - Drop the six planned declarations, and delete the README section that describes them.

Reviewed on 2026-10-23 against board head b58d862, content main a07e202 and the pins in its `lake-manifest.json` (Mathlib 6b7abb3, Tau Ceti a91d3aa). There was no previous review. The design files were not changed. The package had no `sources.toml`; the sources service created one while I fetched seven texts.

There are twelve findings. Four block acceptance: three P1 and one P2. The other eight are P3.

The mathematics holds up. All 44 targets went through the adversarial pass (table under Verified sound) and none of their statements is false. The seeded sample of 15 targets matches the sources, and so do the author's 17 flagged source corrections (E1–E17).

The design does not re-plan its parent. VectorBundlesAndIsocrystals stops at classical BC, curvature and the curve correspondence, and does not treat CN25 §§2, 3.3 or 4.

What blocks acceptance is ownership:

- The arithmetic layers rest on an almost C-representation category that no roadmap owns.
- All eleven declared gaps have supplier `none`.
- Many supplier citations use stage labels that do not exist in the cited roadmaps.

## Verified sound

### Gate

Output of the dependency check (no UPWARD or CYCLE line):

    candidate: VectorBundlesAndIsocrystalsPartII is not in the merge order yet; checked as if placed after VStackSheavesAndLisseCategories (the intake inserts it when its design is accepted)
    depcheck: 27 roadmaps, 227 edges, 0 problem(s)

The placement after VStackSheavesAndLisseCategories comes only from the routing-only request RR4 (R06).

### Seeded source sample

The worker's sample could not be matched to README headings, because the README does not use standard headings. I drew the 15 targets with Python `random.Random('REV-DESIGN-VectorBundlesAndIsocrystalsPartII').sample` over the 44 node ids in plan.json. For each target I checked the result number, page, hypotheses and statement against the cached texts.

| Target | Locator checked | Result |
| --- | --- | --- |
| AC.1/almost-split-extensions | CN25 §2.2.1, Prop. 2.5 (pp. 9–10); Fontaine03 Th. D (p. 292; the definition of almost split is on p. 291) | matches Th. D(i); finite K |
| AC.0/general-base-rigidity-inputs | CN25 Rem. 2.2 (p. 9), Prop. 2.13 (p. 11), proof of 2.14 (pp. 11–12) | matches; attribution see R11 |
| TVS.0/topological-vector-spaces | CN25 Def. 4.1 (p. 20), Rem. 4.2–4.3 (p. 21); Schneiders99 Cor. 1.2.21 (printed pp. 24–25) | matches |
| TVS.1/disc-ext-class | CN25 Prop. 4.10(ii), proof through Rem. 4.14 (pp. 23–25) | matches; λ(B₂)=1 with injection c↦tc |
| AC.1/yoneda-ext-comparison | CN25 Prop. 2.5; Fontaine03 Props. 6.4–6.5 (printed pp. 357–358) | matches, all degrees |
| TVS.2/profinite-cocycle-one-step | CN25 Lemma 4.19 (p. 26) | matches; isometric steps retained |
| TVS.2/constant-source-hom-ext | CN25 proof of Lemma 4.24(i) (p. 28), Rem. 4.8(ii) (p. 22) | matches; Pair part needs Prop. 4.25 proof (R11) |
| TVS.1/disc-translations | CN25 §4.2 (pp. 22–23); Colmez02 Props. 5.20, 5.23 (pp. 30–31) | matches; exact sequence 0→H→T→O_Λ→0 |
| H.0/period-valued-height-functor | CN25 §3.3 (p. 19), Cor. 3.18 and proof (p. 18) | matches |
| TVS.2/pair-hom-from-torsion | CN25 Lemma 4.23 (pp. 27–28) | matches; same-type Pair |
| AC.1/generalized-invariant-complex | CN25 Prop. 2.7, (2.8) (p. 10); Fontaine03 Th. 2.14 (printed pp. 309–310) | matches up to the χ notation (R09) |
| TVS.1/translation-invariant-proetale-class | CN25 Rem. 4.15 (p. 25); Colmez02 Th. 10.5 (pp. 76–77), Prop. 10.18 and Rem. 10.19 (p. 82) | matches |
| TVS.0/classical-bc-to-tvs | CN25 Rem. 4.2 (p. 21), (3.14) | matches |
| TVS.2/normalized-pushout-extensions | CN25 Rem. 4.17 (p. 25), 4.21 (pp. 26–27) | the README's sign is the correct one; the source has a sign slip (Source issues) |
| QBC.0/qbc-forgetful-full-faithfulness | CN25 Cor. 4.31 (p. 31), Rem. 4.6(ii) (p. 22) | matches; reasonable, same type |

In addition, I checked LeBras18 Th. 4.1 (pp. 26–28). Its table gives Ext¹(Q_p,G_a)=0, Ext¹(G_a,G_a)=C, and Ext² zero among G_a and Q_p, which agrees with H.0 line 1567. I also confirmed the TVS25 locators Def. 3.32 (p. 23) and Cor. 4.25 (p. 29).

### Author-flagged corrections E1–E17

All seventeen are confirmed at their cited lines, and all are reproduced in Source issues, together with three issues I found myself (CN25 Remarks 4.17/4.21, Proposition 2.7 and Lemma 4.29). Two are refined:

- E3: the qBC filtration of CN25 Def. 4.5 does not define W≤0, although §3 does define it for BC.
- E13: I class this as a misprint, because the displayed Euler formula in the same remark contains H².

### Adversarial pass

Each row gives the computed values. "None" in the last column means no change is needed.

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| banach-galois-exact-category | 0; finite-dim reps; log χ extension | 0 is a zero object; finite-dim maps are automatically strict; the log χ extension has class log χ≠0 in Hom(G_K,Q_p), nonsplit, and is a conflation | holds | R08 carrier |
| general-base-rigidity-inputs | K=Q_p; K=Frac W(F_p(s)^perf); j=1 | Hom(C,C)=K for every K (CN25 line 494); C(1)^{G_L}=0 by PadicPeriodRings §2; K is closed in C, so it is not dense | holds | R04, R11 |
| period-hom-rigidity | (N,k)=(0,1); (k,ℓ)=(1,2) | Hom(B^+,C)=K·θ; Hom(C,B₂)=0 since t′·1≠0 in B₂ kills H⁰; End(B_k)∋id, so ℓ>k is needed | holds | none |
| almost-split-extensions | V⊕C; 0→Q_pt→U₁→C→0 | U₁ has Dimension (1,1); the quotient by V=Q_pt splits | holds | R01 |
| yoneda-ext-comparison | i=0; (C,C(1)), i=1 | degree 0 is full faithfulness; B₂ represents the class in K=Ext¹ | holds | R08 |
| cyclotomic-generalized-invariants | W=0, C, B₂ | C: W₍₀₎=K, W₍₁₎=0; B₂: W₍₀₎=K, W₍₁₎=Kt′ | holds | R09 |
| generalized-invariant-complex | d₁d₀; W=C; W=C(1) | d₁d₀z=t′γz−χ^{(1)}(γ)^{−1}χ^{(1)}(γ)t′γz=0; C: H=(K,K,0); C(1): H=(0,K,K), as in CN25 Ex. 2.12 | holds | R09 |
| euler-poincare-duality | (Q_p,Q_p); (C,C); duality at i=0 | Q_p-dims (1,[K:Q_p]+1,0) give −[K:Q_p]; (C,C) gives 0; Hom(Q_p,Q_p)=Q_p is dual to H²(G_K,Q_p(1))=Q_p | holds | none |
| truncated-period-ext-table | (k,j)=(1,0),(1,1),(2,1),(2,2),(2,0) | K-dims (1,1,0), (0,1,1), (0,0,0), (0,1,1), (1,1,0); every alternating sum is 0, as height 0 requires | holds | none |
| truncation-vanishing | (N,i,j)=(0,1,2), (1,1,2); i=j | W₍₀₎=K, W₍₁₎=Kt′ with t′ an isomorphism, so acyclic; when i=j the identity survives | holds | none |
| fundamental-arithmetic-surjectivity | E=V⊕C with f=(g,1); f=(g,0) | ker f={(v,−g(v))}≅V; f=(g,0) has f(E)=f(V) and is excluded | holds, narrower than source | R10 |
| equivariant-analytic-realization | C; Q_p | End_{G_K}(C)=K but End_BC(V₁)=C, so forgetting G_K is not full | consistent | R02(a) |
| topological-vector-spaces | 0; V₁; diagonal map on c₀ | the image of (x_n)↦(p^n x_n) contains every finite sequence but not (p^n), since (1,1,…)∉c₀: nonzero algebraic quotient, zero Hausdorff quotient | holds | none |
| classical-bc-to-tvs | C/Q_p | Banach quotient with Dimension (1,−1) | holds | none |
| period-module-realization | 0; B_m; unbalanced tensor | B_m(Λ)⊗̂_{B_m}B_m=B_m(Λ); (ab)⊗x≠a⊗(bx) in the Q_p tensor | holds (complete models) | none |
| period-pairs | [M→M]; [0→B_m]; diagonal | zero; a Module; nonzero | holds | none |
| disc-translations | a=0; a∈2pO_C | E₀=1, ψ₀=0; exp(aX) converges on the closed disc because v(a)>1/(p−1) | holds | none |
| perfectoid-kummer-tower | p=3, n=0,1; p=2, n=0,1 | p=3: error terms have valuation ≥1/3, so Y₀³≡X; p=2: Y₀²+Y₀=(e^{4X}−1)/4 with v₂(4^{j−1}/j!)≥1; Y₁²+2^{1/2}Y₁=Y₀; v₂(2^n/n!)=1 at n=2^r | holds | none |
| bounded-analytic-cocycles | f=c; f=YZ; k=4, 8, 9 | u=−c; u=X²/2; binom(4,2)=6, binom(8,4)=70, binom(9,3)=84, each with valuation 1 | holds | none |
| additive-lifts-and-rank | split; B₂; v=0 | λ=0 and rank 0; λ_v=v; the zero vector lifts trivially | holds | none |
| disc-ext-class | split; B₂ | 0↦0 and B₂↦1; differs from Ext¹_{C(G_K)}(C,C(1))=K | holds | none |
| translation-invariant-proetale-class | a=0, 1 | both differences vanish | holds | none |
| reasonable-c-spaces | 0; c₀; ℓ^∞ | c₀ realizes to c₀(N,Λ); ℓ^∞ is not separable and is excluded | holds | none |
| reasonable-period-models | B_m; B_m² | t^m=0 uniformly | holds | none |
| reasonable-pairs | identity; closed; dense | zero; classical quotient; nonzero | holds | none |
| normalized-pushout-extensions | m=d=1, W=C, w=1 | (b,c′)↦b+tc′ has kernel {(tc,−c)}, so W→E₁ is c↦tc and the class is 1; the source sign gives −t | README correct | none |
| profinite-cocycle-one-step | zero cocycle; finite H | lies in W₀; finitely many values | holds | none |
| hom-ext-from-b1 | W=0, C, c₀ | 0; C with B₂↦1; the parameter lies in c₀ | holds | none |
| torsion-source-hom-ext | (W,d)=(B₃,2), (B₃,5) | B₃[t²]≅B₂ and B₃/t² have length 2; for d≥m both groups are B₃ | holds | none |
| constant-source-hom-ext | W=C; diagonal Pair | Hom=C, Ext¹=0; Hom(Q_p,P)=c₀/T(c₀)≠0 | holds | R11 |
| pair-hom-from-torsion | [0→B_m] | B_m[t^d] | holds | none |
| fundamental-source-hom-ext | d=1 with W=C and W=B₂; d=0 | Hom(Q_pt,C)→Ext¹(B₁,C)=C is the identity, so Ext¹(U₁,C)=0 and Hom=C; for B₂, Hom has length 2 | holds; CN25 display wrong | none |
| linear-additive-lifts | c=0, p, unit | ℓ_v(px)=ℓ_{(1+p)v}(x)−ℓ_v(x)=ℓ_{pv}(x) | holds | none |
| module-hom-ext-comparison | W₁=W₂=C | Ext¹=C in all three categories | holds | none |
| pair-hom-comparison | Module pairs | reduces to the Hom part of Prop. 4.27 | holds | none |
| filtered-quasi-banach-colmez-spaces | 0, Q_p, C/Q_p, c₀ | heights 0, 1, −1, 0 | holds | none |
| positive-pair-orthogonality | Y=C/Q_p with P=[0→B_m]; Y=B₁ | Hom(B₁,B_m)≅C injects into Hom(Q_p,B_m)=B_m, so the map is 0; for B₁→B₁ the identity survives | holds | none |
| intrinsic-curvature-filtration | pure Pair; Q_p⊕[0→B₁] | outer pieces 0; W<0=Q_p, W>0=0 | holds | none |
| qbc-forgetful-full-faithfulness | BC; pure Pair | parent morphisms; Th. 4.30 | holds | none |
| dense-injection-extension-example | J=id; LA⊂C | zero; Ext¹=D/Mes (CN25 line 1050) | holds | none |
| period-valued-height-functor | 0, Q_p^r, B_m, C/Q_p | 0, B_dR^r, 0, 0 | holds | R02(b) |
| vs-ext-and-filtered-localization | V₁, k=0 | the connecting map C→Ext¹(V₁,B^+) is injective because Hom(V₁,t^{−1}B^+)=0; both sides are ≅B^+/t, so it is an isomorphism and the next map is zero | holds | R02(a) |
| nonpositive-period-ext-vanishing | Q_p; C; C/Q_p | 0; 0; Ext¹(C/Q_p,B_dR)≅B_dR, so the excluded case is needed | holds | none |
| height-rank-formula | Q_p, C, C/Q_p, U₁ | ranks (1,0), (0,0), (0,1), (1,0) against heights 1, 0, −1, 1 | holds | none |
| Convention: height labels | Q_p | CN25 labels give 1; the parent's labels used with line 9's formula give −1 | ambiguous | R09 |
| Convention: γ on t′ | K=Q₃ | the two lifts give χ-values that differ by −1; χ^{(1)} is well defined | ambiguous | R09 |
| Convention: Euler sign | Q_p, Q_p | alternating sum −[K:Q_p]; the unsigned sum is 2+[K:Q_p] | README signed, correct | none |
| Convention: B₂ normalization | injection c↦tc | λ=1 in AC.1, TVS.1 and TVS.2 alike | consistent | none |

### Duplication audit, by object

- No other roadmap owns these objects: Topological Vector Spaces, period Pairs, qBC, Ext in C(G_K), and the height functor h. I searched main, all 330 open heads (`roadmaps grep`) and the board packages. CstConjectureForDaggerVarieties consumes the qBC theory through its gap G-QBC and owns none of it. This roadmap is therefore the owner.
- The design restates nothing from the parent: CN25 §§2, 3.3 and 4 are absent from it. LocallyAnalyticDistributions §0.0 owns the dense-diagonal left-heart example, and the design repeats it only as Checks.
- Library objects to cite are listed in R08. No moves down the merge order are needed.

### Supplier citations resolved

| Supplier (head) | Resolved |
| --- | --- |
| VectorBundlesAndIsocrystals (c380d7d) | 26 anchors present, including the VB2 and VB1 anchors; the parent has no "G-HOM" or "G-LEBRAS" labels |
| PerfectoidSpaces (main) | P1 *frobenius-surjectivity-criterion*, P3 *almost-purity-theorem* and P6 *canonical-pro-etale-presentation* present; P9 absent |
| ArithmeticGaloisDuality (09ad340) | Layers R02.1, R02.2 and D7 present (D7.4 is derived local duality) |
| ArithmeticGaloisRepresentations (bef111d) | §1.1 present; the label R01.1 is absent |
| LocallyAnalyticDistributions (3a4526a) | the objects exist in §0.0 and §0.2; the cited slugs do not |
| PadicHodgeTheory (2b343c5) | R06.1, R06.2, P7 and R06.5 absent |

The `roadmaps resolve` lead "AnschutzLeBras25 §3.1" is a false positive: it names a source, not a roadmap.

### Shape and elaboration

- Checks: every one of the 9 definitions has at least three unit tests plus a Check (R05 asks to merge them).
- Locators: all 44 targets have one.
- Lean: no Suggested.lean exists at the design stage. Elaboration is not available (this lane does not elaborate), so the binder check with `#check @name` was not run.

## Not verifiable

- **AnschutzLeBras25**: the sources service found no legal copy. The README gives no DOI, the journal host is in no licence class, and the citation search failed. Its §3.1 locators were not checked. The target that cites them, H.0/vs-ext-and-filtered-localization, is not in the sample, and no verdict depends on this source.
- **TVS25**: Def. 3.32, Th. 4.1, Cor. 4.7 and Cor. 4.25 were located; their content was not checked.
- **Colmez02 Lemme 7.10**: CN25 Cor. 3.18 uses it for the bounded image. I located it but did not check it.
- **FF18 outside the preface**: not read beyond Th. 5.5.3. The FF18 items in the routing ledger were not checked one by one; R06 asks for that ledger to be deleted.
- **Lean elaboration**: not available in this lane.

## Source issues

- **Misprint** in CN25 at Lemma 2.10, proof, p. 11: the source says the range for W₍₁₎ is 0≤j≤j−1; it should be 0≤j≤k−1; affects the proof.
- **Misprint** in CN25 at Remark 4.3, p. 21: the source says the two-term left-heart description is Schneiders Cor. 1.2.20; it should be Cor. 1.2.21, since 1.2.20 is the vanishing and t-structure criterion; affects nothing.
- **Misprint** in CN25 at Definition 4.7, p. 22: the source says curvature ≤0 means W=W≤0, a piece Definition 4.5 never defines; it should be W>0=0, as the parenthesis says; affects nothing.
- **Error** in CN25 at Lemma 4.9, proof, p. 23: the source says the integral equation uses e^{pX}, but at p=2 the coefficients 2^n/n! do not tend to 0; it should use the E₂ tower with e^{4X}; affects the proof.
- **Misprint** in CN25 at Lemma 4.13, proof, p. 24: the source says a_k is bounded by b_{i,k−1} with i=p^r, which equals k when k=p^r; it should be b_{i,k−i} with i=p^{r−1}; affects the proof.
- **Misprint** in CN25 at Lemma 4.13, proof, p. 24: the source says that after subtracting f(0,0) from f one adds f(0,0) to u; it should subtract it, because a constant u=c has coboundary −c; affects the proof.
- **Misprint** in CN25 at Remarks 4.17 (p. 25) and 4.21 (p. 27): the source says the pushout relation is (t^d c, cw); it should be (t^d c, −cw), otherwise E₁ is B₂ framed by −t; affects nothing.
- **Misprint** in CN25 at Proposition 2.7, p. 10: the source says the differential uses χ^{−1}(γ) for γ in Gal(K∞/K), where χ need not factor; it should be Fontaine's χ^{(−1)}(γ); affects nothing.
- **Gap** in CN25 at Definition 4.4(i) and footnote 10, p. 21: the source says W(C)=W for any topological model, but the completed tensor returns the separated completion; it should require complete separated models; affects a stated result.
- **Gap** in CN25 at §4.1.1 after Definition 4.4, p. 21: the source says the Hom and Ext maps for reasonable same-type Pairs are isomorphisms by Theorem 4.30, which proves only Hom; it should claim Hom only (Ext¹ is known for Modules by Proposition 4.27); affects a stated result.
- **Misprint** in CN25 at Lemma 4.24(i), p. 28: the source says Ext¹_TVS(U_d,W) is W, while its proof derives h¹(U_d)=0; it should be 0; affects a stated result.
- **Gap** in CN25 at Proposition 4.18, proof, p. 26: the source says the Fréchet case follows by projective limits, but argues only for nuclear Fréchet spaces; it should prove lim¹-vanishing for separable Fréchet spaces or restrict the statement; affects the proof.
- **Gap** in CN25 at §4.3.2 and Proposition 4.22, proof, pp. 26–27: the source says reasonable B_m-modules need not be separable, yet reduces to Proposition 4.18, which uses separability; it should assume separability or extend the proof; affects the proof.
- **Misprint** in CN25 at Proposition 4.27, proof, p. 30: the source says v_i is a sum over i, reusing the index; it should be v_i=Σ_j a_{i,j}w_j; affects nothing.
- **Gap** in CN25 at Lemma 4.29, proof, p. 30: the source says ℓ_v(cx)=ℓ_{cv}(x) for all c in O_C but proves it only for units; it should add the step c=(1+c)−1; affects the proof.
- **Misprint** in CN25 at Appendix A, proof of Proposition A.3, p. 59: the source says the distance is p^{−n} for the least n with x−y outside U_n, which is undefined when x=y; it should set d(x,x)=0; affects nothing.
- **Misprint** in FF18 at Preface Remark 2.24(i), printed p. 21: the source says H^i(G_K,W)=0 for i≥2, while its own Euler formula contains H²; it should say i≥3; affects a stated result.
- **Misprint** in FF18 at Preface Proposition 2.28(i), printed p. 23: the source says the Euler characteristic is the plain sum of Ext dimensions; it should carry (−1)^i; affects a stated result.
- **Misprint** in FF18 at Theorem 5.5.3, printed p. 213: the source says the point (deg X′, rg X′) lies below HN(X); it should be (rg X′, deg X′), matching the polygon's axes; affects nothing.
- **Misprint** in Fontaine03 at Theorem 6.1, printed p. 355: the source says Ext^n "= 0" is finite-dimensional, sums without signs and mixes the indices n and i; it should state Σ(−1)^i dim Ext^i=−[K:Q_p]h(X)h(Y); affects a stated result.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "b58d862", "job": "REV-DESIGN-VectorBundlesAndIsocrystalsPartII", "model": "opus", "worker": "fable-rev11"} -->
