# Triage report: TARGET-CohomologyComparisonsPartII

Verdict: **part-ii**. Keep **CohomologyComparisonsPartII**, titled “Cohomology comparisons, Part II: classical syntomic producers and relative open-curve coefficients.” The target continues the declared existing comparison producer. No supplied roadmap or library declaration was found to own the complete request, and no other open job should absorb it. The qualification is material: the base text and several supplier contracts are absent, so the report cannot certify their exact stopping point or sections. The brief records that limitation rather than re-planning the base.

## Consolidation before classification

Compared every other listed open job by structures, operators, hypotheses and intended supply, including the two available design briefs.

| Open job | Object comparison and decision |
| --- | --- |
| DESIGN-ColemanIntegrationPartII (#11) | Read `packages/ColemanIntegrationPartII/target.md`. It owns Coleman/Vologodsky primitives, harmonic cochains, annular double indices, wide-open triple indices and finite-extension integration descent. This target owns classical syntomic cochain complexes, period maps, filtered relative coefficients and their Ext/evaluation/Gysin targets. Shared curve de Rham and semistable theory is an input/output boundary, not duplicated integration theory. That design explicitly lists this Part II as a supplier. Keep both; never make this producer depend on its integration consumer. |
| TARGET-ArithmeticLevelRaisingAndBipartiteEulerSystems (#7) | The filed objects are unitary Shimura level raising, diagonal Abel–Jacobi classes, reciprocity laws and bipartite Euler-system rank theorems. They may use cohomology, but do not construct the classical syntomic/relative coefficient producer. No merge. No board file was available. |
| TARGET-GanGrossPrasadConjecturesForClassicalGroups (#6) | Restriction multiplicities, packets, distinguished characters, periods and L-value identities differ from the present cohomology complexes and coefficient category. Shared arithmetic context is not overlap. No merge; no board file available. |
| DESIGN-QWittVectors (#9) | Read `packages/QWittVectors/target.md`, including its suppliers. Big/q-Witt rings, arithmetic Λ-perfection, ghosts, F/V, positive-degree q-Witt calculus and completed framed difference complexes are different objects. Shared Witt, Frobenius, de Rham and completion foundations do not give shared ownership of syntomic cohomology. No merge. |
| TARGET-K3SurfacesAndSymplecticBoundedness (#5) | Native geometric K3 surfaces, Picard lattices, automorphisms and moduli boundedness do not own relative rigid/log-syntomic comparisons. Coherent cohomology is shared background only. No merge; no board file available. |
| TARGET-QSeriesPartitionsAndMockModularForms (#1) | q-series, partitions, Appell–Lerch sums, mock theta functions and modular transformation laws are unrelated objects. Its source manifest exists, but no target/design brief was available. No merge. |

No incoming target had already been merged into this one. The name occurs only as the current package and as a supplier reference in the ColemanIntegrationPartII brief; it is unused by a supplied existing roadmap. There were no supplied open roadmap PR heads to inspect.

## Roadmap and ownership search

Inspected the supplied main checkout at `c4d22422c3f1aaa3d806c42f432953c26cb91969`, active `TauCetiRoadmap/`, `Completed/`, the Git tree, every package filename and `merge-order/ORDER.txt`. Searched by objects as well as names: syntomic cohomology, rigid cohomology, log-crystalline, Hyodo–Kato, nearby cycles, divided Frobenius, modified Tate lattices, Fil-F-MIC, isocrystals, Gauss–Manin, filtered connections, Ext, coherence, evaluation and residues.

The main checkout and Git tree contain no CohomologyComparisons, CrystallineCohomology, PadicPeriodRings, PadicDifferentialEquationsAndRigidCohomology, PadicHodgeRegulators, ColemanIntegration or EllipticRegulators roadmap texts. The base is present by name in the supplied merge order; so are the crystalline, period-ring and rigid-cohomology suppliers. A read-only GitHub lookup of `TauCetiRoadmap/CohomologyComparisons/README.md` at the repository's default branch returned 404. No section numbers were fabricated. The independent regulator review R1–R2 was not an input, so its claims were not used as verified findings.

The available neighboring ownership was read directly:

- `TauCetiRoadmap/AdicSpacesPartIV/README.md`, F1.5–F1.9, F1.11–F1.12 and F1.16: weak completions, dagger geometry, overconvergent de Rham complexes and supports. F1.11 explicitly leaves general finite-type rigid cohomology to the rigid-cohomology roadmap. “Rigid cohomology with support” in F1.16 describes analytic de Rham support constructions; it is not evidence that classical syntomic cohomology is already owned there.
- `TauCetiRoadmap/RigidAnalyticGeometry/README.md`, §§6.1–6.3, 7.3–7.4 and 8.1/8.4: sites, gluing, coherent/proper cohomology, analytification and GAGA. These are suppliers, with AM's open-relative coherence still requiring its own hypotheses.
- `TauCetiRoadmap/EnhancedDerivedSheaves/README.md`, §§0.1–0.4, E2:towers and E5:abstract: enhanced derived functors, tensor and limits. `TauCetiRoadmap/DerivedModuleAlgebra/README.md` also identifies general derived/PD foundations and existing abelian Ext input. Neither claims this classical producer.
- `TauCetiRoadmap/EtaleCohomologyFoundations/README.md`, F.0.3, F.1, F.3a and F.4.1–F.4.5: finite Tate sheaves, derived/adic realizations and trait/inertia foundations. These do not by themselves certify a complete nearby-cycle interface.
- `Completed/HodgeStructures/README.md` and `TauCetiRoadmap/NewtonPolygons/README.md` hits concern different abstract Hodge/slope ownership; neither supplies the requested relative p-adic category. StableReduction's syntomic-morphism hits concern the geometric morphism condition, not syntomic cohomology.

These findings support a Part II on the filed continuation contract, not a duplicate verdict. Missing supplier texts remain an acceptance risk. The design must import any already-owned rigid, HK, rational h-descent or period comparison by its actual accepted section, narrowing the new work to the uncovered producer and adapters. The source list alone does not establish new ownership.

## Pinned-library search

Read pins from `lake-manifest.json`: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. No local library checkout was supplied. Used read-only GitHub code search for syntomic, crystalline, Hyodo, deRham, isocrystal, GaussManin and FilFMIC; searched Ext separately. The index searches the default branch, so its snippets were discovery evidence only. Read relevant positive files at the pinned commits:

| Pinned file | What it actually supplies |
| --- | --- |
| `Mathlib/RingTheory/WittVector/Isocrystal.lean` | `WittVector.Isocrystal`, semilinear Frobenius over the Witt fraction field, and the one-dimensional classification `WittVector.isocrystal_classification`. No overconvergent relative coefficient, Hodge filtration or Gauss–Manin object follows from this declaration. |
| `Mathlib/Algebra/Homology/DerivedCategory/Ext/Basic.lean` | `CategoryTheory.HasExt` and the abelian derived-category framework for Ext. AM's filtered category has its own exact structure; an abelian-category assumption cannot be silently imposed. |
| `TauCeti/RingTheory/Syntomic/StandardSyntomic.lean` | `TauCeti.Algebra.IsStandardSyntomicOfRelativeDimension`, the flat complete-intersection algebra/morphism predicate with base-change results. It is not a cohomology construction. |

Other index hits were divided-power algebra foundations, bibliographic mentions of crystalline cohomology and smooth-manifold de Rham files. No matching classical syntomic, Hyodo–Kato, relative Fil-F-MIC or period-map implementation was found. This is a bounded search, not an exhaustive proof of absence at every pinned file. It provides no declaration-level duplicate owner.

## Source verification and mathematical decisions

Read the operator-held BesserI extraction directly and fetched every other text through the sources service, retaining all service provenance in `packages/CohomologyComparisonsPartII/sources.toml`. No source or extraction was copied into the repository. Every final target has readable source locators; no passage was transcribed.

| Source | Verification and resulting boundary |
| --- | --- |
| BesserI, operator-local, certified | Definition 6.1/Proposition 6.3 give the rigid syntomic assembly and exact sequence (BesserI line 712, BesserI line 727). §5 warns that de Rham-to-rigid comparison need not be an equivalence on opens (BesserI line 664). Remark 8.7(3), previously indirectly located, was read directly at BesserI line 1073. OCR damages displayed formulas; AM Lemma 3.10 confirms the relevant mapping-fibre description (AM line 1321). |
| NN, arXiv v5, certified | §3.2 equation (32) uses the undivided integral map p^r−φ (NN line 1299). Proposition 3.8 identifies the rational complex with its HK semistable target (NN line 1341, NN line 1387). Theorem A and Proposition 4.6/Corollary 4.11 give rational h-descent and period maps after truncation (NN line 85, NN line 2400, NN line 2778). They do not imply an all-weight integral isomorphism. |
| HK, Numdam, certified | §§3.2–3.6 provide Frobenius and monodromy, with Cartier type needed for Frobenius invertibility (HK line 715, HK line 740, HK line 770). Theorem 5.1 has proper log-smooth and Cartier-type hypotheses and a uniformizer-change law (HK line 1321, HK line 1335). These are not dropped when extending the producer. |
| AM, arXiv v2, certified | Definition 2.1 has the coefficient modules, filtration and horizontal Frobenius; §2.1 has the exact-category structure (AM line 131, AM line 186). Definition 2.4 and Lemma 2.5 supply extension realization/injectivity (AM line 249, AM line 283). The two sufficient coherence/comparison settings and the Gysin sequence were read with hypotheses (AM line 510, AM line 530, AM line 567, AM line 587). Equation (2.22) retains σ-dependence (AM line 808). Theorem 3.7 requires a weight range and two vanishings at every mod-p level (AM line 1185, AM line 1200); its proof specializes at Frobenius-compatible lifts, not arbitrary points (AM line 1229, AM line 1289, AM line 1352). §4.1 has further p>2, boundary and multiplicity conditions (AM line 1432). |
| CN, arXiv v4, certified | Added because Theorem 1.1 supplies the bounded integral nearby-cycle comparison (CN line 54, CN line 70, CN line 78). Kept the p=2/dimension qualification, ramification dependence and the distinction between the introduction's N(e,p,r) and §5.1.2's weaker-looking K-dependent phrasing (CN line 2600). The brief uses the stated introduction theorem, with no claim of a better bound. |
| EN, arXiv v2, certified | Added to verify divided J^{<r>} versus undivided J^{[r]} constructions, ω/τ and their product distinction (EN line 158, EN line 193, EN line 243). Theorem 2.2 is the precise divided small-weight result used (EN line 318); Theorem 2.5/gluing distinguishes syntomic-étale generic-fibre targets from nearby cycles (EN line 336, EN line 360). EN's all-weight summary is not used to erase CN v4's qualifications. |
| BesserII, uncertified | Citation search failed to find a legal text. The DOI 10.1007/BF02834844 was service-recorded as paywalled. The institutional MPG record lists no public full text at [its repository page](https://pure.mpg.de/pubman/item/item_3125326). Kept only as optional context with journal page range, with no guessed theorem contents. All final producer statements were completed from readable works. |

Two source-reading issues were made explicit rather than propagated. AM Definition 2.1's Frobenius is a semilinear module isomorphism, despite a printed “algebra” phrase (AM line 138). Lemma 2.19 is worded for a smooth scheme, but its proof embeds it in affine space (AM line 609, AM line 612); the needed acyclicity is exported here for smooth affine schemes, not asserted for all proper curves. This does not restrict the general relative coefficient category or replace its separate proper cohomology theory.

NN/EN and CN have visibly different modified Tate-lattice conventions (NN line 2324; EN line 306; CN line 67). The design must supply rescalings, not identify their integral maps by notation. EN's ω is product-compatible and τ generally is not (EN line 243). Also, an exact theorem in the small-weight range and a bounded theorem in all weights have different hypotheses and conclusions. These distinctions are part of the brief's contract.

BesserII was initially entered into the scratch missing-reference list as needed for evaluation/integration context. Once the readable producer interfaces and the consumer boundary were verified, it ceased to be indispensable. Removed that obsolete table, retained its uncertified manifest entry, and left a comment that no needed text remains missing. A future design relying on a unique BesserII result must reopen that source need. No waiver was assumed.

## Direction, generality and completion

Required supply: existing base plus crystalline/period/rigid/derived foundations → this Part II → PadicHodgeRegulators, ColemanIntegrationPartII and EllipticRegulators. The new package and all three named consumers are absent from the supplied order, so placement must be established by the worker; the order was not edited. No consumer's symbol construction, regulator theorem or integration identity is an input to this producer.

The broad targets retain arbitrary mixed-characteristic complete DVRs with perfect residue fields, every prime, semistable horizontal boundaries and the source-supported log-smooth cases. AM's Frobenius-lift and compactification hypotheses remain visible. Its special p>2 curve application and n<p−1 symbol comparison remain conditional applications; they are not roadmap-wide good-prime restrictions. The all-prime request is not enlarged into a false theorem removing those actual source hypotheses.

Wrote `packages/CohomologyComparisonsPartII/target.md`, completed its source metadata and wrote this report. No Lean, detailed stage plan, GitHub write, merge-order edit or supplier modification was performed. The final brief gives source-located interfaces and Checks, with the specified Suggested.lean constraints reserved for design. No untrusted instruction was used to change the authorized task.

The work independent of unavailable supplier texts is complete. Outstanding uncertainty concerns exact existing ownership/import sections and merge placement, not a legally missing indispensable mathematical source.
