<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/173#issuecomment-6331652781 -->
Red team round 1 pass a (codex) of cc2ed2d

Verdict: needs_changes

1. **F01** (P3) Every Lean example is admitted

   **Location:** `packages/QuiverRepresentationsPartII/Suggested.lean:55`, and all later examples: `by sorry`.

   **Claim:** The examples exercise the roadmap definitions and pin their conventions.

   **Witness:** Every `example` in the file ends in `sorry`, including the non-homogeneity control at line 210 and matching rejection at line 337. There are no proved examples.

   **Exact repair text:** Replace each retained example's `by sorry` with a complete proof. Retain at most two discriminating proved examples per kept definition; combine related assertions where appropriate. Convert any boundary case whose proof requires future API into a named theorem target, also specified in the README.

2. **F02** (P3) Statable checks are missing from Suggested.lean

   **Location:** `packages/QuiverRepresentationsPartII/README.md:290`: “In dimension zero the whole one-point space is open, dense, and irreducible”; also lines 95, 123, 460 and 518.

   **Claim:** These are the advertised boundary and convention checks for the kept definitions.

   **Witness:** No example covers dimension-zero `polynomialTopology`, empty `maximalPart`/`remainder`, an empty off-support `cutPart`, shift length preservation, the three-singleton matching, or construction of the displayed valid `GridPath`. All their carriers already exist in Suggested.lean.

   **Exact repair text:** Add proved, bundled examples for: `Interval.length ((intSeg 2 2).shift (-1)) = 3`; `maximalPart 0 = 0 ∧ remainder 0 = 0`; `cutPart {intSeg 0 0, intSeg 1 0} 3 = 0 ∧ chainWeight {intSeg 0 0, intSeg 1 0} 3 = 0`; the three stated whole-space properties of `polynomialTopology 0`; the size-two matching on the three successive singleton labels (including reuse of the middle label in opposite roles); the missing-grade submodule equality `(constantSpace 2 3).grade 4 = ⊥`; and the explicit `GridPath 3 1` with vertices `(2,1),(1,1),(1,2),(1,3)`. Merge assertions into the relevant examples to respect the two-example limit. Add a proved two-matrix commutator/trace example for the sign convention at README line 35.

3. **F03** (P3) The stated library pins are not the supplied pins

   **Location:** `packages/QuiverRepresentationsPartII/README.md:45` and `:59`: “The baseline is Mathlib `082e2d37…`” and “At Tau Ceti `f7904748…`”.

   **Claim:** These commits identify the library baseline against which the supplier contracts and signatures are suggested.

   **Witness:** `lake-manifest.json:8` pins Tau Ceti to `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`; `lake-manifest.json:18` pins Mathlib to `6b7abb3c7686292736be2955bd3eb9ebf63b456a`.

   **Exact repair text:** Replace the two baseline commit IDs by the supplied manifest's Tau Ceti and Mathlib revisions, respectively. Replace “additional implementation supplier beyond this baseline” at line 71 with “pinned implementation supplier”, since the orbit declaration exists at the actual Tau Ceti pin. Do not change the manifest.

4. **F04** (P3) Some checks do not test the defining condition

   **Location:** `packages/QuiverRepresentationsPartII/Suggested.lean:381`: `p.vertex (Fin.last 3) = (1, 3)`; `:276`: `LinearMap.range (0 : Module.End ℂ (Fin 0 → ℂ)) = ⊥`.

   **Claim:** These are checks for the grid-path and admissible-image layers.

   **Witness:** Line 381 is exactly the `GridPath.finish` field. Line 276 mentions no roadmap definition and holds independently of any image-admissibility construction. The single occurrence test at line 112 uses identical intervals, so a constant selector passes.

   **Exact repair text:** Delete the library-only range example. Replace the endpoint-field example by a proved construction and weighted calculation for the explicit path in §4.5, and add README negative controls rejecting a wrong initial vertex and a non-unit step. For occurrence labels add the check that the multiset of values for `[0,0]+[2,2]` is exactly that input, and verify each distinct interval's count. Add a PairIso negative control comparing zero and nonzero arrows on the same two-grade space, so dropping `intertwine` fails. Supply three discriminating README checks for each definition, bundling their Lean assertions into at most two examples where statable.

5. **F05** (P3) The file contains targets absent from the README and a forbidden name catalogue

   **Location:** `packages/QuiverRepresentationsPartII/Suggested.lean:256`, `:272` and `:421`.

   **Claim:** Suggested.lean records the README's named targets.

   **Witness:** Six Lean names are absent: `Space.Carrier`, `Direction.step`, `Direction.opposite`, `polynomial_irreducible`, `commuting_range_stable`, `totalLength_rightTruncate`. Lines 421–435 are a catalogue of undeclared names, expressly excluded by the signature-file contract.

   **Exact repair text:** Name the coordinate abbreviation `Space.Carrier` in §1.1 and the degree-step and direction-reversal maps `Direction.step` and `Direction.opposite` in §1.2. In §0.2 name the displayed length identity `totalLength_rightTruncate`; in §2.5 name affine-coordinate irreducibility `polynomial_irreducible` before specializing to centralizers. Remove the helper `commuting_range_stable` from Suggested.lean, retaining its proof obligation in §2.1. Delete the final catalogue at lines 421–435. Keep only declarations allowed by the headline/definition/example rule.

6. **F06** (P3) The source manifest is absent

   **Location:** `packages/QuiverRepresentationsPartII/README.md:687` (References); package file inventory at the reviewed head.

   **Claim:** The five referenced works support the target locators throughout the package.

   **Witness:** The head contains README.md, Suggested.lean, metadata.toml and review.json; it has no sources.toml. Thus none of AKY, MW, Z81, Z98 or DIL has the required citation, provenance and certification record.

   **Exact repair text:** Add `sources.toml` using schema `tauceti-roadmap-sources/v1`, with one entry for each of AKY, MW, Z81, Z98 and DIL, recording authors, title, year, exact version/locators, cited targets and the sources service's provenance/status fields. Record unavailable texts honestly; an HTML catalogue page is not the cited mathematical text.

7. **F07** (P3) Private chain predicates replace the pinned vocabulary

   **Location:** `packages/QuiverRepresentationsPartII/Suggested.lean:285` and `:299`; `packages/QuiverRepresentationsPartII/README.md:19`.

   **Claim:** The finite-poset layer follows the existing `IsChain` and `IsAntichain` interface.

   **Witness:** Both predicates are independently redefined by quantifiers. Mathlib already supplies `IsChain` in `Mathlib/Order/Preorder/Chain.lean:51` and `IsAntichain` in `Mathlib/Order/Antichain.lean:42`; the needed relations are already present here.

   **Exact repair text:** Define `IsInclusionChain A := IsChain Interval.included (A : Set Interval)` and `IsEndpointAntichain m A := IsAntichain (endpointBefore m) (A : Set (Fin m.card))`, or use those expressions directly. Use inclusion reflexivity and endpoint-order irreflexivity to expose the all-pairs formulations when needed. Cite the pinned definitions in the supplier contract.

8. **F08** (P3) The representation proof prescribes computational algorithms

   **Location:** `packages/QuiverRepresentationsPartII/README.md:624`: “Construct `mwLabel` by the finite recursive algorithm”; also the greedy procedure at line 632.

   **Claim:** A separately computed label and occurrence-selection algorithms are targets of this roadmap.

   **Witness:** Line 624 gives two executable choose/shorten/repeat procedures; line 632 specifies reverse-list processing and least-unused-index selection. The binding package contract excludes computational algorithms.

   **Exact repair text:** Replace the new algorithmic function `mwLabel` with mathematical recurrence and reinsertion theorems about the already defined geometric `dual`. State the required matching/exclusion property by quantification over occurrence matchings, not a greedy computation. Rename `mw_algorithm_reinsertion` to `dual_reinsertion`; combine `mwLabel_generic` with the recurrence proof and `mwLabel_representation` with `representation_duality_comparison`. Preserve the empty, repeated-occurrence and two-term checks and the exact MW locators. Remove both step-by-step algorithm descriptions.

9. **F09** (P3) A pull-request reference appears in the roadmap

   **Location:** `packages/QuiverRepresentationsPartII/README.md:19`: “Mathlib PR #40741”.

   **Claim:** The finite-poset API is specified through a numbered pull request.

   **Witness:** The numbered process reference is in the README itself, contrary to the binding package rule; the needed pinned `IsChain` and `IsAntichain` definitions can be cited directly.

   **Exact repair text:** Replace the first two sentences with: “For finite posets, use Mathlib's `IsChain` and `IsAntichain`. Establish weak duality for arbitrary chain covers and a disjoint chain partition attaining the antichain bound, then specialize these results to occurrence labels.” Keep the matching and weighted-chain comparison targets.

10. **F10** (P1) The pair layer depends on its own later finite-window adapter

   **Location:** `packages/QuiverRepresentationsPartII/README.md:163`: “the finite-window representation adapter specified in the parent supplier contract”; also lines 167, 177 and 181.

   **Claim:** §1.2 may consume the finite-window adapter before defining the pairs, nilpotence and isomorphisms used to construct it.

   **Witness:** §1.4 owns the integer-grading/window adapter and needs §1.3; §1.3 needs §1.2. The explicit §1.2 adapter prerequisite therefore gives §1.2 → §1.4 → §1.3 → §1.2. The parent supplies finite-quiver representations, not this adapter.

   **Exact repair text:** Replace §1.2's Needs line by “*Needs:* §1.1 and Tau Ceti's homogeneous-map API; nilpotence follows directly from the finite grading support.” Before §1.3, add the named target `finiteWindowEquivalence`: construct the equivalence between pairs supported in a specified finite integer window and representations of its oriented type-A path, and prove restriction/zero-extension compatibility under window enlargement, using §1.2 and the parent's Layer 1. Make §1.3 consume this target before defining `pairType`. In §1.4, use the already constructed window adapter to transport the parent's classification, rather than constructing that adapter there. Cite AKY §3.1, p.15 for the graded/finite-quiver comparison.

11. **F11** (P2) The comparison stops at the unramified rank-one application

   **Location:** `packages/QuiverRepresentationsPartII/README.md:608`: “For `F/ℚₚ` finite and any fixed unramified complex character χ”; also lines 3, 9 and 37.

   **Claim:** The final geometric/representation comparison is supplied only on unramified degree-one cuspidal lines.

   **Witness:** MW II.1, p.147 permits arbitrary cuspidal rank; II.12, pp.175–176 proves independence of that cuspidal label. A GL₂-supercuspidal label and interval `[0,1]` require a comparison on GL₄, which this adapter cannot express.

   **Exact repair text:** State the general target: “For a non-archimedean local field F, a unitary irreducible supercuspidal representation ρ of GL_d(F), d≥1, a real c, and an integral multisegment m, let `integralSegmentAdapter ρ c` send `[b,e]` to `[b+c,e+c]_ρ`. Prove `L(integralSegmentAdapter ρ c m) ≅ Z(integralSegmentAdapter ρ c (dual m))` on GL_{d·totalLength m}(F).” Retain the arbitrary unramified-character normalization as the d=1 application. Add the named comparison input `cuspidal_line_independence`, with the hypotheses and conclusion of MW II.12, pp.175–176, and use it to pass from the rank-one proof to the general statement of II.13. Cite SmoothRepresentationsOfLocalGroups SR.5.2 `segment-representations` and SR.5.3 `highest-derivative-adapter` for the existing arbitrary-rank carriers and involution. Add the GL₂-cuspidal/two-term GL₄ case and an equal-characteristic local field to the README checks; do not force these future representation carriers into Suggested.lean.

## Verified sound

**Coverage:** README.md: all 697 lines; Suggested.lean: all 437 lines. Read 121 Lean declarations: 46 real-bodied definitions, abbreviations, structures or inductives; 14 named theorem signatures; 61 anonymous examples. Read all 35 numbered README target blocks, containing 173 named or separately identified target entries, and inspected all 42 bold spans. None of those spans is an additional individually bold named target. Tested the mathematics of all 68 bullets under Checks, plus the conventions and interspersed examples. The examples have zero complete Lean proofs (R01).

**Sources and suppliers:** attempted all five cited works through the sources service; checked 38 cited locator groups in four legally readable works, listed below. Z81 remains uncertified. Also checked MW II.12, pp.175–176 for R11. Checked the three named supplying roadmaps and their corresponding sections/targets: QuiverRepresentations, AlgebraicVectorBundles, and SmoothRepresentationsOfLocalGroups. Searched all seven supplied sibling heads; there are zero direct supplier citations to those seven in this package and no overlapping ownership found there.

The supplied Mathlib and Tau Ceti declarations used by the package exist. In particular, homogeneity specializes the pinned predicate, the opposite centralizer adds the actual commutation equation, quiver decomposition retains occurrence multiplicities, and the orbit supplier is applied only after its constructibility, Noetherian-space and continuity hypotheses. The finite-support uniform nilpotence target is stronger than the pinned pointwise local-nilpotence theorem and does not duplicate it. The bundle supplier supplies bundle carriers and their section-valued interpretation; this package explicitly owns the additional scoped conormal comparisons.

The 14 Lean theorem statements have no mathematical counterexample in the audited contexts. All needed binder data is explicit or carried by real structures; there are no section variables silently dropped by a sorry proof. Finite coordinate presentations cover arbitrary finite-dimensional complex graded spaces up to a homogeneous basis. No sorry-valued data, `set_option`, `lemma`, `True` placeholder, imported roadmap module, or forced geometric/representation carrier was found. The existing easy layer milestones are stated; omitted duality, ramification and representation headlines require carriers not yet defined here. R05 identifies a helper that does not belong among the headlines.

Exhaustively checked all 1,001 multisets of cardinality at most four with interval endpoints in [−1,2], and 7,007 cuts with a in [−3,3]. The one-copy split, length decrement, maximal/remainder truncation identities, matching-plus-width identity, cut-width equality, and both empty/nonempty peeling branches had zero failures. These finite checks supplement the mathematical arguments; they do not certify the universal statements. Zero modules, empty labels, repeated intervals, missing grades, shifts in both directions, rank-one arrows and rectangular 2×3 blocks were also checked. Coefficients in the operator layers are explicitly ℂ, so zero-ring, inseparable and positive-characteristic coefficient counterexamples are outside those statements. Residue q=2 and q=3 do not invalidate the complex normalization; q=1 is excluded by the local-field hypothesis.

The reviewed commit is `cc2ed2d0bb78a3e57beb0bbe77336e65314f51c9`. Its diff from origin/main changes exactly README.md, Suggested.lean, metadata.toml and review.json within this package. No prior repair report was present in the reviewed package; its review.json contains no settled “not actionable in this package” finding. No package input was edited during this pass. No Lean build or elaboration was run.

### Dependency check

The requested checker exited 1 with exactly:

```text
NOT IN ORDER: QuiverRepresentationsPartII (insert it after its last supplier)
depcheck: 8 roadmaps, 49 edges, 1 problem(s)
```

There is no UPWARD or CYCLE line for this roadmap. The not-in-order line is not treated as a defect under the brief. This coarse roadmap-level check does not detect the internal subsection cycle in R10. EndoscopicTransferAndUnitaryTraceComparison is described as a possible consumer, not an input; its current text does not consume this package's comparison, so no cycle was inferred from that possibility. No prerequisite was moved to a later supplier.

### Supplier witnesses

| Contract | Checked location | Result |
|---|---|---|
| Parent path algebra/representation equivalence | `TauCetiRoadmap/RepresentationTheory/QuiverRepresentations/README.md:229`; pinned `TauCeti/RepresentationTheory/Quiver/Representation/AsModule.lean` | Left-module convention and finite-window applicability agree. The integer-window adapter remains local (R10). |
| Parent Krull–Schmidt | `TauCetiRoadmap/RepresentationTheory/QuiverRepresentations/Suggested.lean:128` and `:135`; pinned `TauCeti/RepresentationTheory/Quiver/Representation/KrullSchmidt.lean:85`, `:110`, `:148` | Finite length or finite vertices with pointwise finite dimension gives a finite indexed decomposition and multiplicity-preserving uniqueness. |
| Parent type-A classification | `TauCetiRoadmap/RepresentationTheory/QuiverRepresentations/README.md:348` and `:375` | The ADE positive-root correspondence applies over ℂ to both oriented finite paths. |
| Finite locally free sheaves and rank | `TauCetiRoadmap/AlgebraicVectorBundles/README.md:244`; `TauCetiRoadmap/AlgebraicVectorBundles/Suggested.lean:167` | Named carriers and rank exist in L0B. |
| Geometric total spaces and sections | `TauCetiRoadmap/AlgebraicVectorBundles/README.md:340`; `TauCetiRoadmap/AlgebraicVectorBundles/Suggested.lean:732`, `:750`, `:795` | L2B supplies `totalSpaceScheme`, `totalSpaceEquiv`, `totalSpaceHomEquiv`; not the orbit dimension theorem. |
| Smooth segments and involution | `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md:4369` and `:4558`, at `28803294a655a2ad6315672600d108a08fcb7553` | SR.5.3 imports SR.5.2's named segments. Both arbitrary positive cuspidal rank and the Z/L conventions are present; the involution is identified on all irreducibles. |

### Locator checks

MW was checked against the [official GDZ volume scan](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0372/PPN243919689_0372.pdf), so its printed journal pages are used instead of unstable OCR line numbers. The other witnesses use the sources service's numbered extractions. No source passage is reproduced here.

| # | Work and locator | Witness | Checked content |
|---:|---|---|---|
| 1 | AKY: §2.1, p.7 | AKY line 264; line 278 | Segment and Z/L normalization, including the two-term character. |
| 2 | AKY: §2.3, pp.8–9 | AKY line 319; line 334 | Shortening and ramified dual/truncate/dual convention. |
| 3 | AKY: Proposition 2.4, p.9 | AKY line 362 | Conductor-tuple consumer, not a new owned representation theorem. |
| 4 | AKY: §2.4, p.10, before Proposition 2.7 | AKY line 422 | Maximal part contains one copy of each distinct maximal interval. |
| 5 | AKY: Proposition 2.7, p.10 | AKY line 430 | Canonical split; not arbitrary additivity. |
| 6 | AKY: Corollary 2.8, pp.10–11 | AKY line 432 | The stated downstream tuple additivity. |
| 7 | AKY: §2.5, pp.11–13 | AKY line 461; line 500 | Seven-interval example and exactly one right shortening. |
| 8 | AKY: §3.1, p.14 | AKY line 548 | Finite-dimensional complex graded pairs and morphisms. |
| 9 | AKY: Lemma 3.1, pp.14–15 | AKY line 554 | Reconstruction needs both unshifted image type and grade dimensions. |
| 10 | AKY: §3.1, p.15 | AKY line 588; line 593; line 620 | Shift sign, block arrows and finite-quiver classification. |
| 11 | AKY: Lemma 3.2, p.16 | AKY line 631 | Both actual-image centralizer restriction surjections. |
| 12 | AKY: §3.1, p.16, genericity/admissibility | AKY line 643; line 647 | Generic opposite type and the admissible triple condition. |
| 13 | AKY: Lemma 3.3, p.16 | AKY line 651 | VN image needs shift −1; WL image does not. |
| 14 | AKY: Lemma 3.4, p.17 | AKY line 676 | Ambient and opposite-image admissibility on a dense open locus. |
| 15 | AKY: §3.2, p.18 | AKY line 734; line 746 | One simultaneous choice and the actual VN image of ramification. |
| 16 | AKY: Proposition 3.5, pp.18–19 | AKY line 757 | Ramification commutes with right truncation. |
| 17 | AKY: Lemma 3.6, p.19 | AKY line 764 | Both maximal-part and remainder truncation identities; typography loses the bar in extraction. |
| 18 | AKY: Proposition 3.7, p.19 | AKY line 771 | Adjacent dual count equals cut cardinality minus weighted chain maximum. |
| 19 | AKY: Proof of Proposition 3.7, pp.19–21 | AKY line 788; line 819; line 856 | Correct terminal vertex and equality of maxima; the package avoids the source terminal-coordinate misprint. |
| 20 | AKY: Proof of Proposition 2.7, pp.21–22 | AKY line 878 | Image reconstruction, induction and maximal-chain peeling. |
| 21 | Z98: §2, p.410 | Z98 line 41; line 67 | Generic commuting opposite quiver and interval labels. |
| 22 | Z98: §3, formula (1), Theorem 1, pp.410–411 | Z98 line 77; line 90 | Monotone rank minimum and rank finite differences; only the adjacent case is used. |
| 23 | Z98: §5, p.412 | Z98 line 137 | Left-endpoint recurrence agrees mathematically; algorithm policy is R08. |
| 24 | DIL: Theorem 3 and first proof, pp.6-1–6-2 | DIL line 40; line 59 | Finite chain partition and antichain bound. |
| 25 | DIL: Split-poset matching, p.6-3 | DIL line 104 | Independent left/right roles and cardinality minus matching size. |
| 26 | DIL: Weighted occurrences, p.6-4 | DIL line 130; line 145 | Incomparable copies encode the antichain weight. |
| 27 | MW: Corollary I.7.2 and Proposition I.7.3, p.147 | MW, printed p.147, scan | Embedding order reverses; the induced involution is Zelevinsky’s. |
| 28 | MW: II.1, pp.147–148 | MW, printed pp.147–148, scan | General cuspidal rank, strict preceding relation and decreasing lexicographic order. |
| 29 | MW: II.2, pp.149–150 | MW, printed pp.149–150, scan | Right-endpoint recurrence and occurrence selection. |
| 30 | MW: Lemma II.3, statement pp.150–151 | MW, printed pp.150–151, scan | Reinsertion and injective matching below the extended interval. |
| 31 | MW: Lemma II.4, pp.160–161 | MW, printed pp.160–161, scan | Independent opposite-centralizer block coordinates. |
| 32 | MW: Proposition II.6, pp.162–169 | MW, printed pp.162–163, scan | Generic geometric label equals the recurrence label; statement and proof setup checked. |
| 33 | MW: Remark II.6.1, p.163 | MW, printed p.163, scan | Dense affine-slice intersection requires nonempty intersection. |
| 34 | MW: Corollary II.7, p.169 | MW, printed p.169, scan | Geometric multisegment involutivity. |
| 35 | MW: Lemma II.10.2, pp.172–173 | MW, printed pp.172–173, scan | Right-induced subrepresentation candidates and excluded matched indices. |
| 36 | MW: Remark II.10.3, p.174 | MW, printed p.174, scan | Label inequality; the package uses the corrected right-induced product order. |
| 37 | MW: Lemma II.11, pp.174–175 | MW, printed pp.174–175, scan | Left singleton extraction, last equal-left-endpoint interval and uniqueness. |
| 38 | MW: Theorem II.13 and proof, pp.176–177 | MW, printed pp.176–177, scan | Geometric/representation identification and the two inductions. |

### Statement and adversarial-case table

All line numbers in this table refer to `packages/QuiverRepresentationsPartII/README.md`. “None” means no change identified for that row, subject to the shared findings on checks and dependencies.

| Block/line | Statements | Context | Instances tried | Result | Change |
|---|---|---|---|---|---|
| §0.1:85 | Interval; intSeg; Interval.contains; Interval.included; Interval.length; Interval.shift; Interval.shorten; Interval.ext_ends; Interval.contains_shift; Interval.shorten_singleton; Interval.length_positive | b,e,a,c ∈ ℤ; b≤e; k∈ℕ | [3,3], [3,4], endpoints 2/3 of [0,2], shift −1 | Closed endpoints, positive length, singleton deletion and shift sign agree. | R01–R02 checks |
| §0.2:99 | Multisegment; degreeDimension; totalLength; rightTruncate; shiftMultisegment; occurrenceInterval; rightTruncate_add; rightTruncate_shift; degreeDimension_add; occurrence_count | finite Multiset Interval; a,c∈ℤ; occurrence index Fin m.card | empty; repeated [1,2]; [0,0]+[1,3]; mixed distinct labels | All multiplicities and length decrement correct. | R01,R02,R04,R05 |
| §0.3:113 | maximalPart; remainder; maximalPart_count; maximalPart_add_remainder; maximalPart_incomparable | finite multiset; closed-interval inclusion | 2[0,2]; [0,2]+[1,1]; disjoint singleton pair; empty | One maximal copy, subtraction and maximal containment correct. | R01–R02 |
| §1.1:137 | Space; Space.grade; Space.dimension; Space.internal; Space.finite_support; Space.dimension_card; constantSpace | finite-dimensional ℂ-space; internal finite-support ℤ-grading; n∈ℕ | n=0; two coordinates in grade 3; missing grade 4 | Coordinate presentation retains repeated grades and zero space. | R01 |
| §1.2:151 | Direction; Pair; VN; WL; PairIso; Pair.Isomorphic; zeroPair; Pair.nilpotent; Pair.isomorphic_refl; Pair.isomorphic_trans | S,R finite coordinate gradings; same direction for isomorphism | zero space; identity map rejected as degree 1; E21; displaced singletons | Uniform exponent follows from finite support; graded/intertwining conditions correct. | R01,R04,R10 |
| §1.3:165 | standardSpace; standardVector; standardPair; pairType; standardSpace_dimension; standardSpace_n; pairType_standardPair; standardPair_apply_up; standardPair_apply_down; standardVector_ne_zero_iff; standardVector_eq_basis; standardBasis; standardVector_mem_grade | occ∈Fin m.card; degree integer; direction up/down | [0,2]; repeated [0,1]; WL singleton [2,2]; invalid degree vector=0 | Correct with endpoint guards on arrow formulas and occurrence-sensitive basis. | R10 ordering |
| §1.4:179 | pair_classification; pairType_dimension; path-rank multiplicity formula | same direction; i≤j; diagonal ranks=grade dimensions | zero, one interval, [0,2]+[1,1]; enlarged support window | Finite differences give exactly one long block and one middle singleton. | R10 ordering |
| §1.5:193 | shiftSpace; shiftPair; imagePair; ImageModel; iteratedImage; pairType_shift; pairType_image_up; pairType_image_down | actual range submodule; injective embedding onto range; c∈ℤ; k∈ℕ | [0,2] gives up [1,2], shifted [0,1], down [0,1]; singleton; k=0 | Shift and actual-image carriers agree; no formal-label substitute. | R01 |
| §1.6:207 | reconstruct_from_image | VN pairs; equality of every grade dimension and unshifted image isomorphism | [0,2]+[1,1] versus [0,2]; displaced zero singletons | Image recovers off-diagonal ranks; dimensions recover diagonal. | none |
| §2.1:225 | centralizer; oppositePair; restrictCentralizer; oppositePair_operator; centralizer_commute; restrictCentralizer_embed | endomorphisms over ℂ; opposite degree; ST=TS | zero space; single chain has zero centralizer; adjacent zero singletons give dimension 1 | Submodule closure, range stability and conjugation valid. | R01,R04,R05 |
| §2.2:239 | centralizer_coordinates; Precedes | source [t,u], target [s,v]; ordered occurrence pairs | self-block; adjacent and separated singletons; 2×3 repeated-singleton block | Boundary equations give s<t≤v+1≤u exactly. | R01 |
| §2.3:261 | centralizer_restrict_up_surjective | any VN pair, actual unshifted image | singleton image zero; [0,1]+[1,2]; repeated chains | Allowed image block lifts to the same original occurrence block. | none |
| §2.4:269 | centralizer_restrict_down_surjective | any WL pair; reflection sends [b,e] to [−e,−b] | zero; reflected [0,1]+[1,2] | Reflection preserves range and reverses degrees correctly. | none |
| §2.5:277 | polynomialTopology; centralizerTopology; ZariskiOpenDense; polynomial_principal_open; centralizerTopology_basis_independent; centralizer_irreducible; zariski_finite_intersection; zariski_surjective_preimage | finite-dimensional complex spaces; explicit polynomial topology; surjective linear map | n=0; nonzero coordinate; ordinary unit disk; affine subspace disjoint from D(x) | Nonzero polynomial and finite-product arguments valid; nonempty intersection caveat correct. | R01,R02,R05 |
| §2.6:294 | genericType; genericLocus; generic_rank_locus; genericType_iso; genericType_unique; genericType_shift; genericLocus_shift | finite path-rank table; opposite centralizer; c∈ℤ | single chain; adjacent singleton pair; missing middle degree; 2×3 rectangular matrix | Finite simultaneous rank maxima give a unique open dense type. | none |
| §2.7:310 | conormal_generic_symmetry; commutingIncidence; gradedOrbit_geometry; conormalIncidence_bundle; conormalClosure_dimension; commutingIncidence_components; conormalClosure_opposite; conormal_generic_fibre | fixed finite graded dimension over ℂ; G=product GL; algebraic dimensions | zero space; two one-dimensional grades with nl=0; commutator diag(−1,1) | Finite-orbit conormal argument is mathematically consistent; requires stated geometric targets. | R02 sign mirror; Z81 locator uncertified |
| §2.8:335 | dual; dual_generic_up; dual_generic_down; dual_dimension; dual_shift | all finite integral multisegments; both directions; c∈ℤ | chain→singletons; adjacent singletons→chain; gap; empty; shift −2 | Transpose keeps interval labels; grade reflection does not. | none |
| §2.9:351 | dual_involutive | all finite integral multisegments | empty; single chain; rectangular multiplicities | Follows from conormal symmetry and both direction identifications. | Z81 locator uncertified; MW II.7 checked |
| §3.1:367 | Admissible; onOppositeImage; imageAdmissibleLocus; Admissible_iff_generic; onOppositeImage_embed; imageAdmissible_implies_admissible | VN N; opposite commuting L; actual unshifted range L | zero space; L=0 on adjacent singleton pair fails; L=0 on chain succeeds | Separate ambient and image admissibility conditions required and present. | none |
| §3.2:387 | image_admissible_open_dense | every VN pair over ℂ | zero-dimensional centralizer; zero/nonzero L; nonzero-minor chart | Surjective restriction, involutivity and chart denominators justify nonempty open dense locus. | none |
| §3.3:397 | simultaneous_genericity; simultaneousRestrictions | one L restricts to every range N^k; finite nilpotence exponent | k=0; k beyond nilpotence; zero N | Finite intersection suffices; later zero images impose no condition. | none |
| §3.4:405 | ram; ram_dual; ram_vn_image; ram_totalLength_le; ram_shift | dual(rightTruncate(dual m)); image-admissible L | single chain→empty; adjacent singletons→[0,0]; gap; empty; shift | Actual image dimensions and interval supports agree. | none |
| §3.5:427 | ram_truncate_commute | all finite integral m; simultaneous image admissibility | [0,0]+[1,1]; [0,2]; [0,1]+[1,2] | Both constructions give range LN shifted −1; no missing genericity condition. | none |
| §4.1:449 | cutPart; IsInclusionChain; chainWeight; adjacentDualCount; cutPart_count; chainWeight_le_card; chainWeight_zero_iff | a∈ℤ; finite support chains; occurrence weights | adjacent singletons E=1; repeated nested blocks E=3; off-support cut E=0 | Meeting versus containing cut and multiplicities distinguished. | R01,R02,R07 |
| §4.2:464 | endpointBefore; IsEndpointAntichain; antichainWidth; IsEndpointMatching; matchingNumber; endpointBefore_irrefl; endpointBefore_trans; matchingNumber_bound; matchingNumber_le_iff; antichainWidth_le_iff; occurrence-permutation invariance | Fin q.card; strict endpoints; independent left/right roles | equal copies; nested intervals; two and three singleton chains; shared-left/shared-right rejected | Strict order and both projection injections give correct maxima. | R01,R07 |
| §4.3:482 | weighted_dilworth; cut_antichain_width; antichain_le_chain_cover; dilworth_partition | finite poset; occurrence copies incomparable | empty; width-2 repeated/nested pair; 3-element chain; 1001 small multisets | Matching+width=card; endpoint antichains correspond to weighted inclusion chains. | R07,R09 vocabulary |
| §4.4:500 | adjacent_generic_rank | m arbitrary; cut a+1→a; independent coordinates for occurrence pairs | single chain; adjacent singles; 2×3 matrix; missing endpoint grade | Every cut edge has correct endpoints; matching minor attains upper bound. | none |
| §4.5:510 | GridPath; InWindow; intervalWeight; GridPath.weight; GridPath.nested; GridPath.invalid_start_weight; GridPath.weight_bound | r,a∈ℕ; theorem hypotheses 1≤a<r; m supported [1,r] | r=3,a=1 explicit path; invalid start; 2[1,3]; r=1 excluded | Path lengths, endpoint, nesting and multiplicity weights correct. | R01,R02,R04 |
| §4.6:525 | grid_path_chain_max | InWindow m r; 1≤a<r | empty weight; singleton chain; repeated terminal interval; zero-weight alternate path | Interpolation proves equality of maxima, not path/chain bijection. | none |
| §4.7:535 | adjacent_chain_formula | all finite integral m and a∈ℤ | adjacent pair; 2[0,1]+[1,1]; nesting; extreme and empty cuts | Matching-width proof covers all integer cuts without window restriction. | none |
| §5.1:559 | truncate_maximalPart; truncate_remainder | all finite integral multisets | empty; repeated max; deleted singleton; nonsingleton containing singleton | Injective shortening of surviving intervals preserves/reflects containment. | R01 |
| §5.2:572 | chainWeight_peeling; chainWeight_peeling_empty | separate nonempty/empty cut hypotheses | empty contradicts unconditional +1; repeated maxima; remainder cut empty | Both branches valid; maxima restore exactly one copy on each maximal chain. | R01 |
| §5.3:588 | ram_maximal_split | canonical one-copy maximal part, all m; total-length induction | 2[0,2]; [0,0]+2[1,2]+[2,2]; arbitrary-sum additivity fails | Image reconstruction plus adjacent dimensions supplies the induction. | none |
| §5.4:606 | integralSegmentAdapter; representation_duality_comparison; integralSegmentAdapter_support; integralSegmentAdapter_shift; integralSegmentAdapter_empty; mwLabel; mwLabel_generic; mwLabel_representation; mw_singleton_extract; mw_involution_embedding; mw_right_singleton_candidates; mw_algorithm_reinsertion | F/ℚp finite; ℂ coefficients; unramified χ; q>1; GL0 unit; MW ordering | χ=1, |·|²; q=2,3; empty; [0,1]; two copies [0,1] | Twist sign, extraction, reversed induction, candidate exclusion and reinsertion agree with MW scans; arbitrary-rank comparison omitted. | R08 algorithms; R11 generality |
| §5.5:650 | newformExample; newform_example_ram | specific seven-interval multiset; ram output via canonical split | input length17/card7/grade3=4; output length8/card4/grade3=1 | AKY endpoint values and one shortening agree. | R01 |

### Lean declaration and context table

All line numbers below refer to `packages/QuiverRepresentationsPartII/Suggested.lean`. The namespace is `TauCetiRoadmap.QuiverRepresentationsPartII`. The file has a noncomputable section and local classical propositional decidability, with no section variables. Complex coordinate spaces carry the usual algebraic module instances; `polynomialTopology` is supplied explicitly in every topological signature. No theorem relies on the ambient usual topology on ℂ. The instance and variable contexts are therefore exactly the displayed binders and the following structure fields.

| Structure | Data and constraints |
|---|---|
| Interval | `left right : ℤ`, `left ≤ right`; derived decidable equality. |
| Space | `n : ℕ`, `degree : Fin n → ℤ`; carrier `Fin n → ℂ`. |
| Pair S d | Actual complex endomorphism and its `Homogeneous S operator d.step` proof. |
| PairIso P Q | Complex linear equivalence; grade-membership iff; operator intertwining for every vector. |
| GridPath r a | `Fin (r+1)` integer vertices; prescribed start and finish; each successive step decreases the first coordinate by one or increases the second by one. Interior-window hypotheses are on the theorems. |

| Layer | Line | Kind/name | Explicit context and signature | Audit |
|---|---:|---|---|---|
| 0 | 25 | structure `Interval` | `structure Interval where` | Mathematical signature checked; cases in preceding table |
| 0 | 32 | def `intSeg` | `def intSeg (a : ℤ) (k : ℕ) : Interval` | Mathematical signature checked; cases in preceding table |
| 0 | 36 | def `Interval.contains` | `def Interval.contains (s : Interval) (a : ℤ) : Prop` | Mathematical signature checked; cases in preceding table |
| 0 | 40 | def `Interval.included` | `def Interval.included (s t : Interval) : Prop` | Mathematical signature checked; cases in preceding table |
| 0 | 44 | def `Interval.length` | `def Interval.length (s : Interval) : ℕ` | Mathematical signature checked; cases in preceding table |
| 0 | 48 | def `Interval.shift` | `def Interval.shift (s : Interval) (c : ℤ) : Interval` | Mathematical signature checked; cases in preceding table |
| 0 | 52 | def `Interval.shorten` | `def Interval.shorten (s : Interval) : Option Interval` | Mathematical signature checked; cases in preceding table |
| 0 | 55 | example `example@55` | `example : (intSeg 0 2).contains 2 ∧ ¬ (intSeg 0 2).contains 3` | Mathematically true; admitted (R01) |
| 0 | 56 | example `example@56` | `example : (intSeg 1 0).included (intSeg 0 2)` | Mathematically true; admitted (R01) |
| 0 | 57 | example `example@57` | `example : ¬ (intSeg 0 2).included (intSeg 1 0)` | Mathematically true; admitted (R01) |
| 0 | 58 | example `example@58` | `example : (intSeg 3 0).length = 1 ∧ (intSeg 0 2).length = 3` | Mathematically true; admitted (R01) |
| 0 | 59 | example `example@59` | `example : (intSeg 2 2).shift (-1) = intSeg 1 2` | Mathematically true; admitted (R01) |
| 0 | 60 | example `example@60` | `example : (intSeg 3 0).shorten = none` | Mathematically true; admitted (R01) |
| 0 | 61 | example `example@61` | `example : (intSeg 3 1).shorten = some (intSeg 3 0)` | Mathematically true; admitted (R01) |
| 0 | 64 | abbrev `Multisegment` | `abbrev Multisegment` | Mathematical signature checked; cases in preceding table |
| 0 | 67 | def `rightTruncate` | `def rightTruncate (m : Multisegment) : Multisegment` | Mathematical signature checked; cases in preceding table |
| 0 | 73 | def `shiftMultisegment` | `def shiftMultisegment (m : Multisegment) (c : ℤ) : Multisegment` | Mathematical signature checked; cases in preceding table |
| 0 | 77 | def `degreeDimension` | `def degreeDimension (m : Multisegment) (a : ℤ) : ℕ` | Mathematical signature checked; cases in preceding table |
| 0 | 81 | def `totalLength` | `def totalLength (m : Multisegment) : ℕ` | Mathematical signature checked; cases in preceding table |
| 0 | 85 | def `occurrenceInterval` | `def occurrenceInterval (m : Multisegment) (i : Fin m.card) : Interval` | Mathematical signature checked; cases in preceding table |
| 0 | 89 | def `maximalPart` | `def maximalPart (m : Multisegment) : Multisegment` | Mathematical signature checked; cases in preceding table |
| 0 | 93 | def `remainder` | `def remainder (m : Multisegment) : Multisegment` | Mathematical signature checked; cases in preceding table |
| 0 | 97 | theorem `maximalPart_add_remainder` | `theorem maximalPart_add_remainder (m : Multisegment) : maximalPart m + remainder m = m` | Mathematical signature checked; cases in preceding table |
| 0 | 101 | theorem `totalLength_rightTruncate` | `theorem totalLength_rightTruncate (m : Multisegment) : totalLength (rightTruncate m) + m.card = totalLength m` | Mathematical signature checked; cases in preceding table |
| 0 | 104 | example `example@104` | `example : rightTruncate ({intSeg 1 1, intSeg 1 1} : Multisegment) = {intSeg 1 0, intSeg 1 0}` | Mathematically true; admitted (R01) |
| 0 | 106 | example `example@106` | `example : rightTruncate ({intSeg 0 0, intSeg 1 2} : Multisegment) = {intSeg 1 1}` | Mathematically true; admitted (R01) |
| 0 | 108 | example `example@108` | `example : shiftMultisegment ({intSeg 2 2, intSeg 2 2} : Multisegment) (-1) = {intSeg 1 2, intSeg 1 2}` | Mathematically true; admitted (R01) |
| 0 | 110 | example `example@110` | `example : degreeDimension ({intSeg 0 2, intSeg 1 0} : Multisegment) 1 = 2` | Mathematically true; admitted (R01) |
| 0 | 111 | example `example@111` | `example : totalLength ({intSeg 0 2, intSeg 1 0} : Multisegment) = 4` | Mathematically true; admitted (R01) |
| 0 | 112 | example `example@112` | `example : occurrenceInterval ({intSeg 0 1, intSeg 0 1} : Multisegment) ⟨0, by simp⟩ = intSeg 0 1` | Mathematically true; admitted (R01) |
| 0 | 115 | example `example@115` | `example : maximalPart ({intSeg 0 2, intSeg 0 2} : Multisegment) = {intSeg 0 2}` | Mathematically true; admitted (R01) |
| 0 | 117 | example `example@117` | `example : remainder ({intSeg 0 2, intSeg 1 0} : Multisegment) = {intSeg 1 0}` | Mathematically true; admitted (R01) |
| 0 | 119 | example `example@119` | `example : maximalPart ({intSeg 0 0, intSeg 2 0} : Multisegment) = {intSeg 0 0, intSeg 2 0}` | Mathematically true; admitted (R01) |
| 1 | 125 | structure `Space` | `structure Space where` | Mathematical signature checked; cases in preceding table |
| 1 | 130 | abbrev `Space.Carrier` | `abbrev Space.Carrier (S : Space)` | Mathematical signature checked; cases in preceding table |
| 1 | 133 | def `Space.grade` | `def Space.grade (S : Space) (a : ℤ) : Submodule ℂ S.Carrier where` | Mathematical signature checked; cases in preceding table |
| 1 | 140 | def `Space.dimension` | `def Space.dimension (S : Space) (a : ℤ) : ℕ` | Mathematical signature checked; cases in preceding table |
| 1 | 144 | def `constantSpace` | `def constantSpace (n : ℕ) (a : ℤ) : Space` | Mathematical signature checked; cases in preceding table |
| 1 | 147 | inductive `Direction` | `inductive Direction ∣ up ∣ down deriving DecidableEq` | Mathematical signature checked; cases in preceding table |
| 1 | 150 | def `Direction.step` | `def Direction.step : Direction → ℤ ∣ .up => 1 ∣ .down => -1` | Mathematical signature checked; cases in preceding table |
| 1 | 155 | def `Direction.opposite` | `def Direction.opposite : Direction → Direction ∣ .up => .down ∣ .down => .up` | Mathematical signature checked; cases in preceding table |
| 1 | 160 | abbrev `Homogeneous` | `abbrev Homogeneous (S : Space) (T : Module.End ℂ S.Carrier) (c : ℤ) : Prop` | Mathematical signature checked; cases in preceding table |
| 1 | 164 | structure `Pair` | `structure Pair (S : Space) (d : Direction) where` | Mathematical signature checked; cases in preceding table |
| 1 | 169 | structure `PairIso` | `structure PairIso {S R : Space} {d : Direction} (P : Pair S d) (Q : Pair R d) where` | Mathematical signature checked; cases in preceding table |
| 1 | 175 | def `Pair.Isomorphic` | `def Pair.Isomorphic {S R : Space} {d : Direction} (P : Pair S d) (Q : Pair R d) : Prop` | Mathematical signature checked; cases in preceding table |
| 1 | 179 | def `zeroPair` | `def zeroPair (S : Space) (d : Direction) : Pair S d` | Mathematical signature checked; cases in preceding table |
| 1 | 183 | def `shiftSpace` | `def shiftSpace (S : Space) (c : ℤ) : Space` | Mathematical signature checked; cases in preceding table |
| 1 | 187 | theorem `Space.internal` | `theorem Space.internal (S : Space) : DirectSum.IsInternal S.grade` | Mathematical signature checked; cases in preceding table |
| 1 | 190 | theorem `Pair.nilpotent` | `theorem Pair.nilpotent {S : Space} {d : Direction} (P : Pair S d) : ∃ k : ℕ, P.operator ^ k = 0` | Mathematical signature checked; cases in preceding table |
| 1 | 193 | example `example@193` | `example : (constantSpace 2 3).dimension 3 = 2` | Mathematically true; admitted (R01) |
| 1 | 194 | example `example@194` | `example : (constantSpace 2 3).dimension 4 = 0` | Mathematically true; admitted (R01) |
| 1 | 195 | example `example@195` | `example : (constantSpace 0 0).grade 0 = ⊥` | Mathematically true; admitted (R01) |
| 1 | 196 | example `example@196` | `example : Direction.down.step = -1 ∧ Direction.up.opposite = Direction.down` | Mathematically true; admitted (R01) |
| 1 | 197 | example `example@197` | `example (S : Space) : (zeroPair S .up).operator = 0` | Mathematically true; admitted (R01) |
| 1 | 198 | example `example@198` | `example (S : Space) : (zeroPair S .up).Isomorphic (zeroPair S .up)` | Mathematically true; admitted (R01) |
| 1 | 199 | example `example@199` | `example : ¬ (zeroPair (constantSpace 1 0) .up).Isomorphic (zeroPair (constantSpace 1 1) .up)` | Mathematically true; admitted (R01) |
| 1 | 201 | example `example@201` | `example : (shiftSpace (constantSpace 1 2) (-1)).degree ⟨0, by decide⟩ = 1` | Mathematically true; admitted (R01) |
| 1 | 202 | example `example@202` | `example : Homogeneous (constantSpace 2 0) (0 : Module.End ℂ _) (-1)` | Mathematically true; admitted (R01) |
| 1 | 203 | example `example@203` | `example : ¬ Homogeneous (constantSpace 1 0) (LinearMap.id : Module.End ℂ _) 1` | Mathematically true; admitted (R01) |
| 1 | 206 | def `upArrow` | `def upArrow : Module.End ℂ (Fin 2 → ℂ)` | Mathematical signature checked; cases in preceding table |
| 1 | 209 | example `example@209` | `example : upArrow ![1, 0] = ![0, 1]` | Mathematically true; admitted (R01) |
| 1 | 210 | example `example@210` | `example : Homogeneous (⟨2, fun i => (i.val : ℤ)⟩ : Space) upArrow 1 ∧ ¬ Homogeneous (⟨2, fun i => (i.val : ℤ)⟩ : Space) upArrow (-1)` | Mathematically true; admitted (R01) |
| 2 | 216 | def `Precedes` | `def Precedes (target source : Interval) : Prop` | Mathematical signature checked; cases in preceding table |
| 2 | 221 | def `centralizer` | `def centralizer {S : Space} {d : Direction} (P : Pair S d) : Submodule ℂ (Module.End ℂ S.Carrier) where` | Mathematical signature checked; cases in preceding table |
| 2 | 251 | def `polynomialTopology` | `@[instance_reducible] def polynomialTopology (n : ℕ) : TopologicalSpace (Fin n → ℂ)` | Mathematical signature checked; cases in preceding table |
| 2 | 256 | theorem `polynomial_irreducible` | `theorem polynomial_irreducible (n : ℕ) : @IsIrreducible _ (polynomialTopology n) Set.univ` | Mathematical signature checked; cases in preceding table |
| 2 | 259 | example `example@259` | `example : Precedes (intSeg 0 0) (intSeg 1 0)` | Mathematically true; admitted (R01) |
| 2 | 260 | example `example@260` | `example : ¬ Precedes (intSeg 0 2) (intSeg 0 2)` | Mathematically true; admitted (R01) |
| 2 | 261 | example `example@261` | `example : ¬ Precedes (intSeg 0 0) (intSeg 2 0)` | Mathematically true; admitted (R01) |
| 2 | 262 | example `example@262` | `example (S : Space) : (0 : Module.End ℂ S.Carrier) ∈ centralizer (zeroPair S .up)` | Mathematically true; admitted (R01) |
| 2 | 263 | example `example@263` | `example : Module.finrank ℂ (centralizer (zeroPair (⟨2, fun i => (i.val : ℤ)⟩ : Space) .up)) = 1` | Mathematically true; admitted (R01) |
| 2 | 265 | example `example@265` | `example : @IsOpen _ (polynomialTopology 1) {x : Fin 1 → ℂ ∣ x 0 ≠ 0} ∧ @Dense _ (polynomialTopology 1) {x : Fin 1 → ℂ ∣ x 0 ≠ 0}` | Mathematically true; admitted (R01) |
| 2 | 267 | example `example@267` | `example : ¬ @IsOpen _ (polynomialTopology 1) {x : Fin 1 → ℂ ∣ ‖x 0‖ < 1}` | Mathematically true; admitted (R01) |
| 3 | 272 | theorem `commuting_range_stable` | `theorem commuting_range_stable {S : Space} (N L : Module.End ℂ S.Carrier) (h : L.comp N = N.comp L) : ∀ v ∈ LinearMap.range N, L v ∈ LinearMap.range N` | Mathematical signature checked; cases in preceding table |
| 3 | 276 | example `example@276` | `example : LinearMap.range (0 : Module.End ℂ (Fin 0 → ℂ)) = ⊥` | Mathematically true; admitted (R01) |
| 4 | 281 | def `cutPart` | `def cutPart (m : Multisegment) (a : ℤ) : Multisegment` | Mathematical signature checked; cases in preceding table |
| 4 | 285 | def `IsInclusionChain` | `def IsInclusionChain (A : Finset Interval) : Prop` | Mathematical signature checked; cases in preceding table |
| 4 | 289 | def `chainWeight` | `def chainWeight (m : Multisegment) (a : ℤ) : ℕ` | Mathematical signature checked; cases in preceding table |
| 4 | 294 | def `endpointBefore` | `def endpointBefore (m : Multisegment) (i j : Fin m.card) : Prop` | Mathematical signature checked; cases in preceding table |
| 4 | 299 | def `IsEndpointAntichain` | `def IsEndpointAntichain (m : Multisegment) (A : Finset (Fin m.card)) : Prop` | Mathematical signature checked; cases in preceding table |
| 4 | 303 | def `IsEndpointMatching` | `def IsEndpointMatching (m : Multisegment) (E : Finset (Fin m.card × Fin m.card)) : Prop` | Mathematical signature checked; cases in preceding table |
| 4 | 309 | def `matchingNumber` | `def matchingNumber (m : Multisegment) : ℕ` | Mathematical signature checked; cases in preceding table |
| 4 | 314 | def `antichainWidth` | `def antichainWidth (m : Multisegment) : ℕ` | Mathematical signature checked; cases in preceding table |
| 4 | 319 | theorem `weighted_dilworth` | `theorem weighted_dilworth (m : Multisegment) : matchingNumber m + antichainWidth m = m.card` | Mathematical signature checked; cases in preceding table |
| 4 | 323 | theorem `cut_antichain_width` | `theorem cut_antichain_width (m : Multisegment) (a : ℤ) : antichainWidth (cutPart m a) = chainWeight m a` | Mathematical signature checked; cases in preceding table |
| 4 | 326 | example `example@326` | `example : (cutPart ({intSeg 0 0, intSeg 1 0} : Multisegment) 0).card = 2` | Mathematically true; admitted (R01) |
| 4 | 327 | example `example@327` | `example : IsInclusionChain {intSeg 0 2, intSeg 1 0}` | Mathematically true; admitted (R01) |
| 4 | 328 | example `example@328` | `example : ¬ IsInclusionChain {intSeg 0 0, intSeg 1 0}` | Mathematically true; admitted (R01) |
| 4 | 329 | example `example@329` | `example : chainWeight ({intSeg 0 1, intSeg 0 1, intSeg 1 0} : Multisegment) 0 = 3` | Mathematically true; admitted (R01) |
| 4 | 330 | example `example@330` | `example : chainWeight ({intSeg 0 0, intSeg 1 0} : Multisegment) 0 = 1` | Mathematically true; admitted (R01) |
| 4 | 331 | example `example@331` | `example : ¬ endpointBefore ({intSeg 0 1, intSeg 0 1} : Multisegment) ⟨0, by simp⟩ ⟨1, by simp⟩` | Mathematically true; admitted (R01) |
| 4 | 333 | example `example@333` | `example : IsEndpointAntichain ({intSeg 0 1, intSeg 0 1} : Multisegment) Finset.univ` | Mathematically true; admitted (R01) |
| 4 | 334 | example `example@334` | `example : IsEndpointMatching (0 : Multisegment) ∅` | Mathematically true; admitted (R01) |
| 4 | 335 | example `example@335` | `example : ¬ IsEndpointMatching ({intSeg 0 1, intSeg 0 1} : Multisegment) {(⟨0, by simp⟩, ⟨1, by simp⟩)}` | Mathematically true; admitted (R01) |
| 4 | 337 | example `example@337` | `example (m : Multisegment) (i j k : Fin m.card) (hij : endpointBefore m i j) (hik : endpointBefore m i k) (hjk : j ≠ k) : ¬ IsEndpointMatching m {(i, j), (i, k)}` | Mathematically true; admitted (R01) |
| 4 | 340 | example `example@340` | `example (m : Multisegment) (i j k : Fin m.card) (hik : endpointBefore m i k) (hjk : endpointBefore m j k) (hij : i ≠ j) : ¬ IsEndpointMatching m {(i, k), (j, k)}` | Mathematically true; admitted (R01) |
| 4 | 343 | example `example@343` | `example : antichainWidth ({intSeg 0 1, intSeg 0 1} : Multisegment) = 2 ∧ matchingNumber ({intSeg 0 1, intSeg 0 1} : Multisegment) = 0` | Mathematically true; admitted (R01) |
| 4 | 345 | example `example@345` | `example : antichainWidth ({intSeg 0 0, intSeg 1 0} : Multisegment) = 1 ∧ matchingNumber ({intSeg 0 0, intSeg 1 0} : Multisegment) = 1` | Mathematically true; admitted (R01) |
| 4 | 347 | example `example@347` | `example : antichainWidth ({intSeg 0 2, intSeg 1 0} : Multisegment) = 2 ∧ matchingNumber ({intSeg 0 2, intSeg 1 0} : Multisegment) = 0` | Mathematically true; admitted (R01) |
| 4 | 351 | structure `GridPath` | `structure GridPath (r a : ℕ) where` | Mathematical signature checked; cases in preceding table |
| 4 | 360 | def `intervalWeight` | `def intervalWeight (m : Multisegment) (i j : ℤ) : ℕ` | Mathematical signature checked; cases in preceding table |
| 4 | 364 | def `GridPath.weight` | `def GridPath.weight {r a : ℕ} (p : GridPath r a) (m : Multisegment) : ℕ` | Mathematical signature checked; cases in preceding table |
| 4 | 368 | def `InWindow` | `def InWindow (m : Multisegment) (r : ℕ) : Prop` | Mathematical signature checked; cases in preceding table |
| 4 | 372 | theorem `GridPath.weight_bound` | `theorem GridPath.weight_bound {r a : ℕ} (p : GridPath r a) (m : Multisegment) (ha : 1 ≤ a) (har : a < r) (hm : InWindow m r) : p.weight m ≤ chainWeight m a` | Mathematical signature checked; cases in preceding table |
| 4 | 377 | theorem `grid_path_chain_max` | `theorem grid_path_chain_max (m : Multisegment) {r a : ℕ} (ha : 1 ≤ a) (har : a < r) (hm : InWindow m r) : ∃ p : GridPath r a, p.weight m = chainWeight m a` | Mathematical signature checked; cases in preceding table |
| 4 | 381 | example `example@381` | `example (p : GridPath 3 1) : p.vertex (Fin.last 3) = (1, 3)` | Mathematically true; admitted (R01) |
| 4 | 382 | example `example@382` | `example : intervalWeight ({intSeg 1 2} : Multisegment) 2 1 = 0` | Mathematically true; admitted (R01) |
| 4 | 383 | example `example@383` | `example : intervalWeight ({intSeg 1 2, intSeg 1 2} : Multisegment) 1 3 = 2` | Mathematically true; admitted (R01) |
| 4 | 384 | example `example@384` | `example (p : GridPath 3 1) : p.weight (0 : Multisegment) = 0` | Mathematically true; admitted (R01) |
| 4 | 385 | example `example@385` | `example (p : GridPath 3 1) : p.weight ({intSeg 1 2, intSeg 1 2} : Multisegment) = 2` | Mathematically true; admitted (R01) |
| 4 | 387 | example `example@387` | `example : InWindow ({intSeg 1 2} : Multisegment) 3` | Mathematically true; admitted (R01) |
| 4 | 388 | example `example@388` | `example : ¬ InWindow ({intSeg 0 1} : Multisegment) 3` | Mathematically true; admitted (R01) |
| 5 | 393 | theorem `truncate_maximalPart` | `theorem truncate_maximalPart (m : Multisegment) : maximalPart (rightTruncate m) = rightTruncate (maximalPart m)` | Mathematical signature checked; cases in preceding table |
| 5 | 397 | theorem `truncate_remainder` | `theorem truncate_remainder (m : Multisegment) : remainder (rightTruncate m) = rightTruncate (remainder m)` | Mathematical signature checked; cases in preceding table |
| 5 | 401 | theorem `chainWeight_peeling` | `theorem chainWeight_peeling (m : Multisegment) (a : ℤ) (h : cutPart m a ≠ 0) : chainWeight m a = chainWeight (remainder m) a + 1 ∧ chainWeight (maximalPart m) a = 1` | Mathematical signature checked; cases in preceding table |
| 5 | 406 | theorem `chainWeight_peeling_empty` | `theorem chainWeight_peeling_empty (m : Multisegment) (a : ℤ) (h : cutPart m a = 0) : chainWeight m a = 0 ∧ chainWeight (remainder m) a = 0 ∧ chainWeight (maximalPart m) a = 0` | Mathematical signature checked; cases in preceding table |
| 5 | 410 | example `example@410` | `example : chainWeight (0 : Multisegment) 0 = 0` | Mathematically true; admitted (R01) |
| 5 | 411 | example `example@411` | `example : ¬ chainWeight (0 : Multisegment) 0 = chainWeight (remainder 0) 0 + 1` | Mathematically true; admitted (R01) |
| 5 | 414 | def `newformExample` | `def newformExample : Multisegment` | Mathematical signature checked; cases in preceding table |
| 5 | 418 | example `example@418` | `example : newformExample.card = 7 ∧ totalLength newformExample = 17` | Mathematically true; admitted (R01) |
| 5 | 419 | example `example@419` | `example : degreeDimension newformExample 3 = 4` | Mathematically true; admitted (R01) |

## Not verifiable

- **Z81:** original §4.3 and Proposition 4.4, pp.20–21, and the claimed conjectural status in §4.5. The MathNet endpoints did not supply readable text; the DOI route was recorded by the sources service as `uncertified`/paywalled. These original locators were not certified indirectly from MW. This is a settled uncertified citation, not an outstanding missing-reference request.
- **Lean elaboration at the supplied pins:** not rerun because the brief prohibits Lean builds. The package's prior elaboration claim in review.json was treated as data, not independently certified. The statements and pinned declarations were inspected directly.
- **Future implementations:** the conormal geometry, genericity and representation constructions remain roadmap targets. This pass checks their mathematical statements, interfaces and cited inputs; it does not certify future proofs. For MW II.3 and II.6, the cited statements, relevant setup and comparison uses were verified, not every line of their long proofs.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "cc2ed2d0bb78a3e57beb0bbe77336e65314f51c9", "job": "RT-QuiverRepresentationsPartII~1a", "model": "gpt-6-astra", "worker": "chris-4"} -->
