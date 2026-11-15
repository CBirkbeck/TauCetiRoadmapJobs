# Review of AlgebraicModuliForArithmeticGeometry (pull request #853 at e5f9c4c)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since `e5f9c4c`. The folder is the one the previous review accepted. All five findings are in the pull request's description, read against this head (step 8). README locations are relative to `TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/`.

## R01 (P3) — The description says the README cites no section of ComplexComparisonPartII
**Location:** description, boundary paragraph: "This roadmap cites no section of #848 and precedes it in the merge order;"
**Claim:** The README names ComplexComparisonPartII sections in four places. It consumes none of them, but it does cite them.
**Witness:** `README.md:144–147` (§§C−1.1–C−1.4, C1.9, C3.2a–C3.2g), `README.md:1138` and `:1147` (§C1.9), `README.md:9190` (§§C3.2f.1–C3.2f.2). None of these is in a *Needs:* line; depcheck reports 0 problems.
**Repair:** "This roadmap consumes no section of ComplexComparisonPartII. It names §§C−1.1–C−1.4, C1.9 and C3.2a–C3.2g only to mark the edge of its scope and to point to where that roadmap uses this one, and it precedes it in the merge order;"

## R02 (P3) — C5.5 of ComplexComparisonPartII does not consume this roadmap
**Location:** description, boundary paragraph: "Its logarithmic de Rham comparisons (C5.5) likewise consume the algebraic constructions here."
**Claim:** §9.10 builds no logarithmic complex of its own. C5.5 uses CrystallineCohomology's logarithmic core directly.
**Witness:** `README.md:309`: CrystallineCohomology §§CR.5:log-algebra.4/CR.5.1 "supply the logarithmic carrier of §9.10". §9.10 defines `logDeRhamComplex` as that roadmap's complex: "no second complex is constructed". ComplexComparisonPartII's C5.5 never cites this roadmap.
**Repair:** "Its logarithmic comparisons (C5.5) and §9.10 here both consume the logarithmic core of CrystallineCohomology §§CR.5:log-algebra.4/CR.5.1; neither roadmap supplies it to the other."

## R03 (P3) — The prose list claims as built here two things the head takes from suppliers
**Location:** description, second paragraph ("This roadmap builds …"): "effective fpqc descent of quasi-coherent modules on schemes and algebraic spaces"; "and characteristic-zero resolution and SNC compactification with the algebraic vanishing theorems and Kollár–Matsusaka boundedness."
**Claim:** Two items come from suppliers: the scheme case of fpqc descent (SchemeAndStackFoundations), and resolution with SNC compactification (ResolutionOfSingularitiesCharacteristicZero). The summary block says this correctly ("from supplied characteristic-zero resolution"); this paragraph contradicts it.
**Witness:** `README.md:1159`: "This roadmap states no second version" of SchemeAndStackFoundations §1.1 `qcoh_fpqc_descent`. `README.md:112` and `:289`: Layer 9 "consumes" resolution and SNC compactification from ResolutionOfSingularitiesCharacteristicZero.
**Repair:** Replace the first phrase by "effective fpqc descent of quasi-coherent modules on algebraic spaces, extending the scheme case of SchemeAndStackFoundations §1.1". Replace the second by "and the algebraic vanishing theorems and Kollár–Matsusaka boundedness, built on the characteristic-zero resolution and SNC compactification that ResolutionOfSingularitiesCharacteristicZero supplies."

## R04 (P3) — Two roadmaps listed as cited suppliers on main are not cited
**Location:** description, dependencies paragraph: "Roadmaps already on main that the README cites (SchemeAndStackFoundations, PadicMeasuresIwasawaAlgebras, AdicSpacesPartII, RigidAnalyticGeometry and the older roadmaps)"
**Claim:** The README cites neither PadicMeasuresIwasawaAlgebras nor RigidAnalyticGeometry. The list also leaves out ResolutionOfSingularitiesCharacteristicZero, which is on main and supplies Layer 9.
**Witness:** Occurrences in `README.md`: PadicMeasuresIwasawaAlgebras 0, RigidAnalyticGeometry 0, ResolutionOfSingularitiesCharacteristicZero 27. All three are on main at `3cf7342`.
**Repair:** "Roadmaps already on main that the README cites (SchemeAndStackFoundations, ResolutionOfSingularitiesCharacteristicZero, StableReduction, AlgebraicVectorBundles, JacobianChallenge, ModularCurves, ReductiveGroupsPartII, AdicSpacesPartII, AdicSpacesPartIII, EnhancedDerivedSheaves, DerivedModuleAlgebra and GroebnerGeometry)"

## R05 (P3) — The merge-order block lists no consumers
**Location:** description, dependencies paragraph: "consumers of this roadmap are listed in the merge-order block, not here."
**Claim:** The merge-order block lists only the suppliers that come before this pull request. No consumer appears in it.
**Witness:** The block reads "#816 (PerfectoidTowers) → #940 (PadicPeriodRings) → #868 (DerivedDeRhamCohomology) → #857 (CrystallineCohomology) → this pull request (#853)". The consumers are listed under `README.md:10364` `## Downstream consumers`.
**Repair:** "Consumers of this roadmap (ModularCurvesPartII, AbelianSchemesAndArithmeticModuli, PELModuli, ShimuraVarieties, ComplexComparisonPartII and FiniteEquivalenceRelations) are listed in the README's Downstream consumers section."

## Previous findings

- none: the review of `e5f9c4c` raised no finding.

## Verified sound

| Statement | Instances | Values computed | Result; change |
| --- | --- | --- | --- |
| `coherentDevissage` (headline, §2.3; its block carries R01's §C1.9 citations) | `X=∅`, `P≡false`; `X=Spec k`, `P`="nonzero" in the 12.8 variant | ∅: (1),(2) vacuous, `P(0)` false, so (0) is needed. Spec k: 12.8's three conditions hold (`G=G′=k`), `P(0)` false; README keeps (0) | Agrees with the README; the source errs (*Source issues*); no change |
| §2.3 locators (sampled target) | `stacks_coherent` lines 1407, 1501, 1572 | 01YF filtration, page 29; 01YI two-out-of-three dévissage, page 31; 01YM extension/summand variant, pages 32–33 | Hypotheses and conclusions as the README restates them, plus (0); no change |
| `devissageViaChow` (§2.3, names ComplexComparisonPartII §C1.9) | `X=∅`; `X=P¹_k`, `Z=X`, `π=id`, `L=O(1)`, `n=0` | ∅: conclusion is exactly (0). `G=O`, `Supp=P¹`, `G_ξ=k(t)=κ(ξ)`, dimension 1; `Rⁱid_*=0` | Its §C1.9 (head line 1986) needs `devissageViaChow`; consumer later in order (41 > 36); R01 |
| `logDeRhamComplex` (§9.10; R02) | `A¹_ℚ`, `D=V(x)`; characteristic `p`; C5.5 | `Ω¹(log D)` free on `dx/x`; `d(xᵐ)=m xᵐ dlog x`; `d(xᵖ)=0`. Defined as CR.5.1 complex (its head line 8508). C5.5 (lines 4114–4640): 0 citations here | Description contradicted (R02) |
| §3.1 scheme fpqc descent (`quasicoherentPseudofunctor` alias; R03) | `Spec ℂ→Spec ℝ`, datum `(ℂⁿ, conjugation)` | descends to `ℝⁿ`, dimension `n` on both sides. Owner: SchemeAndStackFoundations §1.1 `qcoh_fpqc_descent` (main line 2800); `README.md:1159` states no second version | Supplied, not built here (R03) |
| Layer 9 resolution input (`exists_resolution`, supplier §§5.6, 6.2, 7.8; R03) | cusp `y²=x³` over ℚ | blow-up chart `y=xv`: `x²(v²−x)=0`, strict transform `v²=x` smooth, isomorphism off the origin (the smooth locus); statement at main line 877 | Supplied, not built here (R03) |
| `spaceSectionComponentCriterion` (§7.9; `README.md:9190` names §§C3.2f.1–2) | `Pic_{P¹/k}`; `Pic_{E/k}`, `E` elliptic | identity component `{0}=Spec k`, proper. `Pic⁰_E=E`, smooth, proper, dimension 1. ComplexComparisonPartII lines 2592–2597 apply §7.9 | Supply runs from this roadmap to ComplexComparisonPartII; no change |

The rows of the review of `e5f9c4c` for untouched statements stand as recorded there.

- Gate run by this review at `e5f9c4c`: every counter 0, `OK` (the worker's run, which includes the targeted build, has `build=0`); nothing changed outside the folder. Dependency check (`--movable`): `depcheck: 245 roadmaps, 2213 edges, 0 problem(s)`, no UPWARD or CYCLE line.
- Elaboration (`lake env lean` on `Suggested.lean`): five `sorry` warnings (lines 48, 73, 87, 119, 131), nothing else. The file is unchanged, so earlier signature checks and probes stand.
- Description: every sentence of the summary block's three paragraphs and the four prose paragraphs was checked against this head. Five are contradicted (R01–R05). The title matches the README's title, and "nine layers", the layer contents, the folder's three files and the single `TauCeti.*` import are as stated.
- Library names in the description, opened at the pins: `Module.Grassmannian` (Mathlib/RingTheory/Grassmannian.lean:66), `Pseudofunctor.IsStack` (Mathlib/CategoryTheory/Sites/Descent/IsStack.lean:49), `Sheaf.H` (Mathlib/CategoryTheory/Sites/SheafCohomology/Basic.lean:57), `rigidifiedPicardFunctor` (TauCeti/AlgebraicGeometry/PicardFunctor/Rigidified.lean:70). Mathlib has no gerbe, projective-bundle or rigidification file.
- Cross-roadmap claims in the description resolved: EnhancedDerivedSheaves E1.9 and DerivedModuleAlgebra §1.E.1 (main, line 2644). ComplexComparisonPartII's head cites `spaceDQCoh`, `spacePerfect`, `universalFlatteningProperSupport` and `relativePicardSheaf` (lines 2428, 2498). Merge order: CrystallineCohomology 25 < this roadmap 36 < ComplexComparisonPartII 41.
- Overlap check: read FunctionFieldArithmeticPartII, StableReductionPartII and ComplexComparisonPartII (open), and SchemeAndStackFoundations and ResolutionOfSingularitiesCharacteristicZero (main). Owners of the shared objects: scheme fpqc descent, SchemeAndStackFoundations §1.1; resolution, principalization and SNC compactification, ResolutionOfSingularitiesCharacteristicZero; complex analytification, complex GAGA and Picard algebraicity, ComplexComparisonPartII; the §§4.3–4.4 and 4.23 gerbes, §3.5 polarized descent, the §7.6.1 Picard sheaf and the §7.9 components, this roadmap, which the three open roadmaps cite.
- Source independence: changed passages only, and there are none (0 changed lines), so nothing was compared. No layer was added, removed or reordered, so the arrangement was not compared again. The Stacks project has the largest share of source mentions: 882 of about 1,330 across the eight most cited sources (a count of mentions, not locators).
- Remark (untouched text, no change asked): StableReductionPartII's head declares four gaps on this roadmap (`gap:projective-frame-line-twist`, `gap:integral-node-incidence`, `gap:level-tame-components`, `gap:proper-flat-picard-quotient`). The intake routes these.

## Not verifiable

- Nothing in this round's checks. The items the review at `b58cf53` listed concern untouched text and stand as recorded there.

## Source issues

- **Error** in stacks_coherent at Lemma 30.12.8 (tag 01YM), printed pp. 32–33: the source says closure under extensions, the direct-summand condition and the ideal-subsheaf generators give P on every coherent sheaf of a Noetherian scheme; it should be assume P for the zero sheaf too, since on Spec k the property "nonzero" satisfies all three hypotheses and fails at 0; affects a stated result.
- **Error** in stacks_coherent at Lemma 30.12.6 (tag 01YI), printed p. 31: the source says two-out-of-three closure and length-one generators on integral closed subschemes give P on every coherent sheaf; it should be assume P for the zero sheaf or X nonempty, since on the empty scheme both hypotheses are vacuous; affects a stated result.

## For the human reviewers

- none
