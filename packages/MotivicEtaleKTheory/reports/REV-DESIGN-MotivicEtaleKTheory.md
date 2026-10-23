<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/952#issuecomment-6371219713 -->
Review (claude) of 39344bc

Verdict: needs changes

1. **F01** (P1) The supported-regulator fiber map has the wrong sign

   **Location.** `packages/MotivicEtaleKTheory/design/README.md:498` (6.2 sketch): "For a pair square f′r≃r′f with cochain homotopy h satisfying f′r−r′f=dh+hd, its fiber map is (a,b)↦(ra,sb−ha)". The Check at `:503` and `design/plan.json:1052` say "using +ha instead would give 2(dh+hd)a".

   **Claim.** Under the design's pair convention d(a,b)=(da,f(a)−db), the map (ra, r′b−ha) is a chain map between the fibers.

   **Witness.** Write Φ_ε(a,b)=(ra, r′b+εha). Then D′Φ_ε−Φ_εD has second coordinate (f′r−r′f)a−ε(dh+hd)a=(1−ε)(dh+hd)a. So ε=−1 fails and ε=+1 works. A concrete case: A=A′=ℤ[0], B=0, B′=(ℤ→ℤ) in degrees −1,0, f′=id, h=id. Then (1,−1) has D′=(0,2)≠0.

   **Repair.** In the 6.2 sketch, replace the formula with "(a,b)↦(ra, r′b+ha)", and use r′ consistently instead of the undefined s. Rewrite the Check (README `:503`, plan.json test `homotopy_fiber_formula`) as: "with +ha the defect is (f′r−r′f−dh−hd)a=0; using −ha would give 2(dh+hd)a." Tested on the instance above: (1,+1) has D′=(0,1−1)=0.

2. **F02** (P1) The multi-relative cube K-theory used to build the character has no owner

   **Location.** `packages/MotivicEtaleKTheory/design/README.md:184` (2.1): "Use the supplier’s multirelative K-model for cube faces, resolution and Adams projectors." The same input is used at `:203` (2.2) and in the 2.1 and 2.2 *Needs* lines (`:197`, `:211`).

   **Claim.** One of the cited suppliers supplies multi-relative K-theory of X×□ⁿ relative to its faces, with supports and Adams weights.

   **Witness.** No cited supplier has it. SchemeKTheoryOperations `README.md:9` [#1229]: "multi-relative refinements and regulators belong to ColemanIntegration"; the owner is ColemanIntegration §L3.Fa.2 (`README.md:2433` [#1043]). Levine94 line 1212 needs relative K₀ of the cube with Adams weight q.

   **Repair.** ColemanIntegration is at merge-order line 155, which is later than this roadmap's placement after MotivesAndAlgebraicCycles (line 87). Placing this roadmap after line 155 would turn ZagierConjecturePolylogarithms (line 116, which cites `MotivicEtaleKTheory:M.8/motivic-chern-character`) into an upward edge. So move the notion down to this roadmap:

   - Add a Layer 2 target constructing supported multi-relative K-theory K^{s×□ⁿ}(X×□ⁿ; X×∂□ⁿ) as iterated homotopy fibres, with Adams operations compatible on all faces.
   - Build it from SchemeKTheoryOperations §§2.5, 3.1, 6.8, with the locators Levine94 §§1–2 (Theorem 1.10, Corollary 1.11, Theorem 2.7).
   - Cite this target in the *Needs* of 2.1 and 2.2.
   - Record in Downstream consumers that ColemanIntegration §§L3.Fa.1–L3.Fa.2 import it.

   Tested at n=0: K₀(X; ∅) with no faces is ordinary K₀(X), and Adams weight q of [O_V] has leading cycle [V] (SchemeKTheoryOperations §7.2, `chernClass_structureSheaf_leading`).

3. **F03** (P2) §3.2 replans the all-dimensional logarithmic comparison that ComplexComparisonPartII §C5.6 owns

   **Location.** `packages/MotivicEtaleKTheory/design/README.md:11`: "Its §C5.7 is a curve comparison. The all-dimensional smooth-open filtered comparison needed by the Deligne model is §3.2 here." And `:281`: "Prove the logarithmic Poincaré lemma in a polydisk by its product-of-circles calculation."

   **Claim.** No supplier states the all-dimensional logarithmic comparison, so §3.2 proves the logarithmic Poincaré lemma itself.

   **Witness.** `TauCetiRoadmap/ComplexComparisonPartII/README.md:3850` [#848], `regularSingularDeRhamComparison`: for a smooth proper SNC compactification, Ω_X(log D)⊗Ē→Rj_*(Ω_U⊗E) is a quasi-isomorphism when no residue is a positive integer; the trivial connection has residues 0. Deligne cites the same theorem (DeligneHodgeII line 1050).

   **Repair.**

   - Add "§C5.6 (`regularSingularDeRhamComparison`, trivial connection, Ē=O_W)" to the ComplexComparisonPartII supplier contract (`:73`), to the Scope sentence at `:11`, and to the 3.2 *Needs* line (`:289`).
   - In the 3.2 sketch, replace the polydisk Poincaré-lemma route with that citation. 3.2 keeps only the weight and Hodge filtrations (DeligneHodgeII Prop. 3.1.8, Theorem 3.2.5, Corollary 3.2.13) and the Burgos model.

   Tested on 𝔾_m⊂ℙ¹ with residues (0,0): C5.6 gives H¹=ℂ·dz/z, which matches the 3.2 Check.

4. **F04** (P2) The Dolbeault calculus is cited to DifferentialGeometry, which does not state it

   **Location.** `packages/MotivicEtaleKTheory/design/README.md:81`: "Native forms, pullback, wedge and exterior derivative, complexified for Dolbeault forms". Also 3.1 API `:264` (∂, ∂̄, bidegrees, conjugation), the *Needs* lines `:275` and `:361`, and the complex orientation in 5.2.

   **Claim.** DifferentialGeometry Layers 0–1 supply the ∂/∂̄ type calculus.

   **Witness.** DifferentialGeometry Layers 0–1 (`README.md:268–340`, main) give vector-valued forms, wedge and d, with no complex structure or (p,q)-types. ComplexKahlerGeometry K2 (`README.md:193–197`, main) constructs ∂, ∂̄ with bidegrees, squares zero, anticommutation and conjugation; K1 owns types and complex orientation.

   **Repair.** Add a "From TauCetiRoadmap.ComplexKahlerGeometry" contract naming K1 (type decomposition, complex orientation) and K2 (∂, ∂̄ and their identities). Cite it in the *Needs* of 3.1, 3.3, 4.1 and 5.2. Keep DifferentialGeometry for forms, wedge, d and integration. Tested on d=∂+∂̄ applied to |z|² on ℂ: K2's ∂∂̄|z|²=dz∧dz̄ is the 3.3 Check value before the factor −2.

5. **F05** (P2) The universal-class character used by 7.2 is neither owned nor sourced

   **Location.** `packages/MotivicEtaleKTheory/design/README.md:182`: "The construction is the rational inverse of the geometric cycle-to-K map on its Adams weight and agrees with the universal Chern-class construction on the classifying simplicial scheme BGL". Also the API at `:189`, 2.4 at `:234` ("with the universal higher Chern-class convention"), and the 7.2 proof at `:555`.

   **Claim.** The inverse of Levine's cycle map equals the character built from universal higher Chern classes c_{p,n}, and both come from the cited sources.

   **Witness.** Levine94 lines 44–63: Theorem 3.1 is proved without Chern classes. BFT line 297 and BF line 961 use Bloch86's character (uncertified). KTheoryFiniteLocalFields `diagonalChernMilnor` (`README.md:1472` [#1281]) builds integral motivic Chern classes only for fields; nothing here constructs c_{p,n}.

   **Repair.**

   - Add a Layer 2 target constructing universal higher Chern classes c_{p,n}:Kₙ(X)→CHᵖ(X,n) on B·GL_N with specialization (BF lines 974–997). Cite KTheoryFiniteLocalFields §6.10 for the field case.
   - State, as a separate theorem in 2.2, that Levine's inverse cycle map equals the universal-class character, with a named route and inputs. Mark Bloch86 as uncertified for that statement.

   Tested at n=0: both maps send [O_V] to [V] in the leading weight. At n=1 both send u∈k× to u∈CH¹(k,1).

6. **F06** (P2) Two owners with Polylogarithms §§5.2–5.3, and the move is not recorded

   **Location.** `packages/MotivicEtaleKTheory/design/README.md:433`: "These are the universal construction’s auxiliary objects; the consumer’s concrete comparison cones remain its own objects". Also 5.2 at `:410` (the current criterion and normalized pairing) and Scope `:13`.

   **Claim.** The auxiliary complexes in 5.3 and the current criterion in 5.2 are different objects from Polylogarithms'.

   **Witness.** `TauCetiRoadmap/Polylogarithms/README.md:834` [#1424 4696a1a] defines D_A=τ≤2pD_log(X×□^m,p) with infinity normalization, D_{A,Z} and H^p (that is, Aₚ, Aₚ,S, Hₚ); line 900 proves d_D[g]+δ_Z=[ω] (5.2's criterion); line 809 fixes the same (2πi)^{−d} pairing.

   **Repair.**

   - In Scope and Downstream consumers, state that Aₚ, Aₚ,S, Hₚ, the logarithmic Green current identity and the normalized pairing move down to §§5.2–5.3 here, because Polylogarithms (line 156) is later in the merge order.
   - State that Polylogarithms §5.2 keeps only the shifted comparison complex D_AH and β, and §5.3 keeps Green forms. Delete the sentence at `:433`.

   Tested on f=t on 𝔸¹: both roadmaps give d_D[−log|t|]=−δ₀.

7. **F07** (P2) The gap `smooth-whitney-extension` is compound, lacks hypotheses, and hands this roadmap's own proof to the supplier

   **Location.** `packages/MotivicEtaleKTheory/design/plan.json:1424–1427`: needs "Supply general smooth Whitney extension, relative Borel extension with parameters, and the flat-ideal and coordinate-division calculus used to prove the smooth logarithmic Dolbeault comparison". The section is "Part II, §1: … (successor contract to be written)". README `:89`.

   **Claim.** One precise contract on DifferentialGeometry Part II.

   **Witness.** The `needs` sentence bundles three results without domain or coefficient hypotheses. Coordinate division and logarithmic powers are Burgos94 §4 (line 361), part of Burgos's own proof of Theorem 2.1. No DifferentialGeometry Part II exists anywhere (job-issue search: 0).

   **Repair.**

   - Split the gap in two.
     - `smooth-whitney-extension`: "for U⊂ℝⁿ open, A⊂U relatively closed and E finite-dimensional, every infinite-order E-valued Whitney jet on A is the jet of a smooth U→E, including the relative Borel case along a coordinate hyperplane with smooth transverse parameters."
     - `flat-ideal-regular-situation`: "for closed real-analytic A,B⊂U, I∞(A∩B)=I∞(A)+I∞(B)."
   - Move the monomial-division and log-power lemmas into 3.2 as statements here.
   - Name the supplier section "DifferentialGeometry, Part II: Whitney jets and flat functions" without the process wording. Use the same slugs in the README.

   Tested: with A={0} and Taylor coefficients n!, the first gap applies (Borel), while the second does not mention it.

8. **F08** (P3) Wrong AlgebraicTopology item for the simplicial-group comparison

   **Location.** README `:85`, `:197`, `:549` and plan prerequisites: "Stage 8, item 1 … the simplicial-group Kan and Moore-homotopy comparison πₙ(G)=Hₙ(NG)". **Witness.** `TauCetiRoadmap/AlgebraicTopology/README.md:1609` (item 1 is `BasedTopPair`, relative homotopy). `simplicialGroupKan` and `simplicialGroupMooreHomotopyIso` are item 2 (`:1654`), at `:1667–1668`. **Repair.** Replace "Stage 8, item 1" with "Stage 8, item 2" everywhere, including plan.json.

9. **F09** (P3) Consumer label mapping is incomplete, and one old label collides with §4.2 here

   **Location.** README `:603`: "Its requested Layer 4 / §§9.1,12.2 refer respectively to the contracts delivered here in Layers 1, 2 and 6–7." **Witness.**

   - `TauCetiRoadmap/Polylogarithms/README.md:37` cites "MotivicEtaleKTheory §4.2" for the cubical complex and `cubicalOrientationChange`. Here §4.2 is associativity.
   - `packages/KatoEulerSystems/README.md:153` [board head 725fd74] cites "§12.1" for ch₂,₂=−c₂,₂.
   - `packages/ZagierConjecturePolylogarithms/design/README.md:1495` cites `M.8/motivic-chern-character` and `M.8/number-field-deligne-normalization`. ZagierConjecturePolylogarithms is not listed as a consumer.

   **Repair.** Add the mapping:

   | Old label | Section here |
   | --- | --- |
   | Polylogarithms §4.2 | §1.1 |
   | Polylogarithms Layer 4 | §§1.1–1.4 |
   | §9.1 | §§2.1–2.3 |
   | §12.2 | §§6.1–6.3, 7.2, 7.4 |
   | KatoEulerSystems §12.1 | §2.4 |
   | ZagierConjecturePolylogarithms M.8 | §§2.1–2.2 and 7.1, 7.4 |

   Add ZagierConjecturePolylogarithms to Downstream consumers.

10. **F10** (P3) The name promises material that other roadmaps request and this design excludes

   **Location.** README `:13`: "The name MotivicEtaleKTheory adds no finite-coefficient étale descent, norm-residue theorem, p-adic regulator…". **Witness.** Board designs cite this name for étale content: `M.7/bott-etale-descent` (ArithmeticKTheoryPartII; GeneralAlgebraicKTheoryPartII, its interface R10), `M.5a` (MotivesAndAlgebraicCyclesPartII, EtaleHomotopyTypes at merge-order line 47, QuadraticFormInvariantsPartII), `M.1` (SymplecticReidemeisterTorsionModSquares); K2SymbolsBrauer `README.md:2224` [#1302] cites "M.4".

   **Repair.** Add a Downstream paragraph listing these labels as not delivered here. Name existing owners where they exist (norm residue, M.5d: KTheoryFiniteLocalFields §3.0a `motivicToK`) and say the rest need a separate owner. A human should decide whether to rename this roadmap to match its title.

11. **F11** (P3) Consumers and owners named that exist nowhere

   **Location.** README `:13` ("EllipticRegulators retains…"), `:611`, `:613` (HodgeStructuresPartIII). **Witness.** Neither name is on main, in an open pull request, in the board package index or in the board job issues (searches returned 0). **Repair.** Describe them as prospective ("a future elliptic-regulator roadmap"), or drop them. The EllipticKTheory Layer 7 citation is real (board #138 head fd76424, line 1925).

12. **F12** (P3) The number-field Beilinson regulator is built twice elsewhere, and no comparison is recorded

   **Location.** README `:605–607`. **Witness.** ColemanIntegration §L3.Fc.1 (`README.md:2650` [#1043]) constructs reg_∞ on K_{2n−1}(ℂ). PeriodsAndSpecialValues PS.3.2a (board head 9f14c68, line 747) constructs the Beilinson map through ℂ/ℝ(j) itself, so it does not use this roadmap's character as README `:607` says. **Repair.** Record both as specializations of 7.1 at number-field points that should import 7.1 and 7.4. Add a Check that the projection (z+(−1)^{j−1}z̄)/2 equals π_{p−1} here. Correct the PeriodsAndSpecialValues sentence.

13. **F13** (P3) Some Checks do not discriminate

   **Location.** README `:193–195` (2.1) and `:446` (5.3). **Witness.** 2.1: c(O(±1))=1±h equals ch(O(±1)) on ℙ¹, and all three Checks are degree zero, so a character vanishing for n>0 passes. 5.3: on ℂ, D³(A,1)=0, so good and brutal truncation coincide. **Repair.** For 2.1, use ch(O(1)⊕O(−1))=2 against c=1, and add "ch₁,₁[2]=[2]≠0 in CH¹(ℚ,1)⊗ℚ". For 5.3, use ω=Re(z₁)dz₂∧dz̄₂ on ℂ² with p=1: it lies in D²(A,1) and has d_Dω≠0.

14. **F14** (P3) Nonstandard notation for complex conjugation

   **Location.** README `:258`, `:270`, `:307`, `:357` and others, 15 occurrences of "ż" (z with dot above), while `:581` writes "conj f". **Witness.** BKK Definition 5.20 (line 4220) and the literature write z̄; ż is a different letter. **Repair.** Use z̄ (or `conj z`) throughout and define it once in Conventions.

15. **F15** (P3) Narrower than the sources, plus one locator

   **Location.** 3.2 and 3.4 (`:279`, `:314`): "every smooth quasi-projective complex X". 4.2 (`:365`): the associator vanishes "on triples of closed even critical-degree elements". 1.2 (`:124`): "§6.4 … p.20". **Witness.** BKK line 4214 and DeligneHodgeII Definition 3.2.12 (line 1240) treat all smooth separated complex varieties. BKK Proposition 5.15(ii) (line 4145) needs no closedness. BFT §6.4 starts on p.19 (BFT line 943). **Repair.** Either state Layers 3–5 for smooth separated varieties (via EtaleCohomologyFoundations G.2 and resolution), or record quasi-projectivity in Scope as tied to `sncCompactification`. Drop "closed" or cite BF Proposition 1.26. Write "pp.19–20".

Fifteen findings: two P1, five P2, eight P3. The design is carefully built and most of its signs, normalizations and locators survive computation (see the adversarial table). What blocks acceptance is one false chain-level formula (R01), one prerequisite with no owner (R02), two inputs cited to the wrong supplier or replanned from an existing supplier (R03, R04), an unsourced identification on which the Beilinson comparison rests (R05), an unrecorded double ownership with Polylogarithms (R06), and a compound supplier gap that also hands this roadmap's own proof to the supplier (R07).

Paths are repository-relative. `packages/…` means this package on the board; other roadmaps are read at main `a07e202` or at the open head named in brackets.

## Verified sound

**Gate (dependency check)**, exit 0:

```text
candidate: MotivicEtaleKTheory is not in the merge order yet; checked as if placed after MotivesAndAlgebraicCycles (the intake inserts it when its design is accepted)
depcheck: 27 roadmaps, 241 edges, 0 problem(s)
```

No UPWARD or CYCLE line. The R02 repair keeps the placement after line 87.

**Seeded sample** (15 sections), checked against the text:

- 1.2: BFT line 948, 961; Levine94 line 1727.
- 1.4: Levine94 Corollary 4.9 and Theorem 5.2 (rational, as the design says); BF line 661.
- 2.1: Levine94 line 1210 (p.276); BF line 961.
- 2.3: Levine94 Theorem 3.4, line 1405 (p.283).
- 3.1: Burgos94 line 155; BKK Definition 5.20 (line 4217, p.116).
- 3.3: BKK Definitions 5.7–5.10 and Proposition 5.12 (lines 3999–4072).
- 3.4: BKK 5.22, 5.23, 5.29, 5.31 (pp.117–119).
- 4.1: BKK Definition 5.14 (line 4129, p.114) and the special-degree formula (line 4180, p.115).
- 5.2: BF (1.30), Proposition 1.31, line 550; BKK Proposition 5.58 (both directions, line 4846).
- 5.3: BF §§2.4–2.5 (lines 705–766); BFT Proposition 4.3.
- 6.1: BF lines 862–876.
- 6.2: BF Proposition 3.3 (the locator is right; the formula is R01).
- 6.3: BF Proposition 2.19 (line 827).
- 7.1: BF lines 919–960; BKK (5.5)–(5.6).
- 7.4: BKK line 4180; BF line 550; KLM line 553.

All page numbers match the printed pagination, apart from R15. Also checked: DeligneHodgeII Proposition 3.1.8 (p.33), Theorem 3.2.5 (p.35), Corollary 3.2.13 (p.38); Burgos94 Theorems 1.1, 2.1, 3.1, 3.3–3.5.

**Pinned declarations opened.**

- Mathlib 6b7abb3c, 12 declarations: `AlgebraicCycle` (AlgebraicCycle/Basic.lean:44), `map` (:69), `mapCoeff` (:55), `Scheme` (:40), `ModuleCat` (:56), `HomologicalComplex` (:59), `d_comp_d` (:72), `DerivedCategory` (:87), `mappingCone` (:57), `inl_v_d` (:261), `inr_f_d` (:269), `DoldKan.equivalence` (:167). The cone differential is (−da,φa+db); after shifting by −1 and negating the second coordinate it becomes (da,φa−db).
- Tau Ceti a91d3aaf, 9 declarations: `gradedCochainComplex` (:59), `HodgeStructureOn` (:62), `IsMorphism` (:69), `tate` (:91), `tate_F` (:100), `tate_piece` (:111), `tateLatticeMap` (:44, the plain ℤ→ℂ), `MixedHodgeStructure` (:72), `range_inf_F_eq_map_F` (:110).
- Neither pin has Whitney extension, Dolbeault operators, higher Chow groups, higher scheme K-theory or Deligne complexes.

**Supplier sections resolved (90).** Every cited section was found at the stated copy with a matching topic. The contents were read for every section that a finding or a statement here relies on.

- GeneralAlgebraicKTheory [#1212]: §§3.12, 4.6, 4.8, 4.14, 6.3, 7.4–7.7, 8.12–8.13. B[π]=+1 and the left adapter (−1)^{n−1} are confirmed.
- SchemeKTheoryOperations [#1229]: §§2.1–2.6, 3.1–3.6, 4.3, 6.7–6.9, 7.1–7.3. 7.3 leaves the higher Chow character to its owner.
- KTheoryFiniteLocalFields [#1281]: §3.0a, both `motivicCycles` and `motivicToK`.
- MotivesAndAlgebraicCycles, at the current head af100ce (the author read 548737e): §§4.7, 4.8, 4.8a, 4.14, 4.17, 4.18.
- SchemeAndStackFoundations (main): §§2.1, 2.2, 4.12, 4.17, 5.1–5.8.
- ResolutionOfSingularitiesCharacteristicZero [#1199]: §§5.1–5.6, 6.1–6.4.
- EtaleCohomologyFoundations (main): G.1–G.3.
- ComplexComparisonPartII [#848]: C−1.1, C−1.4, C5.1, C5.3 (`properPureHodge`, `relativeHodgeBundles` present), C5.4, C5.5, C5.7, C6.0.
- EnhancedDerivedSheaves (main): 0.1–0.4, E0.6, E1.4, E2.6.
- DifferentialGeometry (main): Layers 0–1, 5–9.
- AlgebraicTopology (main): Stages 2, 3, 6.1–6.4.

**Consumers resolved.**

- Polylogarithms §§5.2, 5.3, 5.9, 5.10, 5.12, 5.13, 5.17, and its gap `universal-deligne-contract`, which is fully covered.
- KatoEulerSystems §3.4; PeriodsAndSpecialValues PS.3.1, PS.3.2a, PS.9; EllipticKTheory Layer 7; MixedHodgeModulesAndIrregularHodgeTheory Layer N; BorelRegulators target.
- The resolver lead "EllipticKTheory Layer 7 found nowhere" is a false positive: it is a board package (#138).
- HabiroRings at its head (#1425 bb5d6cb) cites no section or gap of this roadmap.

**Re-planning check.** No replanning of ArithmeticKTheory, which excludes regulators (`README.md:64`), of AlgebraicKTheory [#1142, low-degree only], or of MotivesAndAlgebraicCycles. Ownership was searched by object: Deligne complexes, logarithmic Dolbeault, semipurity, cubical cycles, the higher Chern character, Whitney/Łojasiewicz and mixed Hodge structures. The searches covered main, all 330 open pull-request heads (roadmaps grep), and the board packages. The duplications found are R03, R06 and R12.

**Principles.** No route shortcut, no copied passage, no algorithm. There is no Lean at this stage, so no sorry'd data or `set_option`. Shape: every layer has Examples and Dependencies. Every definition has API and at least 3 Checks (4–5 for 1.1, 3.1, 3.3), and every theorem has a locator. No backticked own names. No LaTeX delimiters or process words in the README; the one process phrase is in plan.json (R07).

**Headline theorems for the package stage:** 1.3, 2.2, 2.3, 3.4, 4.2, 5.2, 6.1–6.3, 7.2, 7.3, 7.4. None is statable at the pins, because there are no higher Chow groups, no scheme Kₙ and no geometric Deligne complex. The abstract Deligne-algebra statements of 3.3 and 4.1 are statable but are not headlines.

**Elaboration.** Not available: this lane does not elaborate, and a design has no `Suggested.lean`.

### Adversarial table

| Statement | Instances | Values computed (each side) | Result |
| --- | --- | --- | --- |
| 1.1 cubical complex | Γ_t on 𝔸¹, p=1; point, p=0 | faces y=0→[0], y=∞→∅; ∂□=+[0], BF δ=−[0]; point: N₀=ℤ, Nₙ=0 since δᵢ^∞[□ⁿ]≠0; unnormalized d[□ⁿ]=0 gives Hₙ=ℤ for all n | holds |
| 1.2 mixed total | bidegree (1,1); multipliers | D² cross terms −∂□∂Δ, +∂Δ∂□ sum to 0; J at (1,0),(0,1),(1,1)=−1,+1,−1; J(∂□+(−1)ⁿ∂Δ)J⁻¹=δ+(−1)ⁿ∂Δ | holds |
| 1.3 axis quasi-isomorphisms | point p=0; Z=∅, Z=X; ℤ/2⊗ᴸℤ/2 | H₀=ℤ, Hₙ=0; fib(id)≃0; fib(C→0)=C; Tor₁=ℤ/2 in degree −1 | holds (Levine94 4.7 integral, any k) |
| 1.4 operations | 𝔽₂(t)/𝔽₂(t²); pt⊔ℙ¹; two degree-1 classes | f_*f^*=2; CH¹=0⊕ℤ, CH⁰=ℤ²; exchange sign (−1)^{1·1}=−1 | holds |
| 2.1 character | k²; O(±1); O(1)⊕O(−1); ∅ | ch₀=2; ch=1±h but c=1±h too; ch(O(1)⊕O(−1))=2 vs c=1 | holds; R02, R05, R13 |
| 2.2 weights | ψ², weights 0,1,2; ℙ² | eigenvalues 1,2,4; differences −1,−3,−2; ch₂(O(1))=h²/2 | holds |
| 2.3 boundaries | t on (𝔸¹,{0}); t·u and u·t | d(Γ_t,0)=([0],t) ⇒ −δ_raw(t)=+[0]=ch_Z B[t]; ∂□(Γ_t×Γ_u)=+[0]×u ⇒ −δ_raw=u=B(t·u); ∂□(Γ_u×Γ_t)=−u×[0] ⇒ −u=B(u·t) | holds |
| 2.4 normalization | ℙ¹ point; p=1,2,3; ranks 2,3 | ch(1−O(−1))=h; factors 1,−1,1/2; ch₀=6 | holds |
| 3.1 log algebra | punctured disc; two-residue | d log∣z∣²=dz/z+dz̄/z̄; ∮dz/z=2πi; ordered residue ±1 | holds; R04, R14 |
| 3.2 comparison | 𝔾_m⊂ℙ¹; blow-up of (ℙ¹)² | H¹ type (1,1), weight 1+1=2; dimensions 1,2,1 before and after | holds; R03 |
| 3.3 Deligne functor | A=ℂ[0], p=0,1,−1 | H⁰D(A,0)=ℝ; D(A,1)=ℝ in degree 1 (=ℂ/iℝ by Re); p=−1: H⁰=ℝ(−1); ψφ=id in both ranges | holds |
| 3.4 independence | pt⊔ℙ¹; two compactifications of 𝔾_m² | H_D⁰(ℝ(0))=ℝ²; periods (2πi,0),(0,2πi), product (2πi)² | holds |
| 4.1 product | log2•log∣t∣; ∣z∣²•1 | r₁(log∣t∣)=dt/2t−dt̄/2t̄, so x•y=i log2 darg t and y•x=−x•y; ∣z∣²•1=−z̄dz+zdz̄, d_D=−2dz∧dz̄=F^{1,1}(d_Dx∧1) | holds |
| 4.2 associativity | constants 2,3,5; odd triple at a point | 30=30; 0=0 | holds; R15 |
| 5.1 fibers | 0→ℝ[0]; {0}⊂{0,1}⊂𝔸¹ | degree 1; d² second coordinate 0; r↦(r,0) | holds |
| 5.2 semipurity | V(xy); cusp; origin p=1,2; point with full support, p=1; f=t | ℝ²; ℝ; 0; ℝ; H¹=ℂ/iℝ≠0; ∂∂̄log∣t∣=−πiδ ⇒ −2∂∂̄[−log∣t∣]=−δ₀, coefficient +1 | holds |
| 5.3 resolution | (2p,1); point p=0; ℂ | (−1)^{2p}=1; ℝ in degree 0; τ≤2=σ≤2 on ℂ | holds; Check vacuous, R13 |
| 5.4 quasi-isomorphisms | origin in 𝔸¹; (−1)^{ns} | coefficients 1,2; (n,s)=(1,1),(0,1),(1,2) give −1,+1,+1 | holds |
| 6.1 roof | Spec ℂ; −1, i; c₁O(1) | m↦m; log1=0; (2πi)⁻¹∫ω=1 | holds |
| 6.2 fiber map | toy square of R01 | −ha: D′(1,−1)=(0,2); +ha: D′(1,1)=0 | **false**, R01 |
| 6.3 pullback | point→ℙ¹; 2 over ℚ | c₁=0 and H_D²(pt,ℝ(1))=0; log2 by both routes | holds |
| 7.1 character | u=2e^{iθ}, i; O(a) | log2; 0; 1+a·h_D | holds |
| 7.2 identification | rank 2; units 2, −1; weight 2 | 2=2; log2, 0; ch₂,₂=−c₂,₂ | holds given BF 3.5; R05 |
| 7.3 multiplicativity | {2}·{t}; swap; units 2,3 at a point | i log2 darg t, period 2πi·log2; sign −1; 0 | holds |
| 7.4 witnesses | u=2,3,1,i,1/2; f=2, g=t; a=−1,0,1 | log2, log3, log6; 0; 0; −log2; i(log∣f∣darg g−log∣g∣darg f)=i log2 darg t; −1,0,1 | holds |
| gap contract | A={0}, coefficients n!; exp(−1/x²) | Borel extension exists despite radius 0; zero jet but value e⁻¹ at x=1 | true; R07 |

## Not verifiable

- **Bloch86** is uncertified. Its universal higher Chern classes, and their agreement with Levine's inverse cycle map, could not be read (R05).
- **Beilinson85** is uncertified and **Levine98** is waived. The design leans on neither beyond background.
- **Burgos94** loses its display formulas in the extraction (Theorems 1.1 and 2.1). The statements were confirmed through BKK lines 4217–4266 and DeligneHodgeII.
- **BF §2.2** cites "[18] §3.5" for general pullback, and that text was not read. The design uses the supplier's integral moving instead.
- **Lean elaboration** was not available in this lane.

## Source issues

- **Misprint** in BF at Proposition 1.26, p.10: the source says the associativity homotopy h lands in total degree r+s+t; it should be r+s+t−1 so that dh+hd matches the associator; affects nothing.
- **Gap** in BF at Theorem 3.5, p.20: the source says the comparison holds for any equidimensional complex algebraic scheme; it should be stated for smooth quasi-projective complex X, which is all ρ and the proof use; affects a stated result.
- **Gap** in BF at Proposition 2.7, p.15: the source says an integral associative graded-commutative product exists on CH*(X,*) for any quasi-projective X, citing a rational result for smooth X; it should require smooth X and integral moving; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "39344bc", "job": "REV-DESIGN-MotivicEtaleKTheory", "model": "opus", "worker": "fable-rev25"} -->
