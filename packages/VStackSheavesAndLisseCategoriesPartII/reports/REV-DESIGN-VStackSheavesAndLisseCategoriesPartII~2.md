<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/441#issuecomment-6408376925 -->
Review (claude) of 99411c4

Verdict: needs changes

1. **F01** (P2) The scheme-local-terms gap is compound and partly asks for what this roadmap derives itself

   **Location:** `design/README.md:176` (and `design/plan.json`, gap `VS-PII/G-scheme-local-terms`): "scheme cohomological correspondences and their pullback and restriction must extend to arbitrary D_ét complexes, while trace classes, local terms and base change must extend to f-ULA complexes … compatibly with perfection."

   **Claim:** One declared gap with one `needs` sentence, as the intake announces on the supplier's job.

   **Witness:** The sentence asks two sections (§6.2, §6.3) for three results joined by "while"; "compatibly with perfection" is what VS10.8 step 1 (line 1854) itself derives from SchemeAndStackFoundations §0.24 and §0.23a. At its head, EtaleDualityAndPerverseSheaves §§6.2–6.3 (README lines 6292–6296, 6578–6582) restricts Λ to finite ℓ-power-torsion rings or ℤ_ℓ/ℚ_ℓ-finite and complexes to D^b_ctf: the missing input is the coefficient range.

   **Exact repair:** Split into two gaps, one sentence each, same slugs in `plan.json` and under "Supplier gaps":
   - `gap:VS-PII/G-scheme-correspondences`, supplier EtaleDualityAndPerverseSheaves §6.2: for every commutative Λ with nΛ = 0 and n invertible in k, cohomological correspondences between objects of D(X_ét, Λ) on separated finite-type k-schemes, with composition, pullback along morphisms of correspondences and open restriction. Prerequisite of VS10.7 and VS10.8.
   - `gap:VS-PII/G-scheme-local-terms`, supplier EtaleDualityAndPerverseSheaves §6.3: for the same Λ and k separably closed, trace classes tr_c(u, F) ∈ H⁰(Fix(c), K_{Fix(c)}) and local terms of f-ULA complexes on separated finite-type k-schemes, compatible with base change along extensions of k. Prerequisite of VS10.8.
   Delete "compatibly with perfection" (VS10.8 step 1 keeps the perfection step with its SchemeAndStackFoundations citations). Test: Λ = F_ℓ[t] (infinite, killed by ℓ) lies in each `needs` and outside §6.2–6.3 as supplied; nothing in either `needs` is provided on main or at the supplier's head.

2. **F02** (P3) The Liu–Zheng correction misattributes where Gulotta–Hansen–Weinstein cite the partial-adjoint theorem

   **Location:** `design/README.md:2263`: "The partial-adjoint theorem cited as Proposition 1.4.4 in GHW22 is Proposition 2.2.4 in the version used here".

   **Claim:** GHW22 cite an older numbering of *Enhanced six operations*.

   **Witness:** GHW22 line 219 cites "[LZ12b, Proposition 1.4.4]"; its bibliography (lines 1635–1637) has [LZ12a] = arXiv:1211.5948 and [LZ12b] = arXiv:1211.5294 (the gluing paper). LiuZhengGluing v4 has no Proposition 1.4.4 and no partial-adjoint statement; LiuZhengEnhanced line 3906 (p. 79) is Proposition 2.2.4 (partial adjoint).

   **Exact repair:** Rewrite the bullet: GHW22 attribute the partial-adjoint theorem to the gluing paper (arXiv:1211.5294) as Proposition 1.4.4; in the arXiv v4 texts it is *Enhanced six operations* Proposition 2.2.4, pp. 79–80, and the gluing paper contains no such proposition. Add the matching GHW22 misprint to `plan.json` `sourceIssues` (the README lists 11 corrections, the plan 10). The gap text "LiuZhengEnhanced v4 Proposition 2.2.4, pp. 79–80" is right and stays. Tested: LiuZhengEnhanced page marker 79 precedes line 3906; Remark 2.2.5 is on p. 81.

3. **F03** (P3) SmoothRepresentationsOfLocalGroups SR.3 is cited as a consumer for a statement it does not make

   **Location:** `design/README.md:1955`: "SmoothRepresentationsOfLocalGroups:SR.3: for admissible finite-length representations the trace distribution is the Harish-Chandra distribution character."

   **Claim:** SR.3 states the distribution character and uses VS11.3 for it.

   **Witness:** At the head of its pull request the SmoothRepresentationsOfLocalGroups README contains no "distribution character" and no "trace distribution"; its SR.3 subsections (lines 2479–2851) are cuspidal support, the Bernstein centre, tempered representations and Iwahori blocks. SmoothRepresentationsOfLocalGroups is earlier in the merge order (ORDER.txt line 21), so it cannot consume VS11.3.

   **Exact repair:** Delete the bullet. Add one clause to "Scope and ownership": for Λ = ℂ and a finite-length admissible representation placed in degree 0, tr.dist(M) is the Harish-Chandra distribution character h dμ ↦ tr(π(h dμ)); no roadmap on main or earlier in the order states it (AutomorphicSpectralTheory §6 treats automorphic trace distributions; the open GanGrossPrasadUnitaryGroups roadmap requests local distribution characters from AutomorphicSpectralTheory as a gap). Tested on G = ℤ/2, Λ = F_3, M the sign representation: tr.dist(M)(1_{σ} ⊗ counting) = −1, the character value.

4. **F04** (P3) Residues of the repairs and house style

   **Location and witness, item by item** (`design/README.md`):
   - Line 1617: VS9's Dependencies line cites `EnhancedDerivedSheaves:E5:spectra-comparison`; after the F06 repair no VS9 target needs it (VS9.1 needs §E5:abstract.1 at line 1228; VS9.4 needs DGAInfinity Layer 5 at line 1336). Replace by `EnhancedDerivedSheaves:E5:abstract`.
   - Line 1423: "(HKW22 the corrected tensor target in Corrections to the sources corrected)" is not a sentence. Write "(HKW22 Definition 4.3.4, with the target corrected in Corrections to the sources)".
   - Lines 1445, 1635, 1638, 2104: catalogue identifiers "liftAlong", "pushAlongProper", "omega", "comp" are used as if declared; no README definition and no acceptance file carries them. Replace each by the prose name of the fact (the unique lift of Lemma 1.11; the pushed endomorphism; the description of ΩCoCorr_S; compatibility of κ with composition).
   - Line 497: "recorded in DiamondEtaleCohomology" cites a roadmap without a section and outside the supplier contracts. Cite its §17 target (its README records Sch17 Propositions 17.3 and 17.6 at lines 897–1101 of the head) in the contracts, or drop the mention and keep EnhancedDerivedSheaves E2.
   - Lines 1415 and 1447 (VS9.7): "morphisms proper p with p_∗ω = ω′" and "For proper q, p" — the only remaining bare "proper" after F11; write "proper nice" as VS9.6 and VS10.1–VS10.6 do (the convention at line 35 covers it, but the statement should not depend on it).
   - Needs lines with duplicated items: 313 (S4.4 twice), 359 (S0.2 three times), 424 (S4.4 three times), 651 (S1.5 four times), 732 (S2.4 twice); lines 1165 and 1903 end with a second sentence "VStackSheavesAndLisseCategories VS4/classifying-stack-equivalence." after the list's full stop. Merge into the semicolon list.
   - Layer Dependencies lines omit layers their targets need: VS10 (line 1878) omits VS6 (VS10.5, line 1756); VS11 (line 2257) omits VS6 and VS7 (VS11.5–VS11.8, lines 2011, 2048, 2071, 2111); VS8 (line 1204) omits `DiamondsAndVStacks:D4` and `DiamondSixOperations:S2`, `:S3` (VS8.4, line 1035).
   - Line 244: "the conventions use … and records the difference" (number agreement).

   **Claim:** The README is timeless prose whose backticked or catalogue names are declarations and whose layer dependency lines are complete.

   **Exact repair:** As listed; each is a text edit with no mathematical content. Test: `grep` for `liftAlong|pushAlongProper|, omega\)|, comp\)|spectra-comparison|corrected\)` returns nothing; every layer's Dependencies line is the union of the roadmaps and layers in its `*Needs:*` lines.

Reviewed at head 99411c4 of the board pull request (the checkout was already at that head). Files reviewed: `packages/VStackSheavesAndLisseCategoriesPartII/design/README.md` (2298 lines), `design/plan.json` (65 targets, 5 gaps, 10 source issues), `sources.toml` (8 entries). Round 1 had 14 findings (3 P1, 4 P2, 7 P3); the repair report marks F01 and F07 "not actionable in this package" and the other 12 applied. Every round-1 finding is checked below at this head. This round: 4 findings, 1 blocking (P2), 3 P3.

## Round-1 findings at head 99411c4

- **F01 (P1), repaired differently (declared gaps), not re-raised.** The unowned `G-liu-zheng` gap is gone (`plan.json` count 0) and replaced by four gaps with supplier EnhancedDerivedSheaves §E3.4 and one-sentence `needs` each (README lines 168–174; `plan.json` gaps 1–4 with `neededBy` VS7.4 and VS7.5). VS7.4's Needs (line 692) and VS7.5's Needs (line 732) cite all four slugs; VS7.5 step 3 (line 726) names `gap:VS-PII/G-descent` with GHW22 Theorem 4.9 as the specialization of LiuZhengEnhanced Theorem 4.1.8(1) (LiuZhengEnhanced line 5220, p. 105; P5bis at line 5094). Minimality: EnhancedDerivedSheaves §E3.4 on main (README lines 1229–1300) states coherent ringed diagrams, coefficient towers, coherent mates and cutoff adjoints, none of the four results. Both Liu–Zheng papers are in `sources.toml`. The repair's "not actionable" reason (the supplier's scope is a maintainer decision) is right, and the brief's gap contract is the mechanism; nothing to re-raise.
- **F02 (P1), repaired.** `G-lsep-representability` is absent from `plan.json` (count 0) and from the README; no `neededBy` points at VS6. VS6.11 step 5 (line 523) keeps the restriction and says Rf_! ≅ Rf_* for arbitrary proper fine maps is not claimed; Corrections line 2266 records it.
- **F03 (P1), repaired.** Line 271: the base change ℤ_p × S → S carries the noninvertible sheaf of distributions (FS21 Remark IV.1.10, line 4198, p. 110); Rq^!Λ = Haar(ℤ_p, Λ) ≅ Λ is invertible but does not commute with that base change. Recomputed: over F_ℓ, on a coset x + pⁿ⁺¹ℤ_p not containing 0 inside pⁿℤ_p, δ₀ gives 0 and the normalised Haar measure gives p^{−n−1} ≠ 0, so the germs at 0 are independent and the stalk has dimension ≥ 2.
- **F04 (P2), repaired differently but correctly.** VS9.2 (line 1254) states the square as f ∘ e ⇒ e′ ∘ f; step 1 (line 1260) uses (f ⊗ f^{!∨}) ∘ coev_X ⇒ coev_{X′} from the counit and ev_X ⇒ ev_{X′} ∘ (f^{!∨} ⊗ f) from the unit; VS10.1 (lines 1629, 1637) uses 𝔮 ∘ 𝔣 ⇒ 𝔣′ ∘ 𝔮 and the matching triangles; the empty-correspondence Checks are at lines 1274 and 1649. LZ22 (1.3) (line 252) is (f ⊗ f^{!∨}) ∘ coev_X ⇒ coev_{X′} via ε_f, and its (1.4) (lines 253–255) is written for ev : Y ⊗ Y^∨ → 1; under the README's Mathlib orientation ev : X^∨ ⊗ X → 1 the correctly typed transpose is ev_X ⇒ ev_{X′} ∘ (f^{!∨} ⊗ f), as the fix report says (round 1's "f ⊗ f^{!∨}" would not compose). Pasting recomputed: tr(e) ⇒ ev_{X′} σ (f e ⊗ f^{!∨}) coev_X ⇒ ev_{X′} σ (e′ f ⊗ f^{!∨}) coev_X ⇒ tr(e′). LZ22 Construction 1.7 (line 248) uses β : f ∘ v ⇒ v′ ∘ g, the same direction.
- **F05 (P2), repaired.** Lines 23, 156, 160, 164 import PivotalSpherical Layers 2 and 7, AdicSpacesPartIII §R3.8 and DGAInfinity Layer 5; VS9.1 (line 1216) keeps only the bicategorical extension; VS9.4 (lines 1322, 1332) uses the projective-module trace. The six restated names are absent from README and `plan.json`. PivotalSpherical on main: Layer 2 (lines 318–351: left/right trace, cyclicity, monoidality, unit value, for a general rigid monoidal category per line 90), Layer 7 (lines 477–498: symmetric rigid ⇒ pivotal and spherical, trace = linear trace). AdicSpacesPartIII on main: R3.8 at line 11858, *projective-module-trace* 11860, *projective-trace-realization* 11890, `LinearMap.projectiveTrace_nonfree` listed at line 662. Check line 1343 recomputed: 3² ≡ 3 (mod 6), tr_proj(id_P) = 3, `LinearMap.trace` (`Mathlib/LinearAlgebra/Trace.lean:75` at 6b7abb3) is 0 without a finite basis.
- **F06 (P2), repaired.** VS9.4 step 3 (line 1330): (c) ⇒ (d) proved here, (d) ⇔ (e) from DGAInfinity Layer 5 (its README line 463, "the compact objects are the perfect modules") and Stacks 07LT (Stacks07LT line 9463, "Proposition 80.3"), (e) ⇒ (c) from HKW22 Lemma B.1.2(2) (line 3545, p. 73); line 16 no longer claims the dualizability equivalence. Residue: line 1617 (R04).
- **F07 (P2), repaired differently (gap), with a residual defect (R01).** EDC.8 is gone (count 0); lines 18, 27, 113–116, 1819, 1860 cite §6.1, §6.2 (including `CohCorr.pullbackAlong`, `CohCorr.restrictOpen`) and §6.3, which exist at the supplier's head (lines 6219, 6284, 6428, 6430, 6563); line 27 states the supplied coefficient range correctly; VS10.7–VS10.8 keep the general statement through `gap:VS-PII/G-scheme-local-terms` with Λ = F_ℓ[t] Checks (lines 1840, 1867). The "not actionable" reason is right; the gap is the mechanism; its `needs` is what R01 repairs.
- **F08 (P3), repaired.** DiamondSixOperations at its head: S0.1 (line 120), S0.2 (151), S0.4 (216), S1.1–S1.5 (263–369), S2.3 (489), S2.4 (542), S3.1–S3.4 (591–664), S4.1–S4.5 (707–900), S5.4 (1030; `profiniteProjection_upperShriek_distributions` and `IsCohomologicallySmooth.quotient_free` for K of pro-order prime to ℓ), S5.5 (1070). EnhancedDerivedSheaves on main: E1.4 (580), E2.6 (2293; `hypercoverDescent` 2353), E3.2 (1153), E3.4 (1229), E5:abstract.1 (1440). SchemeAndStackFoundations on main: §0.23a (1508), §0.24 (1565), `perfection_universalHomeomorphism` (1577). Baseline pins are 6b7abb3 and a91d3aa; `TauCeti.IsSmoothDiscrete` read at `TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete/Basic.lean:272`. "S4/etale-maps-smooth" is gone. The resolver finds no unresolved citation or name.
- **F09 (P3), repaired.** VS8.9 (line 1152) cites the parent's VS4/classifying-stack-equivalence for derived invariants; VS11.1 (line 1890) cites it for M^∨ and SmoothRepresentationsOfLocalGroups §SR.0d.2 for admissibility (its line 1732 defines admissible complexes by perfect K-invariants for the cofinal family of compact opens of invertible pro-order, equivalent to HKW22's pro-p K since every compact open K of invertible pro-order contains a pro-p open subgroup and invariants under the quotient are a direct summand); VS8.5 (line 1046) takes `HaarMeasureWithValues` (its line 1037: left-invariant, finitely additive on compact opens, normalised measure under invertible pro-order); VS9.5 (line 1350) states the equivalence with `Module.IsReflexive`.
- **F10 (P3), repaired differently.** z ↦ az with a ≠ 0, 1 (lines 1694, 1736, 1872, 2244); Λ = F_3 (lines 1968, 2249); the Haar action pinned at line 40 and the ax+b Check at line 1076 (recomputed below); the C_F Check at line 1314; VS6.3 step 1 (line 284) picks a clean chart first (GHW22 line 1006 "Pick any chart" versus FS21 Remark IV.1.4, line 4105, which needs a separated U → X). The individual analytic local terms are replaced by their sum 2 (lines 1694, 1736); VS11.13's counterexample now uses a pseudo-uniformiser ϖ (line 2245).
- **F11 (P3), repaired.** Line 35 is a convention, not an overloading; "proper nice" appears in VS9.6 (lines 1374, 1376), VS10.1 (1629, 1631), VS10.2 (1655), VS10.3 (1677, 1679), VS10.4 (1702, 1704), VS10.6 (1782, 1784, with S and T decent). Residue in VS9.7 (R04).
- **F12 (P3), repaired.** Lines 2282–2286 describe a docstring-only acceptance file at 6b7abb3 and a91d3aa naming the four end theorems and VS7.5, VS9.9 as not statable, with no declarations planned.
- **F13 (P3), repaired.** No "atlas", "sourceIssues", "suggested declaration", "extraction brief", "Restructure proposal", "PAPER-ABE", "maintainer", round or pull-request references; gaps sit under "Exact supplier contracts" (lines 166–178); field lists are prose. Residues in R04.
- **F14 (P3), repaired.** `sources.toml` has 8 entries with unique keys (HKW22 with DOI and arXiv v4 and a version note; GHW22 v1; LZ22; Sch17; FS21; LiuZhengEnhanced; LiuZhengGluing; Stacks07LT), all `certified`; `cited_for` names the consuming layers.

## Verified sound

### Seeded sample (15 targets; seed = the job id; none chosen by heading)

Each target was checked for statement number, printed page, hypotheses and match against the cached texts (line numbers are those of the cached texts).
- **VS6.9 classifying-stack-of-group-diamond:** HKW22 Example 4.1.1, line 1053, p. 22; the source states the homomorphism description that the target corrects (line 1055).
- **VS6.4 decent-fibre-products:** GHW22 Proposition 4.5 and proof, lines 1011–1045, pp. 20–21 (charts from charts; cancellation via Proposition 4.3.iv); HKW22 list after Definition 4.1.7, line 1161, p. 24.
- **VS6.6 fine-morphism:** GHW22 Definition 1.3.i, line 102, p. 3; Remark 4.6, line 1047, p. 21; Remark 4.7, line 1095, p. 22; Proposition 4.8.o, line 1158, p. 23; HKW22 Definition 4.1.7 second paragraph, lines 1139–1148, p. 23.
- **VS6.3 decent-is-artin:** GHW22 Proposition 4.4 and proof, lines 1001–1010, p. 20; HKW22 line 1160, p. 24; FS21 Remark IV.1.4(ii), lines 4108–4115, p. 108 (separated U → X required, line 4105).
- **VS8.3 locally-profinite-distributions:** HKW22 Example 4.2.1, lines 1215–1228, p. 25 (H⁰(T_S, f^!Λ) = Dist(T, Λ)); Example 4.2.5 and (4.2.1), lines 1306–1317, p. 27.
- **VS8.9 classifying-stack-structure-map:** HKW22 Example 4.2.4, lines 1294–1305, p. 27; the four functors and K = Haar(G, Λ)^∗ match.
- **VS10.2 proper-pushforward-of-characteristic-classes:** HKW22 Corollary 4.3.9, line 1615, p. 33; LZ22 Corollary 2.22, line 933, p. 19.
- **VS11.9 kunneth-for-characteristic-classes:** HKW22 (4.5.2) line 1837 and Theorem 4.5.3 line 1840, both p. 38 (the README's range pp. 36–41 covers §4.5; the theorem and its proof are on pp. 38, 40–41); hypotheses (π and Δ_{T/S} cohomologically smooth, X_i → T fine, A_i ULA over S) match.
- **VS6.8 fine-cohomologically-smooth:** GHW22 Definition 1.3.ii, lines 114–127, p. 3; Remark 4.6, p. 21–22; HKW22 lines 1170–1175, p. 24.
- **VS7.9 relative-dualizing-complex:** HKW22 Definition 4.1.9, lines 1178–1185, p. 24 (S connected, f proper); ΩCoCorr_S, lines 1518–1528, p. 31 (p proper, p_∗ from the counit).
- **VS8.4 constant-locally-profinite-diamond-operations:** HKW22 Example 4.2.1, lines 1215–1228, p. 25; all four operations match.
- **VS10.1 relative-lefschetz-verdier:** HKW22 Theorem 4.3.8 and proof, lines 1572–1614, pp. 32–33 (p, q proper; unique 𝔣′; tr(p̃)); LZ22 Theorem 2.21 line 866 p. 18, Corollary 2.22 and Proposition 2.23 lines 933–940 p. 19.
- **VS8.7 classifying-stack-operations:** HKW22 Example 4.2.2, lines 1229–1252, pp. 25–26; FS21 Theorem V.1.1, lines 6484–6492, p. 168 (with the base change to Spa C).
- **VS11.3 trace-distribution:** HKW22 (4.4.1) and the paragraph before it, lines 1696–1701, p. 35; proof of Proposition 4.4.1, lines 1677–1693, pp. 34–35 (I_{h,μ} factors through M^K).
- **VS8.6 classifying-stack-is-decent:** HKW22 Example 4.2.2 and footnote 3, lines 1229–1243, pp. 25–26; Example 4.2.3, lines 1254–1265, p. 26.

All 15 pass. Also read for the findings and the changed passages: HKW22 §5.3 (lines 2318–2336, p. 48: β clopen with proper g : β → S; additivity) and Proposition 5.3.1 (line 2360, p. 49); Theorem 4.1.8 (line 1165, p. 24); Example 4.3.10 and Definition 4.3.11 (lines 1618–1636, p. 33); Proposition 4.4.1 (line 1657, p. 34); Definition 4.4.2 (line 1694, p. 35); GHW22 Theorem 4.9 (line 1419, p. 27), Proposition 4.14 (line 1594, p. 31), Theorem 3.14 (line 837, p. 17), Proposition 3.16 (line 928, p. 19); LZ22 Construction 1.7 (lines 225–255, pp. 5–6), Lemma 1.11 (line 397, p. 8), Remark 1.12 (line 420, p. 8), Lemma 2.9 (line 694, p. 14), Remark 2.7 (line 659, p. 13); FS21 Remark IV.1.10 (line 4198, p. 110), Proposition IV.2.32 (line 4972, p. 129), Theorem V.7.1 (line 7065, p. 183); LiuZhengGluing Theorem 5.4 (line 2057, p. 38) and Corollary 0.4 (line 145, p. 3, disjoint unions of qcqs schemes). No locator was flagged unverified by the author (`plan.json` count 0).

### Adversarial table

Rows cover the sampled targets, the headline theorems, every target a finding touches and every passage the repairs changed; unchanged VS7, VS9.6–9.12, VS11.2 and VS11.10–11.12 rows of the round-1 table carry computed values and were relied on.

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| Conv. Haar action (line 40) | ax+b group, g = diag(p,1); p = 2, Λ = F_5 | left Haar |a|⁻² da db; (a,b)(p,0) = (ap, b) ⇒ μ(Eg) = |p|⁻¹μ(E) = pμ(E); δ_SR(g) = μ(Eg⁻¹)/μ(E) = |p|; scalar 2 ≠ 1 in F_5 | ok; SmoothRepresentationsOfLocalGroups §SR.2.2 (its lines 1975–1976) uses μ(Ep⁻¹)/μ(E), so χ_G = δ_SR⁻¹ |
| Conv. coefficients | Λ = F_3 with p ≠ 3; Λ = F_ℓ[t] | 3Λ = 0; ℓΛ = 0 with Λ infinite | ok; the latter drives R01 |
| VS6.2 Check (F03) | q : S → [S/ℤ_p], Λ = F_ℓ | Rq^!Λ = Haar ≅ Λ (μ(ℤ_p) = 1); base change ℤ_p × S: δ₀ = 0 and μ = p^{−n−1} ≠ 0 on a coset avoiding 0 ⇒ stalk dim ≥ 2, not invertible | ok |
| VS6.3 | clean chart | FS21 IV.1.4 needs separated U → X; GHW22 proof takes any chart | ok (gap recorded) |
| VS6.4 | S ×_{BG} S, G finite | fibre G with |G| points; decent | ok |
| VS6.6 | [S/GL_n(ℤ_p)] → S; ∞-ball | top map of charts dim.trg n²; ∞ | ok |
| VS6.8 | q : S → [S/ℤ_p], M = C(ℤ_p, F_ℓ) | Rq^!M = Hom_{ℤ_p}(C(ℤ_p,Λ), C(ℤ_p,Λ)) = Dist(ℤ_p, F_ℓ) uncountable; Rq^!Λ ⊗ M countable ⇒ not smooth; fine (dim.trg 0) | ok |
| VS6.9 | S = Spd ℚ_p, G = 1, H = ℤ/2 | H¹(ℚ_p, ℤ/2) = ℚ_p^×/(ℚ_p^×)² of order 4 (p odd), 8 (p = 2) ⇒ maps not of the form φ_f | ok |
| VS7.9 | X = P¹_C | K = Λ(1)[2]; ∫ = trace H² ≅ Λ | ok |
| VS8.3 | T = Fin 3; ∅; ℤ_p over F_ℓ | Λ³; 0; μ(pⁿℤ_p) = p^{−n} ≠ 0, not a finite Dirac sum | ok |
| VS8.4 | T finite | f^!M = M^T, f_! = f_* | ok |
| VS8.5 | ℤ/3 over ℤ[1/3]; ℤ_p over F_p; ax+b | counting measure generates; μ(ℤ_p) = p·μ(pℤ_p) = 0 so Haar = 0; scalar p | ok |
| VS8.6 | GL_n(ℤ_p); ℚ_p^× | chart GL_n^♢ × S/G; open pro-p 1 + pℤ_p | ok |
| VS8.7 | G finite; ℤ_p | Rq_* = Rq_! = Λ[G] ⊗ −; Haar ≅ Λ by counting measure regardless of |G|; Rq_*Λ = C(ℤ_p, Λ) | ok |
| VS8.9 | G finite with |G| ∈ Λ^×; ℤ_p | Rf_! = M_G ≅ M^G; H^i(ℤ_p, Λ) = 0 for i > 0 since Hom(ℤ/p^k, Λ) = 0 (gcd(p, n) = 1); K = Haar^∗ ≅ Λ | ok |
| VS9.2 (F04) | square f e ⇒ e′ f; Y = ∅ | three 2-cells paste to tr(e) ⇒ tr(e′) (recomputed above); ∅ → P¹ exists, P¹ → ∅ does not; tr(0) = 0 | ok |
| VS9.3 | B terminal; L of rank 2 | C_F ≅ F(∗); End(L) = Mat₂(Λ); Lemma 1.11 direction g ∘ c ⇒ c′ ∘ f equals LZ22 (1.9) | ok |
| VS9.4 | Λⁿ; Λ ⊕ Λ[1]; ℤ/6 with P = 3Λ; ℚ[0] over ℤ | matrix trace; 1 − 1 = 0; 3 (3² ≡ 3) versus `LinearMap.trace` = 0; not compact, not perfect; (c) ⇒ (d) via RHom(M, ⊕N_i) ≅ ⊕(N_i ⊗ 𝔻M) | ok |
| VS9.5 | k = 1, κ²; ℤ/ℓ² with ℤ/ℓ ⊕ ℤ/ℓ²; F_ℓ^(ℕ) | evaluation bijective; length 3 on both sides; injective, not surjective | ok; carriers exist at the pin |
| VS9.6 | q♮ = (id, q) | unit Δ : X → X ×_{X′} X closed immersion (q separated); counit q proper; both proper nice | ok |
| VS10.1 (F04) | X = P¹, C = ∅, X′ = C′ = S | pushed u′ = 0 (p_* of anything on ∅ is 0); tr = 0 = ∫_∅; 2-cell ∅ → X | ok |
| VS10.2 | X′ = S, X = P¹ | ∫ cc = χ(P¹) = 2 | ok |
| VS10.3 | g = az, a ≠ 0, 1; closed disc, T ↦ T + p, char 0 | 1 + 1 = 2 in every characteristic; Fix = ∅ (p ≠ 0) but tr = 1 on RΓ = Λ | ok |
| VS10.4 | Λⁿ at S; ∅; id on P¹ | n; 0; only ∫ = 2 is a number | ok |
| VS10.6 | a = id; T a geometric point | identity; determined pointwise | ok; S, T decent is a restriction of HKW22 5.3.1 |
| VS10.7, VS10.8 (R01) | Λ = F_ℓ[t]; X = Spec k, c = id | Λ infinite, killed by ℓ: outside the supplier's finite-ring range (its lines 6292–6296); both traces of id on Λ[0] are 1; perfection handled in VS10.8 step 1 | R01 |
| VS11.1 | generators c-Ind_{K×K}Λ; (G×G)/ΔG | LHS (M^∨)^K ⊗ M^K = RHom(M^K, Λ) ⊗ M^K; RHS Hom(M_K, M^K) = RHom(M^K, M^K); iso iff M^K perfect (VS9.4 (b) ⇔ (e)); (g,h) ↦ gh⁻¹ well defined on cosets | ok |
| VS11.3 (R03) | ℤ/2 over F_3, sign; ℚ_p regular | I_{1_{1}} = id, trace 1; I_{1_σ} = σ, trace −1 = 2; C_c(ℚ_p)^{ℤ_p} of infinite rank | ok; R03 touches only the consumer bullet |
| VS11.4 | G finite, trivial Λ | cc = tr.dist = constant 1 | ok |
| VS11.5 | U = T × B | sides differ by Λ(1)[2] without the twist | ok |
| VS11.9 | T = S; X_i = T, A_i = Λ | tr(A ⊗ B) = tr A · tr B; both sides cc_T(Λ) | ok |
| VS11.12 | X = S | canonical trivialisation on both sides | ok |
| VS11.13 | g = az; ax+b with a ∈ 1 + ϖO, b ∈ O, U = G ∖ {1} | linear terms (a − 1)z, (a⁻¹ − 1)w ≠ 0; w(bw + a − 1) = 0 has a double root at a = 1, b ≠ 0: isolated but not étale | ok; correction E1 valid |
| Gaps G-enhanced-operation-map, G-partial-adjoints, G-restricted-nerves, G-descent | EnhancedDerivedSheaves §E3.4 on main | lines 1229–1300: ringed diagrams, coefficient towers, coherent mates, cutoff adjoints only; each `needs` one sentence; locators LiuZhengEnhanced 3906 (p. 79), 5220 (p. 105), LiuZhengGluing 2057 (p. 38), 145 (p. 3) | ok |
| Gap G-scheme-local-terms | — | two sections, three demands; "compatibly with perfection" supplied by VS10.8 step 1 | R01 |

### Library declarations opened at the pins

Mathlib 6b7abb3, read in a checkout at that commit: `Module.IsReflexive` (`Mathlib/LinearAlgebra/Dual/Defs.lean:212`); the finite-projective instance (`Mathlib/LinearAlgebra/Dual/Lemmas.lean:262`) and `Module.instFiniteDimensionalOfIsReflexive` (`Dual/Lemmas.lean:284`); `LinearMap.trace` (`Mathlib/LinearAlgebra/Trace.lean:75`, zero without a finite basis); `CategoryTheory.ExactPairing` (`Mathlib/CategoryTheory/Monoidal/Rigid/Basic.lean:77`) and `HasRightDual` (line 236); `SymmetricCategory` (`Monoidal/Braided/Basic.lean:366`); `Bicategory` (`Bicategory/Basic.lean:61`); `Bicategory.Adjunction` (`Bicategory/Adjunction/Basic.lean:89`); `Pseudofunctor` (`Bicategory/Functor/Pseudofunctor.lean:57`); `DerivedCategory` (`Mathlib/Algebra/Homology/DerivedCategory/Basic.lean:87`; no monoidal structure in that directory at the pin). Tau Ceti a91d3aa: `TauCeti.IsSmoothDiscrete` (`TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete/Basic.lean:272`); no structure, class or def named for diamonds, v-sheaves or v-stacks. The remaining Mathlib declarations of the supplier contracts (MonoidalCategory, LocallyConstant, charFn, CompactOpens, Module.Dual, IsDiscreteValuationRing, maximalIdeal, Module.Finite, FGModuleCat) were opened by round 1 at the same pin and were not re-opened.

### Cross-roadmap citations resolved

- VStackSheavesAndLisseCategories (head of its pull request): the 12 anchors VS0/artin-v-stack-definition (line 100), enhanced-smooth-descent (137), point-to-classifying-stack-not-smooth (153), shriek-pullback-for-smooth-stacky-maps (145), VS1/ula-definition-with-constructibility (240), ula-descent-and-smooth-locality (248), ula-dualizability-criterion (280), ula-relative-adjoints-and-calculus (288), ula-for-artin-v-stacks (351), smooth-ula-criterion (359), VS4/classifying-stack-equivalence (1232), VS5/ula-equals-admissibility (1416).
- SmoothRepresentationsOfLocalGroups (head): all 14 slugs (lines 699, 723, 764, 984, 1035, 1062, 1094, 1658, 1716, 1732, 1836, 1855, 1873, 1965); SR.1.1 at 982, SR.0d.2 at 1656, SR.2.2 at 1963. SR.3 (2479) does not state the distribution character (R03).
- DiamondsAndVStacks (head): the 10 D4–D6 slugs (lines 6047, 6562, 6635, 6849, 7157, 7311, 7963, 8400, 9228, 9301).
- AdicCoefficientsAndComparisons (head): the 6 L1/L3 slugs (lines 789, 934, 1443, 1468, 1498, 1543).
- DiamondSixOperations, EnhancedDerivedSheaves, SchemeAndStackFoundations, EtaleDualityAndPerverseSheaves, PivotalSpherical, DGAInfinity, AdicSpacesPartIII: under F05–F08 above.
- DiamondEtaleCohomology (head) records Sch17 §17 (lines 897–1101) but is cited without a section (R04).
- The citation resolver reports no cross-roadmap citation and no Lean name found nowhere (main and 367 open heads).

### Dependency gate output

    candidate: VStackSheavesAndLisseCategoriesPartII is not in the merge order yet; checked as if placed after VStackSheavesAndLisseCategories (the intake inserts it when its design is accepted)
    depcheck: 56 roadmaps, 640 edges, 0 problem(s)

No UPWARD or CYCLE line. Every cited supplier is on main or earlier in the merge order; PivotalSpherical and DGAInfinity are on main.

### Ownership and duplication by object

Searched main, the 367 open roadmap pull requests and the 8 board packages for: decent v-stacks, prespatial diamonds, enhanced operation maps, universal local terms (no match anywhere); Lefschetz–Verdier and cohomological correspondences (EtaleDualityAndPerverseSheaves Layer 6 for schemes, the supplier; GlobalShtukasAndFunctionFieldLanglands and others consume Layer 6); symmetric monoidal 2-categories (only EtaleDualityAndPerverseSheaves §6.2, the scheme CoCorr with `CohCorr.*` declarations; it defines trace maps concretely and not the abstract Lu–Zheng §1 prefix, so VS9.1–VS9.3 have no other owner); Hattori–Stallings traces (EtaleCohomologyFoundations on main delegates to `LinearMap.projectiveTrace`, consistent with F05; the TraceFormula roadmap of an open pull request is not earlier in the order); trace distributions and distribution characters (AutomorphicSpectralTheory §6 is automorphic; no roadmap on main or earlier in the order defines the local Harish-Chandra character; R03). HeckeStacksAndLocalShtukas at its head mentions none of these objects. The board packages index lists no overlapping package.

### Headline theorems, Lean form and padding

Headlines: the relative Lefschetz–Verdier formula (VS10.1), characteristic class equals trace distribution (VS11.4), the Künneth formula for characteristic classes (VS11.9), characteristic class on [X/G] equals the universal local term (VS11.12); deep intermediates VS7.5 and VS9.9. None is statable at the pins (no small v-stacks, D_ét, CoCorr_S, monoidal bicategories or enhanced operation maps in Mathlib 6b7abb3 or Tau Ceti a91d3aa, checked above); the README's acceptance-file section says so and plans no stand-in. VS9.5 is statable but is a supporting lemma, not a headline, and is correctly kept in the README. There is no `Suggested.lean` at the design stage, so the one-tactic probe and the `#check` binder comparison do not apply; elaboration: not available (this lane does not elaborate).

### Sources manifest

8 entries, unique keys, no duplicate work, every cited work recorded (HKW22 with DOI and arXiv v4 and a pagination note; GHW22 v1, the only public version; LZ22 v4; Sch17 v3; FS21 v4; both Liu–Zheng papers v4; Stacks 07LT, whose cached text labels the tag "Proposition 80.3"). No `uncertified` or `waived` entry; no missing text, so no `needs-references.toml` was created.

## Not verifiable

- Which version of the Liu–Zheng papers Gulotta–Hansen–Weinstein cite as "[LZ12b, Proposition 1.4.4]": only the arXiv v4 texts were read; older versions were not fetched (R02 is phrased against v4).
- The adaptation of FS21 Theorem V.7.1 to [S/G_S] (VS11.1 step 3) was checked at the level of the generator computation recorded in the table, not against a written proof.
- HKW22 §4.6 (VS11.10–VS11.12) and §4.5 beyond Theorem 4.5.3 were not re-read this round; the round-1 rows with computed values were relied on.
- Elaboration and `#check` comparison: not available (this lane does not elaborate), and there is no `Suggested.lean` at the design stage.

## Source issues

- **Misprint** in GHW22 at §2, item (3), p. 5: the source says the partial-adjoint input is [LZ12b, Proposition 1.4.4], the gluing paper; it should be Enhanced six operations (arXiv:1211.5948v4) Proposition 2.2.4, as the gluing paper v4 has no such proposition; affects nothing.
- **Error** in HKW22 at Example 4.1.1, p. 22: the source says morphisms [S/G] → [S/H] correspond to S-homomorphisms G → H; it should say H-torsors on S with a commuting G-action, homomorphisms arising after a trivialisation; affects a stated result.
- **Gap** in HKW22 at Theorem 4.1.8, p. 24: the source says GHW22 Theorem 1.4 gives (P1)–(P5), (BC1)–(BC2) and Rf_! ≅ Rf_* on all proper fine maps; it should say Theorem 1.4 gives agreement, pseudo-functoriality, projection formula, proper base change and the right adjoint; affects a stated result.
- **Misprint** in HKW22 at Definition 4.1.7, p. 23, and the paragraph after Theorem 4.1.8, p. 24, and Example 4.2.5, p. 27: the source says GHW22 Definitions 4.3 and 4.1, Propositions 4.17 and 4.11; it should say GHW22 v1 Definitions 4.1 and 1.1, Propositions 4.14 and 4.8(iv) with 4.5; affects nothing.
- **Error** in HKW22 at Example 4.3.10, p. 33: the source says Theorem 4.3.8 applies to any correspondence Y → X ×_S X with X proper; it should also require Y proper over S; affects a stated result.
- **Gap** in GHW22 at the proof of Proposition 4.4, p. 20: the source says FS21 Remark IV.1.4(ii) applies to any chart; it should first refine to a separated (clean) chart, as that remark assumes a separated map; affects the proof.
- **Error** in HKW22 at §4.6, closing remark, p. 44: the source says isolated fixed points of every element of a conjugation-invariant open U make the inertia étale over [U//G]; it should require the fixed locus over U to be étale, which fails for the affine group acting on P¹ at a = 1; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "99411c4", "job": "REV-DESIGN-VStackSheavesAndLisseCategoriesPartII~2", "model": "fable", "worker": "fable-rev190"} -->
