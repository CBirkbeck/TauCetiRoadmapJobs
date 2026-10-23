<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/391#issuecomment-6369000373 -->
Review (claude) of 6502997

Verdict: needs changes

1. **F01** (P1) gap:G01 has no supplier and is not declared where the intake reads it

   **Location.** `packages/PadicHodgeTheoryPartII/design/plan.json` lines 1450–1464, the entry `"id": "G01"`, which has only `title`, `neededBy` and `detail`. `design/README.md` line 25 says: "The additional quasisplit contract belongs to the proposed local-generation continuation of reductive groups."

   **Claim.** The quasisplit generic-filtration contract is supplied by a "proposed" roadmap.

   **Witness.** ReductiveGroupsLocalGenerationPartII has no board job, no roadmap on main or at an open head, and no line in `ORDER.txt`: the supplier is `none`. Neither the README nor any node prerequisite mentions `gap:G01`.

   **Repair.**
   - Give G01 `supplier` ReductiveGroupsPartIII and `section` RG3.0, plus a one-sentence `needs` (see R06). ReductiveGroupsPartIII has the open board package job PKG-ReductiveGroupsPartIII, and its design was accepted.
   - Add `### From ReductiveGroupsPartIII` under `## Exact supplier contracts` with "What ReductiveGroupsPartIII must provide (gap:G01): …".
   - Add `gap:G01` to the prerequisites of the six `neededBy` nodes.
   - If that supplier declines, state the corrected threshold formula here as a GM1 target instead.
   - Test case: for the nonnormal cubic E = Q_5(5^{1/3}), G = Res_{E/Q_5} G_m, V = E and μ selecting the identity embedding, the contract must give generic jump 0. The refined orbits have pairings 1 and 0, and their minimum is 0.

2. **F02** (P1) gap:G02 is unowned and creates a two-way supply with the component roadmap

   **Location.** `design/plan.json` lines 1465–1471 (G02), node `GM4/quasisplit-converse` (line 1329). `design/README.md` line 30: "the GLX ADLV continuation must supply: … (4)⇒(3) of GLX Theorem 6.1(a)". Line 672: "The crystalline period point with open derived image is the arithmetic input to the GLX connected-component argument".

   **Claim.** The reverse implication can be imported from a component roadmap "independently of the forward implication imported from this roadmap".

   **Witness.** GLX26 lines 2140–2142, 2172–2175: Lemma 6.12 (GM4/open-component-stabilizers) proves (4)⇒(5), a link of the converse chain (4)⇒(5)⇒(1)⇒(2)⇒(3). The supplier would consume GM3–GM4 while GM4 consumes it. No component continuation has a board job.

   **Repair.**
   - Delete `GM4/quasisplit-converse` and G02 from plan.json and the README.
   - Under Scope, record GLX Proposition 5.11 as a consumer theorem of the future component continuation of HeckeStacksAndLocalShtukas, which imports GM2–GM4 from here.
   - Keep transitivity as the explicit hypothesis of `GM4/open-component-stabilizers`, and cite HeckeStacksAndLocalShtukas §HS2.16 for it. HS2.16 proves it for minuscule μ, and for general μ under its finite-level openness hypothesis.
   - After this, no GM node uses any (4)⇒(3) input, and supply runs one way.

3. **F03** (P1) Serre–Sen openness is cited to a parent node that does not exist

   **Location.** `design/README.md` line 21: "`PadicHodgeTheory:R06.1` and `PadicHodgeTheory:R06.2` … `crystalline-monodromy-group-interface`. These supply … Serre–Sen openness." It is used at lines 531, 553 and 639. Line 218 says "the parent Mumford–Tate group".

   **Claim.** The parent supplies the algebraic monodromy group of a crystalline representation and the openness of its image.

   **Witness.** PadicHodgeTheory at its pull-request head 4c4f1e8 maps only `R06.4` (§6.4) and `R06.6` (§9.3). It has no Mumford–Tate or monodromy group. Its §4.4 uses Sen's inertia Lie-algebra theorem only for `senOperator_zero_iff_finiteInertia`.

   **Repair.**
   - Declare `gap:G03`: supplier PadicHodgeTheory, section §4.4. Needs: "for finite K/Q̆_p, connected reductive G/Q_p and continuous crystalline ξ:Γ_K→G(Q_p), ξ(Γ_K) is open in the Q_p-points of its Zariski closure (Chen14 Prop. 3.2.1(2))".
   - Take H and H° from ArithmeticGaloisRepresentations §7.6, which owns the monodromy group and its identity component.
   - Delete "parent Mumford–Tate group".
   - Test cases: the cyclotomic character has image Z_p^×, open in Q_p^×. A finite-image ξ has a finite closure whose points equal the image.

4. **F04** (P1) ReductiveGroupsPartIII is cited as a supplier, but it exists only as a board package job

   **Location.** `design/README.md` line 25 ("`ReductiveGroupsPartIII:RG3.0/highest-weight-character-basis` supplies the split geometric starting point") and line 344. It appears in the prerequisites of the four GM1 nodes, `GM2/generic-derived-monodromy` and the Layer 2 dependencies (line 446).

   **Claim.** RG3.0 is a supplier section that can be cited.

   **Witness.** No ReductiveGroupsPartIII roadmap on main or at an open head; absent from `ORDER.txt` (so the gate ignores it); only the board job PKG-ReductiveGroupsPartIII exists. Split highest weights are on main: ReductiveGroups Layer 10B (simples by dominant weights, weights between w₀λ and λ).

   **Repair.**
   - Replace the RG3.0 citations with ReductiveGroups Layer 10 (split highest weights, weights between w₀λ and λ, one-dimensional simples).
   - Move only the quasisplit/Galois part into gap:G01 (R01, R06).
   - Remove the RG3.0 prerequisite from all six nodes.
   - Test case: for GL₂ standard, the weights (1,0) and (0,1) lie between w₀λ = (0,1) and λ = (1,0).

5. **F05** (P1) Prerequisites described as supplied that the cited sections do not contain

   **Location.** `design/README.md` line 26: "`#layer-7-structure-theory`, supplies … In particular, … f(J°)⊇G_der implies J°⊇G_tilde_der" and "needed from `ReductiveGroupsPartII:RG2.0` are Zariski density…". Line 28: "`SchemeAndStackFoundations:SF.0` supplies determinantal rank loci". plan.json lines 1374–1412 list them as `requests`, which the intake does not read.

   **Claim.** These suppliers provide the statements quoted above.

   **Witness.** ReductiveGroups Layer 7 (main): Borel, Levi, root datum, Bruhat; no lifting lemma. ReductiveGroupsPartII RG2.0: no Zariski density. SchemeAndStackFoundations Layer 0: `etale_coordinates` (§0.8), fibre-dimension semicontinuity; no rank loci or flag filtration (plan.json line 1399 concedes).

   **Repair.**
   - State as GM3 targets with locators: the central-lifting lemma (the README's own sketch) and the Zariski density of open subgroups of H°(Q_p).
   - Declare `gap:G04`: supplier SchemeAndStackFoundations, Layer 0. Needs: upper semicontinuity of dim(D′∩Fil^i_x) on Fl_μ, together with the locally free universal filtration. Name the owner of Fl_μ itself; HS2.12 uses GeometricSatakeAndFusion's section "Open cells, action truncation and minuscule flags".
   - Point the dominant-chamber conjugacy at BunGAndNewtonStrata §1.12.
   - Point the isogeny openness at RG2.0.2 *smooth-morphism-open-map*.
   - Point Tag 02GL at Mathlib `Algebra.Etale.iff_exists_algEquiv_prod` (`Mathlib/RingTheory/Etale/Field.lean`:271).
   - Test case for the lemma: for GL₂→PGL₂ (kernel G_m) and J = GL₂, J° ⊇ SL₂. For J a maximal torus, the hypothesis fails.

6. **F06** (P2) The `needs` of G01 is compound and partly asks for what is already provided

   **Location.** `design/plan.json` line 1462 (G01 `detail`), quoted in the brief: "Required contract: … generic filtration … equals V∩Fil_η … threshold … equality for conjugate cocharacters … Galois descent … semilinear Frobenius transport, and the character criterion".

   **Claim.** One supplier contract.

   **Witness.** Six distinct theorems. The character criterion follows from ReductiveGroups Layer 10B. Generic-flag equality is Chen Lemme 4.2.2 (GLX26 lines 1435–1458), the rank-locus argument of this design's GM2. Frobenius transport is GLX26 lines 1649–1654, inside GM1's own proof.

   **Repair.**
   - Reduce G01 to one sentence: "for a quasisplit connected reductive group over a characteristic-zero field, the irreducible representations are the W_O for dominant Γ-orbits O, with V_O⊗K̄ = ⊕_{λ∈O} V^λ, Galois descent of isotypic components, and refinement to Γ_E-orbits for any finite, possibly nonnormal E".
   - State generic-flag equality, the corrected threshold formula and Frobenius transport as GM1 targets.
   - Cite ReductiveGroups Layer 10 for the character criterion.

7. **F07** (P2) GM3 infinite transcendence re-plans a ReductiveGroupsPartII target

   **Location.** `design/README.md` lines 454–495, nodes `GM3/witt-leading-digit` (plan line 1009) and `GM3/infinite-transcendence` (line 1050). Line 476 says: "F=Frac W(overline F_p)=breve Q_p has infinite transcendence degree over Q_p."

   **Claim.** This is a new target of this roadmap.

   **Witness.** ReductiveGroupsPartII §RG2.0.4 (open head, earlier in the order) plans `transcendenceDegree_infinite`: Ĕ has infinite transcendence degree over E in characteristic zero. It cites Chen Prop. 2.0.3, pp. 734–735, and also plans `padic_witt` (Ĕ≅Frac W(F̄_p)).

   **Repair.**
   - Delete both nodes and their README subsections.
   - Make `GM3/generic-classical-points` need ReductiveGroupsPartII §RG2.0.4 `transcendenceDegree_infinite`.
   - Pass the strengthened residue-degree bound (Chen gap, see Source issues) to that owner as a note.

8. **F08** (P2) `newtonHodgeVectors_tensorMap` is missing the admissibility hypothesis

   **Location.** `design/README.md` line 119: "Fix an s-decent b, s>0, K/F finite, a filtration μ and a rational representation". Line 135: "A representation morphism preserving the filtered isocrystal sends a member to a member with the same k whenever its image is nonzero."

   **Claim.** It holds for every s-decent b and every μ.

   **Witness.** T = G_m², b = 1 (s = 1, ν = 0), μ = (0,1), V = χ₁⊕χ₂, v = e₁+e₂: Newton exponent 0, d₁(v) = min(0,1) = 0, so v ∈ V^{1,0}. The projection to χ₂ gives e₂ with d₁ = 1 ≠ 0.

   **Repair.**
   - Add the hypothesis "(b,μ) admissible", i.e. every F_{b,μ}(V) is weakly admissible. Strictness of morphisms between weakly admissible objects then preserves degrees.
   - Add the instance above as a negative-control Check.
   - With the hypothesis, a split torus has b ≡ μ(p) and ν = μ, so components with equal Newton exponent have equal μ-weight.

9. **F09** (P3) Cross-roadmap citations use explorer ids that do not resolve at the cited heads

   **Location.** `design/README.md` lines 21–29 and every Dependencies list. Examples: "`BunGAndNewtonStrata:BG0/decent-representative`", "`HeckeStacksAndLocalShtukas:HS2/classical-period-points`", "`MotivesAndAlgebraicCycles:MC.6/tensor-iso-torsor`", "Only part (b) of `nonemptiness-and-period-connectedness`".

   **Claim.** These are supplier sections.

   **Witness.** None of these ids occurs at the cited heads; BunGAndNewtonStrata's anchors sit in Layer 1, not "BG0/BG1"; HeckeStacksAndLocalShtukas §HS2.15 has no part (b). The content exists under the locators listed in the repair.

   **Repair.** Re-point each citation:
   - **PadicHodgeTheory.** Weak admissibility, the abelian category and HN → §3.4 (`filteredHN`). Colmez–Fontaine over finite K/Q̆_p → §3.5 and §5.5 (via FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.4.13). The G-fibre functor → §3.6 (`filteredGFunctor`, `admissiblePair`). Torsor triviality → §5.5 (`periodTorsor_neutral`).
   - **MotivesAndAlgebraicCycles.** §§6.1–6.3 and §6.8.
   - **BunGAndNewtonStrata.** §§1.7, 1.8, 1.9, 1.12, 1.23, 1.43.
   - **HeckeStacksAndLocalShtukas.** §§HS2.11, HS2.12, HS2.13 and HS2.15.
   - **ArithmeticGaloisRepresentations.** "R01.1" → §1.1.
   - **SchemeAndStackFoundations.** "SF.0" → §0.8.
   - **ReductiveGroups.** Cite "Layer 1" and "Layer 7", not `tauceti:` anchors.
   - **DiamondsAndVStacks.** These resolve (§§D0.6, D3.10, D5.3, D5.16, D6.5); cite them by section.

10. **F10** (P3) The pins are wrong, and the text uses process narrative

   **Location.** `design/README.md` line 13: "The fixed libraries are Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369." Line 15: "The current Tau Ceti library a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039 also has". The same pins appear in plan.json lines 15–16.

   **Claim.** These are the fixed libraries.

   **Witness.** The content `lake-manifest.json` pins Mathlib 6b7abb3c and Tau Ceti a91d3aaf. `ExteriorStabilizer/Character.lean` is absent at f790474 and present at the pin.

   **Repair.**
   - Delete the hashes and the word "current".
   - List the library facts under `### From Mathlib` and `### From Tau Ceti`, at the pins:
     - Mathlib: `WittVector.isocrystal_classification` (`Mathlib/RingTheory/WittVector/Isocrystal.lean`:180, rank one), `WittVector.teichmuller` (`Teichmuller.lean`:93), `WittVector.verschiebung` (`Verschiebung.lean`:109), `WittVector.ghostComponent` (`Basic.lean`:296), `AlgebraicIndependent` (`AlgebraicIndependent/Defs.lean`:54).
     - Tau Ceti: `TauCeti.HopfIdeal.exists_finite_subcomodule_exteriorPower_line_stabilizer` (`TauCeti/Algebra/AlgebraicGroup/Representation/ExteriorStabilizer/Character.lean`:101), `TauCeti.Tannaka.fgPointTensorIsoEquiv` (`…/Tannaka/Equivalence.lean`:188).

11. **F11** (P3) README shape, Part II framing and house style

   **Location.** `design/README.md` line 1, "# Roadmap: generic crystalline monodromy"; headings "What is available today", "Prerequisites and boundaries", "Layer overview"; field-list prose "The proposed declaration is …"; process words "proposed continuation", "has no staged packet" (G02).

   **Claim.** The README is in TauCetiRoadmap form.

   **Witness.** Missing headings: `## Scope and ownership`, `## Exact supplier contracts`, `## How to read the build`, and the `### k.n` numbering. No target has its own `*Needs:*` line. The Layer 3 list, for example, mixes Witt-vector lemmas with HS2 period points.

   **Repair.**
   - Retitle "p-adic Hodge theory and geometric comparison, Part II: generic crystalline monodromy".
   - Open by saying where PadicHodgeTheory stops: the §5.5 period torsor and §4.4 Sen theory, with no algebraic monodromy group.
   - Restructure into the house headings, give every target its own `*Needs:*` line, and delete the process words.

12. **F12** (P3) Checks that are not tests, name Lean objects, or are false

   **Location.**
   - Checks with backticked names: `degreeAt_rankOne`, `degreeSum_zero`, `newtonHodge_rankOne`, `decentFibre_unit`, … (16 bullets).
   - Line 330: "The compact Lean milestone checks…"
   - Line 406: "The proof has no edge from the GM4 converse…"
   - Line 647: "The dependency graph has no edge…"
   - Line 472: "…must not be parsed as p^{n−bm}."
   - Line 609: "For finite image C, each orbit descends … with stabilizer C."

   **Witness.** For C = {1, diag(1,−1)} ⊂ GL₂(Q_p) and g = [[1,1],[0,1]], the stabilizer of the orbit gC is gCg⁻¹, which contains [[1,−2],[0,−1]] ∉ C.

   **Repair.**
   - Drop the Lean names from Checks.
   - Replace the non-tests with computed Checks, such as the Res-torus threshold of R01 and the counterexample of R08.
   - Restate line 609 as: the identity-coset orbit has stabilizer C, and the orbit gC has stabilizer gCg⁻¹.

13. **F13** (P3) The planned Lean companion is padding, not headline statements

   **Location.** `design/README.md` line 56: "The short Lean companion contains the two light definitions … sample calculations, and the finite rational positivity milestone `positive_sum_forces_zero`." plan.json `suggestedLean.verification` (line 2108) records "ten theorem signatures and six examples".

   **Witness.**
   - `frobeniusDegreeSum_zero/_one/_succ` close by `Finset.sum_range_zero/_one/_succ` (to_additive of `Mathlib/Algebra/BigOperators/Group/Finset/Defs.lean`:598 and `Basic.lean`:563, :536).
   - `DegreeAt.mem` and `.not_mem_succ` are projections.
   - `positive_sum_forces_zero` is algebra on free rationals.

   **Repair.**
   - At the package stage, delete these declarations.
   - The docstring should name as not statable: GLX Thm 5.8(1)–(2), Prop. 5.9, the z-extension comparison and the compact-torsor theorem. The missing carriers are crystalline realizations of admissible pairs, filtered G-isocrystals over finite K/Q̆_p, Fl_μ, and local shtuka diamonds.
   - Remove the backticks from the API bullets of `newtonHodgeVectors` and `decentCrystallineFibreFunctor`.

14. **F14** (P3) Sources: missing manifest, unverifiable published pagination, one misclassified source issue

   **Location.** There was no `packages/PadicHodgeTheoryPartII/sources.toml`. `design/README.md` line 678: "The locators above use the published text, not an older arXiv pagination." plan.json line 1592 records E8 with `"kind": "error"`.

   **Witness.** The sources service classes the Springer PDF as paywalled. GLX26 ¶4 (lines 625–627) takes the σ-conjugating element in G(Q_{p^s}), and the Theorem 5.8 proof refers to that replacement (lines 1601–1604); such elements preserve genericity.

   **Repair.**
   - Keep the manifest this review created (GLX26 = arXiv v3 with DOI; Chen14; Stacks).
   - Cite GLX by arXiv v3 pages with a version note, or record the published pages as uncertified.
   - Reclassify E8 as at most a misprint (the general sentence omits the restriction), or drop it.

The mathematics of the GLX/Chen route is in good shape: every sampled statement checks against the source, and the computed examples are right. What blocks the design is its supply structure. Two declared gaps have no supplier. One supplier node does not exist at the parent's head. One cited roadmap exists only as a board package job. Several prerequisites are described as supplied, but the cited sections do not contain them. One planned pair of targets is already owned by ReductiveGroupsPartII. One API statement lacks a hypothesis it needs.

## Verified sound

**Gate.** Output of the dependency check:

    candidate: PadicHodgeTheoryPartII is not in the merge order yet; checked as if placed after HeckeStacksAndLocalShtukas (the intake inserts it when its design is accepted)
    depcheck: 27 roadmaps, 232 edges, 0 problem(s)

There is no UPWARD or CYCLE line. The gate does not see ReductiveGroupsPartIII (R04) or the latent cycle with the component roadmap (R02).

**Seeded sample.** The sampler found no targets by heading, so I drew 15 of the 23 nodes with a seeded draw: GM0/filtration-degree, coefficient-rank-one, invariant-line-criterion, ambient-period-transfer; GM1/orbit-degree-bound, frobenius-average-bound, newton-lowest-weight; GM2/hodge-degree-specialization, generic-admissible, generic-derived-monodromy; GM3/witt-leading-digit, infinite-transcendence, z-extension-open-image; GM4/compact-torsor-components, quasisplit-converse.

All 15 agree in theorem number and hypotheses with GLX26 (arXiv v3) and Chen14 (published).
- **Chen14.** Statement locations: §3.1 at lines 781–820, Def. 3.3.1 and Lemma 3.3.2 at lines 933–943, Prop. 3.3.3 at line 946, Prop. 3.3.4 at line 966, Lemma 3.3.5 at line 1008, Prop. 3.3.6 at line 1028, Prop. 2.0.3 at line 532, Lemma 2.0.4 at line 587, Thm. 5.0.6 at line 1303. Every Chen page number agrees (printed page = PDF page + 721).
- **Chen Lemma 2.0.4.** The rendered page shows degree p^{s−b}·m, which confirms the design's m p^{n−b} (the text extraction reads like p^{s−bm}). My own computation: m = 2, b = 1, r = 0 gives P₂ = y^{p²}x^{2p}.
- **GLX26.** All theorem numbers match v3. With published page = v3 page + 804, pages agree except Thm 5.8's statement (841 vs 842) and Lemma 6.12 (854–855 vs 855–856); see Not verifiable.
- **Stacks.** 054L = Lemma 29.37.21, 02GL = Lemma 29.37.7, 02GH = §29.37.

**Source issues in plan.json.** E1, E2, E3, E4, E6, E7 and E9 confirmed by reading. E8 is misclassified (R14). E5 matches the DiamondsAndVStacks D5.16 record, which I did not test independently.

**Library declarations opened at the pins.** Mathlib 6b7abb3 and Tau Ceti a91d3aa, nine declarations: those listed in R10, plus `Algebra.Etale.iff_exists_algEquiv_prod` (`Mathlib/RingTheory/Etale/Field.lean`:271) and `Finset.prod_range_*`.

**Cross-roadmap citations resolved: 34.**
- 9 resolve as cited: DiamondsAndVStacks ×5, VectorBundlesAndIsocrystals VB0 ×2 (anchors `dieudonne-manin-isocrystals` and `tensor-and-dual-slopes`), ReductiveGroupsPartII `points-topological-group`, ReductiveGroups Layer 1.
- 15 exist at other locators (R09).
- 10 are absent: the 8 PadicHodgeTheory R06 ids (all rewritten in R09; only the monodromy interface has no content anywhere, R03), RG3.0 (R04), and the RG Layer 7 lemma (R05).

The parent was read at head 4c4f1e8. Its new §5.5 import of MotivesAndAlgebraicCycles §6.8 matches the design's tensor-torsor use. Its §5.3 NoncommutativeAndEquivariantIwasawa §F.6 import is not used here.

**Ownership by object.** Checked over main, 330 open heads and the board packages. No other owner was found for: the finite decent fibre functor, DegreeAt, HN-irreducibility, GLX generic filtrations, the compact torsor theorem, and Serre–Sen openness. AdmissiblePairsAndPadicHodgeStructures depends on the same missing node.

**Adversarial pass** (computed values on each side; "✓" means the two sides agree):

| Statement | Instance | Computed values | Result |
|---|---|---|---|
| Conventions (sign) | Q_p(1); G_m with b = p^m, μ = z^h | φ = p⁻¹σ, jump −1 (= parent §Conventions, HS2.11); κ(b) = m, μ♮ = h; B(G,μ) ⇔ m = h ⇔ t_N = t_H | ✓ |
| DegreeAt | Fil^i = K for i ≤ a; v = 0; jumps 2, −1 | 1 has degree a; 0 is in every Fil^d, so false; e₁+e₂ ∈ Fil^{−1}∖Fil⁰ gives −1; e₁ gives 2 | ✓; separated + exhaustive suffice for existence |
| frobeniusDegreeSum | s = 0, 1; φ = id; involution with degrees 1, −1 | 0; d(v); s·d(v); 1+(−1) = 0 ≠ 2·1 | ✓ |
| newtonHodgeVectors | φ = p^aσ with jump h; φ = σ with jump 1 | k = sa = sh; Newton k = 0 but d_s = s ≠ 0 | ✓; tensorMap fails (R08) |
| decent fibre functor ω_s | unit; slope 1/2; φ = pσ | Q_{p^s}; dim 2 over Q_{p²}; unnormalized fixed space 0, normalized dim 1 | ✓ |
| coefficient rank one | s = 2, d = (1,−1), k = 0 | t_H = 0 = t_N; φ-stable lines K₀(e₀+ce₁) with cσ(c) = 1 have t_H = −1 ≤ 0; k = 1 gives t_N = 1 ≠ 0 | ✓ |
| invariant-line criterion | torus acting by a character | the line stabilizer allows scalars (Chen14 Prop. 3.3.6, "∃c∈G_m") | ✓ |
| ambient transfer | G_der normal; torus | gG_derg⁻¹ = G_der over B_cris, fpqc descent along Q_p→B_cris, connected ⇒ ⊆ H°; torus: 1 ⊆ H° | ✓ |
| orbit bound | Res_{E/Q₅}G_m, V = E | refined orbits of sizes 1, 2 with pairings 1, 0: min 0, weighted 1/3 = ⟨e₁, μ̄⟩; true generic jump 0 | ✓ |
| Check 0 ≤ 2 | sizes 1, 2; pairings 0, 3 | weighted (0+6)/3 = 2; unweighted 3/2 | ✓ |
| Frobenius average | GL₂ basic slope 1/2, s = 2, generic η | d₂(v) = 0+0 = 0 ≤ 2⟨(0,1),(1,0)⟩ = 0; period ms gives m·d_s (generic degree is G(E)-invariant) | ✓ |
| Newton lowest weight | GL₂, ν = (a,b) | ⟨w₀(1,0),ν⟩ = b ≤ slopes {a, b} | ✓ |
| strict HN | SL₂ with c > 0; GL₂ ordinary with c = 0 | −cn < 0 contradicts the sandwich; c = 0 gives a sandwich 0 ≤ 0 ≤ 0 with ⟨λ,α∨⟩ = 1 | ✓ |
| subobject descent | b = 1 | σ-stable F-subspace = V′⊗F, V′ ⊆ V | ✓ |
| Hodge specialization | plane with jumps 1, 0 | line L: t_H = 1 at Fil¹ = L, 0 elsewhere; t_H = A·rk + Σ_{i>A} dim(D′∩Fil^i) checked by Abel summation | ✓ |
| generic admissibility | GL₂, μ = (1,0), b = diag(p,1) | Fil¹ = e₂-line: t_H = 1 > t_N = 0; generic Fil¹: t_H(e₂-line) = 0 | ✓ |
| derived monodromy | GL₂ basic | μ−ν = (1/2)α∨ > 0; V^{2,1} empty for generic η (d₂ = 0 ≠ 1) | ✓ |
| Witt leading digit | b = r = 0; m = 1; m = 2, b = 1 | degree m with coefficient Y_{m,0}; a^{p^b}u; y^{p²}x^{2p} | ✓ |
| infinite transcendence | E/Q_p finite | independence over Q_p ⇒ over E | ✓; duplicate (R07) |
| generic classical points | P¹; torus | needs a transcendental coordinate; Fl_μ is a point | ✓ |
| open derived image | torus; restriction to K′/K | G_der = 1; a finite-index closed subgroup is open | ✓ |
| z-extension | GL₂→PGL₂ (derived map SL₂→PGL₂) | image of SL₂(Q_p) has finite index [Q_p^× : Q_p^{×2}], so open; lifting lemma checked (R05) | ✓ |
| compact torsor | ξ trivial; finite C | components g×Spd K, stabilizer 1; stabilizer gCg⁻¹ | ✓ statement; Check false (R12) |
| ambient stabilizers | equivariant j | Stab(source) ⊆ Stab(target) | ✓ |
| quasisplit converse | torus | Δ empty; both sides vacuous | ✓ math; unowned (R02) |

## Not verifiable

- Published Inventiones pagination of GLX26: the sources service classes the Springer PDF as paywalled. I verified theorem numbers and v3 pages. The design's Lemma 6.12 pages (855–856) and Theorem 5.8 statement page (842) are one page off the v3+804 offset and could not be settled.
- GLX26 Lemma 3.2's falsity (source issue E5): not independently tested; it relies on the DiamondsAndVStacks D5.16 counterexample.
- Lean elaboration: not available (this lane does not elaborate). No `Suggested.lean` exists at the design stage, so the `#check @name` comparison and the one-tactic probe were decided by reading (R13).

## Source issues

- **Error** in Chen14 at Proposition 3.3.4(2), proof, p. 743: the source says every representation of G is a subrepresentation of one mixed tensor power of a faithful one; it should be a subquotient of finite sums of such powers (G_m, 1⊕χ fails); affects the proof.
- **Gap** in Chen14 at Proposition 2.0.3, proof, p. 735: the source imposes residue degree above p^{b(m−1)}·m·M but finally needs p^{n₀−b}·m·M with n₀−b = b(m−1)+r; it should choose b for the stronger bound, which factorial growth permits; affects the proof.
- **Misprint** in Chen14 at Lemma 3.3.5, p. 744: the source writes N as a sum of Q_{p^s}-lines spanned by the e_i; it should be K₀-lines, since rank one means dim over K₀ equals s; affects nothing.
- **Error** in GLX26 at §5.1 ¶14, p. 836: the source calls MT, defined as the identity component of the Zariski closure, the Tannakian group of the generated category; it should be the full Zariski closure (Chen14 Déf. 3.2.2, Prop. 3.2.3); affects the proof.
- **Gap** in GLX26 at Proposition 5.7, pp. 840–841: the source indexes refined orbits by Gal(E/K) although the reflex field need not be Galois; it should range over all Γ_E-orbits in the Γ_K-orbit (Res-torus over Q₅(5^{1/3}) fails); affects a stated result.
- **Error** in GLX26 at equation (5.29), p. 842: the source sums refined components over every automorphism τ; it should sum once over distinct refined orbits, since the trivial weight with quadratic E gives 2v; affects nothing.
- **Misprint** in GLX26 at the justification of (5.34), p. 843: the source moves φ₀ across the pairing with the same exponent; equivariance gives the inverse exponent, and the full-period sums agree; affects nothing.
- **Gap** in GLX26 at Proposition 6.7, step (4), p. 851: the source treats the Galois image as contained in the derived group, but (4) concerns its intersection with it; it should compare algebraic monodromy and apply Serre–Sen to the lift; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "6502997", "job": "REV-DESIGN-PadicHodgeTheoryPartII", "model": "opus", "worker": "fable-rev18"} -->
