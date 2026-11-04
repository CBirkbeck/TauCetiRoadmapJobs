# Review of DiagrammaticCoherence (pull request #1710 at f1f357f)

**Verdict:** accepted

AI-assisted independent review. No P1 or P2 defect was established. The worker's gate passes, and independent Lean elaboration and the dependency check pass. The three P3 findings below are nonblocking under this review's acceptance rule. This is readiness for human final approval, not an approval or merge.

The review covered both requested files in full, including unchanged passages. Missing primary-source access is recorded below; the new geometric extension targets are not represented as theorems already proved in the literature.

## R01 (P3) — The cited works still have no source manifest

**Location:** `TauCetiRoadmap/DiagrammaticCoherence/README.md:1319`, “References”; the folder has no `sources.toml`.

**Claim:** The ten cited works must have auditable source records.

**Witness:** The folder contains README.md, Suggested.lean and metadata.toml, but zero source records. The bibliography cites ten distinct works, counting the two Joyal–Street manuscripts separately from their published tensor-calculus paper.

**Repair:** Add one entry per work to `TauCetiRoadmap/DiagrammaticCoherence/sources.toml`, with precise locators and legal provenance. Reuse the ten source identifiers in this report, or established identifiers if records exist elsewhere; preserve uncertified status rather than inventing access. This repeats previous R10, which remains unrepaired; no repair report marking it not actionable was supplied.

**Repair check:** The source audit below accounts for all ten works: five readable, four classified uncertified, and one access failure. The same work reached by an alternative URL remains one entry.

## R02 (P3) — Complete the page locators for the coherence sources

**Location:** `TauCetiRoadmap/DiagrammaticCoherence/README.md:768`, “Theorem 1.5 (also Selinger Theorem 3.1)”; also the source clauses at lines 249, 835, 982 and 1052.

**Claim:** The theorem citations provide the exact theorem and page locators required by the review contract.

**Witness:** The cited manuscript's Theorem 1.5 is on printed p.1.30, verified in the scan; Selinger Theorem 3.1 is on preprint p.11. Neither page accompanies those citations or their bibliography entries.

**Repair:** Add printed pages to the primary theorem citations and identify the version used. For the readable texts: Planar diagrams Theorem 1.5, p.1.30; Theorem 2.7, pp.2.33–2.34; Selinger's six comparison statements, preprint pp.11,16,19,24,28,30. Supply pages for the other primary citations when verified; retain their uncertified status otherwise. Do not replace a primary theorem with the survey.

**Repair check:** `planarDiags line 935` is Theorem 5 in Chapter 1, on the rendered p.1.30; `selinger line 419` is Theorem 3.1 on preprint p.11. These locators distinguish the manuscript, the separate GTCII draft and the published paper. Previous R09's geometric ownership/route problem is repaired; page completeness remains a smaller documentation issue.

## R03 (P3) — Describe QuantumGroups Q8 at its actual structure level

**Location:** `TauCetiRoadmap/DiagrammaticCoherence/README.md:52`, “Its braided representation examples are consumers of the general evaluation theorem.”

**Claim:** QuantumGroups Q8 supplies braided representation examples.

**Witness:** On main, `TauCetiRoadmap/QuantumGroups/README.md:730–772` constructs duals, the pivot and spherical traces for the generic signed modules. Q8 contains no braiding or R-matrix construction.

**Repair:** Call these pivotal/spherical representation examples, usable in the corresponding evaluation row. A braided or ribbon example needs its own actual owner and section; do not treat a revision of QuantumGroups as a supplier. No extra supplier is needed for the general coherence theorem.

**Repair check:** Q8's chosen pivot is K⁻¹; its displayed right and left traces are Tr(gf) and Tr(g⁻¹f). On the trivial representation, g=1 and both give 1. This is a valid pivotal evaluation example without claiming a supplied crossing operator. The error is in a consumer description, not a missing premise of the build.

## Verified sound

### Previous findings, checked individually before the full pass

All locations below are in the revised files. Quotes identify the repair, rather than treating the earlier review as authoritative.

| Previous finding | Revised passage | Assessment |
| --- | --- | --- |
| R01: unowned Drinfeld compatibility | README:313, “prove the equation F(u_X) ≫ κ_X = u_(FX)” and :320, “this functor-level extension is a target here” | Repaired. The target has typed δ, κ, b and u, a direct algebraic route, and composition/transformation compatibility. Its scaled-pairing test gives 2/3 on both paths. |
| R02: monotone-height openness | README:106, “the height derivative is strictly positive”; :565, “s³−εs gives derivative −ε at 0” | Repaired. Compact-family positivity and the m/2 bound are explicit; the cubic counterexample is retained. |
| R03: substitute acceptance development | Suggested.lean:16, “The following headline theorems are not statable at the pins”, followed by C1–C7 separately | Repaired. Missing geometry/free-category carriers are named; the syntax substitute is gone. |
| R04: winding padding | Suggested.lean:46–49, “Neither a second syntax development nor winding-word cancellation substitutes for a geometric headline here.” | Repaired. There are zero theorem or data declarations. |
| R05: allowed-import gate | Suggested.lean:7, “import Mathlib” | Repaired. Gate imports=0; independent elaboration succeeds. The remaining module command causes no visibility error in this declaration-free file. |
| R06: Mathlib subimports | Suggested.lean:7, “import Mathlib” | Repaired. There are zero submodule imports. |
| R07: missing root import | Suggested.lean:7, “import Mathlib” | Repaired. Exactly one root import. |
| R08: API, Checks and layer structure | README:230, “The signature and expression API includes”; :238, “Checks”; :247, “Needs” | Repaired. All nine layers have Examples/Dependencies endings, and the constructions have APIs and at least three computed/discriminating instances. Incidence, realization and gluing each receive three instances in §1.1. |
| R09: source/geometry attribution | README:429, “not a theorem about arbitrary surface projections supplied by that lemma”; :481, “Neither alone supplies this relative diagram statement.” | Substantively repaired. Coupon charts/shrinking/extension and the relative smooth–PL route are owned targets, distinguished from closed-link sources. Some page locators remain incomplete: new R02. |
| R10: missing source manifest | README:1319, “References” | Not repaired: new R01. No manifest exists at this head. |
| R11: process references | README:169, “From TauCetiRoadmap.TemperleyLieb”; :174, “not a relation of our free categories” | Repaired. Supplier contracts replace proposal/merge instructions. |
| R12: namespace/docs/name agreement | Suggested.lean:52, “namespace TauCetiRoadmap.DiagrammaticCoherence” | Repaired. Required module explanation and namespace are present; no retained declarations lack documentation or README names. |

### Gate, elaboration and dependency direction

HEAD was verified as `f1f357fe9227ab36aac667bb4c4c0daf15b06c89`. The outside-folder diff is empty. No worktree file was changed.

The supplied gate at this exact head reports:

```text
gate DiagrammaticCoherence: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK
```

Independent `lake env lean` elaboration of `TauCetiRoadmap/DiagrammaticCoherence/Suggested.lean` exited 0 with no warnings. No Tau Ceti import needed an object-file build. There are zero own declarations, so the requested all-declarations signature check and one-tactic padding probe each have zero candidates. The worker's signature parser error about “supplied” comes from prose, not a Lean identifier or declaration; the actual file elaborates.

The requested mechanical dependency command produced:

```text
depcheck: 205 roadmaps, 1549 edges, 0 problem(s)
```

There are no UPWARD, CYCLE or moved lines. All 17 Needs blocks, nine layer dependency endings, supplier contracts and consumer citations were read. The internal order is 0 → 1 → the appropriate coherence row → 8; §0.3 does not use geometric coherence, and §6.1 does not use the ribbon quotient it supplies. No supplier gaps are declared. No route-specific restriction, computational endpoint, sorry'd data, set_option, re-planned base roadmap or circular supply was found.

### Source sample: all 15 requested targets

The README has no separately flagged unverified locator. Every bibliographic work was submitted to the sources service. Identifiers below are review evidence keys; the review did not create or alter a repository manifest. Sources are linked at their legal locations, and extracted-text references use the service's line numbering.

Readable texts: [planarDiags](http://science.mq.edu.au/~street/PlanarDiags.pdf), [gtcII](http://science.mq.edu.au/~street/GTCII.pdf), [selinger](https://arxiv.org/abs/0908.3347), [reshetikhinTuraev](https://people.math.harvard.edu/~opie/Reshetikhin_Turaev.pdf), [roseman](https://www.impan.pl/shop/en/publication/transaction/download/product/89060). PlanarDiags is an OCR scan; the two headline theorem pages were also read as rendered images. Selinger page numbers below refer to arXiv v1, not the later book pagination.

| Seeded target | Text, locator and hypothesis/scope check |
| --- | --- |
| 0.1 Signatures and structural extensions | `planarDiags line 638` introduces object/morphism carriers with word-valued boundaries; `line 935`, Theorem 1.5, printed p.1.30, supplies the monoidal tensor-scheme universal property. `gtcII line 65`, pp.2–3, has ordered tensor inputs/outputs. Duality and arbitrary-arity extensions are identified as additional targets. Joyal–Street I itself remains uncertified. |
| 0.2 Congruences and quotients | TemperleyLieb Layer 2 explicitly supplies typed congruences and strong-monoidal interpretations; this is the owner, not a new theorem attributed to Selinger. `selinger line 419`, p.11, describes monoidal equality from axioms. The five extra structural congruences are targets here. |
| 0.3 Interpretations and Drinfeld compatibility | The canonical δ and pivotal preservation equation resolve to PivotalSpherical Layer 1; the b formula resolves to its Layer 10, equation (3). `selinger line 986`, p.23, gives the pivotal-functor condition; `lines 1175–1179`, p.28, distinguish choices of twist correspondence. The README fixes the supplier's choice and owns its functor-level extension. |
| 1.2 Smooth and PL comparison | `planarDiags line 1277`, printed p.2.10, imposes PL diagrams; `selinger line 834`, p.20, confirms this restriction. `roseman line 733`, Proposition 8.1, p.309, requires a closed 1-manifold and generic endpoint projections. The README correctly does not infer its boundary/coupon/family bridge from this closed-source theorem. |
| 1.3 Jets and generic families | `roseman line 258`, Proposition 4.4, pp.297–298, gives the relative-endpoint generic-isotopy input; Proposition 8.1, p.309, is its curve application. The family must stay parameter preserving, as the README explicitly requires. Golubitsky–Guillemin II.4.13 was not readable; none of the collar/coupon adaptations was certified from that inaccessible theorem. |
| 1.4 Typed local move templates | `reshetikhinTuraev lines 506,516`, Lemmas 5.2–5.3, p.13, and Figure 8, pp.14–15, give generators/relations for their colored ribbon graphs. `line 540`, p.15, supplies the rigid-rectangle coupon argument, not a relative family theorem. `selinger line 1212`, Lemma 4.27, p.29, supplies the extra ribbon relation. |
| 1.5 Morse words | RT Lemmas 5.2–5.3 at the preceding locators support elementary decomposition and the ribbon relation method. `roseman line 733`, p.309, supplies the closed curve event theorem. The general collared/coupon statement is explicitly assigned to §§1.1–1.4. |
| 2.1 The planar comparison | `planarDiags line 935`, Theorem 1.5, p.1.30, gives freeness for tensor schemes; its proof begins with restriction of tensor functors to interpretations. `selinger lines 419,431`, p.11, states the equality theorem and the progressive-isotopy restriction. The README retains progressiveness and non-strict target comparisons. |
| 3.1 The spatial comparison and braid category | `selinger lines 667,677`, Theorem 3.7/Caveat 3.8, p.16, requires smooth progressive graphs and continuously varying tangents. `gtcII lines 126–150`, p.4, gives progressive polarized spatial diagrams and the configuration-space braid category. The published Joyal–Street theorem is uncertified, not independently verified through the survey. |
| 4.1 Winding normalization and planar duality | `planarDiags line 1981`, Theorem 2.7, pp.2.33–2.34, is the free autonomous category theorem for autonomous tensor schemes, with the earlier PL convention. `selinger lines 823,834,843`, pp.19–20, supplies the statement, PL caveat and one-sided embedding argument. Smooth comparison and labelled coupon transport remain owned targets. |
| 5.1 Pivotal reduction and two closures | `selinger lines 993–1014`, pp.23–24, supports parity reduction and states the restriction of the Freyd–Yetter proof to simple/unary signatures. The two trace conventions resolve independently to PivotalSpherical Layer 2. Freyd–Yetter's primary proof was not readable. |
| 6.1 Regular isotopy and the derived twist | `selinger lines 1181–1205`, Theorem 4.23, Caveat 4.24 and Remarks 4.25–4.26, pp.28–29, distinguish regular isotopy from arbitrary spatial isotopy and do not impose sphericity. The order-three pivotal countermodel computes the difference. Freyd–Yetter remains uncertified. |
| 7.1 Framed tangles and the ribbon comparison | `selinger lines 1212,1248,1252`, pp.29–30, gives ribbon compatibility, framed coherence and the category-generated limitation of Shum's theorem. RT's coupon argument is a supporting geometric input. Shum's primary theorem and proof remain uncertified. Arbitrary arity and functor-groupoid compatibility are owned extensions. |
| 8.1 Evaluation and target functoriality | `reshetikhinTuraev line 458`, Theorem 5.1, pp.12–13: ribbon Hopf algebra over a field, finite-dimensional module colors, coupon intertwiners and a uniquely prescribed tensor functor. The README calls this the Hopf-algebra instance; the general-target theorem is derived from the six local universal properties. |
| 8.2 Closure, mirrors and scalar normalization | RT Theorem 5.1 and Lemmas 5.2–5.3 support local evaluation and isotopy. Sphericity/traces come from PivotalSpherical Layers 2/10, not from an unstated field-free version of RT. The new normalization explicitly assumes scalar twist and unit dimension. Its R1 factors are checked below. |

Additional source check: `gtcII lines 429–467`, pp.10–11, concerns pivotal structures/strictification, not the numbered autonomous Theorem 2.7 in the other manuscript. The bibliography keeps the two works distinct. The full arbitrary-arity extension is expressly distinguished from the category-generated literature at README:1308–1317.

### Pins, native definitions and duplication by object

Mathlib pin: `f6090c7095e1e56b3464c1daba5f24631f1290d2`. Tau Ceti pin: `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`. The following 16 object groups were opened at those pins; paths are relative to their library repositories.

| Object/declaration | Pinned file and line | Contract checked |
| --- | --- | --- |
| FreeMonoidalCategory.projectObj | `Mathlib/CategoryTheory/Monoidal/Free/Basic.lean:283` | Recursion on object generators, unit and tensor; no generating coupons. |
| FreeMonoidalCategory.project | Same file:361; monoidal instance:367 | Actual structural evaluation into a possibly non-strict monoidal target. |
| FreeMonoidalCategory.subsingleton_hom | `Mathlib/CategoryTheory/Monoidal/Free/Coherence.lean:313` | Thinness of this structural category, not of an arbitrary-signature category. |
| Functor.Monoidal | `Mathlib/CategoryTheory/Monoidal/Functor.lean:389` | Lax/oplax data with inverse equations; no strict-target restriction. |
| NatTrans.IsMonoidal | `Mathlib/CategoryTheory/Monoidal/NaturalTransformation.lean:46` | Unit and tensor compatibility of a natural transformation. |
| BraidedCategory; Functor.Braided | `Mathlib/CategoryTheory/Monoidal/Braided/Basic.lean:49,530` | Braiding isomorphisms and native strong braided functors; no symmetry axiom. |
| ExactPairing | `Mathlib/CategoryTheory/Monoidal/Rigid/Basic.lean:77` | Fields have types coevaluation 𝟙→X⊗Y and evaluation Y⊗X→𝟙, with both triangle identities. No nonzero-dimension hypothesis. |
| rightAdjointMate; leftAdjointMate | Same file:295,299 | Actual morphism direction Y*→X* for f:X→Y; not scalar conjugation. |
| rightDualFunctor; leftDualFunctor | `Mathlib/CategoryTheory/Monoidal/Rigid/Functor.lean:57,43` | Codomain is (Cᵒᵖ)ᴹᵒᵖ; no pivotal structure is bundled. |
| BraidGroup; sigma | `TauCeti/GroupTheory/SpecificGroups/Braid/Basic.lean:97,104` | Artin type A on Fin(n−1). Natural subtraction leaves no generators at n=0,1. |
| exponentSum_sigma; permHom_sigma | Same file:151,308 | Positive generator has exponent 1 and adjacent-transposition permutation. |
| BraidWord.toBraid; toBraid_append | `TauCeti/GroupTheory/SpecificGroups/Braid/Word.lean:57,72` | List product; appending represents multiplication in the displayed order. |
| overPair_closure; crossingSign_closure | `TauCeti/KnotTheory/BraidWord/PDCode.lean:442,484` | Positive letter has the selected over-pair and sign +1. |
| writhe_closure | Same file:491 | Native closure writhe is exponent sum, including empty words. |
| SmoothLinkEmbedding | `TauCeti/KnotTheory/SmoothLink/Basic.lean:61` | Fin n-indexed circle embeddings with pairwise disjoint ranges; no coupons, interval endpoints, collars or framing fields. |
| SmoothEmbedding.SmoothAmbientIsotopic | `TauCeti/Geometry/Manifold/SmoothEmbedding/SmoothAmbientIsotopy/Basic.lean:72,84` | Existence of a diffeotopy with specified final pointwise transport; does not impose this roadmap's relative/progressive/framing conditions. |

Object searches covered the free-category structures, tensor morphism generators, congruences, duals, Drinfeld comparisons, coupon/tangle geometry, framing, braids and generic-position machinery, rather than just proposed names. No native free ribbon/pivotal/coupon-isotopy category was found. The existing Drinfeld center is a different object. Native braid representations and link diagrams do not supply these universal geometric categories.

The roadmap service's focused search covered main and its open-head index; the board's package READMEs were also searched. Relevant ownership is already concentrated in the seven contracts below. No competing construction in the provided new-roadmap heads was established. A service hit in an unprovided fileless open proposal was not used as a supplier or certified for ownership. The report makes no ownership claim for such unprovided files.

### Cross-roadmap contracts resolved at main

Main was checked at `fa41b374`. Revisions of existing roadmaps were not substituted for their main-branch contracts. PivotalSpherical and TemperleyLieb were also read through the roadmap service; their shape and the main KhovanovHomology roadmap supplied the comparison examples for the README review.

| Roadmap and consumed part | Resolved main file/line | Boundary confirmed |
| --- | --- | --- |
| PivotalSpherical Layers 0–2 | `TauCetiRoadmap/PivotalSpherical/README.md:257,283,318` | Dual/double-dual comparisons, pivotal functors, torsor and traces are owned there. §0.3 adds the Drinfeld compatibility rather than assuming a nonexistent pinned declaration. |
| PivotalSpherical Layers 7,10 | Same file:477,562; central equivalence:609; ribbon/spherical implication:615 | Representation rigidity and the chosen twist/pivotal formula resolve; ribbon implies spherical without the false unrestricted converse. |
| TemperleyLieb Layer 2 | `TauCetiRoadmap/TemperleyLieb/README.md:368` | Generic monoidal generators, relations and strong-functor universal property. Its extra circle-centrality relation is explicitly excluded from this free theory. |
| KhovanovHomology G | `TauCetiRoadmap/KhovanovHomology/README.md:343,388,410,430` | Shared finite-order jet/interpolation floor, compact supported relative ambient extension and labelled closed-link projection/PL bridge. Diagram collar/coupon/framing extensions are assigned locally. |
| GeometricTopology Layers 1–4 | `TauCetiRoadmap/GeometricTopology/README.md:177,206,219,289,357,409,442` | Collars, gluing, tubular neighborhoods, embedding/isotopy foundations and knot presentations. Its smooth-family map requires compact M; local ambient extension here comes from Khovanov G. |
| DifferentialGeometry §§3.2,3.3,3.5,10.2 | `TauCetiRoadmap/DifferentialGeometry/README.md:379,388,400,884` | Maximal/time-dependent flows and Sard; finite dimension and support/confinement assumptions remain in the consuming route. |
| MorseTheory M1,M3 | `TauCetiRoadmap/MorseTheory/README.md:90,430` | Morse charts, approximation and fixed-neighborhood relative statements. Birth/death families and coupon events are additional local targets. |
| QuantumGroups Q8 | `TauCetiRoadmap/QuantumGroups/README.md:593,730–772` | Consumer example, not a proof prerequisite; pivotal/spherical rather than a supplied braiding (R03). |

The citation resolver reported no unresolved cross-roadmap citations. It did not inspect pinned packages on its own host; the independent pin audit above supplies that check. No own fully qualified declaration can collide with another roadmap because this Suggested.lean declares none.

### Headline coverage

| README headline | Suggested.lean treatment and pin check |
| --- | --- |
| C1 monoidal geometric coherence and strong universal property | Lines 18–21 name the absent arbitrary-coupon free category and independent progressive planar quotient. Native structural coherence is cited, not re-stated. |
| C2 braided geometric coherence and Artin/geometric braid category comparison | Lines 22–25 distinguish native Artin groups from the absent colored geometric quotient and free braided category. |
| C3 autonomous winding coherence, including one-sided comparisons | Lines 26–28 name the missing free autonomous and winding-labelled planar categories. Integer lists alone are not a substitute. |
| C4 pivotal geometric coherence and closure comparison | Lines 29–31 name the missing pivotal structure and marked-coupon geometric categories; trace definitions are supplier-owned. |
| C5 braided-pivotal regular coherence | Lines 32–34 name the absent regular coupon quotient and pivotal/twist structures. |
| C6 ribbon coherence and Shum specialization | Lines 35–39 name the absent ribbon/framed tangle carriers, with collars, coupons and normals. |
| C7 evaluation, general RT, closure, mirror and normalized ordinary-knot invariant | Lines 40–44 name the missing source categories, evaluation and framing comparisons. Scalar arithmetic is correctly not substituted for the actual invariant. |
| C0 functor-level pivotal/twist equivalence | Lines 46–47 name the missing pivotal/twist/double-dual structures. |

No headline expressible at these pins through a few simple native-carrier definitions was found omitted. Rebuilding the entire geometric library in Suggested.lean would violate the acceptance-file rule. Zero admitted declarations means zero padding, lost hypotheses, sorry'd data or admitted examples.

### Adversarial computations

These rows are computations and negative controls, not proofs of the new general coherence or relative-geometry theorems. “Pass” means the stated claim survives the listed test. All 111 rows record values, and they cover all 16 numbered subsections, the separate coupon-normalization target, all move families, the headlines and every finding.

Models used: V is ordinary finite-dimensional ℚ-vector spaces with standard duality; P is complex representations of C₃ with pivot modified by its central generator, and χ(z)=ω, ω³=1, ω≠1. Q is finite-dimensional ℤ-graded ℚ-vector spaces with braiding factor 2^(ab) on degrees a,b, standard double dual and ribbon twist 2^(a²). These are mathematical test models, not claims of available pinned instances.

| Statement | Instances tried | Values computed on the two sides / control | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions: composition/tensor | Scalars f=2,g=3; two identity strands | Sequential 2·3=6; disjoint tensor 2·3=6; boundary lengths 1 versus 2 | Pass | None |
| Conventions: positive crossing and mirror | t=1/2 in the two displayed paths | Over/under points (0,1/2,1),(0,1/2,−1); depth gap 2, mirror gap −2 | Pass | None |
| Conventions: crossing sign | Tangents (π,1,0),(−π,1,0) | det(v_over,v_under,e_z)=2π; reversed depth gives −2π | Pass | None |
| Conventions: positive framing | Normal loop in basis (e_z,e_x) | Quarter-time coordinates (1,0),(0,1),(−1,0),(0,−1),(1,0); degrees +1 and −1 under time reversal | Pass | None |
| 0.1 finite signatures/unit | Empty object and coupon sets | Boundary length 0; identity evaluates 1; no strand is introduced | Pass | None |
| 0.1 ordered ports | Coupon (A,B)→C | Correct arities (2,1); atomizing A⊗B gives (1,1), a different signature | Pass negative control | None |
| 0.1 nullary coupons | Label 2 versus empty diagram | Values 2 and 1 although both boundaries have length 0 | Pass | None |
| 0.1 renaming/substitution units | Rename a→b; substitute identity into scalar 2 | Arity (0,0) remains (0,0); resulting scalar 2=2 | Pass | None |
| 0.1 substitution associativity | Scalar composites 2,3,5 | (2·3)·5=30=2·(3·5) | Pass | None |
| 0.1 non-strict normalization | ((A⊗B)⊗C) versus A⊗(B⊗C) | Both words [A,B,C]; comparison sends ((1,2),3) to (1,(2,3)), not literal tuple equality | Pass | None |
| 0.2 least congruence/no extra equations | Two nullary generators valued 2,3 | Distinct evaluations 2≠3 exclude their equality | Pass | None |
| 0.2 descent iff relations respected | Add equality of those generators | Evaluation 2,3 fails since 2≠3; evaluation 2,2 satisfies 2=2 and descends | Pass both directions | None |
| 0.2 adjoining relations twice | Three nullary generators a,b,c; a=b then b=c | Final quotient has one generator class, same as adjoining both relations together | Pass | None |
| 0.2 substitution of equations | Substitute values a=2,b=2 or a=2,b=3 into a=b | Relation images 2=2 versus 2≠3; only first is allowed | Pass | None |
| 0.2 structural separation | B₂, σσ⁻¹ versus σ² | Exponents 0=identity's 0; 2≠identity's 0 | Pass | None |
| 0.3 extension on generators/composition | Scalar labels 2 and 3 | Image of first coupon 2; image of composite 6=2·3 | Pass | None |
| 0.3 chosen-dual comparison | Source pairing 1; target pairing 2 | δ=1/2; target evaluation after δ gives 2·(1/2)=1; wrong δ=1 gives 2≠1 | Pass | None |
| 0.3 Drinfeld equation, identity | Identity functor on ℚ² | Both paths send (2,3) to [φ↦2φ(e₁)+3φ(e₂)] | Pass | None |
| 0.3 Drinfeld equation, changed choices | Target pairings 2 at X,3 at X* | κ=(1/3)/(1/2)=2/3=u_target; missing inverse gives 1/6≠2/3 | Pass | None |
| 0.3 equivalent b equation | Same choices | κ·b_target=(2/3)(3/2)=1=F(b_source) | Pass | None |
| 0.3 composite comparisons | Pairings (1,1)→(2,3)→(5,7) | κ_GF=5/7; κ_Fκ_G=(2/3)(15/14)=5/7 | Pass | None |
| 0.3 unit and transformation compatibility | Standard unit; natural comparison scalar 3 in one dimension | Unit 1=1; comparison paths 3·(2/3)=2=(2/3)·3 | Pass | None |
| 0.3 twist iff pivotal preservation | Identity underlying functor, standard→P | Twist test 1≠ω; pivotal test 1≠ω; equal choices give 1=1 for both | Pass both directions on tests | None |
| 1.1 incidence carrier | Empty, nullary cell, vertex-free circle | (edges,coupons,vertices)=(0,0,0),(0,1,0),(1,0,0); circle retains one component | Pass | None |
| 1.1 realization | Same three objects | Empty image ∅; one disk with scalar label 2; unit circle radius 1 and one component | Pass | None |
| 1.1 gluing/subdivision | Two identity intervals stacked, juxtaposed, or empty glued | Stacking yields 1 interval after suppression; juxtaposition 2; empty gluing leaves count 1 | Pass | None |
| 1.1 associativity/interchange | Three stacked intervals; disjoint scalar coupons | Both associations yield 1 interval; disjoint exchanges evaluate 6=6 | Pass | None |
| 1.1 restriction/relabelling | Two circles labelled a,b; select first or swap | Restriction has 1 circle labelled a; swapping twice returns labels (a,b) | Pass | None |
| 1.1 flat coupon relative control | Affine identity square | Jacobian determinant 1 before/after; all four corners fixed | Pass | None |
| 1.1 graph flattening | z=ε(x²+y²), at (1,0) | Heights ε→0; projected Jacobian 1 throughout, center height 0 throughout | Pass | None |
| 1.1 front-facing versus framed turn | Affine coupon rotated through πt | Projected determinants 1,0,−1 at t=0,1/2,1; middle excluded in C2/C5, allowed event in C6 | Pass | None |
| 1.2 subdivision/PL bridge | Segment [0,1] subdivided at 1/2 | Image [0,1] on both sides; lengths 1=1/2+1/2 | Pass | None |
| 1.2 embedding separation | Compact pieces distance 1, displacement <1/4 each | New distance >1−1/4−1/4=1/2; zero original distance has no positive bound | Pass | None |
| 1.2 nonzero normal openness | Minimum norm 1, error <1/2 | New norm >1/2; zero field gives 0 and is excluded | Pass | None |
| 1.2 source generality | Circle versus interval with coupon | External boundary sizes 0 and 2; coupon counts 0 and 1 | Only first meets Roseman closed-source hypotheses | None |
| 1.2 isotopy versus embedded trace | F(x,t)=(e(x),t), G(x,t)=(e(x),t+εt(1−t)), 0<ε<1 | At t=1/2 time coordinates 1/2 and 1/2+ε/4; derivative ≥1−ε>0 but G is not level preserving | README explicitly avoids this inference | None |
| 1.3 progressive openness | y=s versus y=s³−εs | First derivative 1→>1/2 under stated perturbation; cubic derivative 0→−ε at s=0 | Pass; previous counterexample excluded | None |
| 1.3 same-parameter multijets | dim P=1,d=1,s=0,1,2,3 | Dimensions 1,2,3,4; independent-parameter miscount at s=2 is 4 instead of 3 | Pass | None |
| 1.3 mixed configurations | One edge point, one coupon point, one parameter | Dimension 1+1+2=4; treating both as edges gives 3 | Pass | None |
| 1.3 cusp codimension | γ_t(s)=(s²,s³−ts,s) | At 0 projected derivative (0,0), full derivative (0,0,1); domain/codimension 2/2 | Allowed only in appropriate rows | None |
| 1.3 double tangency | Branches y=0 and y=x²−t | Intersections 0,1 tangent,2 for t<0,=0,>0; domain/codimension 3/3 | Pass | None |
| 1.3 triple and higher events | Lines x=0,y=0,y=x+t; four planar values | Triple: 1 triple at t=0, 3 doubles otherwise; dimensions 4−4=0, four-point 5−6=−1 | Pass dimension tests | None |
| 1.3 height birth/death | y=s³−ts, t=−3,0,3 | Critical counts 0,1 degenerate,2; at t=3 points ±1 have heights ∓2; third derivative at 0 is 6 | Pass | None |
| 1.3 exchange of heights | Feature heights t,−t | Difference 2t; one equality at t=0, opposite order on either side | Pass | None |
| 1.3 local finiteness before compactness | Event set {1/n} | Infinitely many events accumulate at 0; every neighborhood of 0 contains infinitely many | Correctly excluded by required local finiteness | None |
| 1.3 relative support/germs | Perturbation χ(s)εs with χ=0 near endpoints, χ=1 near 0 | Endpoint perturbation 0; derivative perturbation at 0 equals ε | Pass | None |
| 1.4 independent-feature move | f=2,g=3 | (2⊗1)(1⊗3)=6=(1⊗3)(2⊗1) | Pass | None |
| 1.4 rebracketing and units | Three tensor factors; empty word | Both normalized lengths 3; unitor leaves length 1 rather than 2 | Pass | None |
| 1.4 crossing inverse versus opposite braiding | Q, degrees 1,2 | c=4 swap; inverse=(1/4) swap gives 1; opposite positive crossing gives 16≠1 | Pass | None |
| 1.4 Yang–Baxter | Q, three degree-1 lines | Scalar 2³=8 on both sides; permutation (13) on both sides | Pass | None |
| 1.4 hexagons/unit cables | Q, degrees 1,1,2 and unit degree 0 | 2^(1·3)=8=2·4; crossing with degree 0 is 1 | Pass | None |
| 1.4 crossing naturality | Q degrees 1,2; scalars f=2,g=3 | (2·3)4=24=4(3·2) | Pass | None |
| 1.4 snakes, including zero object | V=ℚ² or 0 | Both snake maps send (2,3) to (2,3); on 0 both maps are the unique map; zero pairing on ℚ² sends (2,3) to (0,0) | Pass | None |
| 1.4 mate slide | f(1)=(2,3), φ=(5,7) | φ(f(1))=10+21=31=(f*φ)(1) | Pass | None |
| 1.4 half/full rotation | P, f=2 id_χ | Single/double mates scalar 2; naturality 2ω=ω2; unrelated label 3 gives 3ω≠2ω | Pass | None |
| 1.4 twist balance/unit | Q degrees 1,2 | θ₃=512=θ₁θ₂c₁₂c₂₁=2·16·4·4; θ₀=1 | Pass | None |
| 1.4 spatial coupon turn | Q degree 1, f=3 | θf=2·3=6=fθ; multiport balance gives 512 on both routes | Pass on algebraic template | None |
| 1.4 ribbon compatibility | Q degree ±1 versus P character | Q: θ₋₁=2=(θ₁)*; P: θ_χ*=ω²≠ω=(θ_χ)* | Pass; C5 must not impose C6 relation | None |
| 1.4 inverse normal twists | Degree +1 followed by −1 | Total degree 0=constant normal; endpoints agree even for degree +1 alone | Pass | None |
| 1.5 Morse cuts/refinements | Identity strand cut into thirds | Three identity slabs compose to 1 identity; exceptional-event count 0 | Pass | None |
| 1.5 empty word versus nullary feature | Empty boundary, label 2 | Feature counts 0 versus 1; evaluations 1 versus 2 | Pass | None |
| 1.5 composition/tensor | Two scalar slabs 2,3 or disjoint rectangles | Composite 6; exchanged independent word also 6 | Pass | None |
| 1.5 non-independent features | Adjacent generators in B₃ | Permutation products (12)(23)=(123) and (23)(12)=(132), unequal | Pass negative control | None |
| 2.1 planar coherence headline | Empty signature and two nullary generators | Empty value 1; labels 2≠3 remain distinguishable; disjoint products 6=6 | Pass discriminating cases | None |
| 2.1 structural specialization | Object-only A⊗𝟙→A | Every structural arrow has the same value (a,*)↦a; native hom-set is subsingleton | Pass; supplier cited | None |
| 2.1 tensor/word strictification | Identity tensor empty versus two identities | Boundary lengths 1 and 2; parenthesized triples normalize to [A,B,C] | Pass | None |
| 2.1 independent versus serial coupons | E₁₂,E₂₁ on ℚ² | Products E₁₁ and E₂₂; on e₁ values e₁ and 0 | Pass; serial exchange disallowed | None |
| 3.1 braid headline, degenerate counts | n=0,1,2 | Fin(n−1) has size 0,0,1; B₀,B₁ trivial; B₂ positive generator exponent 1 | Pass | None |
| 3.1 pure braid separation | B₂, σ² and identity | Permutations both id; exponents 2 and 0 | Pass | None |
| 3.1 nonabelian control | Adjacent B₃ generators | Permutations (123)≠(132) despite both exponent sums 2 | Pass | None |
| 3.1 composition convention | Words [σ],[σ⁻¹] | toBraid append=σσ⁻¹=1; exponent 1+(−1)=0 | Pass | None |
| 3.1 horizontal/colored boundary | Counts 1,2; colors A,B | Juxtaposition length 3; one crossing changes ordered colors (A,B)→(B,A) | Pass | None |
| 4.1 rigid headline/empty dual | Empty word | Right and left dual words both []; length 0 | Pass | None |
| 4.1 integer winding normalization | w=[(a,0),(b,2)] | R(w)=[(b,3),(a,1)]; L(R(w))=w; R(R(w))=[(a,2),(b,4)]≠w | Pass | None |
| 4.1 dual tensor/composition | Two letters; matrices F=[[1,1],[0,1]], G=[[1,0],[1,1]] | R(uv)=R(v)R(u); (GF)ᵀ=FᵀGᵀ=[[1,1],[1,2]] | Pass | None |
| 4.1 cup/cap and winding sign | One-dimensional chosen pair at level n | Cup levels (n,n+1), cap order (n+1,n); snake scalar 1·1=1; zero evaluation gives 0 | Pass | None |
| 4.1 closed-wire admissibility | Circle without coupons | Integer half-turn sum +2 or −2, not 0; modulo 2 it is 0 | Pass; rigid trace not invented | None |
| 4.1 changing duality choice | Coevaluation 2, evaluation 1/2 | Snake 2·(1/2)=1; changing coevaluation only gives 2≠1 | Pass | None |
| 4.1 one-sided finite-term test | Levels −2,1 shifted by +2 | Levels 0,3 are nonnegative, parities unchanged; no equation −2=0 is asserted | Pass | None |
| 5.1 pivotal headline/parity reduction | Levels 0,2 on P character | Both parity 0; comparison scalar j_χ=ω≠1 | Pass | None |
| 5.1 two trace closures | P, id_χ and unit | Left ω⁻¹=ω², right ω; unit 1=1 | Pass; no sphericity added | None |
| 5.1 full rotation/coupon mark | 2 id_χ versus 3 id_χ | Correct transported scalar 2, naturality 2ω on both paths; replacement 3ω differs | Pass | None |
| 5.1 category-generated specialization | Unary composites 2,3 versus (2,1)-port coupon | Composite label 6; port counts (1,1) versus (2,1), so unary source does not cover arbitrary arity | Pass scope distinction | None |
| 6.1 regular coherence headline | Immersed circle and circle with added positive turn | Tangent degrees 1 and 2; difference 1 persists under regular homotopy | Pass | None |
| 6.1 derived twist, not ribbon | P symmetric braiding | Double braid 1; θ_χ=ω, θ_χ*=ω², dual morphism (θ_χ)*=ω | Pass | None |
| 6.1 balance and naturality | χ⊗χ; scalar 2 | ω²=(ω·ω)·1; 2ω=ω·2 | Pass | None |
| 6.1 left/right trace separation | P with χ | ω²≠ω although braiding is symmetric | Pass | None |
| 7.1 ribbon headline/normal data | Straight normal, rotating normal; widths 1/10,1/20 | Degrees 0,+1; positive width change preserves +1; width 0 has no ribbon neighborhood | Pass | None |
| 7.1 framed R1 correction | One component: (w,k)=(0,0),(1,−1),(1,0) | Totals 0,0,1; first two agree, third adds θ | Pass | None |
| 7.1 actual twist separation | Q color degree 1, unknot framings 0,+1,−1 | RT values 1,2,1/2 | Pass | None |
| 7.1 empty boundary and closed components | Empty link; unit-colored unknot; V=ℚ² unknot | Values 1,1,2; equality of first two values does not identify their geometric components 0,1 | Pass | None |
| 7.1 quotient genuinely adds ribbon law | P character | Imposed relation would equate ω² and ω; this model cannot descend | Pass | None |
| 7.1 Shum boundary specialization | Empty, positive point, positive/negative pair | Boundary words [],[+],[+,−], lengths 0,1,2 | Pass | None |
| 8.1 evaluation headline | ℚ² identity/snake; Q inverse crossing pair | Both vector maps (2,3)↦(2,3); crossing pair scalar 4·(1/4)=1 | Pass | None |
| 8.1 target functor/signature substitution | Identity functor; scalar labels 2,3 | Identity preserves value 2; substitution composition gives 6 on both routes | Pass | None |
| 8.1 twist inverse and nullary labels | Q degree 1; label 2 | Twist pair 2·(1/2)=1; nullary value stays 2 rather than empty value 1 | Pass | None |
| 8.1 forgetting framing limitation | Q degree 1, unknot framings 0,+1 | Same unframed knot, values 1 versus 2 | Pass negative control | None |
| 8.2 trace closure/recutting | V=ℚ², f=2 id | Left closure=4=right closure; moving the cut retains 4 | Pass | None |
| 8.2 color reversal versus scalar dual | P character; scalar ω | Character dual evaluates ω⁻¹ at z; dual of scalar morphism remains ω | Pass | None |
| 8.2 mirror structure | Q degree 1 | Braiding/twist (2,2) become (1/2,1/2); mirroring twice restores (2,2) | Pass | None |
| 8.2 normalized unknot | ℚ², d=2,q=1, RT=2,w=0 | d⁻¹q⁰RT=(1/2)·1·2=1 | Pass | None |
| 8.2 positive/negative R1 | d=3,q=2; (w,RT)=(1,6),(2,12),(0,3) | Normalized values (1/3)(1/2)6=1, (1/3)(1/4)12=1, (1/3)3=1 | Pass | None |
| 8.2 R2/R3 normalization | Inverse crossing pair; triple crossing in Q | Writhe changes 0 and 0; evaluation factors 1 and 8=8; normalized value unchanged | Pass | None |
| 8.2 zero/nonunit dimension | Zero V over ℚ; d=2 over ℤ | d=0 nonunit, so excluded; total inverse would yield 0≠1. In ℤ, 2 is not invertible | Pass | None |
| 8.2 zero ring | Unique scalar ring, 0=1 | The sole unit has value 0=1; every normalization factor/result is that same element | No unguarded nonzero-field inference | None |
| 8.2 mirror correction | w=1,q=2 and mirrored w=−1,q=1/2 | Original 2⁻¹=1/2; mirrored (1/2)^1=1/2; diagram-only mirror gives 2 | Pass | None |
| 8.2 Hopf trace | V,W dimensions 2,3; Q degrees 1,1 | V: Tr(double braid)=6; Q: trace=2·2·1=4 versus unlink value 1 | Pass | None |
| R01 source records | Ten bibliographic works | Required records 10; actual records 0 | Documentation defect | Add manifest |
| R02 page locator | Manuscript Thm.1.5 and survey Thm.3.1 | Actual pages 1.30 and 11; pages supplied at these citations 0 | Documentation defect | Add pages/version |
| R03 consumer structure | Q8's trivial representation | Pivot 1, left/right dimensions 1,1; braided-construction targets in Q8: 0 | Consumer description overstates its citation | Say pivotal/spherical |

All README Checks were recomputed in the applicable models. Arithmetic-specific stress cases such as ramified primes, inseparable extensions and residue-field cardinalities do not enter these category/geometric statements; relevant degeneracies are empty signatures, zero ports, zero objects, zero/nonunit dimensions, small braid groups, non-strict targets and incompatible duality choices.

## Not verifiable

- **joyalStreetI:** the service classified DOI 10.1016/0001-8708(91)90003-P as paywalled/uncertified. The exact published Theorems 1.2 and 3.7 and their page numbers were not read. The PlanarDiags manuscript verifies its own planar theorem; Selinger and GTCII do not certify the unread published proof.
- **freydYetter:** DOI 10.1016/0022-4049(92)90018-B was classified uncertified. Theorems 3.8 and 4.4 were not read in the primary paper. The category-generated limitation was verified in Selinger, not independently in Freyd–Yetter.
- **shum:** DOI 10.1016/0022-4049(92)00039-T was classified uncertified. Theorem 6.1's primary text was not read; its cited scope is independently reported by Selinger's Caveat 4.31.
- **golubitskyGuillemin:** DOI 10.1007/978-1-4615-7904-5 was classified uncertified. The precise hypotheses and page of II.4.13 were not certified. The roadmap's relative coupon adaptations are locally owned rather than inferred from that theorem.
- **yetter:** DOI 10.1142/4542 reached a publisher HTTP 403. Chapters 7–9, Theorem 9.1 and Lemma 9.12 were not readable. This failed attempt remains in the missing-reference record. No theorem was guessed from its title.
- **New geometric extensions:** the source sample and finite computations do not prove the compact-family coupon normalization, relative smooth–PL equivalence, full stratified event theorem or arbitrary-arity coherence. They are substantial explicit targets with intermediate constructions and suppliers, not claimed existing theorems. Acceptance of this roadmap does not certify completed proofs of them.
- **Unprovided open-proposal files:** no ownership certification is made for open proposals without files supplied in the brief. No such proposal was used to satisfy a dependency.

## Source issues

The Roseman page was checked in the rendered publisher PDF, not inferred solely from OCR. Its trace issue does not refute the revised roadmap: §1.2 expressly requires preservation of the evolution parameter. The native-source item uses “mathlib-pin” for the exact Mathlib revision stated above.

- **Error** in roseman at Proposition 4.5, printed p.298: the source says every sufficiently C¹-close proper embedding of an isotopy trace is an isotopy; it should be level preserving or explicitly reparameterized to become so; affects a stated result.
- **Misprint** in roseman at proof of Proposition 4.5, printed p.298: the source says fibres are taken after composing the time projection before the embedding; it should be the time projection after the embedding; affects the proof.
- **Misprint** in mathlib-pin at rightAdjointMate docstring, Mathlib/CategoryTheory/Monoidal/Rigid/Basic.lean:294: the source says the right mate of f:X→Y has direction X*→Y*; it should be Y*→X*, as the actual declaration correctly states; affects nothing.
