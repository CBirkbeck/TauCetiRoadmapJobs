<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/392#issuecomment-6368493736 -->
Review (claude) of 3e0777d

Verdict: needs changes

1. **F01** (P1) All eighteen declared gaps are unowned

   **Location.** `packages/PadicLocalLanglandsForGL2QpPartII/design/plan.json`, `gaps` (entries G1–G18); README lines 1859–1987, e.g. line 1908: "Route these exact contracts to the geometry design, with no invented supplier ID."

   **Claim.** G1–G18 are declared supplier gaps that the intake can announce.

   **Witness.** Every `gaps` entry has only `id`, `title`, `detail`, `nodes`, `neededBy`; none has `supplier`, `section` or `needs`, so the intake reads supplier `none` for all eighteen. The README has no `## Exact supplier contracts` section.

   **Repair.** For each gap either make it a target of this roadmap (when the work is internal) or give it `supplier`, `section` and a one-sentence `needs` in plan.json, mirrored in the README as "What <Supplier> must provide (gap:<slug>): …". Owners resolved in this review (each precedes this roadmap in ORDER.txt, so the gate stays clean):

   | Gap | Owner or disposition |
   | --- | --- |
   | G1 | Target here in GR.0 (the three-source dictionary is internal), using PadicLocalLanglandsForGL2Qp §§1.2 and 1.7 conventions. |
   | G2 | PadicDifferentialEquationsAndRigidCohomology §RD.2.43 and §RD.1.73 for the residue duality (see R07); the finite-dimensionality of ker P(∇) on D_rig: PhiGammaModulesAndIwasawaCohomology or a target here. |
   | G3 | PadicLocalLanglandsForGL2Qp §4.1k (P-algebraic Kirillov model) and §4.9 (P-finite density, stated there for p≥5 only), or targets here. |
   | G4 | PhiGammaModulesAndIwasawaCohomology §5.7 supplies both ψ-cokernel vanishings and annular generation; the radius descent through (γ−1)⁻¹ is a target here. |
   | G5 | PadicLocalLanglandsForGL2Qp §4.2a (line independence); irreducibility of Π(π,0) a target here or a gap on §4.11. |
   | G6 | Mathlib `WithSeminorms.banach_steinhaus`; LocallyAnalyticDistributions Layer 0 for the radius estimates; Frommer's closed-image theorem a target here. |
   | G7 | Split (R08): LocallyAnalyticDistributions §0.CR.6.6 (Hyodo–Kato of semistable Stein curves and towers), EndoscopicTransferAndUnitaryTraceComparison §12.21 (Stein covers, Mittag–Leffler); the rest targets here. |
   | G8 | GL2AutomorphicRepresentationsAndTransfer §R17.3.12 and CompletedCohomologyAndLocalGlobalCompatibility §4.9; the integral reduction comparison PadicLocalLanglandsForGL2Qp §§3.3, 3.8. |
   | G9 | SmoothRepresentationsOfLocalGroups §SR.3.2 (its cuspidal splitting is over ℂ; ask for the L-coefficient version). |
   | G10 | Mathlib (R07, R09) and PadicLocalLanglandsForGL2Qp §0.1. |
   | G11 | Target here (finite-dimensional linear algebra). |
   | G12 | PadicLocalLanglandsForGL2Qp §§5.1, 5.3 (Gabriel–Morita). |
   | G13 | PadicLocalLanglandsForGL2Qp §§3.6, 5.8 (R07). |
   | G14 | PadicLocalLanglandsForGL2Qp §5.12 (`KisinRingLL.completion`, the B-adic completion of LL(M)). |
   | G15 | LocalGaloisDeformationRings §3.8 for the PID rigidity extension; local freeness a target here. |
   | G16 | Target here (extension of the parent's §6.9 in its own direction; see R05) plus LocallyAnalyticDistributions §0.CR.6.6 for the nonproper Hyodo–Kato comparison. |
   | G17 | PhiGammaModulesAndIwasawaCohomology §5.7 (R07); freeness of rank two a target here. |
   | G18 | PadicLocalLanglandsForGL2Qp §0.1 (coadmissible category); the derived/filtered enhancement a target here. |

2. **F02** (P1) GR.2–GR.3 re-plan the parent's Drinfeld comparison

   **Location.** README line 5: "The geometric end statements already listed in the parent are assigned one proof package here"; line 1994: "Replace that parent node by a reference to this geometric proof package"; plan.json `restructure` entry of kind `move`.

   **Claim.** The parent only lists the Breuil–Strauch end statements, so Part II owns their proofs.

   **Witness.** `TauCetiRoadmap/PadicLocalLanglandsForGL2Qp/README.md` at 29fce9f, §6.9 lines 2365–2397, plans `DrinfeldComparison.halfPlaneModule`, `map_linear`, `map_surjective`, `scalarEndomorphisms`, `map_injective` (with Π(π,2) and the smooth kernel), `functions_dual`, `deRham`, `filtration_preimage`; §4.2a (parent line 1426) and §4.11 (parent line 1670) plan the line-independent action and Π(π,0).

   **Repair.** Delete closed-unipotent, resolvent-analyticity, holomorphic-action, automatic-linearity, nonzero-comparison, surjectivity, pi-two, smooth-kernel, injectivity, analytic-realisation, de-rham-realisation, filtration-position, pi-zero and nrig-projective-line-sheaf, and the `move` restructure. Import those objects by name and section (§§4.2a, 4.11, 6.9, including `DrinfeldComparison.global_nonzero_map`, parent line 2397). Keep common-image (equality of embedded images), homography, kirillov-independence and pi-zero-irreducible only as refinements, each with one clause saying how it goes beyond §§4.11/6.9 (abstract quotient independence there; embedded fixed-radius equality, two-sided covariance and the line-independent Kirillov embedding here). The DLB proof repairs that the parent's §6.9 inherits become declared gaps on PadicLocalLanglandsForGL2Qp §6.9: E1, E5–E10. For example the parent's §6.9 (parent line 2381) kills a kernel vector by "infinite t-divisibility" with no fixed radius (E10). GR.4 and GR.7 then cite the §6.9 names.

3. **F03** (P1) Board packages consumed as if supplied

   **Location.** `LocallyAnalyticRepresentationsOfLocalGroups:LR.0–LR.2` at README lines 44, 90, 174, 249, 393, 416, 495, 536, 600, 621, 691, 710, 742, 938, 1007, 1204, 1266, 1657, 1795; `ScholzeFunctorAndModpCohomologyOfTheLubinTateTower:SZ.0/SZ.5` at lines 938, 1287, 1306, 1313, 1356, 1445; `ModpRepresentationsOfGL2OverLocalFields:MP.1` at line 29.

   **Claim.** These roadmaps supply the cited nodes.

   **Witness.** None of the three is on main, in ORDER.txt or among the 330 open roadmap pull requests; each exists only as a board design package (`packages/<Name>/design/README.md` on the board). Such a supplier can be consumed only through a declared gap.

   **Repair.** Repoint the LR citations to PadicLocalLanglandsForGL2Qp §0.1 (parent lines 205–236). It owns LA(X,L), D(H,L), completed tensors and compact-type duality. It also owns coadmissible modules and the anti-equivalence with admissible locally analytic representations (parent line 219), and admissible unitary Banach representations with their analytic vectors (ST03 Theorem 7.1). For the strong duality also cite LocallyAnalyticDistributions §0.3, "Strong duality for analytic compact-type spaces". Declare anything left (the derived Lie action, if §0.1 does not state it) as a gap with supplier LocallyAnalyticRepresentationsOfLocalGroups. Make SZ.0/SZ.5/SZ.6 declared gaps with supplier ScholzeFunctorAndModpCohomologyOfTheLubinTateTower. The sections are Layer 5, "Finite length of the mod p cohomology of the Drinfeld tower" (CDN23 Théorème 4.1, Corollaire 4.21(c)), and the Strauch components of Layer 0. These were checked to be in that board design. MP.1 is used by no target: delete it, or declare it as a gap with supplier ModpRepresentationsOfGL2OverLocalFields.

4. **F04** (P2) Supplier citations use atlas labels that the suppliers do not have

   **Location.** E.g. README line 129 `PadicLocalLanglandsForGL2Qp:R30.3/colmez-correspondence`; line 51 `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/drinfeld-tower`; line 183 `PadicHodgeTheory:P7/plan/fontaine-dif-module`.

   **Claim.** The cited sections exist where cited.

   **Witness.** The parent's sections are §§0.1–6.10, with no "R30"; PadicHodgeTheory has Layers 0–9, with no "R06" or "P7"; the Drinfeld tower is EndoscopicTransferAndUnitaryTraceComparison §12.4, not "ET.6a". The gate checks roadmap names only.

   **Repair.** Replace each label by the section that, read by content, supplies it (all 88 distinct citation strings resolved to existing content except those of R03):

   | Atlas label | Section to cite |
   | --- | --- |
   | R30.1/gl2qp-subgroups, character-dictionary, tate-dual, psi-and-treillis, trianguline-representation | PadicLocalLanglandsForGL2Qp §§1.1, 1.2, 1.3, 1.4, 1.6 |
   | R30.2/universal-unitary-completion, modp-irreducibles, admissible-unitary-banach | §§2.5, 2.7, 0.1 |
   | R30.3/boxtimes-p1, montreal-functor, contragredient, pi-of-D, family-stability, colmez-correspondence, analytic-vectors-of-pi | §§3.1, 3.2, 3.4, 3.5, 3.6, 3.8, 3.11 |
   | R30.4/kirillov-model, locally-algebraic-vectors, locally-algebraic-type | §§4.1k, 4.2, 4.1–4.2 |
   | R30.5/blocks, blocks-classification, projective-envelope, block-pseudodeformation-ring, paskunas-endomorphism-rings, dual-of-universal-deformation | §§5.1, 5.2, 5.3, 5.4, 5.5, 5.8 |
   | R30.6/paskunas-tung-finiteness | §6.7 |
   | R08.3/weil-deligne-type-ring | PadicLocalLanglandsForGL2Qp §5.12 `WDTypeRing` (declared construction owner, parent line 2032), with LocalGaloisDeformationRings §3.8 as its consumer adapter |
   | ET.6a/drinfeld-tower, period-morphisms, actions-and-weil-descent, central-quotient-sector, rank-two-arithmetic-descent, stein-mittag-leffler | EndoscopicTransferAndUnitaryTraceComparison §§12.4, 12.5, 12.7, 12.14, 12.19, 12.21 |
   | R06.2/period-functors, weak-admissibility-is-admissibility | PadicHodgeTheory §§3.3, 3.4–3.5 |
   | R06.3/de-rham-differential-equation, berger-filtered-module-robba-construction, potentially-semistable-dieudonne-module, fontaine-weil-deligne-functor, p-adic-monodromy-theorem | PadicHodgeTheory §§5.1, 5.2, 5.3, 5.3–5.4, Layer 5 (and PhiGammaModulesAndIwasawaCohomology §5.6a for N_dR) |
   | R06.5/proper-smooth-rational-de-rham-comparison; P7/fontaine-dif-module | PadicHodgeTheory §8.1; §4.4 |
   | PG.4/psi-one-to-zero; PG.5/analytic-iwasawa, analytic-bloch-kato-image | PhiGammaModulesAndIwasawaCohomology §2.4 (`oneSubPhiOnPsiOne`) and §4.3 (`psiFixed_generation`); §§5.4, 5.7 |
   | R31.4/definite-quaternionic-local-global-compatibility | CompletedCohomologyAndLocalGlobalCompatibility §4.9 |
   | R16.3; R17.1; R17.3 | GL2AutomorphicRepresentationsAndTransfer Layers R16.3, R17.1, R17.3 (§R17.3.12 for the globalization) |
   | L0 | LocallyAnalyticDistributions Layer 0 |

   Jacquet–Langlands: the parent declares `DivisionAlgebraTypes.jacquetLanglands` (§6.9, parent line 2357) the single D× transfer for the Drinfeld comparison; cite it, or say why GL2AutomorphicRepresentationsAndTransfer §R17.1.1 is used instead.

5. **F05** (P2) GR.4 needs the Breuil–Strauch realisation for every central character

   **Location.** README line 915: "π is smooth absolutely irreducible supercuspidal with trivial central character"; line 1245: "Π=Π_{M,ℒ} for a supercuspidal M of level≤n", whose prerequisites (line 1247) include GR.3/de-rham-realisation; G16 is needed only by GR.7 (line 1973).

   **Claim.** The GR.4 multiplicity theorems for every supercuspidal M follow from GR.3.

   **Witness.** Take p=7 and ω the quadratic character of 𝔽₇× with ω(7)=1. Squares of characters of μ₆ have order dividing 3, so no twist of a supercuspidal with centre ω has trivial centre. CDN23 line 2161: DLB assumed trivial centres.

   **Repair.** Add a target here, an extension of PadicLocalLanglandsForGL2Qp §6.9 in its own direction, giving the functions and de Rham realisations for every supercuspidal M∈ΦNᵖ_n. Keep M_dR and M*_dR distinct (DLB17 Remarque 1.3(a); CDN23 Proposition 5.7, footnote 30). Make hom-fundamental-diagram, analytic-line-extension, banach-differential-multiplicity, banach-etale-multiplicity and galois-socle consume it, or name it in their prerequisites as the owned G16. Add the p=7 quadratic-character case as a Check that the twist reduction fails.

6. **F06** (P2) Multiplicities on the p-central quotient omit M∈ΦNᵖ

   **Location.** README line 1245 "for a supercuspidal M of level≤n"; line 1264 "with the same level conditions"; line 1285 "when V=V_{M,ℒ} with level≤n"; level is defined at line 63 without any condition at p.

   **Claim.** The multiplicity is ℒ⊗JL(M) (resp. V_{M,ℒ}⊗JL(M), Π(V)′_b⊗JL(M)) for every supercuspidal M of level ≤ n.

   **Witness.** Twist a trivial-centre π₀ by the unramified χ with χ(p)=1+p. Then M has level ≤ n but JL(M)(p)=(1+p)²≠1. Since p∈Z(G) acts trivially on M⁽ᵖ⁾_n (DLB17 line 130; CDN23 line 62), the Hom is 0, not ℒ⊗JL(M).

   **Repair.** Write "M∈ΦNᵖ_n" in banach-differential-multiplicity, banach-etale-multiplicity and galois-socle, and for the Steinberg branch require Sp⊗δ∈ΦNᵖ_n (δ(p)²=1). Add the unramified twist with χ(p)=1+p as a negative-control Check. The slip is copied from CDN23 (see Source issues).

7. **F07** (P2) Gaps ask for what suppliers and Mathlib already provide

   **Location.** README lines 1873 (G2), 1887 (G4), 1894 (G5), 1908 (G7), 1915 (G8), 1929 (G10), 1950 (G13), 1957 (G14), 1978 (G17).

   **Claim.** Each requested result is missing upstream.

   **Witness.** G10: `WithSeminorms.isVonNBounded_iff_seminorm_bounded` (Mathlib/Analysis/LocallyConvex/WithSeminorms.lean:575) is the seminorm criterion. G17: PhiGammaModulesAndIwasawaCohomology §5.7 `allLevelExp_iff_tNrig`. G13: the parent's §5.8 universal family (parent README line 1929).

   **Repair.** Cite the provider and narrow each `needs` to the residue:
   - G2: PadicDifferentialEquationsAndRigidCohomology §RD.2.43 (its step 4 applies DLB Proposition 6.4) and §RD.1.73; keep the finiteness of ker P(∇) on D_rig and the continuity of ∂⁻¹.
   - G4: PhiGammaModulesAndIwasawaCohomology §5.7 `tNrig_psiCokernels_vanish`, `tNrig_annularGeneration`; keep the radius descent.
   - G5: PadicLocalLanglandsForGL2Qp §4.2a `AnalyticBoxtimes.filtrationIndependentAction`; keep the irreducibility.
   - G7: LocallyAnalyticDistributions §0.CR.6.6 and EndoscopicTransferAndUnitaryTraceComparison §12.21.
   - G8: GL2AutomorphicRepresentationsAndTransfer §R17.3.12, the quaternionic globalization of a supercuspidal type; keep the residual irreducibility, the removal of the twist and the three lines.
   - G10: `WithSeminorms.image_isVonNBounded_iff_seminorm_bounded` (WithSeminorms.lean:595), `NormedSpace.image_isVonNBounded_iff` (Bounded.lean:495), and the parent's §0.1 (ST03 Theorem 7.1) for the distribution presentation in CDN23 Lemma 5.9.
   - G13: the parent's §5.8 orthonormalizable family for absolutely irreducible ρ̄ (coefficient change, closed-point fibres). Add a Check converting its fibre Π(ρ_x(ε)) to CDN23's Π(ρ_x)* (dual and ε-twist). Keep the reducible blocks.
   - G14: the parent's §5.12 `KisinRingLL.completion`.
   - G17: keep only freeness of rank two over D(Γ).

8. **F08** (P2) Compound needs sentences

   **Location.** README line 1908 (G7, about twelve results), line 1915 (G8, five); G2, G3, G6, G10, G12, G13, G14, G15 and G16 each bundle two to four results.

   **Claim.** Each `needs` is one precise contract.

   **Witness.** G7 joins several results: the Hyodo–Kato/de Rham diagram, the Kummer map, Banach unit balls, Stein limits, tree-cover patching, half-plane Steinberg cohomology, bounded functions, Morita duality, Kohlhaase's equivalence, density-to-surjectivity and Serre duality. It also says "has no stage/node in this checkout".

   **Repair.** Split each into one gap per result, stating domain, hypotheses and output; use the same slug in plan.json and the README; drop the process text; update every consumer's prerequisites.

9. **F09** (P3) orbit-bounded restates pinned Mathlib lemmas

   **Location.** README lines 1106 (`OrbitBounded.normCriterion`), 1108 (`OrbitBounded.seminormCriterion`), 1100: "The general locally convex equivalence is the precise functional-analysis request G10."

   **Claim.** The orbit criteria are new API, and the seminorm criterion is missing upstream.

   **Witness.** At Mathlib 6b7abb3c, `NormedSpace.image_isVonNBounded_iff` (Bounded.lean:495) and `WithSeminorms.image_isVonNBounded_iff_seminorm_bounded` (WithSeminorms.lean:595, over a nontrivially normed field) state exactly these two criteria.

   **Repair.** Cite both under the Mathlib supplier contract, delete the two API bullets (keep them as Checks if wanted) and keep the subspace and functoriality API.

10. **F10** (P3) Wrong pins, and a Lean file that is not in the package

   **Location.** README line 33: "Mathlib `082e2d37…` and Tau Ceti `f7904748…`"; plan.json `baseline` and `leanStatus` ("Compiled with lean-check … 106 lines").

   **Claim.** The design is pinned to the project's Mathlib and Tau Ceti, and a compiled Lean file accompanies it.

   **Witness.** The content repository pins Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039; the package contains no Suggested.lean.

   **Repair.** Use the manifest pins (the seven cited declarations exist there; see Verified sound) and delete the Suggested.lean and lean-check sentences until the package stage.

11. **F11** (P3) Process narrative and catalogue residue

   **Location.** README line 5 (atlas and extraction IDs); line 31 ("checked in addition to the atlas snapshot"); line 1994 ("This issue does not edit parent deliverables"); line 2071 ("returned HTTP 403 on 2026-10-19"); 38 "Atlas planet" lines; the 137-row routing table (lines 2081–2360); "Status: Recorded in PAPER-…" in E1–E14.

   **Claim.** The README is a timeless mathematical document.

   **Witness.** These passages describe the extraction pipeline, review state and access attempts; the house style forbids process narrative, catalogue tables and field-list formats, and a reader in a year cannot use them.

   **Repair.** In the package, use the TauCetiRoadmap form (Scope and ownership, Conventions, Exact supplier contracts, layers with *Needs:* lines). Delete atlas and extraction IDs, the routing table, access dates and status lines. State ownership as settled scope, not as proposals.

12. **F12** (P3) Locator for the irreducibility of Π(π,0)

   **Location.** README line 701: "DLB17, After Definition 8.7, p. 372"; line 1894 (G5): "the assertion after Definition 8.7".

   **Claim.** DLB17 reports the irreducibility of Π(π,0) after Définition 8.7.

   **Witness.** In DLB17 (arXiv v2) the text after Définition 8.7 (lines 1858–1865) makes no irreducibility claim; Remarque 1.8 (line 410) reports Colmez's theorem that Π(π,0) is topologically irreducible.

   **Repair.** Cite DLB17 Remarque 1.8 and the Colmez paper it cites (with a manifest entry); confirm the printed page against the Annals copy.

13. **F13** (P3) The unfiltered annihilator does not depend on the weight

   **Location.** README line 350: "Do not extrapolate the printed t^k formula to weights {0,k} with k≠1"; line 2017 (E4).

   **Claim.** The annihilator tN⁺_dif is special to weights {0,1}.

   **Witness.** For V=L(j), N⁺_dif(V)=L_∞[[t]]t^{−j}e_j and N⁺_dif(V̌)=L_∞[[t]]t^{j−1}e_{1−j}. Products lie in t⁻¹L_∞[[t]]dt, so the orthogonal is tN⁺_dif(V) for every j. DLB17 line 1569 prints t^k.

   **Repair.** State (N⁺_dif)^⊥=tN⁺_dif for every weight (it follows from N⁺_dif=L_∞[[t]]⊗D_dR, DLB17 line 1299). Correct E4: the exponent is 1, not k, for k≥2. Keep a Check that t^k fails at k=2.

14. **F14** (P3) Sources manifest

   **Location.** `packages/PadicLocalLanglandsForGL2QpPartII/sources.toml` (absent before this review); README line 2058 cites the Annals PDF.

   **Claim.** The cited works are recorded in the roadmap's manifest.

   **Witness.** The package had no `sources.toml`; this review created one (DLB17 arXiv v2; CDN20 and CDN23 with SHA equal to README lines 2065, 2074). Frommer, Kohlhaase, Teitelbaum, Dospinescu's thesis, Colmez's irreducibility paper and Kedlaya are named without entries.

   **Repair.** Keep the three entries; add the others when their gaps get owners; give printed DLB17 pages only after reading the printed copy.

Independent review of `packages/PadicLocalLanglandsForGL2QpPartII/design/README.md` (2360 lines), `design/plan.json` (59 targets, 18 gaps, 14 requests, 14 source issues, 137 routing rows) and the sources manifest. There is no previous review. Fourteen findings: three P1, five P2, six P3. Rejection is not warranted. The new mathematics (GR.4–GR.7, the P-finite Kirillov refinements of GR.1, the embedded-image and covariance refinements of GR.2) is coherent and largely well sourced. The overlap with the parent and the missing owners can be repaired by deleting, citing and assigning. The parent was read at its current head 29fce9f; suppliers in open pull requests were read at the heads in the roadmap index; Mathlib and Tau Ceti were read at the pins of the content repository's `lake-manifest.json`.

## Verified sound

**Principles.** No computational algorithm, no copied passage (statements are English paraphrases of the French sources; about thirty were compared with the source text in the sample and the table below), no sorry'd data or `set_option` (no Lean file at this stage). Route-specific restrictions are the sources' own: p>3 for the factorisation (CDN23 line 65 and footnote 2), p>2 for the mod-p finiteness input, trivial centre for DLB (handled in R05). Re-planning: R02. Unowned or board-only suppliers: R01, R03.

**Dependency check** (verbatim):

    candidate: PadicLocalLanglandsForGL2QpPartII is not in the merge order yet; checked as if placed after CompletedCohomologyAndLocalGlobalCompatibility (the intake inserts it when its design is accepted)
    depcheck: 27 roadmaps, 230 edges, 0 problem(s)

No UPWARD or CYCLE line. No roadmap on main or in an open pull request cites PadicLocalLanglandsForGL2QpPartII (roadmaps grep), so there is no cycle. Internal order: all 127 internal prerequisite entries name existing targets earlier in the build (none forward, none missing).

**Seeded source sample** (the seeded labels are field names; one instance each, plus the author's flagged items):

| Label | Instance | Text checked | Result |
| --- | --- | --- | --- |
| Construction/proof | GR.3/injectivity | DLB17 lines 2685–2709 (Prop. 11.10, Rem. 11.11) | steps match; Remark 11.11 confirms that zero intersection is delicate, so E10's fixed radius is needed |
| Construction/proof | GR.4/finite-dimensional-multiplicity | CDN20 lines 1113–1169 | matches (transversality gives A−λ injective, line 1138) |
| Construction/proof | GR.6/type-annihilator | CDN23 lines 2457–2501 | matches steps 1–4 (constant bounded functions, Y_B, equal centre actions); the source needs only p>2 here |
| Planning API | GR.4/orbit-bounded | Mathlib at 6b7abb3c | true statements, already in Mathlib (R09) |
| Sources | GR.6/factorisation | CDN23 Thm 5.15 p.55 (line 2308), Thm 0.1 p.2 (line 81), Thm 0.18(ii) p.9 (line 380), note 32 p.60 (line 2523) | all four locators correct |
| Hypotheses | GR.1 standing hypotheses | DLB17 Thm 1.2, lines 154–158 | supercuspidal, trivial centre, weights 0,1: correct |
| Target (theorem) | GR.1/kirillov-model | DLB17 Thm 7.3 (lines 1460–1465), Prop. 7.6 (lines 1535–1543) | formulas and LP embedding correct; Casimir recomputed (table) |
| Proof contracts | G11 | CDN20 Lemme 2.18, lines 1171–1194 | all-positive column printed (line 1186); complement step unjustified: G11 is real |
| Proof contracts | G5 | DLB17 Thm 8.5 (lines 1786–1795), Rem. 1.8 (line 410) | proof cited from Colmez; locator R12; line independence provided upstream (R07) |
| Direct prerequisites | GR.7/infinite-primitives | DLB17 §12.1, lines 2790–2809 | uses Dospinescu's thesis Thm 8.4.3 (line 2800), as G3 says; E2 confirmed |
| Unit tests | GR.3/pi-two | DLB17 formula (10), lines 2400–2416 | the three Checks compute correctly |
| Atlas planet | GR.2/homography | — | metadata, not a locator (R11); target checked: DLB17 Thm 9.7, lines 1967–1999, correct |
| Target (theorem) | GR.4/galois-socle | CDN20 Cor. 2.16 (lines 1108–1112), CDN23 Thm 5.1 (2081–2087), Thm 5.10 (2237) | correct apart from R05, R06 |
| Direct prerequisites | GR.5/finite-dual-multiplicity | CDN23 Thm 5.22, lines 2422–2429 | Paškūnas–Tung Cor. 6.7 = parent §6.7; Cor. 4.21 is in the SZ board package (R03) |
| Unit tests | GR.1/residue-pairing | DLB17 lines 1555–1569 | residue and threshold Checks correct; higher-weight Check conservative (R13) |

Further page checks: CDN23 Thm 5.1 p.50, Prop. 5.7 p.51, Thm 5.8 p.52, Def. 5.14 p.54, Cor. 5.17 p.56, Prop. 5.21 p.57, Thm 5.24 p.59; CDN20 Cor. 2.1 p.20, Rem. 2.3 p.21, Prop. 2.5 p.22, Lemme 2.7 p.23, Prop. 2.12 p.25, Thm 2.15 p.27 (author pages): all agree with the README. The DLB17 theorem numbers cited (1.2, 1.3, 1.4, 1.9, 1.10, 3.5, 5.1, 6.3, 6.4, 7.3–7.11, 8.2–8.8, 9.1–9.16, 10.1–10.11, 11.1–11.13, 12.1–12.4) all exist in arXiv v2 with the stated content.

**Adversarial pass** (one row per target; values computed by the reviewer):

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Convention: inverse-pullback Lie action | f on Ω | u⁺f=−f′, a⁺f=−zf′, a⁻f=zf′, u⁻f=z²f′; equals DLB17 Lemma 3.5 (k=0: a⁺=u⁺∂+1) | sound | — |
| Convention: dual action | z acting by χ(z) | (zℓ)(v)=ℓ(z⁻¹v)=χ(z)⁻¹ℓ(v) | sound | — |
| Convention: levels, p-quotient | ϖ_D²=pu | pO_D=ϖ_D²O_D, DLB r ↔ CDN 2r (Endoscopic §12.4: ϖ_E-level m ↔ 2m); p∈Z(G) (DLB17 line 130) | sound | R06 |
| GR.0 level-types | r=1; JL(M)(p)≠1 | 1+pO_D=1+ϖ_D²O_D; zero p-quotient sector | sound | R06 |
| GR.0 isotypic-dual-adapter | Z=W⊗JL(M) | Hom_D(JL(M),Z)=W⊗End JL(M)=W | sound | G1 → target (R01) |
| GR.0 period-line-parameter | V_{M,ℒ} | C⊗V≅(L⊗C)⊕(L⊗C)(1) (CDN20 Rem. 2.8): dim 2, weights 0,1; D_pst=M[−1] (CDN20 line 885) | sound | — |
| GR.1 unfiltered-nrig | two lines | D⁺=tN⁺+L_∞[[t]]⊗ℒ (DLB17 Rem. 7.10); N⁺/D⁺≅L_∞⊗M_dR/ℒ, killed by t; distinct ℒ give distinct D⁺ | sound | — |
| GR.1 nontrianguline-differential-control | rank-one trivial | ∇1=0, so P(X)=X fails injectivity | sound | G2 narrowed (R07) |
| GR.1 p-finite-vectors | trivial rep; 0 | trace^k acts by p^{nk}≠0, so not infinite slope; 0 in both | sound | — |
| GR.1 kirillov-functions | ⋃_{j≥0}p^jℤ_p× | closure ℤ_p compact in ℚ_p, not compact in ℚ_p×; ∂_b[ε(bx)e^{tbx}]₀=tx | sound | — |
| GR.1 kirillov-model | (a,b)=(0,1); general | ∇(∇−1)=t²∂² gives u⁻=−t∂²; C=u⁺u⁻+u⁻u⁺+h²/2=((a−b)²−1)/2, 0 at (0,1) | sound | — |
| GR.1 residue-pairing | V=L(j) | orthogonal of N⁺(V̌) is tN⁺(V) for all j | true; restriction unnecessary | R13 |
| GR.1 kirillov-duality | trivial rep | P-smooth but not infinite slope; Π^{(1 ℚ_p;0 1)}=0 (DLB17 line 1632) | sound | — |
| GR.2 nrig-projective-line-sheaf | w | w²=1; line independence = parent §4.2a | duplicate | R02 |
| GR.2 common-image | two lines | equality inside tN_rig⊠ℙ¹ (DLB17 Thm 8.6) is stronger than §4.11 | sound refinement | keep, state difference |
| GR.2 pi-zero | — | same object as `AnalyticBoxtimes.analyticQuotient` | duplicate | R02 |
| GR.2 closed-unipotent | functions | u⁺(zf)=−f−zf′=(a⁺−1)f | sound | R02 |
| GR.2 homography | g=(a b;c d), w, translation | g∂g⁻¹=g⁻¹z=(dz−b)/(a−cz); cg⁻¹z+d=det/(a−cz) gives gu⁺g⁻¹=det⁻¹(a−cz)²u⁺; w: ∂⁻¹; translation: ∂−b; (c·g∂g⁻¹+d)(a−c∂)=det is one-sided (E7) | sound | keep as refinement |
| GR.2 resolvent-analyticity | x∈ℚ_p | z−x∈O(Ω)×, so ∂−x invertible | sound | R02 |
| GR.2 holomorphic-action | x≠y; constants | 1/(z−x)−1/(z−y)=(x−y)/((z−x)(z−y)); T_c=c | sound | R02 |
| GR.2 automatic-linearity | — | same as parent `map_linear` | duplicate | R02 |
| GR.2 pi-zero-irreducible | — | source locator | sound statement | R12 |
| GR.3 nonzero-comparison | twist | DLB17 line 1198 ignores an unramified twist (E3) | sound | R02, gap on parent |
| GR.3 surjectivity | rank | D×/p^ℤ(1+p^rO_D) acts simply transitively on fibres over Ω (Σ₀=Ω⊔Ω), so rank of Hom_D(ρ,O(Σ_r)) is dim ρ | sound | R02 |
| GR.3 pi-two | aI₂, (1 b;0 1), w | a²·a⁻²=1; factor 1; (−1)(−∂)⁻²=−∂⁻²; on forms (g⁻¹)′=det/(a−cz)² = DLB cocycle (line 2401) | sound | R02 |
| GR.3 kirillov-independence | Γ on t⁻¹N⁺/N⁺ | γ acts through χ(γ)⁻¹ before untwisting (E9) | sound | keep as refinement |
| GR.3 smooth-kernel | one vs two lines | one line gives one copy; dim M_dR=2 gives two | sound | R02 |
| GR.3 filtration-position | ℒ≠ℒ′ | rank-two alternating form: ℒ^⊥=ℒ, reconciling DLB's ℒ^⊥⊂M*_dR with CDN's ℒ⊂M_dR; two lines span | sound | R02 |
| GR.3 injectivity | fixed radius | the parent's §6.9 (parent line 2381) repeats the unfixed step | sound here | R02 (gap on parent) |
| GR.3 analytic-realisation, de-rham-realisation | — | same as `functions_dual`, `deRham`, `filtration_preimage` | duplicates | R02 |
| GR.4 partial-operator-extension | d=2, Ae₁=e₂; S=0; S=E | companion column −λ₁λ₂e₁+(λ₁+λ₂)e₂: trace λ₁+λ₂, det λ₁λ₂; printed all-positive column has det −λ₁λ₂; S=E forces E=0 | sound | G11 → target |
| GR.4 period-multiplicity-spaces | V=L; V=0 | H_C(L)=C^{G_F}⊗L=F⊗L; zero | sound | — |
| GR.4 hom-fundamental-diagram | — | matches CDN20 Prop. 2.4 | sound | R05 |
| GR.4 period-multiplicity | dim V=2 | CDN20 Prop. 2.5(i),(ii); Lemme 2.7 | sound | — |
| GR.4 analytic-line-extension | e ↦ ae | dual generator a⁻¹e*, evaluation unchanged; ℒ⁻¹=M*_dR/ℒ^⊥ (CDN20 line 933) | sound | R05 |
| GR.4 orbit-bounded | ℤ on ℚ_p by pⁿ | ‖pⁿx‖=p^{−n}‖x‖→∞ as n→−∞ | sound | R09 |
| GR.4 etale-bounded | — | CDN23 Prop. 5.6 | sound | — |
| GR.4 bounded-duals | — | CDN23 Lemme 5.3 a)–c) | sound | — |
| GR.4 finite-dimensional-multiplicity | nonsplit V | CDN20 Thm 2.15 with coefficient extension (note 15) | sound | — |
| GR.4 steinberg-comparison | aI₂ on St⊗η_G | η(det aI₂)=η(a²)=η(Nrd a) | sound | — |
| GR.4 banach-differential-multiplicity | χ(p)=1+p; p=7 quadratic ω | Hom=0 versus stated ℒ⊗JL(M); GR.3 not applicable | overclaim | R05, R06 |
| GR.4 banach-etale-multiplicity | same | same | overclaim | R05, R06 |
| GR.4 galois-socle | dim≥3; same twists | 0 (CDN20 Cor. 2.16(ii)); twists as above | overclaim | R05, R06 |
| GR.5 arithmetic-completion | lim_k(L⊗torsion) | H⁰_k finite gives colim_K H^j(G_K,H⁰)=0, j=1,2 (CDN23 lines 2327–2328); L⊗(ℤ/p^k)=0 | sound | — |
| GR.5 integral-reduction | — | CDN23 Cor. 5.17, Prop. 5.19 (G′=G/(ϖ 0;0 ϖ)^ℤ) | sound | — |
| GR.5 block-multiplicity | X=Y⊗JL(M) | Hom_{G×D×}(P⊗JL(M),Y⊗JL(M))=Hom_G(P,Y) | sound | — |
| GR.5 integral-block-evaluation | — | CDN23 Prop. 5.21 | sound | G12 owner |
| GR.5 finite-dual-multiplicity | — | CDN23 Thm 5.22 | sound | R03 |
| GR.5 level-and-central-character | averaging | inverse centres (CDN23 Rem. 5.23(ii)); averaging divides by p-powers, so no integral claim | sound | — |
| GR.6 interpolated-banach-dual | R=0; parent family | zero; parent fibre Π(ρ_x(ε)) versus Π(ρ_x)* | sound | R07 (G13) |
| GR.6 special-family | η=1 | equals CDN23 §5.2 (line 2247) | sound | — |
| GR.6 type-annihilator | — | CDN23 Thm 5.24(i) | sound | G14 owner |
| GR.6 typed-multiplicity-structure | — | Ř = continuous L-dual; local freeness unproved in source | sound | G15 split |
| GR.6 factorisation | Ř | printed Ř=Hom(Ř,L) is recursive (CDN23 line 2311) | sound as corrected | — |
| GR.7 weighted-action | gh | (a−cz)(a′−c′g⁻¹z)=(aa′+bc′)−(ca′+dc′)z: cocycle; aI₂ acts by a^{−k}; k=2 with det is (10) | sound | — |
| GR.7 weighted-realisation | k=0 | DLB17 Rem. 11.12 row; O(2)⊗det=Ω¹ (Lemma 3.5(c)) | sound | G16 owner |
| GR.7 original-breuil-strauch | two lines | basis (ℒ,ℒ′) leaves a diagonal ambiguity (DLB17 lines 2776–2781) | sound | G8 split |
| GR.7 iwasawa-invariants | indices | DLB17 Thm 1.9 uses n twice; condition supplied by PhiGamma §5.7 | sound | R07 (G17) |
| GR.7 infinite-primitives | Σ₀=Ω⊔Ω | f=(1,−1) has primitives (zʲ/j!,−zʲ/j!) and is not pulled back from Ω | correct correction of DLB | G16 owner |
| GR.7 filtered-derived-realisation | filtration | F⁰=[0→Ω¹] (DLB17 line 2818) | sound | G18 split |
| GR.7 boundary-sheaf | disjoint opens | product of germs; Conjecture 12.4 kept as expectation | sound | — |

**Library declarations opened** (Mathlib 6b7abb3c): `Representation` (Mathlib/RepresentationTheory/Basic.lean:48); `Bornology.IsVonNBounded` (Mathlib/Analysis/LocallyConvex/Bounded.lean:61, needs only a seminormed ring and a topology: no Hausdorff or local convexity); `NormedSpace.isVonNBounded_iff'` (Bounded.lean:491, nontrivially normed field, seminormed group); `NormedSpace.image_isVonNBounded_iff` (Bounded.lean:495); `Submodule` (Mathlib/Algebra/Module/Submodule/Defs.lean:39); `LinearMap` (Mathlib/Algebra/Module/LinearMap/Defs.lean:84); `Module.finrank` (Mathlib/LinearAlgebra/Dimension/Finrank.lean:61); `Module.Basis` (Mathlib/LinearAlgebra/Basis/Defs.lean:89); `WithSeminorms.isVonNBounded_iff_seminorm_bounded` and `…image…` (Mathlib/Analysis/LocallyConvex/WithSeminorms.lean:575, 595); `WithSeminorms.banach_steinhaus` and `BaireSpace.instBarrelledSpace` (Mathlib/Analysis/LocallyConvex/Barrelled.lean:164, 122). Tau Ceti a91d3aa has no Drinfeld-cover, Kirillov, Robba, locally analytic or Banach-representation carrier (search of `TauCeti/`); its `TauCeti/Analysis/LocallyConvex/Bounded.lean` only treats products of bounded sets.

**Cross-roadmap citations resolved.** 88 distinct external citation strings (163 occurrences) were checked against the parent at 29fce9f, PhiGammaModulesAndIwasawaCohomology, PadicHodgeTheory, SmoothRepresentationsOfLocalGroups, LocalGaloisDeformationRings, CompletedCohomologyAndLocalGlobalCompatibility, GL2AutomorphicRepresentationsAndTransfer, EndoscopicTransferAndUnitaryTraceComparison, LocallyAnalyticDistributions and PadicDifferentialEquationsAndRigidCohomology at their heads, LocalGaloisGroups on main, and the three board packages. Every one resolves by content (R04 table) except those of R03.

**Shape.** 59 targets: 8 definitions, 14 constructions, 37 theorems. Every definition and construction has 4–6 API bullets (99 in all) and 3–4 Checks (73 in all). Every target has a locator and direct prerequisites. The 18 gap slugs agree between README and plan.json.

**Gaps.** Precision and minimality were checked gap by gap: R01 (owners), R07 (already provided), R08 (compound).

**Headline theorems** (step 7 applies to the package; recorded for it): the functions and de Rham realisations (parent §6.9), the Galois and Banach multiplicities (galois-socle, banach-etale-multiplicity), finite length of Π_M(V), the factorisation, the Iwasawa invariants, the corrected infinite-primitives containment, the filtered derived realisation and the original Breuil–Strauch comparison. None is statable at the pins (no Drinfeld covers, locally analytic or Banach representation categories, or p-adic correspondence in Mathlib 6b7abb3c or Tau Ceti a91d3aa). Suggested.lean should state none of them and say why. The linear-algebra lemma partial-operator-extension is statable, but it is not a headline.

**Ownership against open work.** Checked with `roadmaps grep` over all 330 open roadmap pull-request heads and main. The objects searched were Breuil–Strauch, Π(π,0), the Drinfeld tower, infinitely primitivable functions, P-finite vectors, Kohlhaase, Morita duality and CDN23. Only the roadmaps handled in R02, R04 and R07 touch them, plus ClassicalAdicEtaleCohomology, which uses CDN23 §2 for integral étale comparisons and is a candidate owner for part of G7. The brief named its sibling checkouts without paths; the grep tool covered their heads.

**Lean.** Not available (this lane does not elaborate); the design has no Lean file, so no `#check` binder comparison was possible.

## Not verifiable

- DLB17 printed page numbers: the Annals copy's open-access status could not be confirmed, so the review read arXiv v2 (numbering agrees, pages differ). Printed pages in the README are unverified.
- CDN20 publisher copy (JAMS, paywalled): the "published p." cross-references and E14's publisher text were not read.
- E5 (Thm 8.3 proof), E6 (Prop. 8.4 generation over D(Γ), DLB17 lines 1778–1779 located; KPX Prop. 4.3.8 not read) and E9 were located but not re-derived.
- Works named in the README but not fetched: Frommer, Kohlhaase, Teitelbaum, Dospinescu's thesis, the Colmez paper on Π(π,0), Kedlaya's book, KPX.
- Board job issues were not queried through the API; the three board packages were read from the board's main branch.

## Source issues

- **Error** in DLB17 at Théorème 1.10 (arXiv v2 p.11): the source says every infinitely primitivable function on Σ_n lies in O(Ω); it should be locally constant functions times O(Ω), since Σ₀ is two copies of Ω; affects a stated result.
- **Gap** in DLB17 at proof of Théorème 1.10 (§12.1, arXiv v2 p.66): the source says Théorème 1.2 applies to every nontrivial D× type; it should be a separate argument for one-dimensional types and nontrivial central characters; affects the proof.
- **Error** in DLB17 at Proposition 7.7(b) (arXiv v2 p.38): the source says the orthogonal of the unfiltered lattice is t^k times it for weights 0,k; it should be t times it for every k; affects a stated result.
- **Gap** in DLB17 at Théorème 9.7, proof (arXiv v2 pp.47–48): the source says invertibility of a−c∂ follows from a one-sided identity; it should be completed by a right inverse, e.g. from the identity for g⁻¹; affects the proof.
- **Gap** in DLB17 at Théorème 9.9 (arXiv v2 p.48): the source says the O(Ω)-module structure is unique, with no continuity condition; it should be unique among structures with f ↦ f·ℓ continuous; affects a stated result.
- **Gap** in DLB17 at proof of Théorème 5.1 (§5.3, arXiv v2 p.30): the source says an unramified twist of the globalized representation may be ignored; it should be removed by a global character before taking isotypic parts; affects the proof.
- **Gap** in DLB17 at Remarque 11.13 (arXiv v2 pp.65–66): the source says agreement on two filtration lines fixes the comparison; it should be three distinct lines, since two leave a diagonal ambiguity; affects the proof.
- **Gap** in DLB17 at §12.2, before Proposition 12.2 (arXiv v2 p.67): the source says Théorème 10.1 puts the whole de Rham complex of Σ_n in the coadmissible derived category; it should be restricted to the supercuspidal isotypic parts that theorem covers; affects the proof.
- **Misprint** in DLB17 at Théorème 1.9 (arXiv v2 p.11): the source says n for both the cover level and the cyclotomic level; it should be two different indices; affects nothing.
- **Misprint** in CDN20 at Lemme 2.18, proof (author p.30): the source says the last companion column uses all-positive elementary symmetric functions; it should be alternating, the coefficient of e_{n+1−k} being (−1)^{k+1}σ_k; affects the proof.
- **Misprint** in CDN20 at Proposition 2.5, proof (author p.22): the source says the Hom has dimension 0 or 1 according as D_pst(V*) is or is not M[−1]*; it should be 1 or 0 respectively; affects nothing.
- **Misprint** in CDN23 at Théorème 5.15 (p.55): the source says Ř is Hom(Ř,L); it should be the continuous L-dual of R; affects nothing.
- **Misprint** in CDN23 at Proposition 5.7 and Théorème 5.8 (pp.51–52): the source says the case condition on the p-quotient tower is M of level ≤ n; it should be M∈ΦNᵖ_n; affects a stated result.
- **Gap** in CDN23 at Proposition 5.7, proof (p.51): the source says DLB's main theorem applies to every supercuspidal M∈ΦNᵖ, though DLB assumes trivial central character; it should be proved for general central characters; affects the proof.
- **Gap** in CDN23 at Théorème 5.24(ii), proof (p.60): the source says the L-duals are finite locally free over R_{B,M}, without argument; it should be proved on each PID factor; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "3e0777d", "job": "REV-DESIGN-PadicLocalLanglandsForGL2QpPartII", "model": "opus", "worker": "fable-rev16"} -->
