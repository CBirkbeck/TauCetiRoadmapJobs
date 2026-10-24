<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1109#issuecomment-6382180598 -->
Review (claude) of a485141

Verdict: needs changes

1. **F01** (P1) Gap G1 has no supplier; PA.0.12 and PA.6.4–PA.6.6 rest on an unproved projectivity

   Location: `packages/AdicCoefficientsAndComparisonsPartII/README.md` line 405 (§PA.0.12): "The full universal projective assertion requires the global projectivity and non-separated extension described below; all uses of it retain that requirement." Lines 1246, 1264, 1278 (§§PA.6.4–PA.6.6): "the projectivity conclusions are conditional on the full projective assertion of §PA.0.12". In `design/plan.json` the gap `G1` has no `slug`, `supplier` or `section`.

   Claim: every noetherian quasi-excellent S with dim S ≤ 3, separated or not, is universally resolvable with globally projective resolving alterations, and §§PA.6.4–PA.6.6 conclude projective alterations from it.

   Witness: cp19 Theorem 1.1 (cp19 lines 93–102) assumes X separated and makes π projective only over a specified affine cover; Remark 1.4 (cp19 line 124) is the affine case. No roadmap owns Cossart–Piltant resolution (search: no match).

   Repair: either name a supplier roadmap and section for G1 (in `plan.json` and under `## Exact supplier contracts`; none exists today), or state what the sources prove:
   (a) In §PA.0.9 add the proper variant: X is universally P-resolvable in the proper sense when the resolving P-alteration is only required to be proper (temkin17 §4.1.4, temkin17 line 986).
   (b) Restate §PA.0.12: for S separated, noetherian, quasi-excellent with dim S ≤ 3, every alteration Y → S and nowhere dense closed Z ⊆ Y admit a proper degree-one alteration Y′ → Y, a modification on each reduced component, with Y′ regular and the reduced preimage of Z an snc support, projective when Y is affine (cp19 Theorem 1.1 and Remark 1.4; cjs Corollary 0.4).
   (c) Give §§PA.5.6, PA.6.1 and PA.6.2 the proper variant as well (a and b are then proper). State §§PA.6.4–PA.6.6 with projective alterations when the base is excellent of dimension ≤ 2 or of dimension ≤ 1 (§§PA.0.10–PA.0.11), and with proper alterations over a separated base when the base goes through cp19.
   (d) Delete the three "conditional on the full projective assertion" sentences.
   Tested on the refuting instance: for a non-affine alteration Y of a separated quasi-excellent threefold, (b) is cp19 Theorem 1.1 applied to Y_red, followed by cjs Corollary 0.4 in the regular, hence excellent, Y₁; the proper variant of Theorems 4.2.1 and 4.3.1 is temkin17's own convention (§4.1.4).

2. **F02** (P2) §PA.1.8 uses SchemeAndStackFoundations `chow_lemma` outside its Noetherian hypothesis

   Location: README line 610: "are cofinal among all modifications (Chow's lemma for the proper, separated modifications of the affine scheme, SchemeAndStackFoundations §4.12 chow_lemma)". Line 608 allows "A a ring".

   Claim: projective integral models are cofinal among the tight modifications of Spec K → Spec A for an arbitrary ring A.

   Witness: SchemeAndStackFoundations (main) §4.12, README line 5625: `chow_lemma` is "for `X → S` separated of finite type with `S` Noetherian". §PA.1.8, like ClassicalAdicEtaleCohomology §2.4, admits a rank-two valuation ring A.

   Repair: replace the parenthesis by "(§PA.0.7 applied to the tight modification X_i → Spec A, which is integral and so has one maximal point; then §PA.0.5: a separated, proper, pseudo-projective morphism is projective, ilo14 X Remark 3.1.7(ii))", and add §PA.0.5 and §PA.0.7 to the §PA.1.8 *Needs:* line. Tested on A a rank-two valuation ring: a tight modification X_i is qcqs, integral and of finite type over Spec A, so ilo14 X Proposition 3.1.8 (ilo14 line 7246) applies; the blow-up it produces is integral and still tight.

3. **F03** (P2) Three declared gaps are vague or compound; one duplicates a statement this roadmap owns

   Location: README line 64 (gap:finite-type-fp-factorization): "compatible with restricting the quasi-compact flat finitely presented locus needed in the flattening argument". Line 84 (gap:closed-subset-log-structure): "recovers every log regular fs structure from its triviality locus". Line 92 (gap:very-tame-local-quotient): "compatibly with localization of its Gabber modification".

   Claim: each line is one precise supplier contract.

   Witness: line 64's last clause names no object or property. Line 84's third clause is §PA.4.1's own API bullet (line 933), so that statement has two owners. Line 92 bundles five assertions.

   Repair (README contract and the same slug's `needs` in `design/plan.json`, slugs unchanged):
   (1) finite-type-fp-factorization: "Every finite-type quasi-separated morphism X → S with S qcqs factors as a closed immersion X → X₀ followed by a finitely presented X₀ → S; if X → S is of finite presentation over a quasi-compact open U ⊆ S, X₀ can be chosen with X ×_S U → X₀ ×_S U an isomorphism."
   (2) closed-subset-log-structure: keep (a) for X reduced and locally noetherian and Z nowhere dense closed, O_X ∩ j_*O_U^× ⊆ O_X is a log structure on X_ét; (b) it equals CR.5's divisorial M_D when X is regular and Z = |D| for an SNC divisor D. Delete the third clause; §PA.4.1 keeps the recovery statement as its own target (ilo14 VI §1.4; ilo14 X §3.2.1, ilo14 line 7274).
   (3) very-tame-local-quotient: state separately the four uses: (a) the quotient log structure of `VanishingCycles.veryTameQuotient` is (q_*M)^G; (b) at a geometric point of a very tame action, inertia is abelian of order invertible in the residue field, and q is strict-étale locally the Kummer chart of that group; (c) the very tame locus of a tame action on a log regular fs scheme is open; (d) `VanishingCycles.equivariantLogResolution` commutes with restriction to G-stable opens and with strict localization (ilo14 VIII 5.6.1, as used in ilo14 X Theorem 3.1.5, ilo14 line 7194).
   Each rewritten contract is one checkable statement with its hypotheses.

4. **F04** (P3) The board reads 0 targets: the target headings are not in board form

   Location: README line 125 "### PA.0.1 Residue characteristics of a scheme", and the 58 other `### PA.k.n` headings between lines 125 and 1360.

   Claim: the seven layers carry 59 targets (59 `### PA.k.n` subsections under `## Layer PA.0:` … `## Layer PA.6:`). The board nevertheless recorded "0 targets, 0 Lean declarations", and this review's seeded sample was empty.

   Witness: the board reads targets as `### k.n` subsections of `## Layer` sections (number first), else as bold `**Name**` paragraph openers. The `PA.` prefix defeats the first; the layers' only bold openers are the excluded `**Checks.**`.

   Repair: rename every target heading `### PA.k.n Title` to `### k.n Title` (mechanically: `sed -E 's/^### PA\.([0-9]+\.[0-9]+)/### \1/'`). Keep `## Layer PA.k: title`, as LefschetzPencilsAndVanishingCycles does with `## Layer LPV.0:` over `### 0.1`. Internal references `§PA.k.n` can stay, and consumers that cite "PA.0 `alteration`" still resolve. Tested on a scratch copy: the board's target reader then returns 59 targets, from "0.1 Residue characteristics of a scheme" to "6.12 de Jong's alteration theorem over a Dedekind base"; the layer-id check is clean; the dependency check still reports 0 problems. The "0 Lean declarations" is intended: no headline is statable at the pins (see R09 and Verified sound). This must land in this repair round, because target counts and the seeded sample of every later round depend on it.

5. **F05** (P3) Seven passages are duplicated verbatim

   Location: README line 982 (§PA.4.5: "For a non-quasi-compact fine log scheme the tower is locally finite; …" twice); line 1056 (§PA.4.10: "Here t₁,…,t_r cut out the reduced special fibre, …" twice); line 1136 (§PA.5.3: the paragraph "Include as an auxiliary target the following valued-field uniformization …" twice); line 1180 (§PA.5.6: "The char(X) ⊆ P form also belongs to this target. …" twice); lines 1246, 1264, 1278 (§§PA.6.4–PA.6.6: "For bases whose universal projective resolvability is obtained through the threefold input, …" twice each).

   Claim: none; this is a text defect.

   Witness: each of these lines contains the same sentences twice, consecutively.

   Repair: delete the second copy on each of the seven lines. Under R01 (d), the §§PA.6.4–PA.6.6 sentences go entirely.

6. **F06** (P3) Auxiliary targets are buried in proof routes without statement, API or Checks

   Location: README line 1136 (§PA.5.3): "Include as an auxiliary target the following valued-field uniformization … these auxiliary objects are included in this target". Line 1366 (§PA.6.12): "This is an auxiliary existence target of the arithmetic theorem".

   Claim: the uniformization of one-dimensional valued fields and de Jong's section-and-projection step are owned here.

   Witness: they introduce one-dimensional analytic k-fields, their types, special cosets and Assumption 6.2.1 (temkin10 lines 2031, 2333) without a definition subsection, API or any Check; no other roadmap owns these objects (searched: "special coset", "one-dimensional analytic", "moderately ramified").

   Repair: give each its own subsection, `### 5.3a Uniformization of one-dimensional valued fields` and `### 6.12a Sections and linear projections over a global Dedekind base`; the `5.3a` form is read by the board. State temkin10 Theorem 2.1.8 (temkin10 line 445) and Theorem 6.3.1 under Assumption 6.2.1, and dejong96 §8.6, with their hypotheses. Define the analytic-field objects of temkin10 §§2.1 and 6.1–6.2 with an API and at least three Checks each; for example, a type-2 or type-3 field over an algebraically closed k is stable, that is defectless, while Assumption 6.2.1(ii) fails for a discretely valued k. Then cite the new subsections in the *Needs:* lines of §§PA.5.3 and PA.6.12.

7. **F07** (P3) Process residue: plan slugs, issue-label parentheticals, source-numbered internal references, numbering gaps

   Location: plan-node slugs at README lines 469 "(PA.1/rz-functoriality)", 606, 1148, 1220, 1232, 1278, 1280, 1348 (e.g. "In PA.6/morphism-p-desingularization"). Line 482 "(comparison node of this layer)". Lines 347 and 1226 "(the projective convention)", line 573 "(the separatedness implication)", line 1060 "(the unit/branch rank convention)". Source-numbered internal references at line 540 "under the bijections of Lemma 3.1.3", line 585 "(Lemma 3.1.6)", lines 740–744 "Theorem 3.2.12" and line 903 "As in Theorem 3.3.6". Missing subsection numbers PA.2.3, PA.3.3, PA.4.2 and PA.4.3.

   Claim: none; these are house-style defects.

   Witness: the slugs and labels are identifiers from `plan.json` and from the design's source-issue list; the README never defines them. The numbering gaps are the four design targets that moved to suppliers.

   Repair:
   - Replace the slugs: PA.1/rz-functoriality → §PA.1.5; PA.1/riemann-zariski-space → §PA.1.2; PA.5/stable-modification-existence → §PA.5.3; PA.6/morphism-p-desingularization → §PA.6.1; PA.6/char-s-desingularization-of-morphisms → §PA.6.5; PA.3/galois-alteration → §PA.3.2.
   - Delete "(comparison node of this layer)" and the three label parentheticals.
   - Write source numbers as "temkin17 Lemma 3.1.3" and so on, or use the README section (§PA.1.4 for Lemma 3.1.3).
   - Renumber 2.4–2.7 → 2.3–2.6, 3.4–3.8 → 3.3–3.7 and 4.4–4.10 → 4.2–4.8 and update the references. No consumer cites these numbers: EtaleDualityAndPerverseSheavesPartII cites layer and slug.

8. **F08** (P3) Library and roadmap objects restated without citation

   Location: README line 223 (§PA.0.4): "the generic degree is deg_x f := [κ(x) : κ(f(x))]", with line 239 "residue degrees multiply in towers". Line 760 (§PA.3.1): "the decomposition group D_x is the stabilizer of the point x, and the inertia group G_x …". Line 573 (§PA.1.7): "Val_K … identified with Tau Ceti's valuation spectrum of K".

   Claim: these are this roadmap's own definitions.

   Witness: `AlgebraicGeometry.Scheme.Hom.residueDegree` (Mathlib/AlgebraicGeometry/ResidueField.lean:147) is [κ(x) : κ(f x)]; `TauCeti.AlgebraicGeometry.residueDegree_comp` (TauCeti/AlgebraicGeometry/ResidueDegree.lean:47) is the tower law; EtaleCohomologyFoundations §F.0.A1 (main) defines `SchemeInertia`; ClassicalAdicEtaleCohomology §2.4 presents Spv K as valuation rings.

   Repair:
   - Add `AlgebraicGeometry.Scheme.Hom.residueDegree` to "From Mathlib" and `TauCeti.AlgebraicGeometry.residueDegree_comp` to "From Tau Ceti". Define deg_x f := f.residueDegree x at maximal points, and cite the Tau Ceti lemma in the §PA.0.4 route. Name SchemeAndStackFoundations §4.16 `genericDegree` and `genericDegree_comp` as the integral case.
   - In §PA.3.1 add "EtaleCohomologyFoundations §F.0.A1 `SchemeInertia` gives D_y and I_y for Nor_L(X) → X; PA.3.1 extends them to finite group actions on arbitrary schemes", with a Check that the two agree for Spec Z[i] → Spec Z at (1+i), where both orders are 2. Add an EtaleCohomologyFoundations contract (main, order 20).
   - In §PA.1.7 cite ClassicalAdicEtaleCohomology §2.4 for Spv K as valuation rings with the topology generated by {V : a ∈ V}.

9. **F09** (P3) The Suggested.lean docstring names the wrong missing carriers

   Location: `packages/AdicCoefficientsAndComparisonsPartII/Suggested.lean` line 53: "Generic degrees of scheme alterations, projective morphisms and relative SNC divisors lack pinned geometric interfaces." Line 59: "The finite-degree scheme alteration, regular scheme and projective model interfaces are absent." Line 25 (PA.3.7: "generic degree") and line 57 (PA.6.9: "The scheme alteration … interfaces are absent").

   Claim: these are the carriers missing at the pins.

   Witness: `AlgebraicGeometry.Scheme.Hom.residueDegree` (ResidueField.lean:147) and `IsRegularLocalRing` (Mathlib/RingTheory/RegularLocalRing/Defs.lean:51) exist at the pins, as does Tau Ceti `isRegularRing_iff_isRegularLocalRing_stalk`. Neither library has excellence or a projective-morphism class.

   Repair: rewrite four bullets, leaving the rest of the file unchanged.
   - PA.3.7: tameness of valued-field extensions after henselization, and universally Japanese schemes.
   - PA.6.7: projective and quasi-projective morphisms, and relative SNC divisors (SchemeAndStackFoundations §4.17 owns `IsStrictNormalCrossings`; it cannot be imported).
   - PA.6.9: quasi-projectivity and SNC divisors only. Properness, surjectivity, smoothness and the function-field degree exist: `AlgebraicGeometry.IsProper`, `AlgebraicGeometry.Smooth`, `AlgebraicGeometry.Scheme.functionField`, `Module.finrank`.
   - PA.6.10: excellence of R and projective morphisms.
   The conclusion that no headline is statable stands (Verified sound, item 6).

10. **F10** (P3) The downstream-consumer paragraph is wrong, and one supplier contract is never used

   Location: README line 1384: "AdicCoefficientsAndComparisons Layers L5–L6 and EtaleDualityAndPerverseSheavesPartII EQ.0–EQ.2 consume the alteration geometry". The same line has "LogicAndDefinabilityInNumberTheoryPartII FG.2" and "HigherLocalFieldsAndHigherClassFieldTheory HL.6"; line 1328 repeats HL.6. Lines 115–117 hold the "From TauCetiRoadmap.AdicCoefficientsAndComparisons" contract.

   Claim: these consumers exist at these sections, and Part I supplies something here.

   Witness: Part I (head 248aad6) never mentions this Part II and precedes it (merge-order lines 121, 122). LogicAndDefinabilityInNumberTheoryPartII has no FG layer; it uses this result in §2.1 (design lines 491–503). HigherLocalFieldsAndHigherClassFieldTheory exists nowhere. No *Needs:* line uses lines 115–117.

   Repair:
   - Delete "AdicCoefficientsAndComparisons Layers L5–L6 and".
   - Replace "FG.2" by "§2.1".
   - At lines 1328 and 1384, name HigherLocalFieldsAndHigherClassFieldTheory without "HL.6", or drop it.
   - Delete lines 115–117, or add the *Needs:* entries they serve.

11. **F11** (P3) The supplier contracts omit the owners of projective morphisms and blow-ups

   Location: README line 113, the only StableReduction contract: "Consume Layer 3, proper prestable, semistable and stable pointed curves, …". "Projective" is in the statements of §§PA.0.5, 0.7, 0.9, 0.11–0.12, 4.4–4.8, 5.2, 5.6 and 6.1–6.12; blow-ups are in §§PA.0.6, 0.7, 4.4 and 6.2.

   Claim: Mathlib, Tau Ceti and the named sections supply every carrier.

   Witness: StableReduction (main) Layer 2 "Build projective morphisms and relative `Proj`" (README line 380). Its Layer 4 builds "the blowup of a quasi-coherent finite-type ideal" (line 470). SchemeAndStackFoundations §4.19 takes projectivity from "StableReduction Layer 2" (line 6376). Neither pin has projective morphisms.

   Repair: extend "From TauCetiRoadmap.StableReduction" with "Layer 2: projective morphisms, relative Proj and relative ampleness; Layer 4: blow-ups of quasi-coherent finite-type ideals with their universal property, strict transforms and charts". Add StableReduction Layer 2 or Layer 4, as used, to the *Needs:* lines of §§PA.0.5, PA.0.6, PA.0.7, PA.0.9, PA.4.4 and PA.6.2.

12. **F12** (P3) Locators: separable variants cited as source statements; two line slips

   Location: README line 742 (§PA.2.7): "Theorem 3.2.12, pp. 117–118; Theorem 4.2.1 Step 4, p. 122"; line 905 (§PA.3.8), the same with Theorem 3.3.6. Line 293 (§PA.0.6): "Tag 081R … and Tag 0815 … lines 4197 and 4250". Line 144 (§PA.0.1): "§2.1.1, p. 103 (temkin17 line 71)".

   Claim: the source states these separable results, and the line numbers locate the cited items.

   Witness: temkin17 states only the unrestricted Theorem 3.2.12 (temkin17 line 858) and Theorem 3.3.6 (line 939); Step 4 (line 1051) invokes Theorem 3.3.6. In the More on Flatness extraction, 0815 is at line 4197 and 081R at line 4250. temkin17 §2.1.1 is at line 249.

   Repair:
   - §PA.2.7: "(derived: separable variant of temkin17 Theorem 3.2.12, pp. 117–118, with its proof run inside a maximal separable P-extension; it supplies the separable case of temkin17 Theorem 4.2.1, Step 4, p. 122, temkin17 line 1051)". Make the same change in §PA.3.8 with Theorem 3.3.6.
   - §PA.0.6: "Tag 0815 (Theorem 38.30.7, More on Flatness line 4197) and Tag 081R (Lemma 38.31.1, line 4250)".
   - §PA.0.1: "(temkin17 line 249)".

Twelve findings: one P1, two P2, nine P3. The mathematics of the 59 targets is sound and well referenced; the blocking problems are the unowned projectivity gap G1 and what rests on it, one supplier used outside its hypotheses, and three imprecise gap contracts. The submission's "0 targets" is a heading-format defect (R04), not an absence of targets.

## Verified sound

1. **Seeded sample (15 targets).** The board's sample was empty (R04). I applied the board's seeded-sample rule (seed = job id, sample size 15) to the 59 `### PA.k.n` headings and checked each locator at its line:
   - 0.1: temkin17 lines 71, 249–255 and 1107. Examples char(Spec Q) = ∅ and char(Spec Z_(2)) = {2}; finiteness of char(S) ∖ char(X).
   - 0.5: ilo14 lines 7223–7244 (definition; Remark 3.1.7(i) doubled-origin blow-up; 3.1.7(ii)); temkin17 line 992; stacks More on Morphisms line 6247 (05K0).
   - 0.7: ilo14 lines 7246–7269 (Proposition 3.1.8, Lemma 3.1.9).
   - 0.8: ilo14 line 7304 (the "snc divisor" means support convention).
   - 1.4: temkin17 lines 667–680 (Lemma 3.1.3).
   - 2.2: temkin17 lines 779–795 (§§3.2.2–3.2.4).
   - 2.7: temkin17 lines 858–882 and 1051 (separable variant derived; R12).
   - 3.4: temkin17 lines 850–855 and 936–938.
   - 3.6: temkin17 lines 960–968.
   - 4.8: ilo14 lines 6117–6133 and 7194–7199 (Theorems 1.1 and 3.1.5(ii)).
   - 4.10: ilo14 lines 6985–7001 and 7127–7150 (Theorem 2.4(ii), §2.6 Step 3).
   - 5.1: temkin10 lines 57–99 (§1.2) and ilo14 lines 7276–7281.
   - 5.6: temkin17 lines 999–1075 (Theorem 4.2.1; the README's char(S) ⊆ P statement plus char(X) variant repairs Step 4) and ilo14 lines 7345–7362.
   - 6.3: temkin17 lines 1094–1104 and ilo14 lines 7501–7503.
   - 6.10: dp23 lines 374–379 (proof of Proposition 3.4: ILO X 2.4 with ℓ = 2 over the henselized non-dyadic DVR) and ilo14 line 6985.
   Theorem numbers, pages, hypotheses and support all agree, except the separable locators (R12). Also checked: cp19 lines 93–124; cjs line 131 (Corollary 0.4: regular excellent ambient, reduced closed subscheme of dimension ≤ 2; this covers the uses in §§PA.0.11–PA.0.12); jannsen16 line 1052 (Theorem 2.11, p. 24, exact match with §PA.6.9); dejong96 lines 1447–1458 (Theorem 7.3) and 1545–1563 (§8.1, Theorem 8.2); temkin10 lines 104–158 (Theorems 1.1, 1.2, 1.5; Corollaries 1.3, 1.6), 445 and 2031; stacks lines 4197–4206 (0815) and 4250–4255 (081R); Varieties line 4034 (0C45); Resolution of Surfaces line 1918 (0BI4). Long-overlap scan of the README against all source extractions (12-token shingles): only titles and fragments of at most 17 tokens; no copied passages.
2. **Principles.** No route-specific shortcut: every end theorem is in its source's generality, or more general (§PA.5.6 carries both the char(S) and the char(X) form). No re-planned roadmap: suppliers own monoids, log structures and log regularity (CrystallineCohomology CR.5:log-algebra.1–4), very tame quotients and separated Gabber modification (LefschetzPencilsAndVanishingCycles §0.10), field tameness (LocalFieldsRamificationPartII GF.0–GF.6), and integral alterations and SNC divisors (SchemeAndStackFoundations §§4.16–4.17). No computational algorithm. No `set_option`, no sorry'd data. No LaTeX.
3. **Dependency check.** Output: `depcheck: 32 roadmaps, 290 edges, 0 problem(s)`; no UPWARD or CYCLE line. On the R04-renamed copy: 0 problems.
4. **Cross-roadmap citations resolved.**
   - SchemeAndStackFoundations (main), each section read: §0.9; §§0.16–0.22, including `Excellence.IsQuasiExcellentRing.isNagata` (line 1334) and `nonJapaneseDVR` (line 1464); §1.17 `finiteGroupQuotient_projective` (line 2643); §§4.11–4.20 with `IsModification`, strict transforms, `flattening_by_blowup` (proper, Noetherian integral), `chow_lemma` (Noetherian, R02), `IsRegular`, `resolution_of_curves`, `bertini_smoothness`, `IsAlteration`, `genericDegree`, `IsStrictNormalCrossings` (`.of_subset`, `.pullback_smooth`), `generic_projection` and `alteration_theorem`.
   - LocalFieldsRamificationPartII (board design): all 12 cited targets exist (GF.0/prime-supported-degree, p-extensions, maximal-p-extension, separably-p-closed; GF.1/normalization-and-prolongations; GF.2/tame-extension, unramified-extension, tower-laws, unramified-etale-criterion, perfection-tame-tower; GF.6/general-tameness, separable-p-closed-tameness). GF.0 has no maximal separable P-extension, so that gap is genuine and minimal.
   - CrystallineCohomology (open head 013a921): CR.5:log-algebra.1–4 has every consumed object (Kummer, Kato chart criterion, divisorial structures, log regularity with `trivial_iff`, log smoothness over log regular bases, logarithmic Abhyankar).
   - LefschetzPencilsAndVanishingCycles (8f3e9b1) §0.10: `VanishingCycles.veryTameQuotient`, `equivariantLogResolution` (separated, absolute and relative), `regularLogResolution`, log blow-ups.
   - ClassicalAdicEtaleCohomology (dfcb6b7) §2.4: arbitrary A, projective integral models, Spv K homeomorphism.
   - StableReduction (main) Layer 3.
   - Gap contracts gap:maximal-separable-p-extension and gap:log-blowup-universal-property are precise and minimal; all five slugged gaps are declared in `plan.json` and stated under the right supplier.
5. **Library declarations opened at the pins (Mathlib 6b7abb3, Tau Ceti a91d3aa).**
   - Mathlib, `AlgebraicGeometry/`: ResidueField.lean:45 `Scheme.residueField`, :147 `Scheme.Hom.residueDegree`; Noetherian.lean:277 `IsNoetherian` (extends locally Noetherian and compact, no separatedness); Morphisms/Proper.lean:41; Morphisms/Finite.lean:40; Morphisms/UnderlyingMap.lean:216 `IsDominant`; Morphisms/Separated.lean:43; Morphisms/Flat.lean:42; Morphisms/Etale.lean:39; Morphisms/QuasiSeparated.lean:47; Morphisms/QuasiCompact.lean:41; Morphisms/Smooth.lean:59; Normalization.lean:122, :132, :169, :215; ValuativeCriterion.lean:274, :330; Morphisms/UniversallyOpen.lean:105, :129; Morphisms/FinitePresentation.lean:161 (requires `LocallyOfFinitePresentation`, `QuasiCompact`, qcqs target).
   - Mathlib, elsewhere: RingTheory/Unramified/LocalStructure.lean:376 (`FinitePresentation`, `IsEtaleAt`); RingTheory/Valuation/LocalSubring.lean:116; Topology/Spectral/ConstructibleTopology.lean:47 and :160 (compact, quasi-sober, prespectral, quasi-separated, as the README says); RingTheory/RegularLocalRing/Defs.lean:51, :92; GroupTheory/GroupAction/Defs.lean:515; FieldTheory/Separable.lean:548; FieldTheory/Galois/Basic.lean:55; FieldTheory/PurelyInseparable/Basic.lean:107; Data/Nat/PrimeFin.lean:37; Algebra/CharP/Defs.lean:153.
   - Absent at the pins: excellence, Nagata and Japanese rings, projective morphisms.
   - Tau Ceti: AlgebraicGeometry/AdicSpace/ValuationSpectrum/Basic.lean:73, :212, :241, :253; AlgebraicGeometry/AdicSpace/PatchPresentation.lean:96, :196; AlgebraicGeometry/Quotient/Affine.lean:55, :59; AlgebraicGeometry/Quotient/FiniteGroup/Affine.lean:66, :73, :85; AlgebraicGeometry/ResidueDegree.lean:47.
6. **Suggested.lean.** `lake env lean` on the file, run from the content checkout, exits 0 with no messages; there are no declarations, so no `sorry` warning. The form is right: a single `import Mathlib`, the module docstring, the namespace, no `set_option`. The `#check @name` binder check is vacuous: there is no declaration. No padding. Headline theorems are the Summary's end results (§§PA.6.4, 6.5, 6.7, 6.8, 6.9, 6.10, 6.11, 6.12) and the deep inputs (§§PA.0.10–0.12, 1.4, 2.6–2.7, 3.7–3.8, 4.6, 4.8, 5.2–5.4, 5.6, 6.1–6.3). Each needs projective or quasi-projective morphisms, quasi-excellence, SNC divisors, log structures, henselized valued-field tameness or Riemann–Zariski limits, none of which is pinned. A weakened substitute (proper for projective) is refused by the brief. So the empty file is correct; only the docstring's carrier lists are wrong (R09).
7. **Shape.** All seven layers end with Examples and Dependencies. All 20 definition sections have an API list and 4–7 Checks (§§PA.0.1–0.5, 0.8, 0.9, 1.1–1.3, 1.5, 1.7, 2.1, 2.2, 3.1, 3.2, 3.4, 4.1, 4.4, 5.1). Every target has a locator and a *Needs:* line. No backticked identifier claims a declaration of this roadmap.
8. **Ownership against open work.** Searched by object over main, the board packages and all 336 open roadmap pull requests ("Riemann–Zariski", "pseudo-projective", "tame distillation", "universal resolvability", "stable modification", "Gabber modification", "Cossart", "special coset"). The objects are owned here, except those R08 points to existing owners. MotivesAndAlgebraicCycles §0.5c (open, merge-order line 86) applies temkin17 Theorem 4.3.1(iii) by citation for `pAlterationSupport`; this roadmap (§PA.6.3) owns that theorem. The upward use belongs to that roadmap's review and is not a finding here.

### Adversarial table

| Statement | Instances tried | Values computed (source or definition side / README side) | Result | Change |
|---|---|---|---|---|
| Convention: P-numbers | n = 1, P = ∅; n = 0 | primeFactors(1) = ∅ ⊆ ∅ / "1 is a P-number"; 0 has no positive-degree role / "0 is not" | agree | none |
| Convention: char(X) | Spec Q, Spec Z_(2), Spec Z[1/6], ∅ | ∅, {2} (temkin17 line 255: P(8) = {2}), {p ≥ 5}, ∅ / same | agree | none |
| Convention: restriction direction | Z[i]_(1+i) ⊂ Q(i) | Z[i]_(1+i) ∩ Q = Z_(2) / same | agree | none |
| Convention: Artin–Schreier | u^p − u = t⁻¹, v(t) = 1, p = 2, 3 | p·v(u) = −1 ⇒ v(u) = −1/2, −1/3; e = p / same | agree | none |
| Convention: chart ℕ → ℕ², 1 ↦ (1,1) | cokernel; with (p,p) | ℤ²/⟨(1,1)⟩ ≅ ℤ; ℤ²/⟨(p,p)⟩ ≅ ℤ ⊕ ℤ/p / same | agree | none |
| PA.0.1 char(X) | Spec Z[1/n] → Spec Z; Spec F_p[t] | char(S) ∖ char(X) = primes dividing n (finite); {p} / same; finiteness via the codimension-one components of S ∖ U | agree | R12 (line slip) |
| PA.0.2 maximal domination | A¹ ⊔ Spec k → A¹; ∅ → S; 𝔾_m → A¹ | maximal point Spec k ↦ origin, which is not maximal ⇒ fails; vacuous; generic ↦ generic / same | agree | none |
| PA.0.3 alterations | P¹_k → Spec k; Frobenius of A¹_{F_p}; composite of two alterations | generic fibre P¹ not finite; [F_p(t) : F_p(t^p)] = p; points over η_S form a 0-dimensional set of maximal points, so the fibre stays finite / same | agree | none |
| PA.0.4 P-alterations | Z[i]/Z; t ↦ t² on A¹_Q; Frobenius, p = 2, 3 | degree 2: a {2}-alteration and 3′; char(A¹_Q) = ∅ ⇒ not a char-alteration; degrees 2, 3 / same | agree | R08 |
| PA.0.5 pseudo-projective | doubled-origin plane; its blow-up at o₁ | two k-maps from the DVR at the exceptional generic point (closed point ↦ η, ↦ o₂); trdeg κ(η) = 1 ≠ 0 = trdeg κ(o₂), so no local isomorphism to a separated target / same | agree | none |
| PA.0.6 flattening | Bl₀A² → A²; hypotheses of 0815 and 081R | X qc, lfp, F of finite type, F_U fp and flat; f of finite type and quasi-separated, X_U flat lfp / same | agree | R12, R11 |
| PA.0.7 non-separated Chow | doubled-origin line over k | qcqs and irreducible, one maximal point ⇒ ilo14 3.1.8 applies; already a local isomorphism onto A¹, so pseudo-projective / same | agree | none |
| PA.0.8 snc support | V(xy); origin; nodal cubic; V(xy(x−y)) | codimension 1, 1, D₁₂ of codimension 2: yes; codimension 2: no; singular component: no; triple intersection of codimension 2 ≠ 3: no / same | agree | none |
| PA.0.9 universal P-resolvability | Spec k; non-qe DVR K = k(x, y^p); ∅ | finite reduced alteration regular, Z = ∅: yes; non-finite normalization: no (ilo14 line 7326); vacuous / same | agree | R01 (proper variant) |
| PA.0.10 dimension ≤ 1 | Spec Z, Z = {(p)} | normalization finite (Nagata) and regular (0C45, 0BI4); a finite set of closed points is snc / same | agree | none |
| PA.0.11 excellent surfaces | regular 2-dimensional local ring, Z = closed point | blow-up: exceptional P¹, snc / same (cjs Cor 0.4) | agree | none |
| PA.0.12 threefolds | non-affine alteration of a separated qe threefold; non-separated S | cp19 Theorem 1.1: projective only over an affine cover, separated required / README claims global projectivity and the non-separated case | **refuted as supported** | R01 |
| PA.1.1 pointed modifications | Spec F_p → Spec Z; Bl₀A² with generic point | closed immersion proper, tight; tight / same | agree | none |
| PA.1.2 RZ space | Spec R, R a DVR; A² | tight modification proper, birational, quasi-finite ⇒ finite ⇒ isomorphism, so RZ = Spec R; ℤ² lexicographic value group, not noetherian / same | agree | R07 (slugs) |
| PA.1.3 valuative points | Spec Z_(p), K = Q; K = F_p; doubled-origin line | {Q, Z_(p)}; one element; k[t]_(t) has two centres / same | agree | none |
| PA.1.4 compactness and bijection | temkin17 Lemma 3.1.3 | (i) constructibly compact, Zariski quasi-compact; (ii) stalks are valuation rings, bijection with Val_K(X) / same | agree | none |
| PA.1.5 functoriality | Q(i)/Q at 2 and 5 | fibre sizes 1 and 2; O_{X,x} → O ∩ K is local, so the factorization exists / same | agree | R07 |
| PA.1.6 openness | temkin17 Lemma 3.1.6, no finite generation | open and continuous in both topologies / same | agree | none |
| PA.1.7 absolute RZ | Val_Q; Spec Z[1/p]; F_q; doubled-origin line with a K = F_p point | Val_Q ∖ {Z_(p)}; one point; injective although not separated ⇒ the converse in temkin17 §3.1.7 fails / README asserts only "if" | agree | R08 |
| PA.1.8 affine comparison | A a rank-two valuation ring | supplier `chow_lemma` needs S Noetherian / README applies it to any A | **route gap** | R02 |
| PA.2.1 loci | Q(i)/Q; F_p(t)(u); inseparable L/K at the trivial valuation | (1+i): e = 2 = p, wild; (2+i): unramified; e = p; not separable ⇒ not tame / same | agree | none |
| PA.2.2 S- and P-tameness | Q(i)/Q, P = {3}, {2}; K = F₂(t), P = ∅ | char(Val^w) = {2}: 3-tame, not 2-tame; no morphism Spec L → Spec Q ⇒ the characteristic hypothesis is needed / README adds it | agree | none |
| PA.2.4 towers and composita | Q ⊂ Q(i) ⊂ Q(i, √3) | over 3: e = 2, f = 2, 3 ∤ 2 ⇒ tame; over 2: e = 2 from Q(i) ⇒ wild / same | agree | none |
| PA.2.5 openness | Q(i)/Q; f = t(t − 1) over Z_(p), a = 0 | tame locus = Val_L minus the point over 2, open; f′(0) = −1 a unit, but f is not minimal ⇒ the README's minimal-polynomial step is needed / same | agree | none |
| PA.2.6 tame distillation | Q(i)/Q, S = Val_L | P = {2}; K′ = Q(i) lies in every maximal 2-extension (otherwise K̄(i) is a larger one) / same | agree | none |
| PA.2.7 separable distillation | char K = p ∈ P | the maximal P-extension contains K^{1/p}, so K′ may be inseparable; the perfection route gives a separable K′ / same | agree | R12 |
| PA.3.1 inertia | ±1 on A²; Z/2 on the doubled-origin plane; S₃ free on 6 points; t ↦ t+1 on A¹_{F_p} | inertia {±1} only at 0; generic axis inertia 2, origins 1 ⇒ not inertia specializing; all inertia 1; on t^p − t − a the residue action F_{p^p} is nontrivial ⇒ inertia 1 / same | agree | R08 |
| PA.3.2 Galois alterations | Z[i]/Z; Z[1/2, i]/Z[1/2]; Frobenius; Z[∛2]/Z | inertia 2 not invertible in F₂; tame; Aut = 1 and radicial ⇒ Galois; Aut = 1, degree 3 not radicial ⇒ not Galois / same | agree | none |
| PA.3.4 wild primes | Z[i]/Z; T³ − T − 2 | P^w = {2}; disc = −4(−1)³ − 27·4 = −104; mod 2 T(T+1)², Dedekind test −(T² + T + 1) at T = 1 gives 1 ≠ 0 ⇒ 2 = 𝔭₁𝔭₂², local degrees 1 and 2; 2 ≤ 3, 2 ∤ 3 / same | agree | none |
| PA.3.5 tame coverings | degree invertible on X | inertia orders divide the degree ⇒ X′ = X / same | agree | none |
| PA.3.6 Galois closures | Q(∛2), T = Val_Q ∖ {Z_(2), Z_(3)} | e = 3 at 2 (tame), e = 3 at 3 (wild), both excluded; the Galois closure is likewise tame on S′ / same | agree | none |
| PA.3.7 distillation of alterations | temkin17 Theorem 3.3.6 hypotheses | noetherian, universally Japanese, integral / same | agree | none |
| PA.3.8 separable version | characteristic 0 | reduces to Theorem 3.3.6 / same | agree | R12 |
| PA.4.1 log regular pairs | (A², V(xy)); cusp; (A², {0}); (Spec k[u,v,w]/(uw − v²), V(v)) | 2 = 0 + 2; x² + ax³ independent ⇒ not fine; Hartogs ⇒ trivial structure, nontriviality locus ∅ ≠ {0}; V(u) ∪ V(w) = V(v) as sets, 2 = 0 + 2 / same | agree | R03 |
| PA.4.4 normalized blow-ups | A₁ monoid, ideal ⟨(2,0),(0,2)⟩ | chart k[u,v,s]/(v² − u²s), s = w/u; 2·(−1,1) = (−2,2) in the monoid ⇒ v/u in the saturation; k[u, v/u] regular / same | agree | none |
| PA.4.5 monoidal desingularization | regular X with snc boundary; ilo14 VIII 3.4.9 (line 4967) | identity; functoriality for monoidally smooth maps / same | agree | R05 |
| PA.4.6 Gabber, inertia specializing | ±1 on A², Z = ∅, T = {0} | on Bl₀, −1 fixes E pointwise and sends the local equation x to −x (a unit multiple) ⇒ trivial on M̄ = ℕ and on the stratum ⇒ very tame / same | agree | none |
| PA.4.7 preparation lemma | ilo14 Proposition 1.2 (line 6149) | V projective over Λ with G-action / README: projective Λ[G]-module, equivalent since \|G\| is invertible in Λ | agree | none |
| PA.4.8 relative Gabber | ilo14 Theorem 1.1 with 3.1.5(ii) | separatedness replaced by inertia specializing / same | agree | none |
| PA.4.9 intermediate boundaries | ilo14 Lemma 3.5.2 (line 7655) | an intermediate divisor is a union of components / same | agree | none |
| PA.4.10 local forms | xy = π; π = u t^p; Z_p[x,y]/(xy − p) | ℤ²/⟨(1,1)⟩ ≅ ℤ; ℤ²/⟨(1,p)⟩ ≅ ℤ and gcd(p, p, 1) = 1; a = (1,1) / same | agree | R05 |
| PA.5.1 multipointed curves | blow-up of a smooth special-fibre point of A¹_R; P¹ identity | chart π = tw: node; E meets the strict transform once; deg ω restricted to E = −2 + 1 = −1 ⇒ semistable, not stable; identity contracts nothing ⇒ stable / same | agree | none |
| PA.5.2 projectivity | temkin10 Theorem 1.1 | ω C-ample iff stable / same | agree | none |
| PA.5.3 existence and uniqueness | temkin10 Theorems 1.2, 1.5, Corollary 1.3 | normal base; generically étale S′ / same | agree | R06, R05 |
| PA.5.4 equivariance | temkin10 Corollary 1.6 | lift of Aut_S(C,D) × Aut_S(S′) / same | agree | none |
| PA.5.5 semistable ⇒ log smooth | Z_p[u,v]/(uv − p) | 1 ↦ (1,1), cokernel ℤ, torsion-free / same | agree | none |
| PA.5.6 relative curves | S = Spec Z_(2) ⊔ Spec Q, X = A¹_Q, P = ∅ | char(S) = {2} ⊄ ∅; char(X) = ∅ ⊆ ∅; the identity data satisfy the conclusion / same | agree | R05 |
| PA.6.1 morphisms | f = id, S regular, Z snc; S = Spec Q | Z′ = Z ∪ Z = Z; ∅-alterations of integral Q-schemes are modifications / same | agree | R01 (proper variant) |
| PA.6.2 inheritance | regular 2-dimensional local ring, Z = closed point | without the blow-up, Z′ = V(xy) satisfies (ii) but b⁻¹(Z) is a point; after the blow-up, b⁻¹(D) is Cartier, hence a union of components / same | agree | R07 |
| PA.6.3 perfect field | k = F_p, P = {p} | regular over a perfect field = smooth; degree a power of p / same | agree | none |
| PA.6.4 char(X)-alterations | X = Spec Q[ε]/(ε²); qe threefold base | char(X) = ∅, X_red → X of degree 1; projectivity in the cp19 case unsupported / README conditional | **conditional** | R01, R05 |
| PA.6.5 char(S)-alterations | S = Spec k | a = id, b separable / same; projectivity over the cp19 base unsupported | **conditional** | R01, R05 |
| PA.6.6 refinement | char(X) = char(S) | the refinement is the theorem / same | agree | R01, R05 |
| PA.6.7 Gabber over a field | ℓ = 2, k = F_3; char k = 0, P = ∅ | odd degrees; k′ = k, degree 1 / same | agree | none |
| PA.6.8 one-dimensional base | Spec Z_p, xy = p | Σ = {(p)}, a = (1,1), s = 0, gcd(p,1,1) = 1 (ilo14 lines 6985–7001) / same | agree | none |
| PA.6.9 Jannsen 2.11 | jannsen16 line 1052 | a connected component of smooth X̃ is irreducible, degree prime to ℓ / same | agree | R10 |
| PA.6.10 odd-degree model | dp23 lines 374–379; ramified quadratic base change | ilo14 X 2.4 with ℓ = 2 gives odd degree; quadratic: degree 2, so multiplication by 2 is 0 on Z/2 / same | agree | R09 |
| PA.6.11 de Jong equivariant | dejong96 Theorem 7.3, G = 1 | G₁ ⊆ Aut_X(X₁), k(X₁)^{G₁} radicial over k(X) ⇒ a Galois alteration / same | agree | R07 |
| PA.6.12 de Jong arithmetic | dejong96 Theorem 8.2; X smooth projective, Z = ∅ | projective over S iff over S₁ (S₁ → S finite); the identity works / same | agree | R06 |

## Not verifiable

- None: every cited text opened in the sources cache.
- Not re-derived: the proofs in ilo14 Exposé VIII §§3.3–3.4 and §§4–5 behind §§PA.4.4–PA.4.6 (statements 3.3.15 and 3.4.9 checked); the proofs in cp19 and cjs (their statements checked).
- The ownership search covered main, the board packages and all 336 open roadmap pull requests through the roadmap index.

## Source issues

- **Gap** in temkin17 at Theorem 4.2.1, proof Step 4, p. 122: the source assumes only char(X) ⊆ P, yet applies Theorem 3.3.6, whose degrees lie on the wild primes of S̄ → S, a subset of char(S) possibly outside P; it should assume char(S) ⊆ P, or run Step 4 over the open S₀ with char(S₀) = char(X); affects the proof.
- **Gap** in temkin17 at Theorem 4.2.1, proof Step 4, p. 122: the separable alternative is asserted, but Theorem 3.3.6 can return an inseparable P-alteration when the characteristic lies in P; it should use separable variants of Theorems 3.2.12 and 3.3.6 inside a maximal separable P-extension; affects the proof.
- **Gap** in temkin17 at §4.1.4, p. 121, with Theorems 1.2.5 and 4.3.1(ii), pp. 99 and 123: universal P-resolvability asks only for proper resolving P-alterations, while the theorems conclude projective ones; it should require projective resolving alterations, as in ilo14 Exposé X §3.3.3; affects a stated result.
- **Gap** in temkin17 at §4.3.2, p. 124, and Theorem 1.2.5, p. 99: universal resolvability of qe threefolds is credited to Cossart–Piltant, whose Theorem 1.1 needs separated X and is projective only over a chosen affine cover; global projectivity and non-separated bases remain unproved; affects a stated result.
- **Gap** in temkin17 at proof of Lemma 3.2.10, p. 117: the monic polynomial from Chevalley's theorem is treated as the minimal polynomial of a; it should be replaced by the minimal polynomial g, whose derivative at a is a unit because f = gh; affects the proof.
- **Error** in temkin17 at §3.1.7, p. 115: the projection Val_K(X) → Val_K is said to be injective exactly when X is separated; the converse fails for a fixed pointed scheme, e.g. an F_p-point of the doubled-origin line; it should say "injective if X is separated"; affects nothing.
- **Error** in temkin17 at §3.2.4, p. 116: P-tameness is equated with Spec(Z_{P′})-tameness without hypothesis, but for char K = p > 0 with p ∉ P no morphism Spec L → Spec Z_{P′} exists; it should assume char K = 0 or char K ∈ P; affects nothing.
- **Misprint** in temkin17 at proof of Lemma 3.3.7, p. 120: the nontrivial direction is called obvious, induced valuations are put in S′, and the conclusion is drawn for L; it should prove S-tame ⇒ S′-tame, with valuations in S and composite the Galois closure L′; affects nothing.
- **Misprint** in temkin17 at proof of Theorem 2.6.6, p. 112: Corollary 2.5.6(ii) is cited, but that corollary has a single assertion; it should cite Corollary 2.5.6; affects nothing.
- **Misprint** in temkin17 at proof of Lemma 2.6.3(ii), p. 112: the characteristic of the field K̃_i is said to divide the residue degree; it should be the residual characteristic exponent p, since K̃_i can have characteristic 0; affects nothing.
- **Misprint** in temkin17 at proof of Lemma 3.2.10, p. 117: it refers to the first part of the theorem; it should be the first part of this lemma; affects nothing.
- **Misprint** in temkin17 at Theorem 4.2.1, proof Step 10, p. 123: a composite morphism is called log regular, T is undefined, and the target is written (X, S); it should be log smooth, with T = Z̄ ∪ f̄⁻¹(W̄) and target (S, W); affects nothing.
- **Gap** in ilo14 at Exposé X, proof of Theorem 3.5, Step 3, p. 163: b⁻¹(Z) ∪ f′⁻¹(W′) is called a subdivisor of Z′, which fails when b⁻¹(Z) has codimension two (A², Z the origin, Z′ = V(xy)); it should first blow up X along Z; affects the proof.
- **Misprint** in ilo14 at Exposé X, proof of Theorem 2.4 (§2.6), Step 3, p. 155: the unit and branch parts are given ranks μ and ν, then P is written Z^ν ⊕ N^μ; the two assignments should agree (P = Z^μ ⊕ N^ν); affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "a485141", "job": "REV-PKG-AdicCoefficientsAndComparisonsPartII", "model": "opus", "worker": "fable-rev55"} -->
