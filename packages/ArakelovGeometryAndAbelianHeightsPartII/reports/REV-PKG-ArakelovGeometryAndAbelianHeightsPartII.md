<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1056#issuecomment-6379256296 -->
Review (claude) of d2be3ab

Verdict: needs changes

1. **F01** (P2) Two declared gaps ask for what accepted supplier packages already provide

   **Location.** `packages/ArakelovGeometryAndAbelianHeightsPartII/README.md` line 105 (`gap:curve-local-analytic-contract`, "Provide the Banach-ring and hybrid analytifications, skeleton retraction, graph Laplacian and normalized Green functions, and model-metric and Chambert-Loir measure comparisons…") and line 111 (`gap:archimedean-curve-admissibility`); the same two entries in `design/plan.json` `gaps`; every `gap:` tag that follows a TB or GZ citation in the `*Needs:*` lines and Layer Dependencies (for example lines 439, 1083, 1124, 1162, 1402).

   **Claim.** The intake will announce these as missing supplier work. The TB `needs` is also compound (five constructions across four sections). The only TB item not stated by TB, scheme analytification over the Banach ring (ℤ, |·|∞), is this roadmap's own §2.1 (gluing seminorm charts on TB §0.1 spectra).

   **Witness.** Accepted packages (review.json 2026-10-20): TropicalAndBerkovichArithmetic (head 2dd8ca6) §§0.1, 0.12, 0.15, 0.23, 2.7, 2.13, 3.1, 3.3, 6.1–6.3, 6.6 (μ_a, mean-zero graph Green kernel), 6.8; GrossZagierAndArithmeticHeights (head b5527a0) §§2.2–2.4, 2.8 (mean-zero Arakelov Green function), 2.10 (residue isometry), 2.12, 2.13 (real descent).

   **Repair.** Delete both gaps from `design/plan.json` `gaps` and from README lines 105 and 111. Replace each label citation by the package section it names: `§TB.0/spectrum` → TB §0.1; `completed-residue-fields` → §0.15; `hybrid-analytic-space` → §0.23; `analytification` → §0.22 for complete nonarchimedean fields together with this roadmap's §2.1 over ℤ; `§TB.2/retraction-to-the-skeleton` → §2.7; `§TB.3/metric-graphs` → §3.1; `graph-laplacian` → §3.3; `formal-model-metrics` → §6.1; `model-measures` → §6.2; `semipositive-integrable-metrics` → §6.3; `measure-limits-and-local-heights` → §6.4; `graph-green-and-admissible-measure` → §6.6; `model-metric-laplacian` → §§6.7–6.8. For GZ: `explicit skeleton measure`/`graph admissible measure` → GZ §2.3; `archimedean admissible metric` → §2.4; `normalized arakelov green` → §2.8; `arakelov dualizing metric` → §2.10; `hodge index theorem…` → §2.12; `real admissible descent` → §2.13. If the author finds an item neither package states, keep one gap whose `needs` names only that item, with its hypotheses. Tested: with these citations every `gap:` tag in Layers 2, 7, 8 and 10 resolves to a stated section of an accepted earlier roadmap (TB at merge-order line 205, GZ at 228, this roadmap at 269).

2. **F02** (P2) SchemeAndStackFoundations Layer 5 is cited for geometric nefness, bigness and volume, which it does not state

   **Location.** README line 91 ("Geometric nefness and bigness use nonnegative curve degrees and volume, with positivity of top intersection for nef bundles"); line 167 (§0.1 `*Needs:*` "SchemeAndStackFoundations Layer 5 (nef big)"); line 209 (§0.5 "SchemeAndStackFoundations Layer 5 (big line)"); line 217 (Layer 0 Dependencies).

   **Claim.** The supplier provides geometric nefness, volume, bigness and the projective geometric Hilbert–Samuel/Siu input that §0.5 ("The geometric analogues over a field hold with h⁰ = dim H⁰") and §4.3 rely on.

   **Witness.** `TauCetiRoadmap/SchemeAndStackFoundations/README.md` (main) Layer 5 is §§5.1–5.12: Chow groups, pushforward, Chern classes, projective bundles, Gysin maps, intersection products, K₀, GRR, surfaces, Weil bound, Bézout. No nef or big line bundle and no volume is defined in it.

   **Repair.** Delete the two Layer 5 slug citations from lines 167, 209 and 217. Rewrite line 91: geometric nefness is defined in §0.1 and geometric volume and bigness in §§0.5 and 4.2 here; SchemeAndStackFoundations supplies §§5.1–5.3, 5.5–5.6 and 5.12 (Chow groups, degrees, first Chern classes, intersection products, Bézout) and §3.5 (norms of invertible sheaves, used for the relative-dimension-zero Deligne pairing). In §0.5 give the geometric projective case its own route and locator: Siu's inequality for ample L, M is stated at yuan-2008 line 197 (p. 6, with nef by approximation), and nef Hilbert–Samuel follows from asymptotic Riemann–Roch for nef bundles; record that textbook locator in `sources.toml`, or name a supplier section that states it. Tested: after the change no `*Needs:*` line cites an SSF section that lacks its content.

3. **F03** (P2) The promised comparison with ArithmeticDynamics §4.3a is not a target, yet §§2.6 and 5.4 apply ArithmeticDynamics theorems to this roadmap's bundles

   **Location.** README line 69: "The arbitrary-base completion in Layer 1 restricts to this global-field construction. Its comparison is required to preserve model representatives, boundary estimates, tensor products, metrics and normalized intersections". §5.4 `*Needs:*` line 895 ("ArithmeticDynamics §4.4"); §2.6 `*Needs:*` line 530 ("ArithmeticDynamics §4.1a").

   **Claim.** §5.4(2) applies ArithmeticDynamics §4.4 to L̄_f|_Y, an element of this roadmap's P̂ic(Y/ℤ) (§§1.3, 1.6, 5.2), and §2.6 uses the §4.4 canonical measure.

   **Witness.** ArithmeticDynamics §4.3a (open head) builds its own quasi-projective adelic Picard group, analytic metrics, intersections and heights, and states §4.4 on that carrier; no subsection here maps one group to the other.

   **Repair.** Add a target (a new §1.9, or a stated part of §1.6): for K a number field or a one-variable function field over k and X quasi-projective over K, the identity on model data induces an isomorphism from ArithmeticDynamics §4.3a's adelic Picard group of X to P̂ic(X/k) of §1.6, compatible with tensor product, pullback, the nef and integrable cones, the analytic metrics of §2.3, the intersection numbers of §3.1 and the normalized heights of §4.7 (with the factor [K:ℚ] of the conventions). *Needs:* ArithmeticDynamics §4.3a; §§1.6, 2.3, 3.1, 4.7. Add it to the `*Needs:*` of §§2.6 and 5.4. Check to add: on ℙ¹ over ℚ the standard O(1) has the same metric, self-intersection 0 and height h([1:2]) = log 2 on both sides.

4. **F04** (P2) Downstream consumers lists two roadmaps that are earlier in the merge order, one of them this roadmap's supplier

   **Location.** README line 2005: "ArithmeticDynamics consumes the arbitrary-base relative Deligne pairing and invariant/non-degenerate interfaces for families … GrossZagierAndArithmeticHeightsPartII can consume the relative admissible and theta identities".

   **Claim.** These roadmaps consume this one. For ArithmeticDynamics this records a two-way supply. Its board copy (`packages/ArithmeticDynamics/README.md` line 10935, "Use ArakelovGeometryAndAbelianHeightsPartII, AH.1–AH.4") still does so; its open head no longer cites this roadmap.

   **Witness.** `merge-order/ORDER.txt` lines 229 (GrossZagierAndArithmeticHeightsPartII), 268 (ArithmeticDynamics), 269 (this roadmap); this roadmap cites ArithmeticDynamics §§4.1a, 4.3, 4.3a, 4.4, 4.40 as supplier (lines 9, 67, 136, 858).

   **Repair.** Delete the ArithmeticDynamics and GrossZagierAndArithmeticHeightsPartII sentences from Downstream consumers and keep only later consumers (HeightsRationalPointsAndObstructionsPartII, merge-order line 291). Tested: after the deletion every consumer named in the README is later than line 269 and every supplier earlier.

5. **F05** (P2) "Uniform in the genus" overclaims Yuan's Theorem 1.4

   **Location.** README line 3: "a comparison, uniform in the genus, between admissible self-intersection and the stable Faltings height"; §13.10 Check, line 1990: "the statement says [ω_a²] ≍ 1, uniformly in g."

   **Claim.** The comparison constants do not depend on g.

   **Witness.** yuan-2026 Theorem 1.4 (line 477–478): constants c₃, c₄ "depending only on g". The README's own §13.10 route (line 1986) takes c₃ = 4^(−4g²)/12 (4⁻¹⁶/12 at g = 2), which tends to 0 with g.

   **Repair.** Line 3: "a comparison, uniform over all curves of a fixed genus g > 1 and all number fields and one-variable function fields, between…". Line 1990: "For fixed g, a curve with h_Fal ≤ 1 satisfies c₃(g) ≤ [ω_a²] ≤ c₄(g)."

6. **F06** (P2) A false Check in §4.6

   **Location.** README line 758: "For U projective, D′ can be any sufficiently ample effective arithmetic divisor."

   **Claim.** Every sufficiently ample effective D′ satisfies −D′ ≤ D ≤ D′.

   **Witness.** U = Spec ℤ, D = ([2], 0). For c > 0, D′ = (0, c) is effective of degree c, hence ample, but D′ − D = (−[2], c) is not effective.

   **Repair.** Replace by: "For U projective, D′ can be taken to be any effective nef arithmetic divisor whose finite part is at least |D| componentwise and whose Green function is at least |g_D|; on Spec ℤ, D = ([2], 0) is bounded by D′ = ([2], 0) + (0, c) for any c ≥ 0, while (0, c) is not an upper bound." Tested: D′ − D = (0, c) ≥ 0 and D′ + D = (2[2], c) ≥ 0, and D′ has degree log 2 + c ≥ 0 (nef).

7. **F07** (P3) Process residue: dangling errata fragments and numbering gaps

   **Location.** Line 443: "(Yuan–Zhang p. 72 prints e^(−g/2),rakelovGeometryAndAbelianHeightsPartII/E2)"; line 1214: "(Yuan §2.2.3, with the corrected display of)"; line 1973: "(Yuan pp. 93–95, with the λ̄₍O_K₎ reading of)". The subsections jump from 0.1 to 0.4 (line 169) and Layer 5 starts at 5.2 (line 832).

   **Witness.** The fragments are truncated register identifiers; the gaps show where targets were removed, which the timeless rule forbids.

   **Repair.** Line 443: "(Yuan–Zhang §3.2.2, p. 72, yuan-zhang-2025 line 2632, prints e^(−g/2); the convention of §3.2.1 requires e^(−g))". Delete the two dangling clauses at lines 1214 and 1973, or complete each with the exact display corrected. Renumber 0.4, 0.5 → 0.2, 0.3 and 5.2–5.5 → 5.1–5.4 and update every internal reference.

8. **F08** (P3) Generated prose defects and duplicated Checks

   **Location.** 72 proof routes start with the template "One proof route uses <capitalized clause>" (line 142 "One proof route uses Pass from smooth to continuous metrics", line 370 "One proof route uses Use the valued base scheme"). Doubled words "HeightsRationalPointsAndObstructions HeightsRationalPointsAndObstructions" at lines 967, 987, 993. Line 987 "with a projective compactification a symmetric relatively ample L" lacks a verb. Duplicated Checks: 160/164, 293/297, 333/337, 547/550, 1025/1029, 1051/1055, 1076/1080, 1155/1159, 1228/1232, 1395/1399, 1435/1439, 1436/1440, 1461/1464, 1871/1875, 1960/1963.

   **Repair.** Rewrite the template as "Route: …" with a grammatical sentence; delete the doubled words; complete line 987 ("an abelian scheme with a projective compactification and a symmetric relatively ample L = O(1,1)|_𝒜"); delete the second copy of each duplicated Check (every definition keeps at least three distinct Checks after deletion: checked for §§0.1, 1.3, 1.5, 2.7, 7.1–7.3, 7.7, 8.3, 10.1, 10.3, 10.4, 13.2, 13.8).

9. **F09** (P3) Layer Dependencies and supplier contracts omit consumed sections; build order inside Layer 4

   **Location.** Layer 3 Dependencies line 653 is empty (". The internal prerequisites…") although §3.1 needs HeightsRationalPointsAndObstructions §§5.17a–5.17b. Layer 0 Dependencies (line 217) omit HRPO §§5.17a–5.17f and ArithmeticDynamics §§4.1a, 4.3; Layer 2 (561) omits ArithmeticDynamics §4.1a; Layer 4 (827) omits SchemeAndStackFoundations §§0.20–0.21; Layer 5 (928) omits ArithmeticDynamics §4.4; Layer 6 (1004) omits HRPO §§5.17a–5.17b; Layer 11 (1715) omits StableReductionPartII §MC.6/arbitrary-field-hodge-positivity and §MC.6/finite-cover-hodge-descent. Supplier contracts omit ArithmeticDynamics §4.40 (used at 858), HRPO §0.11 (792), SchemeAndStackFoundations §§0.20–0.21 (682) and §3.5. §4.1's `*Needs:*` (line 682) cites §4.6, a later subsection of the same layer.

   **Repair.** Make each layer's Dependencies the union of its subsections' external `*Needs:*`; add the four missing sections to the supplier contracts; move §4.6 before §4.1 (it needs only §§1.2 and 1.5).

10. **F10** (P3) Locators

   **Location and repair.** (a) Slug labels that are not SchemeAndStackFoundations section numbers: "(first chern)" → §5.3 (lines 195, 217), "(chow group)" → §5.1 (lines 1569, 1653), "(degree)" → §5.2 and "(exterior product)" → §5.5, where `Chow.externalProduct` is defined (lines 1781, 1826); "(nef big)" and "(big line)" are R02. (b) §7.4 locator "yuan-2026 line 1788" (line 1087) points inside the proof of Theorem 3.6 on p. 52; Theorem A.1 is at yuan-2026 line 3531 (pp. 104–105). (c) §6.2's route (line 963) uses Lang, *Fundamentals of Diophantine Geometry*, Ch. 4, Prop. 3.3 and Cor. 3.4, which is not in `sources.toml`; either record it (uncertified textbook locator) or cite gao-habegger-2019 Proposition A.1(5) and its proof remark, line 2568–2578, which already states the result. (d) The TB and GZ labels of R01 carry no package section numbers; R01's repair supplies them.

11. **F11** (P3) The canonical pair is narrowed to g > 1 although the source proves it for g ≥ 1

   **Location.** Lines 17, 23 (scope and conventions), §7.4 (line 1087 "genus g > 1"), §§7.6–7.7, 8.1–8.7 and 9.1; §7.4 Check line 1108.

   **Witness.** yuan-2026 Theorem A.1 (line 3531–3532) and Theorem 2.3 (line 945–947) give the canonical admissible pair for genus g > 0; Proposition 2.7 and Theorems 2.8–2.9 are stated for g > 0 (lines 1114, 1177). Only §§9.2–13.10 need g > 1.

   **Repair.** State §§7.4, 7.6–7.7, 8.1–8.7 and 9.1 for g ≥ 1, using for the g = 1 existence step an admissible bundle of positive degree (see Source issues); keep g > 1 in §§9.2–13.10; adjust lines 17 and 23. If the genus-one pair is to stay out of scope, name its owner in Scope instead.

Six blocking findings (P2) and five non-blocking notes (P3). The mathematics of the targets is in good shape: every computed identity in Layers 9–13 checks, the fifteen sampled locators match their sources, and `Suggested.lean` elaborates. The blocking items are about supplier contracts and direction of supply (two declared gaps ask for what accepted supplier packages already state, a supplier is cited for content it does not have, a promised comparison with the supplier's carrier is not a target, and earlier roadmaps are listed as consumers), one overclaim and one false Check.

Mechanical outputs:

- `lake env lean packages/ArakelovGeometryAndAbelianHeightsPartII/Suggested.lean` (run from the content checkout): exit 0, no output at all (the file declares nothing, so there is not even a `sorry` warning), 8.5 s.
- Dependency check (`gate --depcheck … --movable`): `depcheck: 29 roadmaps, 263 edges, 0 problem(s)`. No UPWARD, CYCLE or moved line.

## Verified sound

**Sample of locators (15 of 15 verified at their text).** 1.2 (yuan-zhang-2025 Lemma 2.4.1 and Remark 2.4.2, lines 1291–1346; yuan-2026 lines 593–637); 1.6 (yuan-zhang-2025 §2.3 line 1103 and §2.5.3 lines 1533–1559, pp. 43–44; yuan-2026 lines 782–800); 1.8 (yuan-zhang-2025 Lemma 2.6.1, line 1759, p. 49, exact sequence and isomorphism match); 2.5 (yuan-zhang-2025 Lemma 5.1.2, line 5121, normality for the Green-function criterion; yuan-2026 Lemma 3.5 proof, line 1599); 2.7 (yuan-2026 §A.6 line 4027–4033; yuan-zhang-2025 §3.4.1 line 2878); 4.6 (yuan-zhang-2025 Lemma 5.1.7(1), line 5315, p. 138); 4.7 (yuan-2026 lines 2146–2170: [K(x):ℚ] versus [K(x):K]; yuan-zhang-2025 §5.3.1 line 5945 and Moriwaki condition lines 6122–6144); 5.4 (yuan-zhang-2025 Theorems 6.2.2–6.2.3, lines 7542–7562, pp. 188–189); 7.3 (yuan-2026 Proposition A.2 line 3662 and Proposition A.5 lines 3975–3999); 10.12 (yuan-2026 line 2992–3001, Faltings/Moret-Bailly normalization with the Faltings-metric λ); 11.2 (yuan-2026 Theorem 3.2, line 1329, and proof via Theorem 3.8, lines 1845–1907); 12.4 (yuan-2026 Lemma 4.3, line 2235; the README's extension to infinite Σ is valid by applying the bound to finite subsets); 12.5 (yuan-2026 Theorem 4.5, lines 2319–2363, all four parts and hypotheses); 13.7 (gaudron-remond-2014 Definition 2.1 line 305–325 and Corollaire 8.4 line 2177: h_Del ≥ −(g/2)log 2π, so h_Fal ≥ −(g/2)log(2π²) as the README states); 13.9 (yuan-2026 Theorem 4.14, line 3096; wilms-2022 Theorem 1.2, line 121). The author flagged no locator as unverified; the two uncertified texts are settled.

**Further locators read while checking statements (12).** yuan-2026 Theorems 1.3–1.4, 2.3, 2.8, 2.9, 3.6, 3.8, 4.1, 4.11, Lemmas 2.1, 2.2, 4.9; yuan-zhang-2025 Lemmas 4.4.1–4.4.4, Theorems 5.2.1–5.2.2, 5.3.2–5.3.3, Lemma 5.3.4, Theorem 5.3.7, Theorems 6.1.1–6.1.2; gao-habegger-2019 Propositions A.1–A.2; cinkir-2011 Theorem 2.9; cinkir-2015 type XIV and the 17/288 bound; wilms-2017 Theorem 1.1 and Corollary 1.2; looper-silverman-wilms-2021 Proposition 6.1; yuan-2008 Theorem 2.2 (lines 221, 364); stacks-pullback Tag 0E0L.

**Library declarations opened at the pins (7).** `TauCeti.AlgebraicGeometry.InvertibleSheaf` (TauCeti/AlgebraicGeometry/LineBundle/Basic.lean:112, full subcategory of invertible modules); `TauCeti.AlgebraicGeometry.AbelianVariety` (AbelianVariety/Basic.lean:95, group object with properness and geometric integrality); `InvertibleSheaf.eulerDegree` (LineBundle/Degree.lean:70) and `LineBundleClass.eulerDegree` (:126), truncated χ through H¹; `InvertibleSheaf.eulerDegree_canonicalBundle` (LineBundle/SerreDuality.lean:168, value 2g − 2 under properness and the file's integrality/DVR/function-field variables); `NumberField.prod_abs_eq_one` (Mathlib/NumberTheory/NumberField/ProductFormula.lean:98, with `x ≠ 0` and infinite-place multiplicities); `Projectivization.logHeight` (Mathlib/NumberTheory/Height/Projectivization.lean:51, variables `[AdmissibleAbsValues K] [Finite ι]`). All exist at the stated lines with the stated hypotheses. No Arakelov, Faltings, Berkovich, Deligne-pairing, adelic-line-bundle or metric-graph carrier exists in either pinned library (grep by object), which confirms the docstring's non-statability claims.

**Cross-roadmap citations resolved (11 suppliers).** ArakelovGeometryAndAbelianHeights (open head): §§1.1–1.15, 2.1, 2.7 (normalizations, h_Del = h_Fal + (g/2)log π), 2.8, 3.4, 5.0a–5.0b, 5.3–5.4, 5.9, 6.5 (Bost in both normalizations) all exist. HeightsRationalPointsAndObstructions (open head): §§0.11, 0.16, 0.18–0.20, 0.26–0.29, 5.17a–5.17f exist. ArithmeticDynamics (open head): §§4.1a, 4.3, 4.3a, 4.4, 4.40 exist. ComplexComparisonPartII §C5.4, JacobianChallengePartII §§1.2–1.4, 2.2, 2.4–2.7, 3.1, 3.3–3.13, 4.5–4.9, 5.1–5.2, 6.3 (conventions x ↦ dx − α, Θ = Δ_J^*(P^∨), τ(y,x) agree), NeronModelsAndSemistableAbelianVarieties §§3.3, 3.9–3.12, MotivesAndAlgebraicCycles §§2.2–2.3 exist at their open heads. SchemeAndStackFoundations (main) §§0.3, 0.20–0.21, 4.11–4.12, 5.1–5.6, 5.12 exist (but see R02). StableReductionPartII (board design): all thirteen cited target ids exist, and the statements of fine-level-scheme, integral-noether, semi-canonical-noether, boundary-thickness, maximal-variation, maximal-variation-hodge and stable-compactification-exists match their use. TropicalAndBerkovichArithmetic and GrossZagierAndArithmeticHeights read at their board heads (see R01). The citation tool's three leads are resolved: TB and GZ are board packages, StableReductionPartII a board design.

**Declared gaps (3).** singular-pluripotential-products is precise and minimal: no roadmap on main or in an open head plans Bedford–Taylor products (grep "Bedford": no match); it is declared under the same slug in `design/plan.json` and README line 97. The other two: R01.

**Ownership against open work.** Searched by object with the roadmaps service (Moriwaki heights, Gross–Schoen, φ-invariant, Deligne pairing, Faltings δ, adelic line bundles, Yuan–Zhang, Noether formula) and in the sibling READMEs: no other owner of the relative admissible theory, Zhang's graph invariants, the potential-bigness criterion or the Faltings-height comparison. ArithmeticDynamics §4.49's invariant extension on the PCF family is a special case of §5.2 owned there as an application; ArithmeticDynamics §4.3a overlaps §§1.6, 3.1, 4.7 in the global-field case by an accepted design split (R03 asks only for the comparison target).

**Suggested.lean.** One module docstring in the required form, single `import Mathlib`, namespace `TauCetiRoadmap.ArakelovGeometryAndAbelianHeightsPartII`, no declarations, no `set_option`, no sorry'd data. Headline theorems from the README: 11.2–11.4 (nef and big ω_a and ⟨ω_a, ω_a⟩), 12.3 (criterion), 12.5 (theta applications), 13.10 (uniform comparison), with the deep results 4.3, 4.8–4.9, 5.4, 5.5, 6.2–6.4, 7.4, 8.7, 9.1–9.3, 10.2, 10.10, 11.1, 13.5–13.6, 13.9. Each is named in the docstring with its missing carrier; none is statable at the pins (no adelic line bundle, admissible pairing, Faltings height, Faltings δ, Arakelov Green function or metric graph with resistance in Mathlib or Tau Ceti). With no declarations, the `#check @name` comparison and the one-tactic padding probe are vacuous: there is nothing to compare and no padding.

**README shape.** All required headings present; every layer ends with Examples and Dependencies; no LaTeX delimiters, no `lemma`, no pull-request numbers, no machine paths; `metadata.toml` (`topic = "math.NT"`) matches main roadmaps. Every definition has an API list and at least three Checks.

### Adversarial table

Values are computed by hand or by a small discretized-graph computation (24 subdivisions per edge) where noted as "num.".

| Statement | Instances tried | Values computed (left / right) | Result | Change |
| --- | --- | --- | --- | --- |
| Conv.: Green −log‖s‖ | ‖1‖ = e⁻¹, e⁻² on Spec ℤ; f = 2 | deg 1, 2; finite log 2 + arch. −log 2 = 0 | holds (yuan-zhang-2025 line 833–839) | none |
| Conv.: point heights | [1:2]/ℚ; quadratic K; [1:t]/k(t), t = u² | log 2; relative 2 log 2, absolute log 2; 1 → 2 | holds (yuan-2026 lines 2164–2170) | none |
| Conv.: Faltings/Deligne | squared-norm ratio π^(−g) | shift (g/2)log π: g = 1 0.5724, g = 2 1.1447 | holds (GR line 322) | none |
| Conv.: theta height | ĥ = ½ĥ_Θ; elliptic fibre | h_Θ = 2ĥ; deg Θ = 2 | holds (yuan-2026 line 2403) | none |
| Conv.: graph lengths | unit loop, unramified/ramified quadratic | length 1 / 2; τ 1/12 / 1/6 | holds | none |
| Conv.: Bost constant | g = 1, j = 0 (|η(ρ)| = 0.80058) | h_Fal = −(1/12)log((Im ρ)⁶|η(ρ)|²⁴) − log 2π = 0.5168 − 1.8379 = −1.3211; bound −½log(2π²) = −1.4913 holds, −½log(2π) = −0.9189 fails | README correct; source error | Source issues |
| 0.1 hermitian bundles | ‖1‖ = e^c, c = 1; e⁻¹ ⊗ e⁻² | deg −1, curvature 0 (semipositive, not nef); e⁻³, deg 3 | holds | none |
| 0.4 Deligne pairing | f finite flat deg 2, L = f*O(1); ℙ¹ × S | N(L) = O(2), deg 2 (identity 1); ⟨O(1)+π*M⟩² = 2M | holds (YZ Lemma 4.4.1) | none |
| 0.5 volume, HS, Siu | O(c) on Spec ℤ, c = 1, 0, −1; A = O(2), B = O(1), O(0) | log(2⌊e^m⌋+1)/m → 1, log 3/m → 0, 0; vol(A−B) = 1 = 2 − 1; zero mixed degree: vol = 2 | holds | R02 (geometric case) |
| 1.1 model divisors | [2], ½[2] on Spec ℤ; (0,1)+(0,2) | allowed / excluded (non-integral on U); (0,3) | holds | none |
| 1.2 boundary norm | E₀ = (0,1): ‖(0,c)‖; field, E₀ = 0; a·D | |c| (c = 2: 2); ∞ off 0; strict iff D̄ ≠ 0 = aD̄ | holds (YZ Lemma 2.4.1) | none |
| 1.3 adelic bundles | U = Spec ℤ[1/2], aᵢ → √2 | rational model coordinate r ∈ ℚ, √2 − r ∉ ℤ: not a model class | holds | none |
| 1.4 presentation | div(2), O(1) on Spec ℤ | degree 0; degree 1, not principal | holds | none |
| 1.5 positivity | O(−1) = O(0) − O(1) | integrable, degree −1, not nef | holds | none |
| 1.6 colimits | O(1) on Spec ℚ | arithmetic degree 1, image in Pic(Spec ℚ) = 0 | holds | none |
| 1.7 complex base | g = (log|z|)² on ℂ^× ⊂ ℙ¹ | g/|log|z|| → ∞; boundary bound C(1+|log|z||) | holds | none |
| 1.8 arithmetic curve | K = ℚ, U = Spec ℤ, Spec ℤ[1/2] | (O(U)^×/μ) ⊗ ℝ/ℤ = 0, ℝ/ℤ; Pic = 0 | holds (YZ Lemma 2.6.1) | none |
| 2.1 analytification | M(ℤ), |2| | 2^t: 2 at t = 1, √2 at t = ½; 2-adic ½ | holds | none |
| 2.2 metrized bundles | div(2) archimedean | e^(−g) = 2 (e^(−g/2) would give √2) | holds; YZ misprint | R07, Source issues |
| 2.3 injectivity | O(1), O(2) on Spec ℤ | Green 1, 2 at |·|∞, tc on the ray, 0 on p-adic rays | holds | none |
| 2.4 density | ord₀, ord∞ on k(t); rescaling | |t| = e⁻¹, e; |t| → 1 as a → 0 | holds | none |
| 2.5 effectivity | O(c), c = −1, 0, 1 | archimedean Green −1, 0, 1: false, true, true | holds (normal case) | none |
| 2.6 measures | ℙ¹ good reduction O(1), O(2), O(−1); Spec K | δ_ζ, 2δ_ζ, −δ_ζ; unit Dirac mass | holds | none |
| 2.7 trivial valuation | trivial model, ‖2‖; rescale by e | 1, 1; ‖1‖ = e violates normalization | holds | none |
| 3.1 intersections | O(1) on Spec ℤ; pullback to O_K, [K:ℚ] = 2 | 1; 2 | holds | none |
| 3.2 adelic pairing | degree-2 norm of f*O(1); family with deg L₂ = 3 | O(2); adds O(3) | holds | none |
| 3.3 composition | norms of degrees 2 then 3 | O(6) either way; ⟨L, π*O(2)⟩ = O(6) for fibre degree 3 | holds (YZ Lemma 4.6.1) | none |
| 3.4 pullback injectivity | E: y² = x³+3x+2 over 𝔽₅, Frobenius | E(𝔽₅) = {O,(1,±1),(2,±1)}, 4a³+27b² ≡ 1; P = (1,1) order 5; F*O(P−O) = O(5P−5O) = O | README hypothesis (reduced fibres) needed; source error | Source issues |
| 4.1 effective sections | O(c), c = 0, 1, −1 | {−1,0,1}: log 3; ⌊e⌋ = 2: 5 sections, log 5; {0}: 0 | holds | R09 (order) |
| 4.2 volume | O(−1), O(0), O(2) | 0, 0, 2 | holds | none |
| 4.3 adelic HS/Siu | d = 1, A = O(2), B = O(1), O(0) | vol(A−B) = 1; vol(A − εB) = 2 | holds (YZ Thm 5.2.2) | none |
| 4.4 pairing positivity | ℙ¹ × S, L = O(1)+π*M, deg M = 1 | ⟨L,L⟩ = 2M, degree 2 | holds (yuan-2026 Lemma 2.2) | none |
| 4.5 finite covers | degree 2, M^d = 3, 0 | 6, 0 | holds | none |
| 4.6 domination | Spec ℤ, D = ([2],0), D′ = (0,c) | D′ − D = (−[2], c) not effective | Check false | R06 |
| 4.7 heights | [1:2]/ℚ; [1:t]/k(t); YZ factor | log 2; 1, 2 after t = u²; h_YZ = [K:ℚ]h | holds | none |
| 4.8 height inequality | X = S = ℙ¹, id; trivial bundle | log 2 ≥ 1·log 2; 0 cannot dominate | holds (YZ Thm 5.3.7) | none |
| 4.9 fundamental ineq. | Spec K, [K:ℚ] = 2, O(1) | 2/(2·1·1) = 1 = e₁; without a_K: 2 ≤ 1 false | holds (YZ Thm 5.3.3) | none |
| 5.2 invariant extensions | z ↦ z²; f = id | max(1,|z²|) = max(1,|z|)², h(2) = log 2; q = 1: uniqueness fails | holds (YZ Thms 6.1.1–6.1.2) | none |
| 5.3 non-degeneracy | A₀ × S (1,1); torsion section; S = Spec K | Betti rank 2 < 4; 0 < 2; deg_L Y > 0 | holds (YZ §6.2.2) | none |
| 5.4 equidistribution | constant A₀ over a point | torsion: height 0, Haar mass 1; repeated 0 not generic | holds | R03 |
| 5.5 Hodge bundle | [K:ℚ] = 2, height h | raw 2h, absolute h; Deligne +(g/2)log π | holds (yuan-2026 Lemma 3.4) | none |
| 6.1 Moriwaki heights | ℚ, [1:2]; H̄₁ trivial | log 2; ≡ 0, Northcott fails | holds | none |
| 6.2 height machine | ℙ¹_ℚ [1:n]; zero polarization | log n, 2 log n, 0; infinite bounded set | holds (GH Prop. A.1) | R10(c) |
| 6.3 Néron–Tate | P of order 2; P of height a | 0; 0, a, 4a | holds | none |
| 6.4 specialization | degree-2 cover, slope 3 | 6/2 = 3 | holds | none |
| 7.1 abelian metrics | good reduction O(e); Tate curve | δ_ζ mass 1; Haar mass 1 vs atomic | holds | none |
| 7.2 curve metrics | unit banana, model ω | δ_v1 + δ_v2 (deg 1 each) vs (2/3)Σdx, both mass 2 | holds | none |
| 7.3 μ_a | unit banana, r_e = ½ | density 1/(2·3/2) = 1/3, total 1 (num. 1.000) | holds (Prop. A.5) | none |
| 7.4 canonical pair | g = 2; diagonal shift c; two elliptic components | mass 2; mean c ≠ 0; bridge r_e = ∞, 2μ = δ+δ = model | holds | R11 |
| 7.5 graph formulas | good reduction; unramified quadratic | e⁰ = 1; length 1, ÷e = 1 vs ÷[K′:K] = ½ | holds | none |
| 7.6 rescaling | a = 2 | Green 1 → 2, norm e⁻¹ → e⁻² | holds | none |
| 7.7 global bundles | g = 2, quadratic extension | raw W doubles, W/[K:ℚ] invariant | holds | none |
| 8.1 admissible extensions | unit banana model ω | atomic mass 2 vs edge mass 3·(2/3) = 2, unequal measures | holds | none |
| 8.2 existence/uniqueness | base O(1), O(2) over ℚ | differ by O(1) | holds | none |
| 8.3 canonical bundles | g = 2 | deg w = 2, Δ*D = −w of degree −2 | holds (yuan-2026 Thm 2.3) | none |
| 8.4 theta bundle | Θ̄ + O(1) | [2]* gives 4Θ̄ + O(1), 4(·) gives 4Θ̄ + O(4): defect O(−3) | holds | none |
| 8.5 section divisors | deg x*w = a | ⟨O(x)ₐ,O(x)ₐ⟩ = −a, ⟨O(x)ₐ,w⟩ = a | holds (Prop. 2.7) | none |
| 8.6 vertical group | O(1) from Spec ℤ; O(x)ₐ | vertical; not vertical (degree 1) | holds | none |
| 8.7 Hodge index | principal theta height a | Θ-height 2a, ⟨M̄,M̄⟩ = −2a | holds (Thm 2.8) | none |
| 9.1 theta pullbacks | expansion; g = 2, d = 1 | (d²w+2dᾱ)² − 4gd²⟨ᾱ,ᾱ⟩ = d⁴P + 4d³⟨w,ᾱ⟩ − (4g−4)d²⟨ᾱ,ᾱ⟩; both forms A + 8b; fibre degree 2gd² both sides | holds (Thm 2.9) | none |
| 9.2 canonical/difference/shift | d = 2g − 2; g = 2, 3 | d² + 2d = 4g(g−1); d²(d²+4d−4g+4) = 16g(g−1)³; 8, 32 / 24, 384; shift 16(g−1)³Θ̄ + 16g(g−1)³P | holds (yuan-2026 lines 393, 1304–1308) | none |
| 9.3 nefness of w | P-coefficient; g = 2, 3 | −1/(4g(g−1)) + 16g(g−1)³/(64g²(g−1)⁴) = 0; −1/8 + 32/256 = 0; −1/24 + 384/9216 = 0 | holds (line 374) | none |
| 10.1 graph invariants | unit loop g = 2; loop ℓ = 2, g = 3; bridge g = 2 | ε, φ, τ = 1/6, 1/12, 1/12 (num. .1664, .0828, .0832); 4/9, 2/9, 1/6 (num. .4437, .2210, .1664); 1, 1, 1/4 | holds | none |
| 10.2 inequalities | K₄ (g = 3); bridge; t(3), t(4) | φ/δ = 17/288 ≥ 0.05447 ≥ 1/39; de Jong 6 + 11/6 − 17/24 = 7.125 = 9 − 6·5/16; bridge 0 = 0; t(4) = 3/88 | holds | none |
| 10.3 local φ | type-0 node, g = 2; ramified quadratic | 1/12; 1/6 | holds | none |
| 10.4 E_S | g = 2 unit node | 1/6 | holds | none |
| 10.5 ε bound | g = 2 unit node | 2 − 1/6 = 11/6 ≥ 0 | holds | none |
| 10.6 Φ_S | unit loop g = 2 | 1/12; domain is the square | holds; source misprint | Source issues |
| 10.7 triple pairing | coefficient sum | 8 − 24 + 24 + 12(g−1) = 12g − 4 (g = 2: 20) | holds (Thm 3.6) | none |
| 10.8 φ bound | unit loop g = 2 | 1/12 − 1/39 = 3/52 > 0 | holds | none |
| 10.9 Hodge decomposition | g = 2 | 1 + 19.5·15 = 293.5 ≤ 300; 12/300 = 1/25 | holds (Thm 3.8) | none |
| 10.10 Gross–Schoen | hyperelliptic g = 2, φ = 5 | (5/2)W − φ = 0 ⇒ W = 2; quadratic: W = 4, φ = 10 | holds | none |
| 10.11 Faltings δ | g = 1 at ρ; theta rescale by e | −log(0.002027) − 8 log 2π = −8.50 > −9; shift −24 | holds | none |
| 10.12 Noether | g = 2, K = ℚ | constant −8 log 2π = −14.70 | holds | none |
| 10.13 Ξ_S | g = 2 unit node; archimedean | 1 + 1/6 = 7/6; δ − 4g log 2π | holds | none |
| 10.14 obstruction | |t|^(1/log(1/|t|)) | e⁻¹; limit ε = 1/6 vs 0 | holds | none |
| 11.1 φ positivity | a = 1/156 | 1/39 − 2/156 = 1/78 > 0 | holds | none |
| 11.2 geometric bigness | g = 2, deg λ = 1 | deg P ≥ 1/25 | holds (Thm 3.2) | none |
| 11.3 arithmetic bigness | g = 2, d = 1, [K:ℚ] = 2 | normalized ≥ 2c₀/5, raw ≥ 4c₀/5 | holds | none |
| 11.4 bigness of w | g = 2, dim S = 1 | a = 4·2·1·2 = 16; term 2·16·P¹ = 32P¹ > 0 | holds (line 1344) | none |
| 12.1 relative powers | Y = S; L = π*M, e = 1 | m⊠L = mL; top degrees 0 | holds | none |
| 12.2 pairings | e = 1, m = 2; d = 2, a = 2, M² = 3, m = 3 | (2,1),(1,2) → aM, (3,0),(0,3) → 0; 2¹·3 = 6 | holds | none |
| 12.3 criterion | dim S = 0, e = 1, a = 2 | (em)!a^m/(e!)^m = m!·2^m > 0 | holds (Thm 4.1) | none |
| 12.4 grid bound | Z = Σ², |Σ| = 3; Z = ∪ᵢ C×{sᵢ}, n lines | d = 2, deg 9, bound 3 (sharp); d = 1, deg n, bound n (sharp) | holds | none |
| 12.5 theta potential bigness | g = 2, d_α = 1 | 2P + ι*Θ̄; 8w + π*P; 16Θ̄ + 32π*P | holds (Thm 4.5) | none |
| 12.6 restriction | ℤ[x]/(x²−2) at 2 | fibre 𝔽₂[x]/(x²), integral test Spec 𝔽₂ | holds | none |
| 13.1 function-field h_Fal | g = 2, char ≠ 3; deg 3 over degree 2 | > 3⁻¹⁶; 3/2 | holds (Lemma 4.9) | none |
| 13.2 global invariants | g = 2 unit node; quadratic | (1, 1/6, 1/12); raw sums double | holds | none |
| 13.3 Zhang correction | h = 1/10, δ = 1, ε = 1/6 | W_model = 1/5, Wₐ = 1/30 = (2/5)(1/12) | holds | none |
| 13.4 lower bounds | A(g) | A(4) = 139; A(3) = 1 + (432/17 + 2)·7/2 = 96.94; A(5) = 109.625; g = 2: 107.25; limit 47 | holds (yuan-2026 lines 2948–2969) | none |
| 13.5 function-field comparison | A = 139, 107.25 | 12/139 = 0.0863 ≥ 1/12; 12/107.25 = 0.1119 | holds (Thm 4.11) | none |
| 13.6 Wilms bound | g = 1, 2 | −10.544 < −9; −21.088 | holds | none |
| 13.7 comparison height | g = 1, j = 0 | c = ½log(2π²) + 1 = 2.4913; h + c = 1.1702 ≥ 1 | holds | Source issues |
| 13.8 coercive divisor | unit K₄, c(3) = 17/288 | (483/17)(17/48) − 6 − 11/6 = 107/48; −Δ: −181/48 < 0; −cΔ: 15/8 > 0 (cinkir-2015 XIV: A = 12, B = 3, C = 16; num. φ .3504, ε 1.831) | holds; source misprint | Source issues |
| 13.9 number-field comparison | constants | 2g log(2π⁴) + 4g log 2π = 6g log(2π²); g = 1: 17.896 | holds (Thm 4.14) | none |
| 13.10 uniform comparison | h < 1 function field; h ≥ max(1, 24|c₅|) | (1/12)4^(−4g²) = c₃; h/12 + c₅ ≥ h/24 | holds; prose overclaims | R05 |

## Not verifiable

- moret-bailly-1989 (Théorème 2.5) and faltings-1984 (Theorem 6, pp. 401–402): settled as uncertified (paywalled). The normalization they support was checked through yuan-2026 line 2996–3001 and wilms-2017 Theorem 1.1.
- Works cited only "as recalled in" Yuan or Yuan–Zhang (Szpiro Lemme 3.2.1, Zhang 1993 Theorems 4.4 and 4.6, Heinz Proposition 4.3, Coman–Guedj–Zeriahi, Klein–Randić Theorem D, Baker–Faber §6, BLR §7.4): not read; the recalled statements were checked in yuan-2026 and yuan-zhang-2025 at the README locators.
- Lang, *Fundamentals of Diophantine Geometry*: not in the manifest and not needed for the statement (R10(c)).
- The TB and GZ catalogue labels (`TB.0/spectrum`, `GZ.2 (…)`): the supplier design files at their heads hold only the `gaps` array, so the labels were resolved by content against the package sections (R01).
- yuan-2026 was read in the author manuscript of 21 August 2024 (as the manifest records); the published pagination was not compared.

## Source issues

- **Misprint** in yuan-zhang-2025 at §3.2.2, p. 72: the source says the term e^(−g/2) defines the metric of O(D) attached to an arithmetic divisor (D, g); it should be e^(−g), as the Green-function convention of §3.2.1 and the inverse map −log‖s‖ require; affects nothing.
- **Error** in yuan-2026 at Lemma 2.1(1), p. 25: the source says π* on adelic Picard groups is injective for projective flat π with geometrically connected fibres; it should be the same statement with geometrically reduced fibres added, since relative Frobenius of an elliptic curve over 𝔽₅ kills an order-five class; affects a stated result.
- **Misprint** in yuan-2026 at §3.3.1, p. 49: the source says δ(C) equals δ of the split semistable base change divided by [K′:K]; it should be divided by the ramification index e(K′/K) when nodes are counted as points; affects nothing.
- **Misprint** in yuan-2026 at §3.3.2, p. 50: the source says the Green function of Φ_S is an integral over the analytic fibre of X; it should be over the analytic fibre of X ×_S X, where c₁(O(Δ)ₐ)² lives; affects nothing.
- **Error** in yuan-2026 at §4.4.1, p. 78 (also p. 84): the source says Bost gives h_Fal ≥ −g log √(2π) in the Faltings normalization of §4.3.1; it should be −(g/2) log(2π²) there, the stated constant being the Deligne-normalized one; affects the proof (constant c only).
- **Misprint** in yuan-2026 at proof of Theorem 4.14, p. 94: the source says the geometric part D̃_S − Δ̃_S is effective; it should be D̃_S − c(g)Δ̃_S, as derived on p. 95 (D̃ − Δ̃ is negative at the unit tetrahedral graph); affects nothing.
- **Gap** in yuan-2026 at proof of Theorem A.1, p. 113: the source says property (2) follows from constancy of the pairing integral with L = ω_C, which is empty when g = 1 since c₁(ω) = 0; it should be the same argument with an admissible L of positive degree; affects the proof (genus one only).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "d2be3ab", "job": "REV-PKG-ArakelovGeometryAndAbelianHeightsPartII", "model": "opus", "worker": "fable-rev46"} -->
