<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1396#issuecomment-6393783961 -->
Review (claude) of d9b1fec

Verdict: needs changes

1. **F01** (P1) Eight design gaps still have supplier `none`

   - **Location.** `packages/EllAdicHomotopyTypesAndWeights/design/plan.json`, top-level `gaps`, entries `G1`–`G8`.
     - Their only keys are `id, title, neededBy, detail`; there is no `supplier` or `section`.
     - The README never mentions `gap:G1`…`gap:G8`. Its only gap slugs are the five named-supplier contracts at README lines 63, 81, 83, 97 and 107.
   - **Claim.** Under the brief, a declared gap whose supplier is `none` is unowned.
   - **Witness.** The README already gives every record an owner:
     - G1 (coefficient resolution, extendability, principal quotients, finite width) is owned here:
       - §2.2 (line 279: "establish extendability and finite-skeleton determination");
       - §2.3 (line 293: "the extendability argument is part of this target");
       - §2.4 (line 307);
       - §4.2 (line 494).
     - G2 (universal coefficients, completed complexes) is owned here, at §§3.3–3.4 (lines 396 and 419).
     - G3 (good covers, finite CW type) goes to `gap:compatible-good-cover-refinement` and ComplexComparisonPartII §§C6.0–C6.1.
     - G4 (geometric Hodge realization, spread independence) goes to `gap:geometric-mixed-hodge-realization`, `gap:arbitrary-base-weight-filtration` and §5.1 here.
     - G5 (finite blocks, Lemme 5.3.5) is owned here, at §§6.2 and 6.6 (line 687).
     - G6 (compatible pro-unipotent lifting) is owned here, at §7.2 (line 736).
     - G7 (1-minimal versus unipotent étale group) goes to §8.4 here and `gap:normal-variety-unipotent-category`.
     - G8 (finite-coefficient étale theory) goes to EtaleCohomologyFoundations §§F.2.2, F.3 and F.4.1–F.4.6, and to ComplexComparisonPartII §C6.3. All of these exist on main or at the open head.
   - **Repair.**
     - Retire G1, G2, G5 and G6, which are owned here.
     - Close G3, G4, G7 and G8 by recording the slugs and sections above.
     - The package stage may only append to `plan.json` `gaps`, so the intake or a human must authorise this change. The README needs no new text.
   - **Tested.** After the change no record in `gaps` has supplier `none`. Each record's content sits at the README line given.

2. **F02** (P2) §0.1 rebuilds DerivedDeRhamCohomology §2.21 without citing it

   - **Location.** README §0.1, line 117: "impose A^p=0 for p<0, xy=(-1)^(pq)yx on homogeneous elements, and x²=0 for every homogeneous element of odd degree".
     - Scope, line 9, says only that the DG carrier is in the library.
     - DerivedDeRhamCohomology is cited nowhere.
   - **Claim.** The strict graded-commutativity and odd-square-zero predicates on a nonnegatively graded DG algebra are already planned by an earlier roadmap. Restating them here gives one object two owners.
   - **Witness.** DerivedDeRhamCohomology (open roadmap pull request, head 83d00dd, merge order 21) has README §2.21 at lines 3247–3255. It works on DGAInfinity Layer 1's unital cochain DG-algebra carrier, restricted to nonnegative degrees, and defines two predicates there:
     - strict graded commutativity, xy=(−1)^(ij)yx in degrees i and j;
     - odd-square-zero, x²=0 in odd degrees, kept even in characteristic 2.

     Its line 59 says that its strict models use these predicates.
   - **Repair.**
     - Add DerivedDeRhamCohomology §2.21 to Scope and to a `From TauCetiRoadmap.DerivedDeRhamCohomology` contract.
     - Rewrite §0.1 as the use of those predicates on the carrier, keeping only the connectedness convention (H⁰=K) as this roadmap's own clause.
     - Add DerivedDeRhamCohomology §2.21 to the Needs line.
   - **Tested.** 𝔽₂[e] with |e|=1 and d=0 satisfies the sign rule but fails §2.21's odd-square predicate (e²≠0), so it is still rejected. Λ_{𝔽₂}(e) is accepted. Checks 1–6 of §0.1 keep their values.

3. **F03** (P2) `gap:geometric-mixed-hodge-realization` makes ComplexComparisonPartII consume a later roadmap

   - **Location.** README line 83: "What ComplexComparisonPartII must provide (gap:geometric-mixed-hodge-realization): Extend §C5.3’s geometric Hodge realization and MotivicEtaleKTheory §3.2’s smooth logarithmic realization to every separated finite-type complex scheme …". Lines 87 and 548 repeat this assignment.
   - **Claim.** To extend MotivicEtaleKTheory §3.2, ComplexComparisonPartII must consume it.
     - ComplexComparisonPartII is at merge order 43 and MotivicEtaleKTheory at 84, so that would be an upward edge.
     - MotivicEtaleKTheory §3.2 already consumes ComplexComparisonPartII, so the contract creates a cycle between the two suppliers.
     - The needs sentence also bundles five deliverables.
   - **Witness.**
     - MotivicEtaleKTheory §3.2 Needs line (board package README line 379; README line 395 at its open head 83b84df): "ComplexComparisonPartII §§C5.1, C5.3, C5.5–C5.6".
     - ORDER.txt puts ComplexComparisonPartII at line 43 and MotivicEtaleKTheory at line 84.
   - **Repair.**
     - Address the singular extension to the owner of the smooth realization: "What MotivicEtaleKTheory must provide (gap:…)", at §§3.2/3.4, for every separated finite-type complex scheme through proper SNC hyperresolutions. MotivicEtaleKTheory is earlier than this roadmap.
     - Keep ComplexComparisonPartII §C5.3 only as the cited pure input.
     - Name ResolutionOfSingularitiesCharacteristicZero (open head bf45c86, which MotivicEtaleKTheory §3.2 already consumes) as the resolution owner at line 91.
     - In Scope, say how the request differs from MixedHodgeModulesAndIrregularHodgeTheory H.1/operations and H.1/weight-bounds (board design). Those supply weights for quasi-projective varieties through mixed Hodge modules, not Deligne's hyperresolution realization for separated schemes.
   - **Tested.** After readdressing, MotivicEtaleKTheory (84) consumes ComplexComparisonPartII (43) only, and this roadmap (198) consumes both. That is a single direction of supply.

4. **F04** (P2) §4.3 restates its own supplier contract and overlaps EtaleHomotopyTypes §EH.6 without saying so

   - **Location.** README §4.3, line 506: "construct a cofinal compatible system of analytic open covers of X(C), refining the analytifications of the étale maps, such that every nonempty finite intersection is contractible. The nerves N_α have the homotopy type of X(C)".
   - **Claim.**
     - The first two sentences of §4.3 are exactly what line 81 asks ComplexComparisonPartII to supply (`gap:compatible-good-cover-refinement`): good-cover refinements and a nerve equivalence that is natural in the refinement. That gives two owners for one object.
     - EtaleHomotopyTypes plans a Betti–étale comparison from the analytic type to the rigid étale type. §4.3 plans another one, and Scope (line 13) cites only §EH.3.
   - **Witness.**
     - README line 81, the contract text.
     - EtaleHomotopyTypes design README, §EH.6 "Betti–étale comparison zigzag" (lines 1374–1378): for quasi-projective complex X it builds a natural zigzag from Sing_an(X) through holim_U Sing_an(U) to Et_p(X), using the component map of every singular simplex.
   - **Repair.**
     - State §4.3 as follows: given the contracted cover system, the nerves define a pro-map N→Et(X₁), and its cohomology map with ℤ/ℓ^r coefficients is the Artin comparison of §C6.3. Keep `gap:compatible-good-cover-refinement` as the only owner of the covers.
     - Add EtaleHomotopyTypes §EH.6 to Scope, with one clause saying how §4.3 differs. §4.3 uses a pro-system of nerves for separated finite-type X and the raw type Et; §EH.6 uses a homotopy limit for quasi-projective X and the p-completed type.
   - **Tested.** On 𝔾_m(ℂ) both routes give H¹ of rank 1. The disconnected two-arc cover of a circle (Check, line 515) still fails the nerve equivalence: its nerve is an interval, with H¹=0, while the circle has H¹ of rank 1. It is excluded by the contract's good-cover condition.

5. **F05** (P2) Compound gap needs

   - **Location.** README line 63 (`gap:connected-sullivan-interface`) and line 97 (`gap:arbitrary-base-weight-filtration`).
   - **Claim.**
     - Line 63 asks AlgebraicTopologyPartII for six deliverables in one gap:
       - polynomial forms with their de Rham theorem;
       - ordered Sullivan models;
       - homotopy lifting;
       - full and 1-minimal existence;
       - quasi-isomorphism rigidity;
       - scalar extension.

       It also "extends" `G3`, which is a supplier-`none` design record of AlgebraicTopologyPartII, not a section.
     - Line 97 bundles a separate theorem, the weights 1 and 2 on H¹ of a normal variety (Poids 8.3), with the spread-independent filtration.
   - **Witness.**
     - AlgebraicTopologyPartII design `plan.json`: `G3` "Rational minimal models" has keys `id, title, detail, neededBy` and no supplier. Its §AT2.4 (design README line 505) only records minimal-model existence for nilpotent finite-type spaces.
     - That package's review (finding F05) asks it to drop the minimal-model route, which also retires G3.
   - **Repair.**
     - Split line 63 into one-statement slugs addressed to §AT2.4:
       - `polynomial-forms-de-rham`: A_PL(X;K) on simplicial sets, and its multiplicative de Rham isomorphism (DGMS 2.1; Sullivan 7.1);
       - `sullivan-minimal-models`: existence of full and 1-minimal models for connected nonnegative CDGAs over fields of characteristic 0, and the isomorphism of quasi-isomorphic minimal algebras (Morgan 5.6, 5.9);
       - `sullivan-homotopy-lifting`: lifting through quasi-isomorphisms up to polynomial homotopy;
       - `sullivan-scalar-extension`.
     - Cite §AT2.4, not the G3 record.
     - Split `normal-h1-weights` (DeligneWeightsAndPurity) off line 97.
     - Add the new slugs to `plan.json` `gaps`.
   - **Tested.** Each new slug names a single statement with its hypotheses. The Λ(a₁), K[x₂]⊗Λ(y₃) and three-punctured-line examples of Layers 0 and 8 each consume exactly one of the split slugs.

6. **F06** (P3) Suggested.lean docstring omits one headline and carries a process sentence

   - **Location.** `Suggested.lean` lines 19–20, and line 44: "Bare scalar identities and diagonal-cycle identities do not replace the geometric headline theorems."
   - **Claim.**
     - The Summary's first end result, §4.1 (H*(A_ℓ(X))≅H*_ét(X,ℚ_ℓ) as rings for every separated finite-type variety), is not named. Line 19 covers the pro-simplicial algebra of §3.5.
     - Line 44 narrates rejected alternatives.
   - **Witness.** README line 3 and §4.1 (line 468). The docstring has 18 bullets and none of them names §4.1.
   - **Repair.**
     - Add a bullet: "The étale realization theorem for varieties lacks A_ℓ and the étale ℚ_ℓ cohomology ring of a variety."
     - Delete the sentence at line 44.
   - **Tested.** The file still elaborates with no declarations.

7. **F07** (P3) Supplier and source locators that point at the wrong place

   - **Location and witness.**
     - Lines 55, 295, 358 and 398 cite AlgebraicTopology Stage 6 for "ordinary simplicial cohomology … with its comparison to the native singular cohomology of a realization".
       - Stage 6 (main README lines 946–1573) treats singular cohomology of spaces and never mentions simplicial sets.
       - Simplicial-set cochains are at the pin: Mathlib `SSet.chainComplex` composed with Tau Ceti `TauCeti.ChainComplex.linearYonedaObj`, the same composite as `TopCat.singularCochainComplex` at `TauCeti/AlgebraicTopology/Cohomology/Basic.lean`:60.
       - The realization comparison is AlgebraicTopology Stage 4 item 7 (`simplicialRealizationCW`, main README line 817).
     - Line 19 cites EtaleHomotopyTypes §EH.0 for change-of-universe and cofinality comparisons. EH.0 imports them from DiamondsAndVStacks D0 (EtaleHomotopyTypes design README, "Existing owners" table and EH.0 inputs).
     - §3.1 (line 345) defines H^i of a pro-simplicial set as the colimit of level cohomology. EtaleHomotopyTypes §EH.0 "Local-coefficient detection" (design README line 205) already fixes this convention.
     - §0.1 cites weil-II (5.1.2) (weil-II line 3665). That passage gives only the Koszul rule. The odd-square axiom comes from the exterior factor in (5.1.6.3) (weil-II line 3710), or from R02's supplier.
   - **Repair.**
     - Cite the pinned simplicial carrier and Stage 4 item 7 alongside Stage 6.
     - Cite DiamondsAndVStacks D0 for universes.
     - Cite §EH.0 for pro-space cohomology, and keep the forms colimit as this roadmap's own.
     - Point §0.1's odd-square clause at (5.1.6.3).

8. **F08** (P3) Checks that restate another Check of the same list

   - **Location.** README lines 136–137 (they repeat 133–134), 199–200 (196, 198), 329 (327–328), 390 (388), 428 (425, 427), 516 (515), 602–603 (600–601), the y-clause of 656 (654), 695 (693), 771–772 (770), 796 (795) and 849 (848).
   - **Claim.** These lines repeat the same computation; they are padding. Every definition still has three or more distinct Checks after deletion, for example 0.1 (4), 1.2 (3), 3.2 (4), 3.4 (3) and 6.1 (3).
   - **Repair.** Delete the listed bullets, keeping the unit clause of line 656.

9. **F09** (P3) Typos and one non sequitur

   - **Location and repair.**
     - Line 451: "tγ_(ℓ−1)=lγ_l" should read "tγ_(ℓ−1)=ℓγ_ℓ".
     - Lines 437–442: "A_l" should read "A_ℓ", as in the target statement at line 433.
     - Line 333: "the integral of dx₁ on the oriented interval from 0 to 1 is 1; a positive-degree cohomology class on this simplex is therefore zero". The class vanishes because dx₁=d(x₁) is exact, not because its integral is 1. Replace the clause with "dx₁=d(x₁) is exact, so H¹ of the simplex is zero".
   - **Tested.** On Δ¹, dx₁=d(x₁) and H¹(Δ¹)=0.

Nine findings, five of them blocking: one P1, four P2 and four P3.

The package owns real content. It has 36 targets, each with a Needs line and a locator, and every definition has at least three Checks. It is not an index or an alias. Its overlap with EtaleHomotopyTypes is confined to §4.3 (R04).

The claim that no headline theorem can be stated at the pins holds up when checked one headline at a time (table below).

The blocking findings are about ownership and contracts:
- the design gaps that still have supplier `none` (R01);
- a predicate that another roadmap already defines (R02);
- a supplier contract that would create a cycle between its two suppliers (R03);
- a target that restates its own contract (R04);
- compound contracts (R05).

## Verified sound

### Elaboration and gates

- The package `Suggested.lean` was elaborated with `lake env lean` at the content pins (Mathlib 6b7abb3c, Tau Ceti a91d3aaf). Exit 0, no messages: it has no declarations, so it has no `sorry` warnings either.
  - One `import Mathlib`, no `set_option`, namespace `TauCetiRoadmap.EllAdicHomotopyTypesAndWeights`, and a module docstring in the required form.
  - The `#check @name` binder audit and the one-tactic padding probe apply to no declaration.
- The dependency check reported no UPWARD or CYCLE line:

      depcheck: 48 roadmaps, 546 edges, 0 problem(s)

  - Every supplier is earlier in ORDER.txt than line 198: SchemeAndStackFoundations 2, DerivedModuleAlgebra 7, EtaleCohomologyFoundations 19, ComplexComparisonPartII 43, EtaleHomotopyTypes 44, MotivicEtaleKTheory 84, DeligneWeightsAndPurity 92, AlgebraicTopologyPartII 123, AnabelianGeometryAndNonabelianChabauty 197.
  - DGAInfinity, AlgebraicTopology and ReductiveGroups are on main.
- The citation-resolver leads were checked:
  - AlgebraicTopologyPartII §AT2.4 and EtaleHomotopyTypes §EH.3 exist as board designs on the board's main branch.
  - The three §EH.3 subsections cited at line 71 exist at design README lines 768, 805 and 842.
- The five gap slugs agree in README and `plan.json`: supplier, section and needs text all match.

### Pinned declarations opened (file:line at the pins)

- Mathlib, `RingTheory/DividedPowerAlgebra/Init.lean`: `DividedPowerAlgebra`:99, `dp`:127, `dp_mul`:171, `algHom_ext`:235, `lift`:346, `map`:418. There is no grading file at the pin.
- Mathlib, other files:
  - `SSet` at `SimplicialSet/Basic.lean`:33;
  - `Abelian.DoldKan.equivalence` at `DoldKan/Equivalence.lean`:167;
  - `Functor.IsMittagLeffler` at `CofilteredSystem.lean`:137, a predicate on a functor into `Type`;
  - `ExteriorAlgebra` at `ExteriorAlgebra/Basic.lean`:60.
- Tau Ceti, DG algebra files:
  - `IsDGAlgebra` at `DG/Algebra/Defs.lean`:182; it has degree +1, square zero and Leibniz only, with no commutativity or support;
  - `DGAlgHom` at `Hom/Basic.lean`:50;
  - `IsDGAlgebra.Cohomology` at `Cohomology.lean`:182;
  - `algEquivCohomologyOfZero` at :257.
- Tau Ceti, cohomology and Hodge files:
  - `TopCat.singularCochainComplex` at :60 and `singularCohomology` at :94 of `Cohomology/Basic.lean`;
  - `singularCup` at `Cup.lean`:203;
  - `Hodge.MixedHodgeStructure` at `Geometry/Hodge/Mixed/Basic.lean`:72, with W and F bounded, pure graded pieces, and no finite dimension imposed.

All README claims about these declarations are true.

### Suppliers resolved, by section

- **On main:**
  - DerivedModuleAlgebra §§0.DP.2, 0.DP.3, 0.14–0.17 (§0.17 gives L∧ⁿ(N[1])≃Γⁿ(N)[n] for flat N), 1.T.1 and 1.1;
  - EtaleCohomologyFoundations §§F.0.3, F.2.2 (field-extension invariance), F.3 (ordinary finiteness for separated finite type), F.4.1–F.4.6, F.10.1, F.10.2 and F.10.2b;
  - DGAInfinity Layers 1, 3 and 8;
  - AlgebraicTopology Stages 5 and 6;
  - ReductiveGroups Layers 5, 6 and 6A (Levi complements, torsor triviality);
  - SchemeAndStackFoundations §0.9, Layer 2 (including §2.16, μ_n of curves, used by the three-puncture example), §§4.13, 4.17 and 4.19.
- **At open heads:**
  - ComplexComparisonPartII §§C5.3, C5.5 and C6.0–C6.6. §C6.0 gives finite CW type for singular and noncompact separated X.
  - DeligneWeightsAndPurity §§0.1–0.3, 0.7–0.15, 7.12, 7.15 and 8.20–8.24.
  - AnabelianGeometryAndNonabelianChabauty §§2.1–2.3. Its §2.2 étale category is stated for characteristic-zero curves, as line 105 says.
  - MotivicEtaleKTheory §§3.1–3.2.

### Duplication audit by object

- Divided-power algebra, exterior algebra, DG carrier, singular cochains and the abstract MHS are all cited at the pins.
- No roadmap or package plans Weil II §5:
  - searched for divided-power forms, the ℓ-adic homotopy algebra, Sullivan models, formality and Mal'cev presentations;
  - over the open roadmap pull-request heads (`roadmaps grep`, which covers main) and the board packages.
- AnabelianGeometryAndNonabelianChabauty §2.11 (two-step Mal'cev quotient for curves) is consistent with §8.5 and is not a duplicate.
- Tau Ceti's additive tensor eigenvalue lemma (`tmul_mem_maxGenEigenspace_add`) is not the multiplicative grading of §6.3.
- The only duplications found are R02, R04 and R07.

### Seeded source sample

Every sampled target was checked against the text at its locator. The extraction's page offsets were confirmed: Weil II printed page = PDF page + 135, so weil-II line 3649 is p. 234.

| Target | Locator checked | Result |
|---|---|---|
| 0.1 | weil-II line 3665 (5.1.2), morgan lines 1017–1042 (Defs 5.1–5.3, p. 163) | supports Koszul rule and 1-minimal definition; odd-square clause see R07 |
| 1.2 | weil-II lines 3668–3678 (5.1.3, 5.1.4.1) | t-grading, 0 ≤ exterior degree ≤ t-degree |
| 2.1 | weil-II lines 3740–3746 (5.1.8) | Ω(X,A)=Hom(X,Ω⊗A), coefficients first |
| 2.2 | weil-II lines 3751–3760 (5.1.9 b, pp. 236–237) | homology ℤ at exterior degree = t-degree = i; README's general R follows because Ω(σ)⊗R is degreewise free |
| 2.4 | weil-II lines 3694–3695, 3778–3782 | off-diagonal base change and diagonal right-exact sequence; README's principal restriction is correct (see Source issues) |
| 2.5 | weil-II lines 3688–3693, 3749–3750 | x_i ↦ x_i⊗t; t-degree n image = degree ≤ n forms |
| 3.2 | weil-II lines 3767–3773, 3796–3800 | (F) is finiteness of H*(X,ℤ/ℓ) |
| 4.2 | weil-II lines 3823–3834 (pp. 238–239) | Galois acts; continuity only on each Ω(X,ℤ/ℓⁿ) with discrete topology |
| 5.2 | poids lines 185–208 (§13, Th. 14, pp. 83–84); weil-II lines 3891–3913 | Frobenius eigenvalues algebraic of integer weight; generalized-eigenspace filtration is W |
| 6.1 | weil-II lines 3867–3878 (5.3.1) | exhaustive filtration by finitely generated subalgebras; generalized eigenspaces |
| 6.2 | weil-II lines 3870–3873; morgan lines 1166–1188 (pp. 167–168) | every automorphism homotopic to a filtration-preserving one; Morgan warns blocks can be infinite |
| 6.4 | weil-II lines 3879–3882 | eigenvalue = ∏α_i with Σn(i) ≥ n |
| 7.2 | weil-II lines 3919–3933 (p. 241); sullivan lines 1042–1068 (p. 295, (A.1) at line 1067) | unipotent kernel; split extension, U-conjugate sections; Levi decomposition and torsor rational points |
| 7.3 | weil-II lines 3897–3918 (5.3.3–5.3.4) | grading with W_n = ⊕ pieces of weight ≤ n |
| 7.4 | weil-II lines 3917–3937 | conjugacy by automorphism inducing identity on Gr_W; Lemme 5.3.5 left to reader |

The author flagged no locator as unverified; SGA 5 and Miller are settled `uncertified`. Other locators read in passing:
- weil-II lines 3938–3958 (5.3.6–5.3.8);
- morgan line 2245 (Th. 9.4, generators of bidegrees (−1,−1), (−2,−1), (−1,−2), (−2,−2), so relation weights −2, −3, −4);
- morgan-correction line 29;
- poids lines 127–153 (7.1, 7.2, 8.3) and 164–175 (§10);
- hodge-III lines 582–589 (6.2.8, pp. 20–21) and 1213–1221 (8.2.4, p. 38);
- sullivan lines 912 (6.1), 1121 (7.1) and 1289 (8.1);
- dgms lines 270 (1.1), 448 (2.1, p. 255) and 1060 (§6, p. 270).

All are correct.

### Headline theorems against the pins

Each headline was tested against the pins. The roadmap does not list 1.1 as a headline. The table's "Missing at pin" column names what blocks a statement.

| Headline (README §) | Statable? | Missing at pin, or test |
|---|---|---|
| 2.2 coefficient homotopy | no | homogeneous Γ^m (only `DividedPowerAlgebra/Init.lean`; DerivedModuleAlgebra §0.DP owns it) and the simplicial module σ↦Γ^{n−p}(R^σ)⊗Λ^p(R^σ/R) |
| 2.3, 2.5, 3.4, 3.5 form comparisons | no | Ω(X,R); A_PL (no polynomial-forms carrier at either pin) |
| 3.3 ℓ-adic universal coefficients | no | Simplicial-set cohomology itself is at the pin: the probe `((X.chainComplex (ModuleCat.of ℤ ℤ)).linearYonedaObj ℤ M).homology n` elaborated. The pro-object colimit, the coefficient system r↦ℤ/ℓ^r with change maps (Tau Ceti has coefficient maps only for isomorphisms) and Tor need a multi-definition encoding. This is an input lemma, so the docstring is accepted. |
| 4.1, 4.4, 8.1, 8.2 | no | A_ℓ; Sullivan models (no "Sullivan" or "minimal model" carrier at either pin, apart from Tau Ceti's A∞ minimal models, which are a different notion) |
| 5.2 | no | geometric MHS on H^i(X(ℂ),ℚ); Tau Ceti has only the abstract carrier |
| 6.2, 6.4, 6.6 | no | Sullivan minimal algebra with Hirsch filtration (contracted to AlgebraicTopologyPartII) |
| 7.2 | no | Tau Ceti has finite-type commutative-Hopf-algebra groups and a geometric-points unipotence property (`Algebra/AlgebraicGroup/Unipotent/Basic.lean`). The headline is about the minimal-model automorphism pro-scheme G₁, which is a construction, so the docstring is accurate. |
| 7.3, 7.4, 8.4, 8.5 | no | geometric Sullivan model with Hodge W; unipotent étale fundamental group |
| 1.1 (not a headline) | yes | `∃ f : DividedPowerAlgebra ℤ ℤ →ₐ[ℤ] Polynomial ℚ, Injective f ∧ ∀ n, f (dp ℤ n 1) = X^n / n!` elaborated with `sorry`. It is correctly absent: it is an input lemma, and stating it would be padding. |

No statable headline is missing (one naming gap: R06).

### Adversarial table

Every row was recomputed for this review.

| Statement | Instances | Values computed (README / independent) | Result | Change |
|---|---|---|---|---|
| Conv. sign + odd square | 𝔽₂[e], Λ_{𝔽₂}(e) | e·e=(−1)e·e holds in char 2; e²≠0 / 0 | holds | R02 |
| Conv. Frobenius | ℙ¹, q=2 | geometric (1,2) → weights (0,2); arithmetic (1,½) → (0,−2) | holds | — |
| Conv. weights | dy=x² with w(x)=2 | w(y)=4 → w(dy)=4=w(x²); w(y)=3 fails | holds | — |
| Conv. q=1, rank 0 | — | |α|=1^{w/2}=1 for every w; empty spectrum | holds | — |
| 0.1 | Λ(a₁,b₁) d=0; zero algebra | [ab]≠0 in H²; H⁰=0≠K, so not connected | holds | R02 |
| 1.1 | ℤ{t}, 𝔽₂{t}, ℚ | γ₁²=2γ₂; 𝔽₂: γ₁²=0, γ₂≠0; γ₂↦t²/2; tγ_n=(n+1)γ_{n+1}; two maps to 𝔽₂[ε] (γ₂²=6γ₄=0) | holds | — |
| 1.2 | edge | Ω₀¹=0, Ω₁¹=ℤ·dx₀; d:(0,1)→(1,1) | holds | R08 |
| 1.3 | σ={0}, {0,1} | Ω=R{t}; dx₀=−dx₁; dγ₂(x₀)=x₀dx₀; t=1 forces 1=2γ₂ | holds | — |
| 1.4 | collapse 2→1, 3→1 | γ₂(x₀+x₁)=γ₂(x₀)+x₀x₁+γ₂(x₁); Σγ₂(x_i)+Σ_{i<j}x_ix_j | holds | — |
| 2.1 | Δ⁰, ∅, Δ¹ | R{t}; Hom(∅,−)=0, so 1=0; x₀+x₁=t | holds | — |
| 2.2 | (p,n,i)=(0,0,0),(0,1,0),(1,1,1); R=0 | N(R^σ) is R→R (id) in degrees 1,0, contractible; Q≃K(R,1); Λ¹: H₁=R → R, 0, R; R=0 gives 0 | holds | — |
| 2.3 | S¹=Δ¹/∂, T², ∅ | Ω₁: H⁰=R, H¹=R (Hom(S¹,L)=R, Hom(S¹,Q)=R, d=0); H¹(Ω₀)=0; (aγ₁)(bγ₁)=2(a∪b)γ₂ ≡ 0 mod 2 while H²(T²,𝔽₂)=𝔽₂ | holds | — |
| 2.4 | ℕ discrete with (a); ℚ[x₁,…] with I=(x_i); ℝP² at (1,1) | kernel a∏R/a∏R=0; (x_i)∉I∏R (send x_j↦0 for j≤N and x_{N+1}↦1); integral cocycles miss the generator of H¹(ℝP²,𝔽₂) | holds (diagonal and non-principal excluded correctly) | — |
| 2.5 | point, edge | γ_n↦tⁿ/n!; t-degree 0 image K·1, x₁ absent; t-degree 1 span{tx₀,tx₁,tdx₀}=t·span{1,x₁,dx₁} (dim 3 = 3) | holds | R08 |
| 3.1 | constant point; lim versus colim | Rγ_n; (ℓ^i)_i ∈ lim_r⊕ℤ/ℓ^r but ∉ ⊕ℤ_ℓ | holds | R07 |
| 3.2 | CP^∞, ∨_ℕS¹, S¹ | ranks 1 in even degrees; H¹=∏𝔽_ℓ uncountable; ℓ,ℓ,1 | holds | R08 |
| 3.3 | ℤ_ℓ →(ℓ) ℤ_ℓ in degrees 1,2 | H¹=0, H²=ℤ/ℓ; mod ℓ: H¹=𝔽_ℓ = 0 ⊕ Tor(H²,𝔽_ℓ) | holds | — |
| 3.4 | point; S¹ at (1,1) with ℤ/2 | ℤ_ℓγ_n; cokernel ℤ/2 (2 elements); ML via 2.4 and finite H^p | holds | R08 |
| 3.5 | point, n=ℓ−1 | [γ₂]=½; (aγ_n)(bγ_m) ↦ (n+m choose n)/(n+m)! = 1/(n!m!); tγ_{ℓ−1}=ℓγ_ℓ is not a unit in ℤ_ℓ | holds | R09 |
| 4.1 | Spec k, two points, 𝔸¹ with ℓ=p | H⁰=ℚ_ℓ; ℚ_ℓ²; H¹(𝔸¹,ℤ/p)=k[t]/(F−1) is infinite | holds | R06 |
| 4.2 | Spec 𝔽_{q²}/𝔽_q, point | Frobenius swaps (1,0),(0,1): stabilizer index 2; index 1 | holds | — |
| 4.3 | 𝔾_m(ℂ); two arcs on S¹ | H¹ rank 1; nerve is an interval, H¹=0≠ℤ | holds | R04 |
| 4.4 | 𝔾_m, elliptic | Λ(a₁); Λ(a₁,b₁) with Λ³=0, ab the top class | holds | — |
| 5.1 | 𝔾_m, elliptic, nodal cubic | weights 2; 1; nodal H¹=W₀ (normalization ℙ¹ has H¹=0), so normality is needed | holds | R03 |
| 5.2 | ℙ¹, q=3 | eigenvalues (1,3); W₀ ranks (1,0), W₂ ranks (1,1) | holds | — |
| 6.1 | Λ(a,b); K[x₂] | constant filtration admissible; deg ≤ 2 span not closed (x²) | holds | R08 |
| 6.2 | dy=x²; ℙ¹−3 points | block {x,y} contains x²; free Lie algebra dims 2,1,2,3,… is infinite | holds | — |
| 6.3 | Jordan block J₂(1); eigenvalues 2,3 | dim ker(σ−1)=1, dim ker(σ−1)²=2; product 6 ≠ 5 | holds | — |
| 6.4 | dy=x², σx=ax | d(σy)=a²x², so σy=a²y; a·a from H² twice, Σr=4≥3; du=v excluded by minimality | holds | R08 |
| 6.5 | Λ(a,b), σa=2a, σb=a+2b, q=2 | H¹ Jordan block, weight 2; σ(ab)=4ab, weight 4 | holds | — |
| 6.6 | shears A, B | AB=((2,1),(1,1)), BA=((1,1),(1,2)); Aⁿ=((1,n),(0,1)) has infinite order; 2^w distinct, so stable subspaces are graded | holds | R08 |
| 7.1 | Λ(a₁) weight 1; λ=2 | Aut: a↦ca, G₂ forces c=λ, so U=1; scalars 2, 4 | holds | — |
| 7.2 | 𝔾_a⋊𝔾_m | s₁(2)s₁(3)=(−1,2)(−2,3)=(−5,6)=s₁(6); (c,1)(0,λ)(−c,1)=(c(1−λ),λ)=s_c(λ) | holds | — |
| 7.3 | elliptic, 𝔾_m | weights (1,1)→2; degree 1 weight 2; W₁H¹(𝔾_m)=0, W₂=H¹ | holds | — |
| 7.4 | shear b↦b+a with w=(1,2) | identity on Gr₁, Gr₂; [b]↦[b]+[a]≠[b], so not homotopic to id; matches "identité sur Gr_W" | holds | R08 |
| 8.1 | ℙ¹−3 points over 𝔽₂, ℓ=3 | H¹=ℚ₃(−1)²: eigenvalues (2,2), weights (2,2) | holds | R08 |
| 8.2 | ℙ¹; 𝔾_m control | x↦[x], y↦0 (weight 4>3), x²↦0 in H⁴=0, chain map; 𝔾_m generator weight 2 projected away, H¹ fails (purity needed) | holds | — |
| 8.3 | Λ(a,b,c), dc=ab; ℙ¹ | dc(A,B)=1=−c([A,B]), so [A,B]=−C; the + transpose gives the opposite sign; 1-minimal model of ℙ¹ is K, 0↪K | holds | — |
| 8.4 | ℙ¹−3 points; C₂, S₃ | depth 1 dim 2, depth 2 dim 3; (1+N)^m=1 forces N=0 in char 0, so the completions are trivial | holds | R08 |
| 8.5 | elliptic, genus g, ℙ¹−3 points, nodal | [a,b] weight −2; 2g generators of weight −1 with one relation; R=0 with weights −2; weight-0 generator excluded; relation weights ≥−4 (H² ≤ 4) and ≤−2 (brackets), so {−2,−3,−4} | holds | — |
| Worked example: infinite discrete | as 2.4 | as 2.4 | holds | — |

## Not verifiable

- **SGA 5 Exp. V 5.3.1 and Miller 1978.** Both are paywalled and settled `uncertified`, so they were not read. §§2.2–3.4 were checked against weil-II, and mathematically, instead.
- **Two of the design's recorded Weil II misprints** (plan `sourceIssues` E2 and E7): bold versus regular X at (5.2.1.3), and the m/n index in Théorème 5.3.4. The text layer does not show the letter styles, and it garbles the index at weil-II lines 3770 and 3917, so they could not be confirmed.
- **Ownership against open pull requests** was checked only through the roadmap index (`roadmaps grep` and `show`) and the board checkout.
  - The fixed package READMEs of EtaleHomotopyTypes and AlgebraicTopologyPartII are not on the board's main branch. Their designs and reviews were used.
  - If AlgebraicTopologyPartII's fix has already retired G3, R05's repair becomes mandatory.
- **Tau Ceti object files** for the DG and Hodge modules were not built. They were not needed, because `Suggested.lean` imports no Tau Ceti module. These declarations were verified by reading the source at the pinned lines.

## Source issues

- **Misprint** in weil-II at (5.1.5), p. 235: the source says the comparison map into the Sullivan–de Rham forms tensored with ℚ[t] is an isomorphism. It should say an injective morphism, whose t-degree-n image is the bounded-degree subcomplex. Affects nothing.
- **Error** in weil-II at (5.1.5), last paragraph, p. 235: the source says coefficient change to any quotient B of A is an isomorphism off the diagonal. That fails for an infinitely generated ideal on an infinite discrete simplicial set; it should be restricted to finitely generated (for example principal) ideals. Affects nothing, since only ℓ-power quotients are used.
- **Gap** in weil-II at Lemme (5.3.5), p. 241: the source says a common stable filtration exists for finitely many automorphisms and leaves the proof to the reader. It should be proved, since unrestricted conjugacy in Théorème 5.3.4 depends on it. Affects a stated result.
- **Error** in morgan at Theorem 9.2, p. 195: the source treats the indecomposables of a minimal algebra as invariant under homotopic maps. Only the associated graded of the canonical filtration is invariant. Affects a stated result; corrected in print at IHÉS 64 (1986), p. 185.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "d9b1fec", "job": "REV-PKG-EllAdicHomotopyTypesAndWeights", "model": "opus", "worker": "fable-rev89"} -->
