# Review of ZigzagPreprojective (pull request #1653 at efbc447)

**Verdict:** needs changes

## R01 (P1) — Replace all thirteen admitted data constructions

**Location:** `TauCetiRoadmap/ZigzagPreprojective/Suggested.lean:113`, also lines 119, 124, 128, 132, 142, 156, 161, 223, 257, 329, 332, 338. **Claim:** these declarations provide the algebra, comparisons, grading, basis, trace, pairing, homogeneous corners and oriented quiver used by the acceptance statements.

**Witness:** all thirteen bodies are `sorry`. For example, the pairing's type imposes no equation relating it to the trace. On the six-dimensional A₂ algebra, the zero pairing fits that type but has radical dimension six.

**Repair:** delete the admitted data and use the native constructions documented below. State remaining new results as propositions with `sorry`; keep only necessary simple definitions with real bodies. The native A₂ trace has three hyperbolic pairs and radical dimension zero, including over 𝔽₂. The worker's `sorry-data=13` failure is reproduced by reading every listed body. This is one finding covering all thirteen occurrences.

## R02 (P1) — Clear the acceptance-build failure

**Location:** `TauCetiRoadmap/ZigzagPreprojective/Suggested.lean:131–133`. **Claim:** the acceptance module satisfies the required build with only admission warnings.

**Witness:** the worker records `build=1 FAIL`; direct elaboration reproduces `warn.classDefReducibility` for `zigzagGradedAlgebra`. Lean exits successfully, but the required warning-clean acceptance check fails. This is not a type-checking error.

**Repair:** remove this duplicate grading construction and consume `TauCeti.zigzagAlgebraGradedAlgebra`, which already has the appropriate reducibility attribute in `TauCeti/RepresentationTheory/Quiver/Zigzag/Componentwise/Grading.lean:225`. Re-run the targeted gate; do not suppress the warning with `set_option`. The native definition describes the actual product grading, including the singleton degree-two piece. P1 follows the brief's rule for a failing acceptance build.

## R03 (P1) — Supply the cyclic-quotient computation used by the formality proof

**Location:** `TauCetiRoadmap/ZigzagPreprojective/README.md:488–511`, especially “choose a nonzero Hochschild class”. **Claim:** the listed Hochschild comparison and generic deformation theory supply the ADE/bad-characteristic formality classification.

**Witness:** LW line 198, Corollary 3.4, p. 4, needs the positive-degree computation of Π/[Π,Π]. Neither the displayed comparison nor DGAInfinity Layer 8 computes that quotient or determines its bad-characteristic classes.

**Repair:** own a preceding target computing, or proving the required vanishing/nonvanishing criterion for, the positive-degree cyclic quotient for finite trees over every field; give its primary locator and make the formality theorem depend on it. Explicitly transport the supplier's `HH^{n,2-n}` criterion to the local `(2,q)` convention. Do not declare the missing computation supplied by DGAInfinity. A discriminating test is D₄: in degree four the cyclic classes are x₁₂,x₁₃,x₂₃ with relations x₁₂+x₁₃=x₁₂+x₂₃=x₁₃+x₂₃=0. Their relation matrix has rank 3 over ℚ or 𝔽₃, rank 2 over 𝔽₂; quotient dimensions are respectively 0,0,1. The repair must recover this characteristic dependence before claiming the final iff. A bibliographic reference to the final theorem does not assign this prerequisite a target.

## R04 (P2) — Consume the extensive strict-algebra implementation at the pin

**Location:** `TauCetiRoadmap/ZigzagPreprojective/Suggested.lean:29–342`; `README.md:162–179,316–448`. **Claim:** the private doubled graph, zigzag, trace, center, Cartan, preprojective and signless constructions are needed to state unfinished work.

**Witness:** `TauCeti/RepresentationTheory/Quiver/Zigzag/Basic.lean:62` defines `TauCeti.DoubledQuiver`; `Trace.lean:218,252` proves symmetry and nondegeneracy; `Center.lean:491` proves the stated center dimension. Many further exact owners are listed below.

**Repair:** remove duplicate targets and local carriers, cite the existing objects/results in Scope and ownership and exact supplier contracts, and retain only genuinely new comparisons. Do not re-admit native results under private names. This also applies to the public componentwise algebra, grading, finite/non-Dynkin preprojective dimensions, quadratic-dual equivalence and the affine-D₄ operation. The native formulas give A₂ dimension 6 and center dimension 3, D₄ dimension 14 and center dimension 5, and the same four affine-D₄ quartic values, so this substitution preserves the tested mathematics.

## R05 (P2) — Put the statable headline theorems in Suggested.lean

**Location:** `TauCetiRoadmap/ZigzagPreprojective/README.md:283–305,508–511`; `Suggested.lean:6–18`; `AffineGraphClassificationTargets.lean:18–24`. **Claim:** the acceptance file captures the roadmap's headline results, with unavailable carriers explaining omissions.

**Witness:** affine recognition already elaborates in the separate file but is absent from `Suggested.lean`. A scratch signature for the complete finite-tree intrinsic-formality iff also elaborates at the pins, using native zigzag grading and A∞ structures.

**Repair:** move the affine-recognition theorem into `Suggested.lean` and state the all-characteristic intrinsic-formality theorem there. A simple predicate can quantify over `TauCeti.AInfinityAlgebra k (TauCeti.zigzagAlgebra k G)`, fix its grading and binary operation, require minimality and strict unit 1, and require `IsFormal`; the right side is a valid simply-laced finite Dynkin type with the stated good-characteristic predicate. Native minimal-model quasi-isomorphisms are isomorphisms, so this expresses the promised notion. The scratch signature includes isolated A₁, all finite trees and the D/E bad primes; no admitted data or empty condition is needed. Name each genuinely unstatable headline and its missing interface individually in the docstring. A blanket claim that DG/A∞ carriers are unavailable is stale.

## R06 (P2) — Preserve the multiplicity-two and trivial McKay boundaries

**Location:** `TauCetiRoadmap/ZigzagPreprojective/README.md:128–135`. **Claim:** every binary subgroup gives an ordinary affine zigzag algebra and every odd cyclic subgroup gives the stated odd-cycle skew algebra.

**Witness:** Γ={±I} has two simples and four degree-one arrows, so its basic exterior skew algebra has dimension 8; the simple two-vertex zigzag algebra has dimension 6. Γ=1 gives exterior dimension 4, versus A₁ zigzag dimension 2.

**Repair:** state the ordinary comparison for binary groups with graphical McKay type, and the odd-cycle comparison for odd order at least 3. Explicitly leave the actual trivial and C₂ quiver presentations to the downstream McKay owner, rather than forcing them through simple graphs. `TauCetiRoadmap/McKaySkewGroup/README.md:985–1004,1041–1044` at its supplied head already makes precisely these distinctions. This is a scope contract, not a new supplier edge. Recheck C₂ with multiplicity matrix [[0,2],[2,0]], Γ=1 with [2], and C₄ with ordinary cycle dimension 16.

## R07 (P2) — Specify enhanced, finite-total-Hom spherical twists

**Location:** `TauCetiRoadmap/ZigzagPreprojective/README.md:532–538`. **Claim:** a Hom-finite triangulated category with Serre pairings suffices to construct the evaluation-cone twist functors.

**Witness:** ST line 510, Definition 2.2, p. 12, uses complexes of injectives; ST line 554, Definition 2.5, pp. 13–14, additionally requires finite total Hom. Its functor uses the actual Hom complex and chain-level cone.

**Repair:** require a specified k-linear DG/A∞ enhancement with the relevant cones and tensor action, or the source's concrete derived-category model; require finite total graded Hom from and to each spherical object, and state n>0 for the cited braid theorem. Import that infrastructure from DGAInfinity Layers 1, 2 and 5. Individual Hom spaces of dimensions 1 in infinitely many degrees are each finite but have infinite total dimension, so “Hom-finite” alone does not supply the finite evaluation object. In the corrected two-object n=2 test with adjacent total Hom dimension 1, the two twist matrices satisfy ABA=BAB; the computed matrices appear below. Cones in an unspecified triangulated category do not themselves define a functor.

## R08 (P3) — Delete computational and boundary padding

**Location:** `TauCetiRoadmap/ZigzagPreprojective/Suggested.lean:179–180,193–201,268–281`. **Claim:** these are acceptance theorems.

**Witness:** the two Cartan entry theorems already close by `simp`; the three edge counts by `decide`; the three displayed “dimension” theorems only calculate 14,30,34 from those counts and never mention an algebra.

**Repair:** delete them from `Suggested.lean`. Also delete the admitted boundary calculation `finrank_rankOneZigzag`; keep all these statements as README Checks. This is nine declarations. One-tactic probes on all seven admitted theorem statements across the two files did not close with `simp`, `rfl` or `infer_instance`; that does not rescue boundary padding or the eight already-proved elementary statements. Native strict-algebra lemmas additionally explain the duplication in R04.

## R09 (P3) — Attach exact source locators and record the sources

**Location:** `TauCetiRoadmap/ZigzagPreprojective/README.md:218–313,423–446,593–623`. **Claim:** the bibliography makes the individual targets verifiable.

**Witness:** the entire new affine-classification development has no source locator; most other targets cite only whole papers. The folder has no `sources.toml`. The only explicit numbered paper locators are Couture 4.8/4.12 and LW Example 4.7.

**Repair:** attach theorem/section and printed-page locators to each target, including each proof input, and record the ten cited works in one source manifest with the versions actually read. The legal texts and verified locators in this report provide starting points. Cite the affine-classification source explicitly; the PR description's mention of Knutson is not a README reference. All ten listed works were retrieved; no inaccessible-text request is outstanding. Do not import ET's characteristic-two presentation slip described under Source issues.

## R10 (P3) — Add per-definition Checks and per-target dependencies

**Location:** `TauCetiRoadmap/ZigzagPreprojective/README.md:205–542`. **Claim:** the layer outline specifies a usable, checkable development.

**Witness:** there are zero `*Needs:*` lines and zero `**Checks.**` blocks. For example the new reflection, stuck/precarious predicates and primitive-mark normalization have no explicit three-test set. Layer examples and dependencies are absent throughout.

**Repair:** use the requested Summary/Scope and ownership/Conventions/Exact supplier contracts/How to read the build shape; make layers level-two headings, with prose subsections, API facts, three discriminating Checks per retained definition, and Examples/Dependencies endings. Add statement- and route-specific dependencies. For the reflection, use A₂ at (1,0), triangle at (1,1,1), and D₄ at (2,1,1,1): reflected coordinates −1,1,1 and Cartan coordinates 2,0,1 distinguish nonnegativity, nullity and precariousness. Record the mark and sign witnesses from the table. Replace vague phrases such as “the cardinality required by Couture” and “the relevant Hilbert series/Koszul theorem” with explicit hypotheses and formulas.

## R11 (P3) — Align the auxiliary Lean file and declaration documentation

**Location:** `TauCetiRoadmap/ZigzagPreprojective/AffineGraphClassificationTargets.lean:1–10`; `Suggested.lean:37–70,165–180,218–253,268–299`; `README.md:625–629`. **Claim:** both files meet the prescribed acceptance-file form and README/Lean correspondence.

**Witness:** the auxiliary file has no `import Mathlib`. Numerous instances, abbreviations and theorems lack declaration docstrings; their local Lean names are absent from the README. The closing README paragraph is review-process narrative.

**Repair:** after moving recognition into the acceptance module, remove the redundant auxiliary file, or make any retained Lean file obey the same import/docstring rules. Document every retained declaration and its exact README name; use layer-number section comments in README order and a headline-oriented module docstring. Remove the process paragraph. Both original files elaborate; the issue here is the required form, not a claimed type error.

## Verified sound

This is an independent AI review of all three named files at efbc447. No tracked file was changed. The diff outside this folder is empty. This PR revises an existing roadmap; it is not a proposal to recreate a different roadmap. Its new affine recognition work remains in the existing graph owner. No route-specific characteristic restriction, algorithmic deliverable, `set_option`, copied prose passage, or forbidden import of another roadmap was found. The failures above prevent acceptance.

**Build and gate.** Built only the needed individual native imports, then ran the prescribed direct elaboration of `Suggested.lean`: exit 0, nineteen admission warnings and the one reducibility warning. The auxiliary recognition file elaborated with one admission warning. The worker's gate is FAIL with `sorry-data=13`, `build=1`; all its other counters, including outside-folder, stray-files, dependency and import scanners, are zero. The auxiliary import omission is visible on reading although that scanner did not report it. No claim of a passing gate is made.

**Elaborated signatures and padding.** A combined scratch copy printed `#check @name` for 62 declarations (60 named declarations from Suggested, the recognition theorem, and the anonymous decision instance, given a name only in the scratch copy). It elaborated successfully after correcting the scratch-only name of that anonymous instance. Explicit field, finiteness, graph, connectedness, cardinality and bipartiteness binders survived; no dropped-section-variable defect was found. Nothing in the PR was changed. Separate scratch copies tried the three single tactics on each of the six admitted Suggested theorems and the one recognition theorem; all retained their admissions. Exact native results and already-proved one-tactic declarations were inspected as listed below. The full intrinsic-formality statement was also elaborated independently with only one theorem admission and real predicates on native carriers.

**Dependency output.** The requested mechanical check returned exactly:

```text
depcheck: 205 roadmaps, 1502 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. This is evidence about recognized edges, not a substitute for the missing per-target edges in R10. The citation resolver found no unresolved roadmap citation. Its library-name scan was unavailable, so library claims were checked directly in the pinned sources.

**Ownership and supplier resolutions.** Main was fa41b37; the pins were Mathlib 6b7abb3 and Tau Ceti a91d3aa. I read the relevant main-roadmap specifications and conventions in QuiverRepresentations, GrothendieckEulerForms and DGAInfinity, and compared the supplied open heads for RootSystems/RootSystemsPartII, QuiverRepresentationsPartII, McKaySkewGroup, AffineLieAlgebras and KacMoody. Object searches used `roadmaps grep`, main, the board's package README/plan files and the supplied open checkouts. Search hits referring to automorphic Ginzburg or unrelated zigzags are not competing owners. Revisions of existing roadmaps were not used in place of main as suppliers. No fully qualified local-name collision was found in the relevant open Lean files.

| Supplier or consumer citation | Resolved location and contract |
|---|---|
| QuiverRepresentations | `TauCetiRoadmap/RepresentationTheory/QuiverRepresentations/README.md:206,229,270,311`: path algebras, left representations, finite-algebra structure and Euler/reflection theory. This roadmap owns the specific quotients, not a second general path algebra. |
| GrothendieckEulerForms | `TauCetiRoadmap/GrothendieckEulerForms/README.md:113,269,313,360,383,437`: shifts, graded K₀, linear resolutions, Cartan maps, finite-support Euler forms and Laurent coefficients. Its q⁻ᵈ target-shift convention agrees with lines 84–87 here. |
| DGAInfinity | `TauCetiRoadmap/DGAInfinity/README.md:62,93,353,394,431,466,520,550,629`: right modules/opposites, Keller signs, transfer, bar/cobar, perfect categories, Morita, Hochschild/formality, CY completions, relative Koszul theory. Layer 9 really does provide the derived tensor completion. The local `(2,q)` formality indexing still needs the adapter noted in R03. |
| RootSystems Layer 5 | `TauCetiRoadmap/RepresentationTheory/RootSystems/README.md:321–354` on main supplies finite Cartan positive definiteness/classification. It does not supply the affine recognition theorem. RootSystemsPartII's integral dominance/folding scope does not duplicate that theorem. |
| McKaySkewGroup | Supplied head, `TauCetiRoadmap/McKaySkewGroup/README.md:985–1004,1030–1048`: consumer of graphical ordinary/skew zigzag; it separately owns trivial/C₂ presentations. R06 concerns disagreement with this exact consumer contract. It is not a supplier required for affine recognition. |
| StablePeriodicCurved | Main `TauCetiRoadmap/StablePeriodicCurved/README.md:33,51`: consumer of these particular algebras, owner of general stable/curved categories. The exclusion of stable consequences from the bimodule-CY theorem preserves the direction. |
| Other open work and board packages | Searches by positive additive functions, affine recognition, zigzag/preprojective quotients, derived Koszul/Ginzburg constructions found no alternate owner for the new graph recognition. RootSystems' finite classification, KacMoody/AffineLieAlgebras' Lie theory, and QuiverRepresentationsPartII's interval/geometric representation work are distinct. Generic A∞ and CY infrastructure remains DGAInfinity's. |

**Pinned declarations actually opened.** The 25 file groups below are library-relative, at the pins above. These are objects or statements read, not names inferred from a newer library.

| Library file and line | Declaration/body and relevant limitation |
|---|---|
| `Mathlib/Combinatorics/Quiver/Symmetric.lean:33–36` | `Quiver.Symmetrify` uses the sum of forward and reverse hom types; it retains parallel arrows and loop directions. |
| `Mathlib/Combinatorics/SimpleGraph/Connectivity/Connected.lean:313` | `SimpleGraph.Connected` includes preconnectedness **and nonempty vertices**; the recognition signature excludes the empty graph. |
| `Mathlib/RingTheory/TwoSidedIdeal/Operations.lean:52,324,350` | `TwoSidedIdeal.span`, `asIdeal`, and its `IsTwoSided` instance give the intended noncommutative quotient, without a private closure predicate. |
| `TauCeti/RepresentationTheory/Quiver/PathAlgebra/Basic.lean:209,477,515,719,1033,1042,1052` | `pathAlgebra`, `ofPath`, `vertexIdempotent`, `pathAlgebraBasis`, `ofArrow`, target-idempotent multiplication, and arrow/path multiplication pin later-factor-first composition. |
| `TauCeti/Combinatorics/SimpleGraph/AdditiveFunction.lean:85,128,135,144` | `graphCartanMatrix`, its multiplication formula and null/energy identities. The energy statement assumes an additive δ; positivity is needed for the division/PSD argument. |
| `TauCeti/LinearAlgebra/RootSystem/AffineDynkinType/Basic.lean:114,154,177,226,344,368,390,500,519,640,658` | Native carrier, validity, graphicality, graphs, connectedness, matrices, graphical comparison, marks, affine node and additive/null laws. `IsGraphical` alone is not validity; both appear in the new theorem. |
| `TauCeti/LinearAlgebra/RootSystem/AffineDynkinType/Star.lean:315,346,378` | `starGraphIsoE6/E7/E8`, with edge-length triples (2,2,2), (1,3,3), (1,2,5). |
| `TauCeti/LinearAlgebra/RootSystem/AffineDynkinType/Deletion.lean:160,384,462` | Injective Bourbaki nodes, Cartan submatrix and graph deletion. |
| `TauCeti/LinearAlgebra/RootSystem/AffineDynkinType/PositiveSemidefinite.lean:214,228,253` | Native PSD, kernel span of marks and kernel finrank one, with valid type and the separate Ã₁ case. |
| `TauCeti/LinearAlgebra/RootSystem/FiniteType/SimpleGraph.lean:143` | `SimpleGraph.posDef_graphCartanMatrix_iff`: finite, connected, rational positive-definite finite-Dynkin recognition; not the affine theorem. |
| `TauCeti/RepresentationTheory/Quiver/Zigzag/Basic.lean:62,71,113` | Native doubled quiver, vertex map and quiver instance. |
| `TauCeti/RepresentationTheory/Quiver/Zigzag/Componentwise/Basic.lean:105,433,492` | Native `zigzagAlgebra`, connected nonisolated equivalence and A₁ dual-number equivalence. |
| `TauCeti/RepresentationTheory/Quiver/Zigzag/Componentwise/Grading.lean:101,226,234,250` | Public grading, graded algebra and integer extension/internal direct sum. |
| `TauCeti/RepresentationTheory/Quiver/Zigzag/Dimension.lean:152,162` | Native dimension 2V+2E, including isolated vertices; A₁ dimension 2. Nontrivial coefficient ring is explicit. |
| `TauCeti/RepresentationTheory/Quiver/Zigzag/Trace.lean:120,151,218,252` | Native trace and its product pairing, symmetry and nondegeneracy; no-isolated-vertex hypothesis is present. |
| `TauCeti/RepresentationTheory/Quiver/Zigzag/Center.lean:475,491,572` | Center basis, connected nonisolated center dimension, and componentwise center dimension. |
| `TauCeti/RepresentationTheory/Quiver/Zigzag/QHom.lean:113` | `zigzagProjectiveQHom_eq_toLaurent`: actual homogeneous projective Hom coefficients equal the Cartan polynomial. |
| `TauCeti/RepresentationTheory/Quiver/Zigzag/Skew/Classification.lean:62,86` | Gauge/relabel and H¹/automorphism-orbit classification over a nontrivial commutative ring with only trivial idempotents; strictly broader than the proposed field restriction. |
| `TauCeti/RepresentationTheory/Quiver/Zigzag/Preprojective.lean:312` | `sourceSinkSignlessPreprojectiveAlgebraEquiv`: native bipartite comparison; source/sink corner signs suffice without a nontrivial arrow rescaling. |
| `TauCeti/RepresentationTheory/Quiver/Zigzag/Quadratic/Dual.lean:214,226,411` | Quadratic-presentation comparison for connected graphs with ≥3 vertices and `quadraticDualQuadraticZigzagEquivSignless`. |
| `TauCeti/RepresentationTheory/Quiver/Preprojective/ADE/FiniteDimensional.lean:68` | Every orientation of a finite simply-laced Dynkin diagram has finite-dimensional preprojective algebra, including characteristic two. |
| `TauCeti/RepresentationTheory/Quiver/Preprojective/InfiniteDimensional.lean:285` | Connected non-Dynkin simple-graph orientations give infinite-dimensional preprojective algebra. |
| `TauCeti/Algebra/Homology/Ginzburg/Basic.lean:288,375,393` and `ZerothCohomology.lean:202` | Native 2-Ginzburg differential, DG law, square-zero theorem and `preprojectiveEquivGinzburgTwoCohomologyZero`. |
| `TauCeti/RepresentationTheory/Quiver/Zigzag/AInfinity/AffineD4.lean:134,170,223,228` | Native Liu–Wang deformation, all four quartic values, minimality and strict unit. |
| `TauCeti/Algebra/Homology/AInfinity/Algebra.lean:66`, `Algebra/Unit.lean:44`, `Algebra/Formal.lean:63`, `Algebra/Minimal.lean:172` | Native operations and real grading, strict unit, formality, and quasi-isomorphism iff isomorphism for minimal models. These suffice for the formality headline probe. |

**Headline coverage.** The README's endpoints are (1) affine graph recognition and primitive null/PSD comparison; (2) zigzag bases, dimension, center and Frobenius theory; (3) skew-parameter classification; (4) graded projective Cartan/q-Euler comparison; (5) preprojective orientation independence, dimension and Hilbert/Koszul theorems; (6) quadratic/Koszul duality and the ADE/non-ADE dichotomy; (7) 2-/3-Ginzburg CY-completion comparisons; (8) derived Koszul duality and bigraded Hochschild comparison; (9) the all-characteristic finite-tree intrinsic-formality classification; (10) braid equivalences, the type-A faithfulness case and enhanced spherical-twist comparison. Much of (2)–(5), the quadratic part of (6), and the explicit DG models/operation examples of (7)–(9) is native and should be cited. (1) and (9) are demonstrably statable and missing from the acceptance module. The remaining derived-Hom/CY/Hochschild, general Koszul-resolution and twist-action interfaces need individual statement-level analysis in the docstring; this review does not certify the blanket omission of every result in those layers merely because one interface is absent.

**Sources and sample.** The worker supplied no target identifiers or seed: its sample field says “none found by heading”. There are no README locators flagged unverified. I therefore cannot claim to have reproduced a nonexistent seeded selection. I verified all three explicit numbered locators and used the following fifteen-target supplemental sample. All ten cited works were fetched through the source service from arXiv or the IMU proceedings archive, without modifying a source manifest. Page numbers below are those printed in the retrieved versions, except CB where the proceedings page is given explicitly.

| Sample | Target and source locator checked | Result |
|---|---|---|
| S01 | Low ranks/quadratic presentation: HK §3, p. 4, HK lines 164–186; ET Lemma 2.5, p. 4, ET line 208 | A₁ degree 2 and A₂ cubic exception agree; connected ≥3 is essential. |
| S02 | Frobenius trace: HK Proposition 1, p. 4, HK lines 187–191; ET Lemma 2.6, p. 4, ET lines 212–215 | Intended relation algebra agrees over all fields by the basis calculation. ET's literal characteristic-two relation needs the correction below. |
| S03 | Vertex-fixing skew classification: Couture Theorem 4.8, p. 12, Couture lines 535–559, standing field hypothesis at line 290 | H¹ classifies vertex-fixing graded isomorphisms; square-root field assumption belongs to the cited version. |
| S04 | Arbitrary graded skew classification/tree case: Couture Theorem 4.12, p. 15, lines 689–707; Corollary 4.13, p. 16, lines 711–713 | Aut(G) quotient and trivial H¹ for trees agree. |
| S05 | Graded Cartan entries: ET Lemma 2.7, p. 4, lines 218–239; HK §6.1, p. 11, lines 509–527 | Diagonal 1+q², adjacent q, otherwise 0; handedness/shift translation checked. |
| S06 | Non-Dynkin preprojective Hilbert/Koszul theorem: EE Theorem 3.4.2, p. 7, lines 329–350; §2.1, line 34 | Any field, finite connected non-Dynkin quiver; loops and multiple arrows are allowed in the source. |
| S07 | Classical zigzag Koszul dichotomy: ET Theorem C, p. 1, line 37; Propositions 5.4/5.14, pp. 15/18, lines 885/1055; HK Proposition 11, p. 11, line 502 | The finite-ADE versus non-ADE assertion is the intended result; exclude A₁/A₂ from the quadratic statement, and avoid ET's uncorrected char-2 presentation. |
| S08 | Signed relation/orientation: CB §1, printed p. 119, CB lines 4954–4977 | Global commutator and orientation independence agree; one-arrow rescaling checked directly. |
| S09 | Ordinary CY completion: Keller Theorem 4.8, p. 20, Keller line 927 | Homological smoothness is a real hypothesis; applies to the undeformed completion. |
| S10 | 3-Ginzburg/deformed completion: Keller §6.2/Theorem 6.3, pp. 26–27, lines 1238–1268 | Finite graded-projective arrow data; deformation class is the image of the potential. Sign of the degree −2 loop can be transported by negation. |
| S11 | Derived duality and completion: EL Theorem 23, p. 37, EL lines 1274–1297; LW §4.3, p. 5, lines 237–246 | Trees, right-module/opposite conventions and retention of Adams grading matter. Ordinary versus completed duality is not interchangeable. |
| S12 | Hochschild comparison/formality criterion: LW Proposition 3.2, p. 3, lines 118–169; Theorem 4.2/Proposition 4.4, p. 5, lines 217–218/248–249 | Formula and regrading agree; the cyclic-quotient vanishing input is separately needed (R03). |
| S13 | Exact formality theorem and quartic example: LW Theorem 1.1, p. 1, lines 19–21; Example 4.7, p. 6, lines 289–296 | The bad-prime lists and four displayed operations agree with the source and native implementation. |
| S14 | Graph braid relations/type-A faithfulness: HK Proposition 7, p. 9, lines 395–409; KS Corollary 1.2, p. 5, KS line 204 | Existence does not imply faithfulness. KS uses its specified type-A algebra; a comparison is needed when applying it to these conventions. |
| S15 | Spherical twists: ST Definitions 2.2/2.5/2.9, pp. 12–15, lines 510/554/609; Proposition 2.13/Theorem 2.17, pp. 17–18, lines 714/768 | The source proves enhanced finite-total-Hom statements, not the bare categorical generality written here (R07). |

Source IDs identify these retrieved versions: HK math/0002060v2; ET 1807.11173v2; Couture 1509.08405v2; EE math/0512287v1; CB ICM 2006 volume II; EL 1502.07922v6; Keller 0908.3499v5; LW 2301.06757v3; KS math/0006056v2; ST math/0001043v2. The arXiv versions, not unverified journal renumberings, are used throughout.

**Adversarial values.** The rows below cover the mathematical declarations, layer claims, sampled targets and findings. A computed instance is a falsification check, not a proof of a general theorem. “Native” means the precise pinned result above also exists. Numerical graph enumeration and rational/modular row reduction were independent scratch calculations. For common checks, `a` is a nonnegative integer position, `C=2I−A`, `q` is an indeterminate; zigzag examples use the roadmap's actual low-rank conventions. All dimensions are over a field unless another ring is named.

| Statement / declaration | Instances tried | Computed values on the two sides, or distinguishing control | Result / change |
|---|---|---|---|
| Finite simple graph / connectedness | Empty graph, singleton, single edge | Connected is false, true, true respectively; every diagonal adjacency is false | Empty recognition case excluded; loops belong only to general quivers |
| `DoubledQuiver`, `doubledVertex`, `doubledQuiver` | A₁, A₂ | Vertex counts 1,2; arrow counts 0,2; vertex inclusion sends 0 to 0 | Correct real bodies, native duplicates: R04 |
| Doubled finite/Fintype/Hom-subsingleton instances | Empty graph, A₂ | Vertex cardinalities 0,2; Hom(0,1) cardinality 1; Hom(0,0) cardinality 0 | Adjacency supplies finite Hom here |
| Reverse / involutive reverse | A₂ arrow a:0→1 | rev(a)=b:1→0; rev(b)=a | Correct endpoints; R04 |
| Symmetrify finite/Fintype instances | One loop; two parallel arrows | Vertex counts unchanged (1;2); doubled arrow counts 2;4 | Multiplicities retained |
| Later-factor-first multiplication | a:0→1, b:1→0 | e₁a=a=ae₀; e₀a=0; ab lies at 1, ba at 0 | Agrees with native path convention |
| Affine types and graphical restriction | Ã₁, Ã₂, D̃₄ | Ã₁ matrix [[2,−2],[−2,2]]; Ã₂ is a 3-cycle; D̃₄ has 5 vertices/4 edges | Ã₁ excluded from simple-graph recognition |
| Coefficient reflection formula | A₂ a=(1,0), i=0 or 1 | s₀a=(−1,0), a₀−(Ca)₀=1−2=−1; s₁a=(1,1), 0−(−1)=1 | Integer codomain essential; Checks needed: R10 |
| Reflection involution | Same A₂ position | s₀²(1,0)=(1,0); s₁²(1,0)=(1,0) | Both signs return correctly |
| Stuck iff Ca≥0 | A₂ (1,0); D₄ (2,1,1,1) | Ca=(2,−1), not stuck; Ca=(1,0,0,0), stuck | Both directions tested |
| Precarious / strict decrease / null equivalence | D₄ above; triangle (1,1,1) | D₄ centre 2→1 and Ca₀=1; triangle every 1→1 and Ca=0 | Stuck differs from null |
| Relabelling invariance | Swap A₂ vertices | Ca=(2,−1) transports to (−1,2) for a=(0,1) | Inequalities transported by permutation |
| Zero propagation | A₂ (0,1); triangle (0,1,1) | Ca=(−1,2); (−2,1,1) | Zero next to a positive entry violates Ca≥0 |
| Positivity needs connectedness | Triangle⊔singleton | a=(1,1,1,0), Ca=0, a≠0 but a₃=0 | Correctly excluded |
| Primitive gcd normalization / integral multiples | ÃE₈ δ=(6,3,4,2,5,4,3,2,1) | gcd(δ)=1; gcd(2δ)=2; (2δ)/2=δ; zero=0δ | Includes m=0 |
| Affine-node normalization | Same marks, centre 0, affine leaf 8 | δ₀=6, δ₈=1; (2δ)₈=2 | Arbitrary vertex need not have mark 1 |
| Energy identity / double counting | Triangle, ÃD₄, ÃE₈; x=e₀ and null marks | 2xᵀCx=4; oriented weighted-square sum=4 each | Factor 2 and positive denominators verified |
| Energy negative controls | A₁ marks (1); A₂ (1,1); D₄ (2,1,1,1), x=e₀ | LHS=4 each; RHS=0,2,3; Cδ≠0 in all three | Not counterexamples: null-mark hypothesis fails |
| PSD / kernel / corank | Triangle; ÃD₄; ÃE₈ | Ranks 2/3,4/5,8/9; Cδ=0; energy sum≥0 | Kernel dimension 1 each |
| Rational-to-integral kernel converse | ÃE₈ generator δ/6 | Coordinates (1,1/2,2/3,1/3,5/6,2/3,1/2,1/3,1/6); multiplying by 6 yields δ | Nonzero denominators; correct scaling |
| Proper extension: added vertex | Triangle plus leaf at 0, a=(1,1,1,1) | Ca=(−1,0,0,1); mark-weighted sum on triangle=−1 | Boundary sign correct |
| Proper extension: added edge | Square plus diagonal 0–2, a=(1,1,1,1) | Ca=(−1,0,−1,0); extra-edge contribution=−2 | Non-induced copies covered |
| Proper-extension hypotheses | Triangle⊔singleton; K₄ at a=(−1,−1,−1,−1) | First has nonzero nonnegative null vector (1,1,1,0); second has Ca=(1,1,1,1) | Connectedness and nonnegativity necessary |
| Affine recognition iff / unique type | All 772 connected labelled graphs with 1–5 vertices | 21 positive-null cases: 1 triangle,3 four-cycles,12 five-cycles,5 four-leaf stars; 21 affine matches | Both sides agree; move headline: R05 |
| Cycle / degree-four / double-fork route | C₃; K₁,₄; adjacent double fork | Degree lists (2,2,2),(4,1,1,1,1),(3,3,1,1,1,1); marks all 1,(2,1,1,1,1),(2,2,1,1,1,1) give Cδ=0 | Distinguishes Ã₂,D̃₄,D̃₅ |
| Paths / low-rank exclusion | A₁; A₂ at all-1 candidate | Cδ=(2);(1,1); det C=2;3 | No positive null vector |
| Arm equations | (2,2,2),(1,3,3),(1,2,5) | Sums 1/3+1/3+1/3=1;1/2+1/4+1/4=1;1/2+1/3+1/6=1 | Native T-indices are edge lengths plus 1 |
| Complete arm solution list | Positive a≤b≤c | a≥3 gives sum≤3/4; a=2 forces b=c=2; a=1 forces b=2 or 3 and c=5 or 3 | Elementary complete bound, not bounded enumeration only |
| Finite positive-definite contrast | D₄ a=(2,1,1,1) | aᵀCa=2>0; Ca₀=1; s₀a₀=1<2; det C=4 | Nonzero stuck vector has precarious vertex |
| Nonreturn relator | A₃ 0→1→2; A₂ 0→1→0 | First class 0; second x₀≠0 | Endpoint distinction correct |
| Equal-backtrack relator | A₃ at middle vertex | (1→0→1)−(1→2→1)=0; both summands=x₁≠0 | Does not kill volume |
| Long-path relator / quadratic redundancy (S01) | A₃ and A₂ alternating length-three paths | A₃ rewrites via other neighbour to nonreturn=0; A₂ quadratic-only quotient retains one alternating path per length | ≥3 and cubic exception essential |
| Ideal / universal property / homogeneous relations | A₂ cubic path; A₃ backtrack difference | Generator degrees 3;2; both quotient images 0; identity remains 1 | Native quotient: R04 |
| Bare quotient versus rank-one convention | Singleton; A₂ | Singleton quotient dimension 1 versus dual numbers 2; A₂ quotient dimension 6 | Correct intentional distinction |
| Public componentwise algebra | Empty graph; two isolated vertices; A₂ | Public dimensions 0;4;6; bare quotient dimensions 0;2;6 | Native product fixes admitted data: R01/R04 |
| Public A₁/A₂/nonisolated comparisons | A₁; A₂ | Expected dimensions 2=2;6=6; native maps preserve 1 and graph idempotents | Replace admitted comparisons |
| Grading / multiplication / internal direct sum | A₂ | Piece dimensions (2,2,2,0,…); deg(a)+deg(b)=2=deg(ab); degree-3 products 0 | Zero grading fails direct sum; R01/R02 |
| Basis index / homogeneous basis | A₂; D₄; empty graph | Index counts 2+2+2=6;4+6+4=14;0 | Native basis agrees |
| Dimension formula | A₂,D₄,E₈,ÃE₈ | Dimensions 6,14,30,34 equal 2V+2E | Native theorem; duplicate R04 |
| Isolated component formula | A₁⊔A₂ | Public dimension 2+6=8=2·3+2·1; bare quotient dimension 7 | Public convention needs no numerical correction |
| Radical / top / socle | A₂ | dim J=4,J²=2,J³=0; top dim 2; socle dim 2 | Volumes span socle |
| Trace definition (S02) | Basis e₀,e₁,a,b,x₀,x₁ | Values (0,0,0,0,1,1); zero trace gives six zeros | Native definition fixes admitted data |
| Pairing symmetry | A₂ | tr(ab)=tr(x₁)=1=tr(ba); tr(eᵢxᵢ)=1=tr(xᵢeᵢ) | Correct also in char 2 |
| Nondegeneracy / Frobenius / self-injectivity | A₂ over ℚ,𝔽₂ | Gram has 3 swap blocks, det −1 / 1; radical dim 0, versus zero pairing radical dim 6 | No characteristic exclusion needed |
| Center formula | A₂,D₄,E₈,ÃE₈ | Basis counts 1+V=3,5,9,10; A₂ requires equal idempotent coefficients and zero arrow coefficients | Native center theorem |
| Rank-one / disconnected center | A₁; A₁⊔A₂ | Center dims 2;5 equal V+number of components 1+1;3+2 | Includes isolated volumes |
| Skew cocycle/gauge classification (S03/S04) | Tree; triangle parameter λ | Tree H¹=1; triangle H¹=kˣ with holonomy λ; gauge ratios multiply to 1 | λ=1 and −1 differ outside char 2; native R04 |
| Arbitrary versus vertex-fixing isomorphisms | Triangle λ=2 over ℂ | Vertex-fixing class 2; reversal sends 2 to 1/2; same Aut-orbit | Aut quotient necessary and present |
| Exterior-skew cycle convention | C₄,C₃ over ℚ; C₃ over 𝔽₂ | (−1)⁴=1; (−1)³=−1; in 𝔽₂ −1=1 | Even/odd/char-2 distinction correct |
| Parameter scalar extension | ℚ→ℂ, λ=2 | 2 maps to 2≠1; sign −1 stays −1; no field map ℚ→𝔽₂ | Units preserved; characteristic change is not this base change |
| Skew basis/center/trace | Triangle holonomy −1, char≠2 | Graded dimensions 3,6,3; center dim 4; opposing arrow products may have traces 1 and −1 | Frobenius need not be symmetric; ordinary symmetry cannot be imported |
| Left projective/head/socle | A₂ | Pᵢ piece dims (1,1,1); head/socle dims 1; End(Pᵢ) degrees 0,2 | Left convention matches supplier |
| Homogeneous projective Hom definition | A₂ diagonal/adjacent | Corner dims (1,0,1)/(0,1,0); all d≥3 zero | Arbitrary admitted submodule could be 0: R01 |
| Cartan definition / entry theorems (S05) | A₂; nonadjacent D₄ leaves | Diagonal 1+q²; adjacent q; distinct leaves 0 | Correct; entry statements are simp padding: R08 |
| q-Hom theorem | A₂ diagonal/adjacent | Dimension sum weighted by qᵈ is 1+q² / q, equal to matrix entries | Native theorem; R04 |
| Shift / K₀ / ordinary Cartan | A₁ and A₂, q=1 | Shift {1} gives q; Hom into shift −2 contributes q²; C_A₂(1)=[[2,1],[1,2]] | Target-shift q⁻ᵈ agrees with supplier |
| Ext-Euler finite-support restriction | Simple over A₁ dual numbers | dim Extⁿ(k,k)=1 every n≥0; 1−1+1−… has no finite sum | Unconditional Ext-Euler correctly excluded |
| Completed inverse-Hilbert substitution (S06) | Triangle | Zigzag row sum 1+2q+q²; reciprocal after q↦−q is 1/(1−q)² with coefficients 1,2,3,4,… | Power series, not Laurent polynomial |
| Dynkin graph / decision instance / aliases | A₂,D₄,E₈ | Vertex/edge pairs (2,1),(4,3),(8,7); diagonal Cartan 2≠−1 | Correct bodies; documentation R11 |
| Affine E₈ arm relation / decision / graph | Centre 0, neighbours 1,2,4 | 8 edges; degree at 0 is 3; arms 1,2,5; fromRel adds reverse edges, no loops | Correct explicit model |
| Four named graded Cartan matrices | A₂,D₄,E₈,ÃE₈ | Sizes 2,4,8,9; diagonal 1+q²; 2,6,14,16 off-diagonal q entries | Matches graph data |
| D₄ edge-count theorem | D₄ | 3 unoriented edges=stated 3 | Correct, padding: R08 |
| E₈ edge-count theorem | E₈ | 7 unoriented edges=stated 7 | Correct, padding: R08 |
| ÃE₈ edge-count theorem | ÃE₈ | 8 unoriented edges=stated 8 | Correct, padding: R08 |
| Numerical D₄ dimension theorem | D₄ | 2·4+2·3=14=stated RHS | Correct arithmetic; signature omits algebra: R08 |
| Numerical E₈ dimension theorem | E₈ | 2·8+2·7=30=stated RHS | Correct arithmetic; signature omits algebra: R08 |
| Numerical ÃE₈ dimension theorem | ÃE₈ | 2·9+2·8=34=stated RHS | Correct arithmetic; signature omits algebra: R08 |
| Determinant versus specialization | ÃE₈, y=q² | det coefficients [1,1,0,−1,−1,−1,−1,0,1,1]; constant 1; value at q=−1 is 0 | Nonzero polynomial; singular specialization |
| Affine deletion / finite comparison | Delete leaf 8 of ÃE₈ | Arms 1,2,5 become 1,2,4; V/E 9/8→8/7; zigzag dims 34→30 | Finite E₈ shape, with native label transport |
| Preprojective relator / local corners (S08) | One arrow a:0→1, reverse b | ρ=ab−ba; e₁ρe₁=ab; e₀ρe₀=−ba | Correct in char 2 as well |
| Preprojective ideal / quotient / opposite / base change | One-arrow double over ℚ,𝔽₂ | ab=ba=0; basis e₀,e₁,a,b has dim 4 both; opposite swaps corners | Native construction |
| Orientation reversal | a′↦b, b′↦−a | a′b′−b′a′ maps to −ba+ab=ρ; in char 2 both minus signs collapse | Genuine algebra equivalence |
| Antisymmetric sign/gauge | Unit weight u on one edge | u·ab,−u·ba generate same corner ideals as ab,ba; u=0 would give zero ideal | Sign takes units; zero is not allowed |
| ADE finite dimension / self-injectivity | A₁; A₂ | Π(A₁)=k,dim 1; Π(A₂) dim 4, projectives length 2 with exchanged socles | Distinct from zigzag dims 2,6 |
| Non-Dynkin Hilbert/Koszul theorem (S06) | Triangle; one original loop | Triangle row dims 1,2,3,4,…; loop double gives k[x,y], degree-n dim n+1 | Infinite; source also covers loops |
| Non-Dynkin hypothesis control | A₂ recurrence H₂=A²−I,H₃=A³−2A | H₂=0; H₃=−A has adjacent coefficient −1 | Cannot be its Hilbert series |
| Algebraic moment-map commutator | One-loop scalar x,y; x=E₁₂,y=E₂₁ | Scalar commutator 0; matrix commutator diag(1,−1) | Correct noncommutative sign |
| Signless relation / ideal / dual | Three backtracks at a trivalent vertex | Difference space dimension 2; orthogonal complement span(1,1,1) | Dual kills sum, not differences |
| Quadratic-dual claim (S07) | A₃; A₂ | A₃ middle relation cycle₁+cycle₂=0; A₂ zigzag has no quadratic relation and needs cubic ones | ≥3 essential |
| Bipartite orientation / quiver / equivalence | Source–sink A₃ | Signed corner sum equals signless sum at sinks and its negative at sources | Native equivalence; replace admitted data R01/R04 |
| Non-bipartite gauge obstruction | Triangle over ℚ,𝔽₂ | Vertex scalings require λ₀=−λ₀; impossible for a unit over ℚ, automatic in 𝔽₂ | Keep signless dual in general |
| Classical Koszul dichotomy / low ranks (S07) | Triangle; A₁; A₂ | Triangle dual row dims n+1; A₁ generator degree 2; A₂ new relation degree 3 | Low ranks are not degree-one quadratic Koszul cases |
| 2-Ginzburg carrier / bidegrees | A₂ | Arrows (0,1),loops (−1,2),loop differential (0,2); difference (1,0) | Native DG object exists |
| 2-Ginzburg d² / Leibniz | dt₁=ab,dt₀=−ba | d²t₁=d(ab)=0; d(tᵢtⱼ)=dtᵢ·tⱼ−tᵢ·dtⱼ | Required degree−1 sign |
| H⁰ comparison | A₁; A₂ | A₁ H⁰=k=Π(A₁); A₂ H⁰ kills ab,ba and has dim 4 | Native comparison |
| Derived completion / bimodule 2-CY (S09) | A₁ | Π₂=k⟨t⟩,degree t=−1; H⁻¹ contains t≠0, while ordinary Π=k has H⁻¹=0 | DG object cannot be replaced by ordinary Π |
| Ordinary versus completion (S11) | A₁ | Polynomial t-support finite; ∑ₙ≥0tⁿ has infinite support and exists only in completed construction after forgetting relevant grading | Direction and completion distinction correct |
| 3-Ginzburg / potential derivative (S10) | One loop x,W=x³ | Degrees x=0,y=−1,t=−2; dy=3x²,dt=xy−yx; d²t=3x³−3x³=0 | In char 3 derivative is 0; no division by 3 |
| 2- versus 3-Ginzburg distinction | A₁,W=0 | Added generator degrees −1 versus −2, hence different negative cohomology degrees | Distinct public constructions |
| Zigzag regrading / strict operations | A₂ | Arrow (1,−1),volume (2,−2); m₂ degree (0,0); m₁=0 | Matches supplier unsuspended multiplication |
| Derived Koszul duality / low rank (S11) | A₁ | Tensor t has degrees (−1,2); bar dual generator degrees (2,−2); zigzag basis 1,x with x²=0 | Exceptional degree-two generator recovered |
| Small resolution / HH comparison (S12) | A₁ | Π=k cyclic quotient only degree 0: RHS dim 1 at q=−2,0 at q>0; loop cochain gives same HH bidegrees | No positive obstruction class in this case |
| Obstruction criterion / indexing (S12) | n=4 operation on four arrows | Output degree 4+(2−4)=2; Adams −4+2=−2; local q=2>0 | Supplier-index adapter needed: R03 |
| D₄ cyclic quotient / bad-prime input | Degree 4 over ℚ,𝔽₂,𝔽₃ | 3 generators; relation ranks 3,2,3; quotient dims 0,1,0 | Missing owned computation: R03 |
| Non-ADE class / deformation input | ÃD₄ degree 4 over same fields | 6 generators; ranks 4,3,4; quotient dims 2,3,2 | Nonzero in all three; operation alone does not prove gauge nontriviality |
| Four affine-D₄ m₄ values (S13) | Four displayed arrow quadruples, scalar 1 | Outputs β₄α₄,α₁β₁,β₁α₁,α₄β₄, all nonzero volumes; other quadruples 0 | Matches source/native model: R04 |
| Stasheff / strict-unit control | Affine-D₄ arrow inputs | m₂∘m₄ gives volume·arrow=0; m₄∘m₂ has non-arrow input=0; m₄∘m₄ output degree 3=0 | n=5,7 arrow checks; native theorem supplies full unit identities |
| Intrinsic-formality classification (S13) | A₁; D₄ chars 0,2,3; E₈ chars 2,3,5,7 | Good-char predicate: A₁ true; D₄ true,false,true; E₈ false,false,false,true; D₄ quotient dims 0,1,0 agree | Source supports iff; headline statable: R05; not a full E₈ HH computation |
| Braid evaluation complex | A₁ A=k[x]/x² | Multiplication A⊗A→A dimensions 4→2,rank 2; kernel basis x⊗1−1⊗x,x⊗x | Degrees −1,0; no internal shift |
| Inverse coevaluation / shift | Same A₁ | 1↦x⊗1+1⊗x has degree 2; target shift {−2} makes degree 0 | Valid in char 2 too |
| K₀ action / inverse | Self and adjacent projectives | Bᵢ(Pᵢ)=−q²Pᵢ; Bᵢ(Pⱼ)=Pⱼ−qPᵢ; inverse self coefficient −q⁻², product 1 | At q=1 gives reflection |
| Commuting relation | Two isolated vertices | Matrices diag(−q²,1),diag(1,−q²); both products diag(−q²,−q²) | Numerical control; categorical result source-backed |
| Braid / spherical comparison (S14/S15) | Two 2-spherical objects, adjacent Euler value −1 | A=[[-1,1],[0,1]],B=[[1,0],[1,−1]]; ABA=BAB=[[0,−1],[−1,0]] | Enhancement/total-Hom assumptions needed: R07 |
| Faithfulness versus K₀ (S14) | A₁ braid generator | At q=1 action −1, square acts 1; braid group ℤ | K₀ specialization cannot establish faithfulness |
| Sphericality versus graded projective End | A₂ projective | Internal End dims 1 in degrees 0,2; cohomological Extⁿ(P,P)=0 for n>0 | Not automatically 2-spherical; README caveat correct |
| Finite-total-Hom / evaluation (S15) | Dimension 1 in every nonnegative degree | Each Hom dimension 1<∞; total sum infinite | Exact total condition and enhancement: R07 |
| Transfer through supplied equivalence | Identity; swap A₂ vertices | F Bᵢ F⁻¹=Bᵢ for identity; relabelling sends B₀→B₁ | Uses equivalence, does not construct McKay comparison |
| Nonabelian McKay control | Q₈⊂SU(2), irreducible dimensions d=(2,1,1,1,1) | ÃD₄ basic dimension 2·5+2·4=18; dᵀ(2I+A)d=32=4·8, the full skew-group dimension | Morita equivalence permits 18 versus 32; the basic graphical comparison is consistent |
| Zero-object / invalid-index controls | Zero module; invalid affine type; out-of-range index | End(0) dimension 0 versus spherical self-Hom dimension 2; invalid type fails Valid; Fin n has no index n | Excluded hypotheses, no junk-value extension claimed |
| McKay boundary contract | Γ=1,C₂,C₄ over ℂ | Basic exterior dims 4,8,16; simple zigzag dims 2,6,16 | First two fail: R06 |
| Field / finite / universe binders | ℚ,𝔽₂,𝔽₃; zero ring; infinite vertices | Fields have 1≠0; zero ring has 1=0 and fails Field; finite sums have explicit Fintype binders | No dropped-binder defect found |

The 111 computed rows include sign, orientation, low-rank, component, characteristic-two and completion controls that also test the named examples against surrounding formulas. A native row is evidence about the existing result, not approval of restating it. These calculations do not prove a general derived equivalence, CY structure or categorical braid equivalence; those assertions were checked against the listed sources and suppliers.

## Not verifiable

- The worker-seeded fifteen-target selection cannot be reconstructed: no target identifiers or seed were supplied, and the worker reported none found by heading. The fifteen supplemental source checks are disclosed rather than presented as that seeded selection.
- The new Layer 0 graph-classification development has no cited text or locator. Its elementary route and finite examples were checked directly, but an unspecified source locator cannot be certified (R09).
- Journal numbering was not inferred from preprint numbering. This report certifies the identified arXiv versions and the IMU proceedings text. All ten bibliography works were obtained legally; no inaccessible-text request remains.
- The PR's admitted data have no implementation to inspect. Their types do not determine the promised constructions (R01); dependent theorem elaboration is not a truth certificate.
- Ownership searches covered readable supplied heads and main/board files, not unpublished or inaccessible work. The supplier contracts and pinned declarations actually used are enumerated above.

## Source issues

- **Error** in ET at Definition 2.2(c), printed p. 3 (ET lines 163–181): the source says backtracks equal the difference of the two loop generators in every characteristic; it should be the volume generator, using either loop generator in characteristic two; affects a stated result. The loop-sum relation makes the difference zero in characteristic two, whereas Remark 2.3's volume remains nonzero; the claimed quadratic presentation and nondegenerate trace do not follow from the literal relations.
- **Misprint** in LW at Remark 4.6, printed p. 6 (LW lines 278–288): the source says the graded algebra Π₂(Γ) has the asserted nontrivial higher deformations; it should be the graded zigzag algebra Z(Γ), as used throughout the following Hochschild calculation; affects nothing.
