<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/952#issuecomment-6373416870 -->
Review (claude) of eb7fbdd

Verdict: needs changes

1. **F01** (P2) §2.0a cannot supply ColemanIntegration §§L3.Fa.1–L3.Fa.2, so the cube K-theory still has two owners

   **Location.** `packages/MotivicEtaleKTheory/design/README.md:13`: “The shared supported multi-relative cube construction of §2.0a likewise supplies ColemanIntegration §§L3.Fa.1–L3.Fa.2”. The same claim is at `:672`, and the plan.json consumer entry repeats it. §2.0a (`:200`) is stated “For every field k, smooth quasi-projective finite-type X/k”.

   **Claim.** ColemanIntegration can drop its L3.Fa.1–L3.Fa.2 constructions and import §2.0a, which would leave one owner.

   **Witness.** ColemanIntegration `README.md:2395` [#1043 ae078af] works over regular Noetherian B with an ample family; `:2442` applies its cubes to B = Spec O, O a DVR, with localized opens. §2.0a covers neither; at B = X smooth over k both build the same fibre.

   **Repair.** Note first that L3.Fa.1 is ColemanIntegration's ordinary Quillen package, not a cube construction (SchemeKTheoryOperations `README.md:9` [#1229 88dbd5a]).
   - State §2.0a, in the README and in its plan hypotheses, for every regular Noetherian separated finite-dimensional X with an ample family. This is the scope in which SchemeKTheoryOperations §§6.7–6.9 already supplies supported K-models, Adams operations and finite weights. Allow open Y ⊂ X×□ⁿ with the induced face pairs. Keep “k a field, X smooth quasi-projective” only for the relative cycle-map clause.
   - At `:13`, name only §L3.Fa.2.
   - At `:672`, write: “ColemanIntegration §L3.Fa.2 imports §2.0a's cube K-theory, ordered relativity equivalence and Adams weights; its L3.Fa.1 Quillen package, special-unit localizations and de Jeu symbols remain there.”
   - Alternative, if the field base is kept: say exactly which part ColemanIntegration imports (field base, closed supports) and which part it extends. Add here a target stating that the two constructions agree when B = X is smooth over k and S = Y.

   **Tested.** Take B = Spec ℤ_p and m = 1. Regular homotopy invariance gives fib(K(𝔸¹_B) → K(B)⊕K(B)) ≃ ΩK(B). This is ColemanIntegration's relativity isomorphism K_n(X_B;□) ≅ K_{n+1}(B), and it uses the same zero-face-first a−b sign (README `:208` here; ColemanIntegration `:2435`).

2. **F02** (P3) §2.0a's weight decomposition is stated without rational coefficients

   **Location.** `README.md:200`: “first use the finite generalized weight-q decomposition defined by (ψᵃ−aᑫ)ᴺx=0 for some N≥1.”

   **Claim.** The homotopy groups of the total fibre split into generalized weight pieces.

   **Witness.** n = 0, X = S = ℙ², h = 1−[O(−1)]: ψ²h = 2h−h² and ψ²h² = 4h². The integral generalized pieces ℤ·1, ℤ(2h+h²), ℤh² have index 2 in K₀(ℙ²) ≅ ℤ³; h is not in their sum.

   **Repair.** Write “on Kₘ^S(Y;∂□ⁿ)⊗ℚ”, as the third hypothesis of 2.0a in plan.json already says (“finite generalized rational weight decomposition”).

   **Tested.** Over ℚ, h = (2h+h²)/2 − h²/2.

3. **F03** (P3) §2.1 still asserts the identification that §2.2 proves

   **Location.** `README.md:238`: “agrees with the universal Chern-class construction on the classifying simplicial scheme BGL, not an arbitrary group equivalence”. API bullet `:245`: “Universal bundle classes on finite Grassmannians … give the same higher Chern-class maps as the multirelative cycle construction”.

   **Claim.** 2.1 defines the character and also states that it agrees with the universal classes.

   **Witness.** `:240` says “Section 2.2 separately identifies this inverse with §2.0b’s universal-class character”, and that theorem is `:262` (plan API `levineUniversalChernAgreement`), which needs 2.1. So 2.1 asserts it before its prerequisite exists, which is a build-order defect.

   **Repair.**
   - Delete the clause at `:238` and in the plan.json 2.1 statement.
   - Delete API bullet `:245` (plan.json 2.1, second API entry).
   - 2.2 keeps the theorem.

   **Tested.** All four 2.1 Checks (rank 2; ch(O(1)⊕O(−1)) = 2 against c = 1; ch₁,₁[2] = [2]) still evaluate from the inverse-cycle definition alone.

4. **F04** (P3) The §2.2 identification has no Check in K-degree 2

   **Location.** `README.md:264–269`, the 2.2 Checks. Every one is in K-degree 0 or 1, and the 7.2 Checks have no nonzero degree-2 value either.

   **Claim.** The Checks pin the identification of Levine's inverse with the universal-class character.

   **Witness.** Multiplying the identification by (−1)^{n(n−1)/2} (a reversed loop order in the delooping) gives +1, +1 at n = 0, 1, so every 2.2 and 7.2 Check passes, and −1 at n = 2.

   **Repair.** Add to 2.2: “On 𝔾_{m,ℚ}, both maps send {2}·{t} ∈ K₂ to the cube product [Γ₂]×[Γ_t] ∈ CH²(𝔾_m,2)⊗ℚ, whose regulator is i log 2 darg t (§§7.3–7.4); reversing the loop order gives the negative.”

   **Tested.** On the universal side, §2.4's product formula gives ch₂,₂({2}·{t}) = ch₁,₁(2)×ch₁,₁(t) = [Γ₂]×[Γ_t]. Its regulator is log 2•log|t| = i log 2 darg t (`:420`).

5. **F05** (P3) The Layer 2, 5 and 7 Dependencies paragraphs omit suppliers named in their *Needs* lines

   **Location.** `README.md:312` (Layer 2), `:533` (Layer 5) and `:666` (Layer 7).

   **Claim.** Each layer's Dependencies paragraph lists its suppliers.

   **Witness.** 2.0b *Needs* (`:234`) names MotivesAndAlgebraicCycles, SchemeAndStackFoundations, EnhancedDerivedSheaves and AlgebraicTopology, absent from `:312`. 5.2 *Needs* (`:490`) names ComplexKahlerGeometry and AlgebraicTopology, absent from `:533`. 7.1 *Needs* (`:616`) names AlgebraicTopology and EnhancedDerivedSheaves, absent from `:666`.

   **Repair.** Add these items:
   - To `:312`: MotivesAndAlgebraicCycles §4.8a, SchemeAndStackFoundations §§5.3–5.8, EnhancedDerivedSheaves §§0.1–0.4, E0.6, E2.6, KTheoryFiniteLocalFields §6.10 and AlgebraicTopology Stage 8, item 2.
   - To `:533`: ComplexKahlerGeometry K1–K2 and AlgebraicTopology Stages 2–3, 6.1–6.4.
   - To `:666`: AlgebraicTopology Stage 8, item 2 and EnhancedDerivedSheaves §E2.6.

   **Tested.** I compared every layer's *Needs* lines with its Dependencies paragraph by script. Layers 1, 3, 4 and 6 already match, and these additions close Layers 2, 5 and 7.

6. **F06** (P3) §3.2 states only the F half of Burgos94 Theorem 2.1

   **Location.** `README.md:339`: “the holomorphic logarithmic complex maps by a filtered quasi-isomorphism for F to E_W(log D)”.

   **Claim.** 3.2 restates the source's comparison for a fixed compactification.

   **Witness.** Burgos94 line 181–182: Theorem 2.1 is a bifiltered quasi-isomorphism, for W and for F. On E_W(log D), whose W is defined in 3.1, the weight sentence at `:339` (“induced by Wₘ₋ᵢ on the logarithmic complex”) needs the W half as well.

   **Repair.** Write “maps by a bifiltered quasi-isomorphism for (W,F) to E_W(log D)”. Keep the sentence saying that W is not invariant under refinement.

   **Tested.** On 𝔾_m ⊂ ℙ¹, dz/z lies in W₁ and not in W₀ on both sides, which gives weight 1+1 = 2, as in the Check at `:345`.

7. **F07** (P3) Process wording in Scope and Downstream

   **Location.**
   - `README.md:13`: “their ownership moves from Polylogarithms §5.2 to this earlier supplier”.
   - `:670`: “move down to §§5.2–5.3 here”.
   - `:676`: “Its construction is not an existing use of this roadmap’s motivic character.”

   **Claim.** The README is timeless.

   **Witness.** The house style forbids process narrative. These sentences record a change of ownership and the present state of another package.

   **Repair.**
   - At `:13` and `:670`, write: “Aₚ, Aₚ,S, Hₚ, the logarithmic Green-current criterion and its normalized even-degree pairing are §§5.2–5.3 here; Polylogarithms §5.2 imports them.”
   - Delete the sentence at `:676`.

   **Tested.** The replacement keeps the same owner and the same section mapping.

Seven findings: one P2, six P3. The round-1 repairs hold at the text: the §6.2 fibre map, the §C5.6 import, the ComplexKahlerGeometry contract, the split gaps, the §2.0a/§2.0b constructions and the Polylogarithms move all check out. One blocking defect remains. The repaired Scope and Downstream sections say that §2.0a supplies ColemanIntegration §§L3.Fa.1–L3.Fa.2, but §2.0a is stated only over a field, and ColemanIntegration needs it over regular Noetherian bases (R01). So the two-owner problem that F02 was meant to solve is still open. The P3 findings are wording, a Check and Dependencies fixes.

Paths are repository-relative. `packages/…` is this board package. Other roadmaps were read on main `a4a8652` or at the open head given in brackets.

## Verified sound

### Round-1 findings, repair status

| Id | Status | Repaired passage (quoted at most 40 words) |
| --- | --- | --- |
| F01 | repaired | `:561` “its fiber map is (a,b)↦(ra,r′b+ha)”; the Check at `:566` computes (1,1)↦(0,0) and the wrong sign (1,−1)↦(0,2). Recomputed: the defect is (1−ε)(dh+hd)a. |
| F02 | partly repaired | §2.0a (`:198–216`) constructs the supported total fibre, Adams operations, generalized weights and the ordered delooping, and 2.1–2.2 *Need* it. The ColemanIntegration claim is R01. |
| F03 | repaired | `:341` “Import ComplexComparisonPartII §C5.6’s regularSingularDeRhamComparison for the trivial connection with Ē=O_W”. Found at ComplexComparisonPartII `README.md:3850` [#848 2d50a88]; residues 0 are not positive integers. |
| F04 | repaired | `:83–85` ComplexKahlerGeometry K1–K2 contract; cited in *Needs* of 3.1, 3.3, 4.1 and 5.2. Main `README.md:96` (K1) and `:193` (K2) state the type calculus and the Dolbeault operators. |
| F05 | partly repaired | §2.0b (`:218–234`) and the separate 2.2 theorem (`:262`). 2.1 still asserts the identification (R03). |
| F06 | repaired | `:13` and `:496` record that Aₚ, Aₚ,S, Hₚ are Polylogarithms' D_A, D_{A,Z}, H^p; `:433`'s old sentence is gone. The Polylogarithms §5.2 import edit lies outside this package (wording in R07). |
| F07 | repaired | Two gaps, each with domain, coefficients, conclusion, locator and three Checks (`:93–107`); the same slugs in plan.json; the local estimates are owned in 3.2 (`:341`). |
| F08 | repaired | “Stage 8, item 2” throughout. AlgebraicTopology `README.md:1654`, with `simplicialGroupKan` and `simplicialGroupMooreHomotopyIso` at `:1667–1668` (main). |
| F09 | repaired | Six-row label table (`:686–693`). Polylogarithms `:37`, `:120`, `:825` [#1424 4696a1a], KatoEulerSystems `:153` [board 725fd74] and Zagier `design/README.md:1495` all resolve. |
| F10 | settled, not re-raised | Marked not actionable: renaming needs a maintainer. The reason holds; the ledger at `:695` promises nothing. |
| F11 | repaired | EllipticRegulators and HodgeStructuresPartIII are gone. EllipticKTheory at board fd76424 cites no section of this roadmap, so dropping it was right. |
| F12 | repaired | `:672`, `:676`; the 7.1 Check π_{p−1}(3+4i) = 3, 4i, 3. PeriodsAndSpecialValues PS.3.2a [board 9f14c68, line 747] uses (z+(−1)^{j−1}z̄)/2, and ColemanIntegration L3.Fc.1 (`:2648`) builds reg_∞. |
| F13 | repaired | 2.1 Checks at `:250` and `:252`; the 5.3 Check at `:509`. Recomputed: ch = 2 against c = 1; v₂ = 1; dω = −2i. |
| F14 | repaired | 0 occurrences of ż in the README and plan.json; z̄ is defined at `:25`. |
| F15 | repaired | 3.2, 3.4, 5.1 and 5.2 are stated for smooth separated varieties, using EtaleCohomologyFoundations §G.2 (Nagata, main) and ResolutionOfSingularities §§5.1–5.5 [#1199 bf45c86], which need no quasi-projectivity. 4.2 no longer asks for closedness (BKK Proposition 5.15(ii)). 1.2 cites pp.19–20. |

Each repaired pattern was also searched for in the rest of the design:
- Fibre-map signs: 5.1, the Conventions and the 2.3 adapters.
- Unowned inputs: 7.1's Deligne Chern classes are owned here; 2.0b's specialization uses MotivesAndAlgebraicCycles §4.8a.
- Mis-cited suppliers: C5.4, C6.0 and DifferentialGeometry Layers 5–9 all state what is cited.
- Two owners: ColemanIntegration L3.Fa.2 is R01. ColemanIntegration L3.Fc.1, PeriodsAndSpecialValues PS.3.2a and KTheoryFiniteLocalFields §6.10 are recorded, with an agreement statement.
- Non-discriminating Checks: R04.
- Narrowing below the sources: R06.

### Dependency check

Run exactly as the brief gives it; exit 0.

```text
candidate: MotivicEtaleKTheory is not in the merge order yet; checked as if placed after MotivesAndAlgebraicCycles (the intake inserts it when its design is accepted)
depcheck: 27 roadmaps, 241 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. The placement is after merge-order line 87. Every named consumer comes later: ZagierConjecturePolylogarithms 116, ColemanIntegration 155, Polylogarithms 156, MixedHodgeModulesAndIrregularHodgeTheory 181, PeriodsAndSpecialValues 201, KatoEulerSystems 246. The R01 repair adds no supplier.

### Seeded sample (15 targets), checked against the text

No locator is flagged as unverified in plan.json.

- **1.1**: BF line 381 (§1.6, p.8) and line 610/626 (§2.1, pp.13–14); BFT line 180 (p.5). BF's δ on normalized cubes is Σ(−1)ⁱδ⁰ᵢ = −∂□.
- **1.2**: BFT line 943 and 948 (p.19), line 961 (p.20). Normalized in the cube directions only.
- **1.4**: Levine94 Corollary 4.9 (line 1794, printed p.297) is rational; Theorem 5.2 (line 2226, p.313) is rational, with graded commutativity in the cube degree; BF line 661. The integral claim rests, as stated, on the KTheoryFiniteLocalFields §3.0a moving.
- **2.0a**: Levine94 line 407 (p.247), 539 (Theorem 1.10, p.252), 625 (Corollary 1.11, p.256), 655, 695 and 711 (§2: supports, Grayson's functorial operations on iterated fibres, generalized k^q-eigenspaces, Lemma 2.1, pp.257–258), 1101 (Theorem 2.7, infinite field, p.272).
- **2.2**: Levine94 Theorem 3.1 (line 1210, p.276); BF Theorem 3.5 (line 905, p.20).
- **3.1**: Burgos94 line 155 (§2, p.65); BKK Definition 5.20 (line 4217, printed p.116).
- **3.2**: DeligneHodgeII Proposition 3.1.8 (line 1044, p.33), Theorem 3.2.5 (line 1142, p.35), Corollary 3.2.13 (line 1242, p.38), Definition 3.2.12 for smooth separated varieties; Burgos94 Theorem 2.1 (line 181, p.67), Proposition 4.1 (line 379, p.75).
- **3.3**: BKK Definitions 5.7–5.10 (lines 3999, 4035, pp.111–112), Proposition 5.12 (line 4060). Every case of the differential and of φ and ψ matches.
- **3.4**: BKK Theorem 5.22 (line 4239, p.117), (5.23) (lines 4260–4263, pp.117–118), Proposition 5.29 (line 4297, p.119), Corollary 5.31 (line 4315, p.119).
- **4.1**: BKK Definition 5.14 (line 4129, printed p.114, inside the cited pp.113–115), special degrees (line 4176–4180, p.115).
- **4.2**: BKK Proposition 5.15(ii) (line 4145, p.114, no closedness); BF Proposition 1.26 (line 506, p.10).
- **5.2**: BF (1.30) and Proposition 1.31 (lines 530–552, p.11); BKK §5.6 (line 4795, p.132) and Proposition 5.58 (line 4841, p.133), with the cycle current normalized by (2πi)^{−(d−p)} (line 4811).
- **6.2**: BF Proposition 3.3 (line 877, p.19); Lemma 1.10 (line 319, p.7).
- **6.3**: BF Proposition 2.19 (line 827, p.18); BFT Proposition 6.12 (line 961).
- **7.3**: BF line 1440 (§5.1, p.31), line 1539 (Definition 5.8, p.33), lines 1619–1625 (Proposition 5.13 and Corollary 5.14, p.35).

Also read:
- The gap locators: Burgos94 Theorems 3.1, 3.3, 3.4 and 3.5 (lines 316, 337, 345, 358; pp.72–74).
- The 2.0b locator: BF lines 961–997 (Bloch's universal classes, transcendental moving and specialization, read over ℂ).
- The 2.1 locator: Levine94 line 1197.

All pages are printed pagination. The printed number of a page sits on the last line before the next page marker (BKK printed page = PDF page − 1; Levine94 printed page = PDF page + 233).

### Supplier sections resolved, at the stated copy

- GeneralAlgebraicKTheory [#1212 e0552fe]: §§3.12, 4.6, 4.8, 4.14, 6.3, 7.4–7.7, 8.12–8.13.
- SchemeKTheoryOperations [#1229 88dbd5a]: §§2.1–2.6, 3.1–3.6, 4.3, 6.7–6.9, 7.1–7.3. I read §§6.7–6.9: sheaf-level ψᵏ on supported K, and finite simultaneous weights in the regular ample-family scope. Its Downstream line gives this roadmap the higher-Chow refinements.
- KTheoryFiniteLocalFields [#1281 afe02e8]: §3.0a (`motivicCycles`, `motivicToK`, read) and §6.10 (`diagonalChernMilnor`, with factors 1, −1, 2 at n = 1, 2, 3, matching the 2.0b Check).
- MotivesAndAlgebraicCycles [#1313 79b02f6]: §§4.7, 4.8, 4.8a (read: relative-cycle specialization), 4.17, 4.18.
- ResolutionOfSingularitiesCharacteristicZero [#1199 bf45c86]: §§5.1–5.6 (read), §§6.1–6.4 (§6.2 read).
- ComplexComparisonPartII [#848 2d50a88]: C−1.1, C−1.4, C5.1, C5.3 (`properPureHodge` is for smooth proper, not necessarily projective, varieties: `:2974`), C5.4, C5.5, C5.6 (`:3850`), C6.0.
- On main:
  - SchemeAndStackFoundations §§2.1, 2.2, 4.12, 4.17, 5.1–5.8
  - EtaleCohomologyFoundations §§G.1–G.3
  - EnhancedDerivedSheaves §§0.1–0.4, E0.6, E1.4, E2.6
  - DifferentialGeometry Layers 0–1, 5–9
  - ComplexKahlerGeometry K1–K2
  - ComplexManifolds Milestones 1–2
  - AlgebraicTopology Stages 2–3, Stage 6 items 1–4, Stage 8 item 2

The resolver lists no unresolved citations, and I confirmed this against the copies above. HabiroRings [#1425 bb5d6cb] and its board package cite no section or gap of this roadmap.

### Pinned declarations opened

Mathlib 6b7abb3c, 12 declarations:
- `AlgebraicCycle` (AlgebraicCycle/Basic.lean:44, a locally finite-support function, no dimension condition), `mapCoeff` (:55, residue degree when the weights match, else 0), `map` (:69)
- `Scheme` (Scheme.lean:40), `ModuleCat` (ModuleCat/Basic.lean:56)
- `HomologicalComplex` (:59), `d_comp_d` (:72), `DerivedCategory` (DerivedCategory/Basic.lean:87)
- `mappingCone` (:57), `inl_v_d` (:261), `inr_f_d` (:269). The cone differential is (−da, φa+db), and the shift with negation gives the pair fibre of the Conventions.
- `DoldKan.equivalence` (Equivalence.lean:167)

Tau Ceti a91d3aaf, 10 declarations, all with the namespaces cited:
- `TauCeti.gradedCochainComplex` (:59)
- `TauCeti.Hodge.HodgeStructureOn` (Structure.lean:62), `IsMorphism` (Morphism.lean:69)
- `tateLatticeMap` (Tate/Basic.lean:44, the plain ℤ→ℂ), `tate` (:91, type (−m,−m)), `tate_F` (:100), `tate_piece` (:111)
- `MixedHodgeStructure` (Mixed/Basic.lean:72), `Hom.range_inf_F_eq_map_F` (Mixed/Strictness.lean:110)
- `ContMDiffMap.weakWhitneyJet` (WeakWhitney.lean): a topology on the derivatives of a given map, not an extension theorem.

Neither pin has a Whitney or Borel extension theorem (searched by `git grep` at the pinned commits), a flat-ideal result, higher Chow groups, higher scheme K-theory or Deligne complexes. So the gaps ask for nothing that is already provided.

### Duplication and ownership, by object

I searched main, all 330 open roadmap heads (`roadmaps grep`) and the board packages for these objects: multi-relative K-theory, Whitney/Borel extension, flat ideals and Łojasiewicz, higher Chern classes, universal Chern classes, Deligne–Beilinson, logarithmic Dolbeault/Burgos. What turned up:
- ColemanIntegration L3.Fa.2 (R01) and L3.Fc.1 (recorded).
- Polylogarithms §5.2 (recorded move; its §5.2 at `:834` still builds D_A).
- KTheoryFiniteLocalFields §6.10, the field diagonal, with an agreement API.
- PeriodsAndSpecialValues PS.3.2a (recorded).
- EtaleDualityAndPerverseSheaves Layer 1, which uses étale coefficients and comes later in the merge order: not a duplicate.
- SchemeKTheoryOperationsPartII, which treats formal schemes: not a duplicate.
- RealAnalyticGeometry (main), which has no Whitney extension or flat ideals.

Ownership against the open pull requests named in the brief was checked through `roadmaps grep` over all heads. No other duplication was found.

### Declared gaps

Both gaps name DifferentialGeometry, a roadmap on main. Both use the same slug in plan.json and in the README (`:93`, `:101`). Each has an exact domain and conclusion. They ask for nothing the pins, this roadmap or an earlier roadmap provides.

The relative Borel clause is a special case of Whitney extension, not a second request: a jet along a hyperplane with smooth coefficients meets the Whitney condition by Taylor's theorem in y (Burgos94 line 321–335).

### Principles and shape

- No route shortcut, re-planning, copied passage, algorithm, Lean file or `set_option`.
- 27 targets: 8 definitions, 6 constructions, 12 theorems, 1 example. 50 API entries, 93 Checks.
- Every definition and construction has at least three Checks.
- README and plan.json agree verbatim on every statement and Check. Four plan API entries paraphrase README sketch sentences: 2.2, 3.2 (two) and 6.2.
- No LaTeX, no backticked own names, no pull-request numbers; process wording is R07.

### Headline theorems for the package stage

The headlines are 1.3, 2.2 (with the universal-class identification), 2.3, 3.2, 3.4, 4.2, 5.2, 5.4, 6.1–6.3, 7.2, 7.3 and 7.4. None is statable at the pins: there are no higher Chow groups, no scheme Kₙ and no geometric Deligne complex. The abstract Dolbeault-algebra statements of 3.3 and 4.1 are not headlines.

**Elaboration:** not available (this lane does not elaborate, and a design has no `Suggested.lean`). There was therefore no padding probe and no `#check` binder comparison.

### Adversarial table

| Statement | Instances | Values computed (each side) | Result |
| --- | --- | --- | --- |
| Cube orientation | Γ_t on 𝔸¹; n=0,1,2 | ∂□Γ_t=+[0]; BF Σ(−1)ⁱ(δ⁰−δ¹) gives −[0]; J=1,−1,1; J_{n−1}∂□=(−1)^{n−1}∂□=δJₙ | holds |
| Pair fibre vs Mathlib cone | A→B | cone (−da,φa+db); shift −1 gives (da,−φa−db); b↦−b gives (da,φa−db) | holds |
| Boundary adapter | (𝔸¹,{0}) | d(Γ_t,0)=([0],t) ⇒ [(0,t)]=−[[0]]; B[t]=+[O₀]; adapter −raw sends t↦+[0] | holds |
| Projection parity | 3+4i; p=1,2,3 | π_{p−1}=3, 4i, 3; π₀(2πiy)=0; π₁((2πi)²x)=0 | holds |
| 1.1 | point, p=0 | N₁=0 since δ¹₁[□]=[pt]≠0; H₀=ℤ; raw complex keeps ℤ in every degree | holds |
| 1.2 | bidegree (1,1) | D² cross terms −1,+1; J at (1,0),(0,1),(1,1)=−1,+1,−1; (−1)^{n+m} gives −1 at (0,1) | holds |
| 1.3 | ℤ/2⊗ᴸℤ/2; Z=∅,X | Tor in degree −1; fib(id)=0, fib(C→0)=C | holds |
| 1.4 | 𝔽₂(t)/𝔽₂(t²); pt⊔ℙ¹ | π_*π^*=2; CH¹=0⊕ℤ, CH⁰=ℤ²; exchange (−1)^{1·1}=−1 | holds |
| 2.0a | n=1; X=ℙ²; B=Spec ℤ_p | (1,0)↦1, (0,1)↦−1, (1,1)↦0; integral pieces have index 2 (h missing); ℤ_p is outside the hypotheses | R01, R02 |
| 2.0a generalized weights | M=2I+N | (M−2I)e₂=e₁≠0, (M−2I)²e₂=0 | holds |
| 2.0b | O(1)⊕O(−1) on ℙ²; n=1,2,3 | c₂=−h², ch₂=h²; diagonal 1,−1,2 times factors 1,−1,½ gives 1,1,1; c₀,₀(0)=1 against ch(0)=0 | holds |
| 2.1 | ℙ¹; unit 2 | ch(O(1)⊕O(−1))=2, c=1; v₂(ch₁,₁[2])=1, zero map gives 0 | holds; R03 |
| 2.2 | weights 0,1,2; sign model | eigenvalues 1,2,4; differences −1,−3,−2; (−1)^{n(n−1)/2}=+1,+1,−1 | R04 |
| 2.3 | (𝔸¹,{0}); Z=∅ | ch_Z B[t]=+[0]=−δ_raw[t]; 0≃0 | holds |
| 2.4 | ℙ¹; p=1,2,3 | ch(1−O(−1))=h; (−1)^{p−1}/(p−1)!=1,−1,½ | holds |
| 3.1 | punctured disk | d log∣z∣²=dz/z+dz̄/z̄; ∮dz/z=2πi; residue ±1 by order | holds |
| 3.2 | 𝔾_m⊂ℙ¹; flat tests | residues (0,0) meet C5.6 (its residue (1,0) case gives 0); weight 1+1=2; f/z²(1)=e⁻¹≈0.368; f log∣z∣²/(zw̄)(−2,1)=−e^{−1/4}log4/2≈−0.540 | holds; R06 |
| 3.3 | A=ℂ[0]; ∣z∣² | H⁰D(A,0)=ℝ; D¹(A,1)=ℝ, so H¹=ℂ/2πiℝ by Re; p=−1: kernel {(a,a)}=ℝ(−1); −2∂∂̄∣z∣²=−2dz∧dz̄, value 4i; ψφ=id | holds |
| 3.4 | pt⊔ℙ¹; 𝔾_m² | H⁰_D=ℝ²; periods (2πi,0),(0,2πi), product (2πi)² in both choices | holds |
| 4.1 | log2, log∣t∣; ∣z∣²,1 | (log2/2)(dt/t−dt̄/t̄)=i log2 darg t, swap −; −z̄dz+zdz̄, d_D=−F^{1,1}d=−2dz∧dz̄=d_D∣z∣²•1 | holds |
| 4.2 | 2,3,5; Re z,2,3 | 30=30; 6 Re z on both sides, value 6 at z=1, d(Re z)=dx≠0 | holds |
| 5.1 | 0→ℝ[0] | degree 1; d² second entry res(dω)−d(resω−dg)=0 | holds |
| 5.2 | V(xy); origin; point; f=t | ℝ², (1,1); p=1: 0, p=2: ℝ; full support gives H¹=ℝ≠0; −2∂∂̄[−log∣t∣]=2(−πi)/(2πi)δ₀=−δ₀, coefficient +1; Polylogarithms also uses (2πi)^{−(d−c)} | holds |
| 5.3 | ω=x₁dz₂∧dz̄₂, p=1 | ω ∈ D²(A,1); dω(∂x₁,∂x₂,∂y₂)=−2i; excluded by τ≤2 | holds |
| 5.4 | origin; (n,s) | coefficients 1,2; (−1)^{ns} at (1,1),(0,1),(1,2)=−1,+1,+1 | holds |
| 6.1 | Spec ℂ; unit −1 | m↦m; log∣−1∣=0 | holds |
| 6.2 | A=A′=ℤ[0], B=0, B′=ℤ→ℤ, r=f′=h=1 | f′r−r′f=1=dh+hd; +h gives (1,1), D′=(0,0); −h gives (1,−1), D′=(0,2) | holds |
| 6.3 | pt→ℙ¹; 2 over ℚ | c₁↦0 and H²_D(pt,ℝ(1))=0; log 2 by both routes | holds |
| 7.1 | 2e^{iθ}; S₃ | Re log=log2 for every θ; π₀(constant S₃)=S₃, nonabelian | holds |
| 7.2 | rank 2; units 2, −1 | 2=2; log2=log2; 0=0; degree 2 not pinned | R04 |
| 7.3 | {2}·{t}; {2,3} at a point | i log2 darg t, swap −, period 2πi log2; H²_D(pt,ℝ(2))=0 | holds |
| 7.4 | u=2,3,½; f,g | log6=log2+log3; −log2; x•y=i(log∣f∣darg g−log∣g∣darg f) | holds |
| gap: Whitney | A={0}; x=0 in ℝ² | 1,1,2 give 1,1,4; (2!)²sin(π/2)=4; 0 and exp(−1/x²) share the zero jet | precise, minimal |
| gap: flat ideals | A={x=0}, B={y=0} | φ(x)+φ(y) ∈ I(A)+I(B); value e⁻¹ at (0,1)∈A, so not in I(A∪B) | precise, minimal |
| Polylogarithms transport | bidegree (r,−n) | J(d_D+(−1)^r∂□)J⁻¹=d_D+(−1)^rδ, as at Polylogarithms `:834` | holds |
| ColemanIntegration claim | B=Spec ℤ_p | §2.0a needs a field base | R01 |

## Not verifiable

- **Bloch86** is uncertified. Its arbitrary-field universal classes (2.0b) and their identification with Levine's inverse (2.2) were not read; the identification over ℂ was read in BF lines 961–997.
- **Beilinson85** is uncertified and **Levine98** is waived. The design leans on neither beyond background.
- **Burgos94** displays are lost in the extraction (the maps of Theorem 2.1 and the formula of Proposition 4.1). Their content was confirmed through the surrounding text, BKK lines 4217–4237 and the 3.2 Checks.
- **BF §2.2**: its general pullback cites a source that was not read. The design uses the supplier's integral moving instead.
- **Lean elaboration**: not available in this lane.

## Source issues

- **Misprint** in BF at Proposition 1.26, p.10: the source gives the associativity homotopy's target degree as r+s+t; it should be r+s+t−1, as a degree −1 homotopy matching the associator; affects nothing.
- **Gap** in BF at Theorem 3.5, p.20: the source states the Beilinson comparison for any equidimensional complex algebraic scheme, but its proof treats smooth quasi-projective X only; it should assume that; affects a stated result.
- **Gap** in BF at Proposition 2.7, p.15: the source asserts an associative internal product for any quasi-projective X; it should assume X smooth, since diagonal pullback and the cited Levine result (rational) need smoothness; affects a stated result.
- **Gap** in Levine94 at Theorem 3.1, pp.276–277: the source states the cycle-map isomorphism over any field, but its proof checks Theorem 2.7, which assumes an infinite field; it should add rational descent from an infinite algebraic extension; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "eb7fbdd", "job": "REV-DESIGN-MotivicEtaleKTheory~2", "model": "opus", "worker": "fable-rev30"} -->
