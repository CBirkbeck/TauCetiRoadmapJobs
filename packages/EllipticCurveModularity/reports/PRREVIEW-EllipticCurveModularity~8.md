# Review of EllipticCurveModularity (pull request #1018 at 0342320)

**Verdict:** accepted

**Summary.** Accepted: the 23 changed lines repair the three folder-level corrections of the previous review without introducing a new problem, the Lean file elaborates with `sorry` as its only warning, and the title and description agree with this head except for one paragraph that the supplier's new head has overtaken. There is one small correction (that paragraph) and six format notes, five of them carried over unchanged; none blocks. The two points for the human reviewers stand as before.

## C01 — The description's paragraph on EllipticCurveModularityTotallyReal describes a head that no longer exists

A reader of the description is told that the supplier still needs a revision which it has already received. The paragraph says that EllipticCurveModularityTotallyReal "still says that this roadmap obtains the newform from classical Serre modularity and does not use its case K = ℚ; those two sentences need the matching revision there". At that roadmap's open head (`4588f93`) both sentences are revised: its Summary (`TauCetiRoadmap/EllipticCurveModularityTotallyReal/README.md`, lines 38–40) says EllipticCurveModularity derives the newform "from the case `K = ℚ`", its consumer list (lines 1141–1143) says this roadmap "uses §4.4 with `K = ℚ` for the existence of the newform", and "Outside this roadmap" (lines 1224–1226) says the classical formulations are derived from §4.4 in EllipticCurveModularity. The phrase "classical Serre" no longer occurs in that file.

The smallest change: delete the paragraph. The preceding paragraph already names §§4.2 and 4.4 as what is consumed.

## N01 — R29.2's first theorem needs R29.4

Carried over unchanged: the theorem that an attached form is residually attached at every prime uses the exact level and all-coefficient comparison of R29.4, so the guide to the layers could say that R29.2's definition comes first and its theorem after R29.4. There is no cycle.

## N02 — Three links into ModularForms point at headings that are no longer there

Carried over unchanged (lines 483, 569 and 1350): the anchors `#layer-5-strong-multiplicity-one-and-the-eigenform-characterization`, `#layer-7-l-functions` and `#layer-8g-galois-stability-the-character-field-and-rationality` land at the top of the page. The citations themselves stay valid through that roadmap's mapping of its earlier labels.

## N03 — Pinned declarations behind "supplied" facts are not named

Carried over unchanged: multiplicativity of `WeierstrassCurve.LFunction` and its value at 1 are `WeierstrassCurve.isMultiplicative_LFunction` and `WeierstrassCurve.LFunction_apply_one`; the cross-level theorem of the contracts table is `HeckeRing.GL2.Newform.level_eq_and_coe_eq_of_forall_notMem_prime_eigenvalue_eq`.

## N04 — Five lines of `Suggested.lean` exceed 100 characters

Now lines 100, 102, 107, 109 and 115 (the docstrings and signatures of the three `IsNewformOf` theorems of R29.3 and R29.4).

## N05 — RankZeroOneBSD is named as a consumer but is no roadmap

Carried over unchanged: README line 1502 and the description's summary ("EllipticCurves Layer 7 and RankZeroOneBSD consume the continuation") name RankZeroOneBSD; on main and among the open roadmaps there is only RankZeroOneBSDPartII, so a reader cannot find the consumer meant.

## N06 — The generated dependency block lists two roadmaps the README does not cite

In the description's `depends-on` block, SerreWeightAndLevelOptimisation and FiniteFlatGroupsAndIntegralPadicHodgeTheory are listed (both ticked, both on main); neither name occurs in `TauCetiRoadmap/EllipticCurveModularity/README.md` at this head. Regenerating the block removes them.

## Deferred findings

- D01 — resolved: at its open head `4588f93` the supplier's Summary, consumer list and "Outside this roadmap" paragraph all name §4.4 at K = ℚ as consumed by this roadmap.

## Previous findings

The previous report had no finding (R); its small corrections and format notes are accounted for here.

- C01 — repaired: the description now names "EllipticCurveModularityTotallyReal (§§4.2 and 4.4 …), AutomorphicGaloisRepresentations … and FaltingsFinitenessAndIsogenyTheorems" as the three open suppliers; all three are open, every other supplier cited is on main. A leftover in the generated block is N06.
- C02 — repaired (was deferred as D01): the supplier at `4588f93`, lines 1141–1143, "EllipticCurveModularity uses §4.4 with `K = ℚ` for the existence of the newform". The description's sentence about it is now out of date: C01 above.
- C03 — repaired: line 224 now reads "(ArithmeticGaloisRepresentations §6.1; EllipticCurves Layer 1)"; "Lemme 5" occurs nowhere in the README.
- C04 — repaired: rows 26b1 and 274a1 are gone; the seven remaining rows were recomputed and each is used by a Check (by label, or by its equation `y² = x³ − x`).
- C05 — repaired: both definitions are removed from `Suggested.lean`; the README (lines 162–167) describes good and multiplicative reduction in prose and line 1645 no longer lists the two names. No remaining text refers to them.
- N01 — not repaired: untouched; written again as N01.
- N02 — not repaired: untouched; written again as N02.
- N03 — not repaired: untouched; written again as N03.
- N04 — not repaired: the same five lines, renumbered; written again as N04.
- N05 — not repaired: line 1502, "Its consumers include EllipticCurves Layer 7 and RankZeroOneBSD"; written again as N05.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| `HasRationalCyclicSubgroup` (passage whose locator changed) with `five_isogeny_j` | 11a3, point (0,0); 11a1; 11a2 | (0,0) has order 5; j=−4096/11 with v=−11; j(11a1)=−122023936/161051 with v=−1/11, −125/11; 11a2 with v=−1375 | holds | none |
| Reduction prose of the notation section (reworded) | 11a1 at 7 and 11; `y²=x³−x` at 2 | Δ=−11⁵, c₄=496≡1 mod 11: good at 7, multiplicative at 11; Δ=64, c₄=48: additive, both false | holds | none |
| Model table (two rows removed) | seven remaining rows | Δ, c₄: −161051, 496; −11, 375376; −11, 16; −648, 225; 64, 48; 37, 48; −659664896, 7936; all equal the table | holds | none |
| List of definitions in the contracts (line 1645) | the five names against the file | `GQ`, `lCoeff`, `coeff`, `HasRationalCyclicSubgroup`, `IsNewformOf` are exactly the file's five definitions; 12 theorems unchanged | holds | none |
| Existence (`modularity`), supplier side | supplier §4.4 at its head `4588f93` | §4.2 at line 942, §4.4 at line 1086; consumer line 1141 names this roadmap; no citation back as supplier | holds as supplier contract | C01 (description) |

The rows of the previous review for the untouched statements stand as in that review, of `ed6ed86`; the diff changes no theorem statement.

- Changed passages read at this head: 4 in the README (lines 162–167, 219–226, the model table, line 1645) and the removal of two definitions in `Suggested.lean`; no file changed outside the folder.
- Library declarations opened at the pin: `WeierstrassCurve.HasGoodReduction` and `HasMultiplicativeReduction` (`Mathlib/AlgebraicGeometry/EllipticCurve/Reduction.lean`, lines 324 and 341), the predicates the reworded prose refers to.
- Cross-roadmap citations resolved for the changed passages and the description: ArithmeticGaloisRepresentations §6.1 (main, line 3964), EllipticCurveModularityTotallyReal §§4.2, 4.4 (open head), and the status of all 15 roadmaps the README cites (three open, the rest on main).
- Dependency check: `depcheck: 200 roadmaps, 2194 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `Suggested.lean` elaborates with 12 `sorry` warnings and nothing else; no `set_option`, no sorry'd data; imports are `Mathlib` and four Tau Ceti modules.
- Automatic checks: all passed at this head.
- Title and description read against the head: one sentence group out of date (C01), one dangling name (N05), one stale generated block (N06); the rest agrees (new roadmap, three files, 17 declarations, three open suppliers with the sections the README cites).

Overlap check: read EllipticCurveModularityTotallyReal again at its new head; EllipticCurveModularityPartIIGL2TypeAbelianVarieties, EllipticCurveModularityPartII, EllipticCurvePeriodsAndModularParametrizations, AutomorphicGaloisRepresentations, AlgebraicModularFormsAndSerreWeights, ModularForms, ModularCurvesPartII as read in the previous review (the change touches no shared object; the third list is empty); existence of the newform over ℚ: EllipticCurveModularityTotallyReal §4.4, consumed here; residual attachment predicate: AlgebraicModularFormsAndSerreWeights §7.5; the quotient `A_f⁰`: ModularCurvesPartII §16.5; elliptic coefficient summability: here, consumed by EllipticCurvePeriodsAndModularParametrizations §3.1.

Source independence: changed passages only: 3 passages compared with 1 source (serre lines 1266–1268, whose locator the change removes), none shared; no layer added, removed or reordered, so the arrangement stands as compared before (largest share Cremona, 12 of the locators; independent).

Research link: The headline is the modularity theorem for elliptic curves over ℚ in Serre's 1987 formulation (§4.6, Theorem 4), with Carayol 1986 for conductor and local factors and Faltings 1983 for the isogeny; existence is imported from the totally real case (README, R29.3 and References).

## Not verifiable

- Silverman, AEC VII.5, cited at the reworded reduction paragraph: no legal copy read; the predicates were read at the pin instead.
- The Provenance section's account of `LeanPool/lean-pool`: repository not opened (as before).

## Source issues

- none

## For the human reviewers

- Scope: existence of the attached newform (headline `modularity`) is taken only from EllipticCurveModularityTotallyReal §4.4, whose References gave as main sources a discussion draft of 7 October 2026 and a preprint of 4 October 2026; this README cites no refereed proof of existence.
- Licence: the Provenance section maps targets to the Apache-2.0 folder `LeanPool/FLTEichlerShimura`, and two choices are said to follow the Imperial College London FLT project; neither repository was opened, so agreement of Lean declarations with them is unchecked.
