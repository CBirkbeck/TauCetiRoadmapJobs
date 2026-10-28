# Review of ComplexComparison (pull request #196 at 4bd7237)
Folder: `TauCetiRoadmap/CohomologicalPointCounting/ComplexComparison/`

**Verdict:** needs changes

This is an AI review. There are 12 findings: 3 P1, 2 P2, and 7 P3. The comparison summits are supported by the sources checked below, but the construction has overlapping owners and missing interfaces, and the gate fails. These defects are repairable while retaining the Artin-comparison scope.

In findings below, `README.md` and `Suggested.lean` mean the files in the folder above. No pull-request file was changed.

## R01 (P1) — The elementary-fibration theorem fails in dimension zero

**Location:** `README.md:391`, “for every point of a smooth complex variety”.

**Claim:** Every such point has a neighbourhood fibred in open smooth curves over a smooth variety of dimension one less.

**Witness:** Take X = Spec ℂ. Its only nonempty open has dimension 0. An elementary fibration over a nonempty base has fibres of dimension 1, so cannot have this total space.

**Repair:** State the one-step projection theorem for positive-dimensional smooth components. Treat zero-dimensional smooth schemes by the length-zero tower, and formulate the general good-neighbourhood theorem using towers of elementary fibrations. Specify the closed/rational-point version used by the proof and explain the open-cover extension. On Spec ℂ the repaired tower has length 0; on A¹ use A¹ ⊂ P¹ over Spec ℂ with boundary {∞}. See sga4-3 lines 1774–1803, XI Definitions 3.1–3.2 and Proposition 3.3. Milne's Proposition 21.8 repeats the missing dimension restriction; see Source issues.

## R02 (P1) — Import the existing foundational owners instead of rebuilding them

**Location:** `README.md:229–240`, “Any foundational real algebraic geometry missing from Mathlib and used here is part of this layer”; also `README.md:260–315`.

**Claim:** This folder owns semialgebraic foundations, local-coefficient chains/cochains, compact-support cochains, and topological support operations.

**Witness:** `Completed/RealAlgebraicGeometry/README.md:322,439`; `TauCetiRoadmap/AlgebraicTopology/README.md:382,1011`; `TauCetiRoadmap/CharacteristicClasses/README.md:333`; `TauCetiRoadmap/TopologicalSheafCohomology/README.md:74`; `TauCetiRoadmap/AffineMorseLefschetz/README.md:355` already assign these same objects to their respective roadmaps.

**Repair:** Delete the repeated construction targets and add exact supplier contracts: RealAlgebraicGeometry Layers 3 and 6; AlgebraicTopology Stage 2 item 6, Stage 3, and §§6.1–6.2; CharacteristicClasses C1.2a S0–S5; TopologicalSheafCohomology TS0 and TS3; and AffineMorseLefschetz A4.1 for finite compact semialgebraic triangulation. Keep precisely identified new analytification and global comparison extensions. RealAlgebraicGeometry excludes triangulation at lines 80–81, but that exclusion does not leave it unowned: AffineMorseLefschetz A4.1 owns the compatible finite compact construction and RealAnalyticGeometry R2 owns its analytic-simplex strengthening. CharacteristicClasses C1.2b also owns the constant-coefficient Čech/singular overlap; identify the additional local/constructible coefficient comparison here.

The import preserves the examples: the semialgebraic singleton {0} has one point in either model; the supplied interval triangulation has two vertices and one edge; the native local-coefficient circle complex with transport 2 over 𝔽₅ has differential 1; the supplied compact-support object gives H²_c(ℂ,𝔽₃)=𝔽₃. No alternate carrier or convention is needed. Main and supplied-open-head provenance is recorded below; progress revisions of main roadmaps were not used as suppliers.

## R03 (P1) — Relative lower shriek uses a topological construction outside its domain

**Location:** `README.md:444–449`, “For separated finite-type” morphisms; compare the locally compact **Hausdorff** domain fixed at `README.md:307`.

**Claim:** The relative compact-support comparison is available over every finite-type complex base.

**Witness:** Let D be the affine line with doubled origin and f = id_D. The morphism is separated, proper and finite type, but Dᵃⁿ is not Hausdorff. Layer 7's Rf! cannot take this input.

**Repair:** Extend the owned topological construction to the needed locally Hausdorff spaces and separated locally proper maps, by gluing over Hausdorff open subsets of the base. State the restriction/descent and composition laws before Layer 12. Do not discard nonseparated schemes from the general analytification scope. For id_D the glued functor must be the identity: the constant 𝔽₃ sheaf has stalk 𝔽₃ at both origins on both sides. The affine-chart restrictions are identity functors and agree on ℂ×. SGA 4's support comparison explicitly works locally on the base (sga4-3 lines 8863–8905).

## R04 (P2) — The constructible singular-cohomology endpoint has no specified carrier

**Location:** `README.md:307–312`, “for every finite constructible” sheaf; `README.md:274` constructs singular coefficients only from a fundamental-groupoid local system.

**Claim:** The displayed singular complex accepts arbitrary constructible sheaves, including those not locally constant.

**Witness:** On ℂ let L be the skyscraper 𝔽₃ at 0. Its stalks at 0 and 1 have cardinalities 3 and 1. A fundamental-groupoid functor must transport them isomorphically along a path, which is impossible.

**Repair:** Keep the general constructible comparison on derived **sheaf** cohomology. State the ordinary singular corollary for local systems, as in Layers 10–11. If a constructible cochain model is also wanted, define its actual coefficient carrier and cochain construction, with its comparison theorem and dependencies, before using it; it cannot be Layer 6's groupoid construction. For the skyscraper, the retained sheaf result gives H⁰_c = 𝔽₃ and all other groups zero; the ordinary local-system singular theorem correctly does not apply. This retains full constructible Artin comparison.

## R05 (P2) — Relative ordinary comparison is unnecessarily restricted to proper maps

**Location:** `README.md:434`, “For a proper finite-type morphism”.

**Claim:** The relative ordinary theorem is offered only for proper f, despite constructible coefficients throughout.

**Witness:** SGA 4 XVI Theorem 4.1(ii), sga4-3 lines 5518–5533, permits finite-type f with constructible torsion F without properness. For j:ℂ×→ℂ, both degree-one direct-image stalks at 0 are 𝔽₃.

**Repair:** State relative ordinary comparison for finite-type morphisms and bounded constructible finite coefficients, retaining the proper case as a specialization (and its broader torsion-coefficient form where appropriate). Own the needed nonproper direct-image comparison inputs or cite their exact earlier owner. For the punctured-line inclusion, both sides at 0 have H⁰ = H¹ = 𝔽₃ and higher groups zero; at a nonzero point only H⁰ = 𝔽₃ survives. This is a genuine nonproper test of the repaired theorem, not an arbitrary-base-change assertion.

## R06 (P3) — Replace source families with claim-level locators

**Location:** `README.md:55–57`, “comparison theorem chapters”, and `README.md:454`, “Summit:”.

**Claim:** The reference list and source-to-layer table locate the targets precisely enough to verify them.

**Witness:** No theorem number or page accompanies the Summit. “Milne, §21” matches the lecture notes, whereas the bibliography names the book. Hironaka is named without a title, year, theorem or page.

**Repair:** Give each theorem its exact source and locator; distinguish Milne's 2013 lecture notes from his 1980 book. For the sampled summit use SGA 4 XVI 4.1 and XVII 5.3.3–5.3.5, with the version/page correspondence below. Identify the triangulation work and its hypotheses. Record cited works in the required source manifest when repairing the package; this review did not create or edit one. The new locators were tested on the point, punctured line, and A¹ compact-support examples below.

## R07 (P3) — Supply the per-definition Checks, conventions, and dependency structure

**Location:** `README.md:274`, “Pin the convention for transporting coefficients”; `README.md:456–465`, the eight family-wide examples.

**Claim:** The build specifies definitions and their verification contracts.

**Witness:** There are no `*Needs:*` lines, no per-layer Examples/Dependencies subsections, and no per-definition three-Check lists. The transport direction and Tate-twist normalization are requests to choose conventions, not chosen conventions.

**Repair:** Use the requested Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, and numbered-layer structure. Keep the existing API content, add hypotheses and dependencies per target, and give each definition at least three discriminating Checks. Pin first-vertex transport using AlgebraicTopology's convention: a loop with transport 2 over 𝔽₅ sends coefficient 1 to boundary 2−1=1; inverse transport gives 3−1=2. Include a two-simplex boundary-square check and conjugation acting by −1 on H²(P¹,𝔽₃). Specify n≥1 in the power-cover example: n=0 has an infinite fibre at 1 and is not a finite étale cover. Include the empty zero-sheet cover rather than imposing surjectivity. Make proof sketches routes with named inputs, not mandatory proof choices.

## R08 (P3) — Remove LaTeX delimiters

**Location:** `README.md:3` and throughout, beginning with the complex base-field notation.

**Claim:** The file satisfies the mathematical-text format.

**Witness:** The worker's `latex` gate reports 101 occurrences; the display at lines 7–19 is one directly visible instance.

**Repair:** Replace all inline/display LaTeX delimiters with Unicode prose or permitted code spans/blocks. For example, the base field remains ℂ and the comparison direction remains étale → classical after conversion. Re-run the gate until `latex=0`.

## R09 (P3) — Remove TeX-only syntax outside code

**Location:** `README.md:100`, the displayed bounded ctf category; throughout the formulas.

**Claim:** The displayed notation follows house style.

**Witness:** The worker's distinct `tex` rule reports 45 occurrences, including subscript/superscript braces and TeX commands outside code spans.

**Repair:** Convert those expressions to Unicode or ASCII code notation, independently of removing delimiters. Preserve boundedness and finite Tor dimension: use, for example, `D^b_ctf(X, Lambda)`. Re-run until `tex=0`; the point over ℤ/4 with coefficient ℤ/2 must still be excluded from ctf.

## R10 (P3) — Remove pull-request narrative from the roadmap

**Location:** `README.md:473`, “Mathlib pull request #34626 determines the naming and affine design followed here”; also line 79.

**Claim:** Design coordination is expressed as timeless mathematical ownership.

**Witness:** The worker's `prnum` gate reports line 473. Line 79 also names the numbered pull request in its link label.

**Repair:** Retain a descriptively titled link to the affine-analytification design and state the concrete interface adopted. Remove numbered pull-request labels and process narration from the prose. This preserves the same affine complex-point/topology contract and the instruction to build missing material in Tau Ceti; verify `prnum=0`.

## R11 (P3) — Add the metadata required by the gate

**Location:** `TauCetiRoadmap/CohomologicalPointCounting/ComplexComparison/metadata.toml` (absent).

**Claim:** The folder is ready for the package gate.

**Witness:** The worker reports `metadata=1`, specifically the missing file; all source files remain read-only in this review.

**Repair:** Add valid roadmap metadata using the repository schema and this folder's actual identity/dependencies, then verify `metadata=0`. This is a mechanical package repair; no mathematical assertion changes.

## R12 (P3) — Explain the empty acceptance file by headline and missing carrier

**Location:** `Suggested.lean:11–20`, “Prototype the functors and natural comparison morphisms here once their source and target categories exist”; “No compiled targets yet”.

**Claim:** The docstring explains the acceptance-test status of the roadmap's headlines.

**Witness:** The file has zero declarations. It does not separately account for compact-support and relative comparison, and line 20 is a temporal progress comment.

**Repair:** Keep the file empty where carriers are absent, but explicitly list Riemann existence, ordinary Artin comparison, compact-support comparison, relative ordinary/shriek comparison, and the sheaf/singular comparison with each missing carrier. Say that this file states headline theorems against the pins and README.md is the roadmap; remove the progress comment. Do not insert abstract stand-ins or example computations. With zero declarations, the repaired file still has no dropped binders and no padding to prove.

## Verified sound

The checked head is `4bd72379658126cbe9be935656396f0c9dac4de0`. The mathematical core remains a general finite-coefficient comparison development: no good-prime shortcut, computational algorithm, copied source passage, sorry-defined data, `set_option`, or admitted example was found in these two files. There were no previous findings to reconcile.

### Gate, elaboration, and scope

The worker's gate has exactly four failing rules: `latex=101`, `tex=45`, `prnum=1`, `metadata=1`. R08–R11 cover all four. Build, stray files, outside-folder changes, import rules, sorry-data, and the other recorded rules passed. The explicit outside-owned-folders diff was empty; the family index and six named sibling folders were treated as this PR's authorized scope.

The requested dependency check was run against the supplied candidate order and returned:

```text
depcheck: 163 roadmaps, 1163 edges, 0 problem(s)
```

There was no UPWARD, CYCLE, or moved line. This checks the graph the tool extracts; it does not remedy absent exact contracts or R03. All direct supplier mentions and exclusions were read. The three sibling inputs form the intended direction ConstructibleEtale → EtaleBaseChange → CompactSupport → ComplexComparison. UniversalCovers is completed on main. EllAdicRealization and the finite-field branch are named as consumers/exclusions, not prerequisites.

The exact requested `lake env lean` elaboration completed with exit code 0 and **zero diagnostics**. The worker's targeted module build also passed. There is one `import Mathlib`, one namespace, **zero definitions, zero theorems, zero section variables**, and no TauCeti import. Thus there are zero signatures to print and zero sorried declarations for a one-tactic probe; no binder defect or padding was concealed by skipping a nonempty probe.

### Headline inventory and the pins

The README's deep endpoints are: functorial general analytification (Layers 0–2); compatible triangulation and finite topological type (3–4); local-system/sheaf/singular comparison (5–7); Riemann existence (8); the classical-to-étale site morphism (9); finite-level derived Artin comparison (10); compact-support Artin comparison (11); and relative ordinary/compact-support comparison (12). Its compatibility claims include coefficients, products, twists, and finite-group actions.

The manifest pins Mathlib at `9caeba1000ef8f302920981f4a08651d325abc81`, verified against the installed package. **It contains no Tau Ceti package or commit.** Therefore no current Tau Ceti implementation was silently substituted for a nonexistent pin. Searches by objects and carriers, and reads of the native files below, found no complete complex-analytic-space/analytification/local-system-comparison carriers at this pin. Naming a missing analytification in a free predicate would not make the headlines statable. The empty file itself is not a missing-headline or padding finding; its explanation needs R12. No absent statable headline was established in this audit.

Ten native declarations were opened at the pin (not just searched by the roadmap's preferred names):

| Native declaration | File and line at the Mathlib pin | What the definition actually supplies |
| --- | --- | --- |
| `AlgebraicGeometry.Scheme` | `Mathlib/AlgebraicGeometry/Scheme.lean:42` | A locally ringed space locally affine; no complex field, finite type, or separation is built in. |
| `AlgebraicGeometry.LocallyOfFiniteType` | `Mathlib/AlgebraicGeometry/Morphisms/FiniteType.lean:43` | An affine-local ring-map condition; no global quasi-compactness or separatedness. |
| `AlgebraicGeometry.IsProper` | `Mathlib/AlgebraicGeometry/Morphisms/Proper.lean:42` | Relative separatedness, universal closedness and locally finite type; it does not make the base separated. |
| `AlgebraicGeometry.Scheme.smallEtaleTopology` | `Mathlib/AlgebraicGeometry/Sites/Etale.lean:50` | The native small étale site, not a classical comparison morphism. |
| `CategoryTheory.Sheaf.H` | `Mathlib/CategoryTheory/Sites/SheafCohomology/Basic.lean:59` | Ext from the constant integral sheaf, with explicit sheafification/Ext hypotheses. |
| `CategoryTheory.sheafIsAbelian` | `Mathlib/CategoryTheory/Sites/Abelian.lean:39` | The abelian sheaf-category instance under its sheafification assumptions. |
| `AlgebraicTopology.singularChainComplexFunctor` | `Mathlib/AlgebraicTopology/SingularHomology/Basic.lean:36` | Chains with a fixed coefficient object; no arbitrary constructible coefficient functor. |
| `AlgebraicTopology.singularHomologyFunctor` | `Mathlib/AlgebraicTopology/SingularHomology/Basic.lean:55` | Homology of that chain complex, not a sheaf/singular comparison. |
| `IsCoveringMap` | `Mathlib/Topology/Covering/Basic.lean:287` | Evenly covered neighbourhoods, with possibly empty fibres; no surjectivity assumption. |
| `IsCoveringMap.monodromyFunctor` | `Mathlib/Topology/Homotopy/Lifting.lean:394` | Actual transport in the fibre functor; its map laws are at lines 397–398. |

An eleventh declaration opened was `IsManifold` at `Mathlib/Geometry/Manifold/IsManifold/Basic.lean:785`: it extends the chart compatibility condition and does **not** assert Hausdorffness of the manifold. Consequently the doubled-origin example alone is not a counterexample to the roadmap's smooth-manifold sentence under Mathlib's vocabulary. Its failure in R03 is specifically the Hausdorff hypothesis of the roadmap's own support construction.

### Resolved ownership and supplier citations

The main content snapshot was `d00bcc158f6faf5b505e8410b76886db635e58ab`; the supplied TopologicalSheafCohomology head was `6e3d3a95ba905d8a66ce20c5cf3a8aef989890e9`. Read main AlgebraicTopology, completed UniversalCovers and completed RealAlgebraicGeometry for shape and the relevant ownership sections; also read CharacteristicClasses. Used the prescribed `roadmaps grep` and `roadmaps show` tools, then read the actual located passages. Searched the supplied open-head files and board packages for overlapping objects. No fully qualified declaration collision is possible in this folder's empty Lean file.

| Citation/object | Resolved owner and exact passage | Resolution |
| --- | --- | --- |
| Finite constructible complexes and ctf | `TauCetiRoadmap/CohomologicalPointCounting/ConstructibleEtale/README.md:261,309,329,348` (Layers 5, 7, 8) | The named objects exist as targets; add these exact sections to the contract. |
| Proper direct images/base change | `TauCetiRoadmap/CohomologicalPointCounting/EtaleBaseChange/README.md:254,282` (Layers 5–6) | Proper base change and ctf finiteness are actually stated. |
| Lisse fibre transport | Same file, `README.md:311` (Layer 8) | Requires smooth **proper** f and lisse coefficients; the relative consumer must preserve these conditions when it claims lissity. |
| Algebraic compactification and Rf! | `TauCetiRoadmap/CohomologicalPointCounting/CompactSupport/README.md:231,274,298` (Layers 5, 7, 8), with its preceding compactification layers | Supplies compactification-independent algebraic lower shriek, supports, and ctf finiteness. |
| Coverings and monodromy | `Completed/UniversalCovers/README.md:13,66,98` | Path/local-path/semi-local-simple-connectivity and basepoint conventions are explicit. |
| Semialgebraic sets/maps and cell decomposition | `Completed/RealAlgebraicGeometry/README.md:322,439` (Layers 3, 6) | Existing owner; triangulation explicitly excluded at lines 80–81. |
| Compatible finite triangulation | `TauCetiRoadmap/AffineMorseLefschetz/README.md:353–369` (A4.1); `TauCetiRoadmap/RealAnalyticGeometry/README.md:26–34,138` (R2) | Compact semialgebraic marked-family triangulation already has an owner; the analytic strengthening is separate. |
| Twisted chains, transport, pairs and excision | `TauCetiRoadmap/AlgebraicTopology/README.md:382,481` (Stage 2 item 6; Stage 3) | Same carrier and first-vertex convention; import it. |
| Local cochains and products | Same file, `README.md:1011,1057` (§§6.1–6.2) | Same construction; import it. |
| Compact-relative singular cochains | `TauCetiRoadmap/CharacteristicClasses/README.md:331–343` (C1.2a S0–S5) | Same object, more general module coefficients; import with support hypotheses. |
| Constant-coefficient Čech/singular comparison | Same file, `README.md:462` (C1.2b) | Existing overlap on paracompact Hausdorff CW-type spaces. |
| Topological derived sections, extension by zero and compact supports | `TauCetiRoadmap/TopologicalSheafCohomology/README.md:28,68–78` (TS0, TS3), supplied open head | Earlier in the order, same objects; its Hausdorff domain does not by itself repair R03. |

The supplied AlgebraicTopologyPartII head explicitly consumes ordinary AlgebraicTopology (lines 11, 74); CohomologyComparisonsPartII concerns p-adic/rigid comparisons, not this finite complex comparison; AnalyticStacks' solid/Huber analytic objects were not treated as identical to classical complex analytic spaces. The open search also surfaced ComplexComparisonPartII, but the brief supplies no checkout for that open head: ownership against that particular open PR was **not checked**, and its search excerpts are not used as a finding or an approved supplier contract. Ownership against other open PRs for which no files were supplied was likewise not checked. The board-package search and the supplied EllAdicHomotopyTypesAndWeights head (`README.md:97–102`) both attribute the finite Artin summit to ComplexComparisonPartII C6.3, reinforcing the need to resolve that overlap. Since the alleged owner’s files are not supplied, this is an unresolved ownership lead rather than a certified duplication finding. The independently verified main-roadmap duplication in R02 does not depend on that lead.

The [linked affine-analytification design](https://github.com/leanprover-community/mathlib4/pull/34626) was opened. Its description discusses the regular-value theorem and manifold gluing; it is design coordination for the smooth direction, not evidence of a pinned singular analytic-space carrier. The roadmap correctly retains its independent singular/nonreduced targets.

### Seeded source sample: Summit

No README locator is explicitly marked unverified; instead most are too broad (R06). The seeded Summit was checked in the source texts through the source service, without editing a manifest.

| Source and locator actually read | Support for the sampled claim |
| --- | --- |
| [SGA 4 tome 3, 2024 retypesetting](https://www.normalesup.org/~forgogozo/SGA4/tomes/tome3.pdf), XVI 4.1, original pp. 232–233; retypeset p. 132, PDF p. 138; sga4-3 lines 5518–5533 | Relative ordinary comparison for finite-type morphisms; properness or constructibility supplies the stated alternatives. Bounded derived finite ctf follows by truncation. |
| Same source, XVII 5.3.2–5.3.5, original pp. 362–364; retypeset pp. 198–199, PDF pp. 204–205; sga4-3 lines 8863–8915 | Natural compactifiable relative support comparison, independence/transitivity, coefficient variant and absolute compact-support corollary. The sibling's Nagata compactification supplies compactifiability. |
| [Milne, Lectures on Étale Cohomology v2.21](https://www.jmilne.org/math/CourseNotes/LEC.pdf), Theorem 21.1 and Remark 21.2, p. 130; milne-lec lines 5007–5011 | Smooth finite constant comparison and a pointer to the general constructible result; not by itself a locator for every derived/support/relative enhancement. |
| [SGA 1, arXiv reprint v2](https://arxiv.org/abs/math/0206203), XII 5.1, reprint p. 251, original p. 333; sga1 lines 9872–9884 | Finite étale analytic/algebraic cover equivalence for locally finite-type complex schemes, including the finite-type scope here. |
| SGA 4 XI 3.1–3.3, original pp. 69–70; retypeset p. 43; sga4-3 lines 1774–1803 | Elementary fibrations and good-neighbourhood towers; the tower handles dimension zero. |

The source comparison does not certify every listed product/twist/equivariant coherence automatically: those still need specified natural maps and convention checks, as in R07. The theorem numbers and both original/retypeset page systems are recorded to avoid confusing PDF pages with printed pages.

### Computed adversarial pass

The 134 rows below cover the definitions, API claims, proof-route steps, summits and worked examples. These are computations and separating instances, not substitutes for general proofs. Write F = 𝔽₃ unless another ring is specified; a displayed cohomology tuple lists degrees (0,1,2), with higher degrees zero in the examples. `0` denotes the zero module. D denotes the doubled-origin affine line. “Retain” means no defect was found on that test, not formal certification of the full theorem. R07 supplies the required README Checks rather than adding them to Lean.

| Statement/location | Instances tried | Values computed on the two sides / separating value | Result and change |
| --- | --- | --- | --- |
| All finite-type schemes, reduction and nilpotents, lines 73–75 | Spec ℂ[ε]/ε² versus Spec ℂ | Both point spaces have cardinality 1; analytic stalks have ℂ-lengths 2 and 1 | Retain nilpotent-sensitive structure. |
| Non-Hausdorff analytic spaces, line 208 | D | Two distinct origins; every pair of their neighbourhoods intersects in nonzero points | General non-Hausdorff carrier needed; R03. |
| Finite coefficients/ctf, lines 95–103 | Zero ring; ℤ/4 with module ℤ/2 | Zero-ring modules give 0 throughout; Tor_i^(ℤ/4)(ℤ/2,ℤ/2)=ℤ/2 for all i≥0 | Zero ring harmless; latter coefficient is not ctf. |
| Three cohomology constructions, lines 105–113 | Point, F | Étale/sheaf/singular tuples all (F,0,0), but obtained from different constructions | Retain actual comparison maps. |
| Complex point definition, lines 155–159 | ℂ; zero algebra; ℂ[ε]/ε² | Hom_ℂ-alg to ℂ has respectively 1, 0, 1 elements; zero loci match | Retain. |
| Presentation independence, line 167 | ℂ[t] versus ℂ[x,y]/(y−x²) | t=2 corresponds to (2,4); projection and graph compose to 2 and (2,4) | Retain. |
| Affine functoriality, line 171 | Pullbacks t↦t², t↦t+1 | Evaluation at 2 of (t+1)² is 9, equal to applying translation then squaring | Preserve contravariance. |
| Localization/principal opens, line 172 | ℂ[t,t⁻¹] | Points are exactly z≠0; z=1 allowed, z=0 excluded | Retain. |
| Tensor/fibre products, line 173 | Two maps ℂ[t]→ℂ with t↦0 and t↦1 | Tensor is zero ring; topological fibre product is empty | Retain empty case. |
| Affine Euclidean topology, line 174 | A⁰, A¹ | Point versus ℂ; an open disc around 0 has inverse image the same disc | Retain n=0. |
| Quotient closed embeddings, line 175 | ℂ[t]→ℂ[t]/t² | Source point image {0}; kernel forces z²=0 iff z=0 | Underlying image is closed, nilpotents retained separately. |
| Affine product topology, line 176 | A¹×A¹ | Neighbourhood product B(0,1)×B(0,1) equals the product-basis neighbourhood | Retain. |
| Affine Hausdorffness, line 177 | 0 and 1 in ℂ | Radius 1/3 discs have intersection ∅ | Retain. |
| Affine local compactness, line 177 | 0 in ℂ | Closed unit disc is compact and contains an open neighbourhood | Retain. |
| Affine second countability, line 177 | ℂ | Rational centres/radii give countably many discs on both presentations | Retain. |
| Global gluing/cover independence, lines 183–193 | P¹ from two A¹ charts | On overlap transition z↦1/z; 2↦1/2↦2 | Retain. |
| Open immersion, line 194 | Gₘ→A¹ | Image ℂ∖{0}, an open subset; point 0 has empty fibre | Retain. |
| Closed immersion/reduction, line 195 | Double point→A¹ | Image {0}; reduced and unreduced carriers each have one point | Retain. |
| Scheme fibre products, line 196 | z↦z² pulled back to 0 and 1 | Fibre point counts 1 and 2, matching zeros of z² and z²−1 | Retain ramified/nonreduced fibre. |
| Finite coproducts, line 197 | ∅ ⊔ pt ⊔ pt | Point count 2 on both sides; H⁰=F² | Retain. |
| Properness, line 198 | P¹→pt; A¹→pt negative control | Preimages are compact S² and noncompact ℂ respectively | Retain properness hypothesis. |
| Finite maps, line 199 | z↦z² | Over w≠0 two points, over 0 one; inverse of closed unit disc is closed unit disc | Finite/proper, not necessarily covering. |
| Smooth morphisms, line 200 | A²→A¹ projection; z↦z² at 0 | Projection derivative rank 1; square derivative 0 at 0 | Retain smoothness for submersion. |
| Étale local homeomorphism, line 201 | z↦z² on Gₘ versus A¹ | Nonzero derivative 2z versus derivative 0 at 0; ramified neighbourhood has two sheets joining | Retain étale restriction. |
| Reduction compatibility, lines 202–204 | Double point | Topology: one point both sides; ring ε²=0 with ε≠0 only before reduction | Retain. |
| Analytic-space local models, line 208 | Node xy=0; double point | Two branches at node; one point with length-two stalk at double point | Neither a manifold-only nor reduced-only model suffices. |
| Affine analytic ideal, line 212 | t² versus t | Quotients ℂ{t}/t² and ℂ{t}/t have lengths 2 and 1 | Retain. |
| Analytic gluing, line 213 | P¹ charts | Inversion twice fixes z=2 | Retain. |
| Analytification functor, lines 214–219 | Identity and square map | id(2)=2; square(id(2))=4=id(square(2)) | Retain. |
| Agreement with classical topology, line 220 | A¹, double point | ℂ and singleton on both constructions | Retain. |
| Analytic products/immersions/finite/proper, line 221 | Double point×A¹ | Underlying space ℂ; each local ring has a nonzero square-zero ε | Retain scheme-level structures in transport. |
| Étale local biholomorphism, line 222 | Gₘ square map near 1 | Derivative 2; local inverse derivative 1/2; product 1 | Retain. |
| Smooth specialization, line 223 | A¹; node | One complex coordinate on A¹; node has two branches and is not locally a disc | Retain general analytic carrier. |
| Semialgebraic sets/maps/Boolean operations, line 231 | {0}, ℝ∖{0}, x↦x² | Intersection ∅, union ℝ, graph y=x² sends 2 to 4 | Import existing owner, R02. |
| Cell decomposition, line 232 | Polynomial x | Three cells (−∞,0), {0}, (0,∞), with signs −,0,+ | Import existing foundational owner, R02. |
| Noncompact finite triangulation, line 233 | ℝ | Homeomorphic to one open edge; not homeomorphic to the compact closed edge | Retain open-simplex wording; import compact foundation, R02. |
| Compact specialization, line 234 | [0,1] | Two vertices and one closed edge; Euler characteristic 2−1=1 | Import AffineMorseLefschetz A4.1, R02. |
| Compatible products/subsets/strata, line 235 | [0,1]² with diagonal | Four vertices, five edges, two triangles; χ=4−5+2=1; diagonal is a subcomplex | Import shared marked-family construction, R02. |
| Complex→real algebraic, line 236 | z²=0 | Equations x²−y²=0, 2xy=0 give x=y=0 | Retain. |
| Singular/reducible triangulation, line 238 | xy=0 in ℂ² | Two contractible complex lines meet in a point; χ=1+1−1=1 | Retain, precise locator needed. |
| Separated Hausdorff conclusion, line 246 | A¹ versus D | A¹ separates 0,1; D cannot separate its two origins | Retain separation restriction. |
| Local compactness, line 247 | Node at origin | Intersection with a closed radius-one ball is compact | Retain. |
| Second countability, line 248 | P¹ | Two countable chart bases have countable union | Retain. |
| Paracompactness, line 249 | ℂ with integer-lattice open unit discs | These cover ℂ; the closed unit disc meets exactly 9 members, so this cover is locally finite near 0 | Retain in separated scope; example is not a general proof. |
| Local contractibility, line 250 | Node, small ball intersection | Radial homotopy sends (x,y) to ((1−t)x,(1−t)y); xy stays 0 | Retain singular case. |
| Local path connectedness, line 251 | Same node | Each point joins 0 by that radial path | Retain. |
| Finite cohomological dimension, line 252 | pt; S² with F | Maximal nonzero displayed degrees 0 and 2 | Retain; a numerical general bound still needs specification/source. |
| Finite CW homotopy type, line 253 | ℂ× | Retracts to S¹, with one 0-cell and one 1-cell, χ=0 | Retain, not a compactness assertion. |
| Proper polyhedron, line 254 | P¹ | S² triangulated as tetrahedron boundary: 4−6+4=2 | Retain. |
| Affine-cover local properties, line 256 | D | Each origin has a disc chart; two countable affine bases suffice globally; Hausdorffness remains false | Retain stated local/global distinction. |
| Compact finiteness consequence, line 258 | ℂ×, F | H_c=(0,F,F), total dimension 2 | Retain. |
| Local system definition, line 262 | Constant F; skyscraper at 0 | Constant stalk dimensions 1 everywhere; skyscraper dimensions 1 at 0 and 0 elsewhere | Excludes skyscraper as a local system, R04. |
| Stalks and pullback, line 264 | Circle monodromy 2 over 𝔽₅, pulled back by degree 2 | Stalk 𝔽₅; new transport 2²=4 | Retain; import shared carrier. |
| Tensor/dual, line 264 | Same monodromy 2 | Tensor transport 4; dual transport 2⁻¹=3; evaluation transport 2·3=1 | Retain, no unqualified exact duality claimed. |
| Kernels/cokernels/extensions, line 264 | 0→ℤ/2→ℤ/4→ℤ/2→0 on a point | Cardinalities 2,4,2; kernel and quotient each ℤ/2 | Retain; stalk finiteness preserved. |
| Finite monodromy, line 265 | 𝔽₅ rank-one transport 2 | Image {1,2,4,3}, order 4 | Retain. |
| Groupoid equivalence, line 266 | Two points | Two independently chosen modules, e.g. 0 and F; no morphism forces equality | Retain unbased/componentwise form. |
| Based representation equivalence, line 267 | Circle, trivial versus −1 over F | H⁰ invariants F versus 0 | Distinguishes trivial and nontrivial monodromy. |
| Basepoint change, line 268 | Regular S₃ covering | h=(12), g=(123): hgh⁻¹=(132), not g | Retain conjugation-sensitive convention. |
| First-vertex chain convention, line 274 | Loop transport 2 over 𝔽₅, coefficient 1 | Forward boundary 2−1=1; inverse gives 3−1=2 | Pin the former supplied convention, R07. |
| Boundary and coboundary, line 278 | Interval with constant F | ∂[01]=[1]−[0]; δ(a,b)=b−a | Retain signed maps. |
| Chain-complex identities, line 279 | Triangle, successive transports 2 and 3 over 𝔽₅ | Vertex coefficients in ∂²: at 2, 6−6=0; at 1, −2+2=0; at 0, 1−1=0 | Retain; put computed witness in Checks. |
| Local-coefficient functoriality, line 280 | Degree-two circle map, transport 2 | Composite transport 4 on either construction | Retain actual pullback coefficient system. |
| Homotopy invariance, line 281 | Constant coefficients on interval and point | H=(F,0,0) on both; collapse and inclusion act as identity on H⁰ | Retain ordinary statement. |
| Pair long exact sequence, line 282 | ([0,1],{0,1}) | H⁰ interval=F→F² diagonal; cokernel=F=H¹(pair) | Retain. |
| Excision, line 283 | (ℝ,ℝ∖{0}) versus small interval pair | H¹=F on both; other relative groups zero | Retain hypotheses from supplier. |
| Mayer–Vietoris, line 284 | Circle covered by two arcs | F²→F² has rank 1; kernel F, cokernel F | Retain sign (i_U,−i_V). |
| Cup pairing, line 285 | Two generators a,b on the torus, F | a∪b=1 on oriented 2-cell; b∪a=−1=2 | Retain Koszul sign. |
| Constant-system comparison, line 286 | S¹ | Local-system and ordinary complexes both F→0 F; H⁰=H¹=F | Import carrier and comparison, R02. |
| Compact singular cochains, line 287 | ℂ versus pt | H_c=(0,0,F) versus (F,0,0); ordinary H⁰(ℂ)=F | Import supports, do not identify ordinary/support cochains. |
| Not group cohomology, line 289 | S² | π₁=1, H²(group,F)=0 but H²_sing(S²,F)=F | Retain explicit warning. |
| Generic sheaf cohomology packaging, line 293 | Point | Γ(F)=F, Hⁱ=0 for i>0 | Native sheaf object, not new theory. |
| Sheaf/singular local-system comparison, lines 295–303 | S¹ with −1 monodromy over F | Differential −1−1=1; H⁰=H¹=0 on both sides | Retain; give exact topological hypotheses. |
| Constructible generalization, line 305 | Skyscraper F at 0 in ℂ | Sheaf H⁰=F; groupoid transport between dimensions 1 and 0 does not exist | R04. |
| Extension by zero, line 307 | j:ℂ×→ℂ, constant F | (j!F)_0=0; (j!F)_1=F, whereas (j_*F)_0=F | Import existing operation; wrong j_* excluded. |
| Topological locally proper separated pushforward, line 307 | ℂ→pt; id_D | First has H²_c=F; second should be identity but falls outside the stated Hausdorff carrier | R03. |
| Compact sheaf/singular comparison, lines 309–313 | Constant F on ℂ; skyscraper F at 0 | Constant case (0,0,F)=(0,0,F); skyscraper sheaf side (F,0,0), no Layer-6 coefficient input | R04. |
| Boundedness, line 315 | S², F | Only degrees 0,2 nonzero | Retain finite-triangulation scope. |
| Perfectness/Tor condition, line 315 | Point, ring ℤ/4, coefficient ℤ/2 | H only in degree 0 but Tor_i=ℤ/2 for every i | Retain explicit negative control. |
| Finite étale→covering, lines 319–322 | z↦z² on ℂ×; empty cover | Fibres have 2 and 0 sheets respectively | Retain empty fibres. |
| Riemann existence equivalence, lines 325–330 | Point; cyclic covers of ℂ× | Finite étale sets equal finite discrete sets; degree-n cover corresponds to nℤ⊂ℤ | Retain. |
| Full faithfulness, line 335 | Two-sheet cover of a point | Endomorphism set has 2²=4 maps on each side | Retain. |
| Essential surjectivity, line 335 | Three-sheet connected circle cover | z↦z³ has three sheets and monodromy a 3-cycle | Retain. |
| Pullback/products/disjoint unions/components, line 336 | Degree-2 cover of ℂ× pulled back by itself | Two components, since y²=z² gives y=z or y=−z | Retain. |
| Galois covers/deck groups, line 337 | z↦z³ | Deck group μ₃≅ℤ/3, generated by multiplying z by ζ₃ | Retain. |
| Finite lisse/local-system equivalence, line 338 | Sign rank-one system on ℂ×, F | Monodromy −1 both sides; invariant subgroup 0 | Retain. |
| Fundamental-group completion, line 339 | ℂ× | Topological group ℤ; finite quotients ℤ/n; étale group ℤ̂ | Completion is essential. |
| Riemann-existence naturality, line 340 | Power maps degrees 2 and 3 | Composition degree 6; induced maps multiply winding by 6 both ways | Retain. |
| Local-homeomorphism site, line 346 | Point and a two-sheet object | Object is two discrete points; its two local sections cover it | Topos equivalent to sets over open site. |
| Comparison-morphism direction, lines 348–352 | Constant F at a point | Pullback sends F to F; comparison sends 1↦1, not 0 | Retain étale→classical cohomology map. |
| Open-site equivalence, line 354 | Two discrete points | Sheaf category is pairs (M₁,M₂) in both descriptions | Retain. |
| Inverse/direct images, line 357 | Identity of a point | Unit/counit on F each send 1 to 1 | Retain. |
| Constant sheaves, line 358 | Disjoint pair of points | Global sections F² on both sites | Retain. |
| Kᵃⁿ = ε*K, line 359 | K=F[1] on point | Only H⁻¹=F on either side | Retain shift convention. |
| Stalk compatibility, line 360 | Skyscraper at 0 | Stalks F at 0, 0 at 1 on both sites | Retain. |
| Lisse/constructible preservation, line 361 | Sign system and skyscraper | Ranks 1 everywhere for first; ranks 1,0 for second | Preserve distinction, R04. |
| Tensor/dual/coefficient change, line 362 | Rank-one transport 2 over 𝔽₅ | Dual 3; product 1; scalar reduction ℤ/4→𝔽₂ sends 2 to 0 | Retain derived scalar-change conventions. |
| Tate twists, line 362 | μ₃ and complex conjugation | ζ₃↦ζ₃⁻¹=ζ₃²; inverse multiplier 2, not 1 | R07 fixes actual normalization. |
| Naturality in schemes, line 363 | Power maps on ℂ× | Winding generator maps to 2 then 6, same as degree-6 map | Retain. |
| Derived-image comparison morphism, line 364 | P¹→pt, F | Both sides have F in degrees 0,2; map must preserve chosen generator | Retain; specify map, not just existence. |
| Ordinary Artin summit, lines 368–382 | ∅; pt; double point; ℂ×; P¹ | Respectively (0,0,0), (F,0,0), (F,0,0), (F,F,0), (F,0,F) on each side | Retain theorem, R06 locator. |
| Elementary-fibration definition, lines 386–390 | A¹⊂P¹→pt | Boundary one point; fibre dimension 1; H⁰=F,H¹=0 | Retain, specify open/dense inclusion. |
| Generic projection, line 391 | pt versus A¹ | dim pt=0 cannot equal dim base+1; A¹ gives 1=0+1 | R01. |
| Curve higher images, line 392 | P¹ minus 1,2,3 points | (H⁰,H¹)=(F,0),(F,F),(F,F²); Hⁱ=0 for i≥2 | Retain nonempty boundary. |
| Leray induction, line 393 | (ℂ×)²→ℂ× | Two fibre rows give ranks (1,2,1) on both sides | Retain; dimension-zero base needed. |
| Noetherian/stratification reduction, line 394 | Node xy=0; double point | Node ordinary H=(F,0,0); double point unchanged from pt | Retain; explicit comparison inputs required. |
| Bounded truncation, line 395 | F⊕F[1] on point | H⁰=F, H⁻¹=F on both sides, others 0 | Retain bounded derived passage. |
| Coefficient change, line 397 | S¹, ℤ/4→𝔽₂ | Free degree-0,1 cochain terms reduce from ℤ/4 to 𝔽₂ on both sides | Retain derived tensor convention. |
| Cup compatibility, line 397 | (ℂ×)², F | Oriented generators satisfy a∪b=1 and b∪a=2 on both sides | R07 records signs. |
| Künneth compatibility, line 397 | (ℂ×)² | Ranks (1,1) tensor (1,1) give (1,2,1) | Retain derived product. |
| Twist compatibility, line 397 | P¹ with μ₃ coefficients | Degree-two generator is preserved after chosen μ₃ identification; conjugation multiplier 2 | R07. |
| Finite-group equivariance, line 397 | Inversion on ℂ× | H⁰ multiplier 1; H¹ multiplier −1=2 | Retain action, no averaging/invariants claim. |
| Constant singular corollary, lines 399–405 | P¹, ℂ× with 𝔽₂ and 𝔽₃ | Betti ranks (1,0,1) and (1,1,0) for either coefficient field | Retain both small characteristics. |
| Lisse singular corollary, line 407 | ℂ× sign system, F | H⁰=H¹=0 both sides | Retain nonconstant coefficients. |
| Compact-support summit, lines 411–419 | pt; ℂ; ℂ×; ∅ | (F,0,0), (0,0,F), (0,F,F), (0,0,0) on each side | Retain separated finite type. |
| Compactification independence, line 421 | A²⊂P²; blowup of boundary point | Both open parts ℂ²; H⁴_c=F and other H_c vanish | Retain canonical comparison requirement. |
| Proper pushforward, line 423 | Two points→pt | H⁰_c=F² either directly or after pushforward | Retain. |
| Open extension, line 424 | ℂ×→ℂ | H_c(j!F)=H_c(ℂ×,F)=(0,F,F) | Retain. |
| Conjugation, line 425 | ℂ, ℂ× with F; μ₃ | H²_c(ℂ) multiplier −1=2; circle H¹ multiplier 2; ζ₃↦ζ₃² | Retain; no arbitrary discontinuous automorphism claimed. |
| Localization triangle, line 426 | {0}⊂ℂ, complement ℂ× | F=H⁰_c(pt)→H¹_c(ℂ×)=F is an isomorphism; H²_c(ℂ×)→H²_c(ℂ) is an isomorphism | Retain, pin connecting sign. |
| Compact Künneth/external product, line 427 | ℂ×ℂ | F in degree 2 tensor F in degree 2 yields F in degree 4 | Retain. |
| Compact finite-group compatibility, line 428 | Rotation z↦−z on ℂ | H²_c multiplier +1 on both sides (real orientation preserved) | Retain. |
| Compact singular corollary, line 430 | ℂ with constant F | H²_c=F versus ordinary H²=0 | Retain correct support theory. |
| Relative ordinary summit, lines 434–442 | P¹×Y→Y; j:ℂ×→ℂ | Proper fibre ranks (1,0,1); at puncture for j, ranks (1,1,0) on both sites | Retain proper case; extend as R05. |
| Relative support summit, lines 444–449 | A¹×Y→Y; id_D | Fibre H²_c=F; id_D should have identity stalk F→F but is outside Layer 7 | R03. |
| Fibre/monodromy packaging, line 452 | Trivial P¹-family; branched finite square map | First: constant ranks 1,0,1. Second: H⁰ fibre rank 2 away from 0 and 1 at 0 | Keep smooth/proper/lisse conditions for lissity. |
| Worked example 1, line 458 | A⁰,A¹,A² | Classical spaces pt,ℂ,ℂ² respectively | Retain. |
| Worked example 2, line 459 | Gₘ | H¹=F, Euler characteristic 1−1=0 | Retain. |
| Worked example 3, line 460 | P¹ | H⁰=H²=F, H¹=0, Euler characteristic 2 | Retain. |
| Worked example 4, line 461 | Power n=0,1,2 | Fibres at 1: infinite,1,2; n=0 is not finite étale | Add n≥1, R07. |
| Worked example 5, line 462 | Reducible affine nodal curve xy=0 | Ordinary H⁰=F only; compact H²_c=F² and H¹_c=F | Retain, make a specific nodal equation a Check. |
| Worked example 6, line 463 | Sign monodromy on ℂ× | Differential 1 over F, so H⁰=H¹=0; trivial system gives F,F | Discriminating monodromy Check. |
| Worked example 7, line 464 | A¹ and Gₘ localization | H_c(A¹)=(0,0,F), H_c(Gₘ)=(0,F,F) | Retain actual localization maps. |
| Worked example 8, line 465 | Inversion on Gₘ, order 2 | On ordinary H¹ trace −1=2; identity trace 1 | Retain equivariance, not equality of every action. |

The table also supplies positive and negative models for the principal definitions: point versus empty algebra, reduced versus double point, polynomial graph versus coordinate choice, local system versus skyscraper, j! versus j_*, proper versus nonproper structure map, positive-dimensional fibration versus point, and actual transport versus its inverse. There is no denominator or Frobenius normalization in this folder to test. Finite group actions were checked without an invertibility-of-order assumption because the claim is equivariance, not exactness of invariants.

## Not verifiable

- **Milne's 1980 book:** the source service found the publisher landing page but no legally retrievable text. The independently fetched 2013 notes are a different work; their numbering is not assigned to the book. `milne-book` remains in the missing-reference list. The sampled summit was nevertheless checked in SGA 4.
- **Dimca, Sheaves in Topology:** the DOI request was classified `uncertified`/paywalled. No text was taken from an unauthorized mirror, and no theorem/page has been guessed. The README needs an exact locator even when the source remains uncertified.
- **SGA 4½:** the DOI request was classified `uncertified`/paywalled. Compact-support support was verified instead in SGA 4 XVII; the README currently supplies no exact SGA 4½ locator.
- **Hironaka/triangulation:** the README does not identify a work. A source-service attempt for the plausible *Triangulations of algebraic sets* (1975), pp. 165–185, reached the AMS volume landing page but no legal text. `hironaka` remains in the missing-reference list, explicitly as a candidate requiring identification, not a verified match to the author's intended source.
- **Tau Ceti implementations:** there is no Tau Ceti pin in this head's manifest. Roadmap ownership was checked as roadmap ownership, not as proof that their APIs exist in an unspecified Tau Ceti checkout.
- **Unprovided open heads:** the ownership limitation for ComplexComparisonPartII and other open PRs without supplied files is stated above. No absence claim about those heads is made.

Fetched through the source service: SGA 1; SGA 4 tomes 2 and 3; Milne's notes; Stacks Chapters 59 and 63. Stacks Chapter 63 was retrieved successfully from [More Étale Cohomology](https://stacks.math.columbia.edu/download/more-etale.pdf) after correcting an initial nonexistent download URL; it is not an outstanding source request. No source text was copied into the repository or report. All work independent of the unavailable texts was completed; the verdict is not parked on those texts.

## Source issues

- **Error** in milne-lec at Proposition 21.8, printed p. 133: the source says every smooth variety has a neighbourhood admitting an elementary fibration; it should be positive-dimensional smooth varieties, with dimension zero handled by a length-zero good-neighbourhood tower; affects a stated result.
