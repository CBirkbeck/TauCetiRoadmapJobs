# Review of BorelEquivalenceRelations (pull request #1616 at 6c542e9)

**Verdict:** needs changes

## R01 (P2) — Require an uncountable image in the continuum-class example

**Location:** `TauCetiRoadmap/BorelEquivalenceRelations/README.md:623–625`, “A closed relation with 𝔠 classes … more generally the kernel of a continuous map between Polish spaces.”

**Claim:** The generalization under this heading includes a claim of continuum many classes, without an image-size hypothesis.

**Witness:** For `f : ℝ → ℝ`, `f(x)=0`, the kernel is the universal relation. Its quotient has cardinality 1, whereas 𝔠>1. The function is continuous and both spaces are Polish.

**Repair:** Say that every such kernel is closed and smooth, and has 𝔠 classes **if the image is uncountable**. Add the constant map as a negative-control Check. The quotient is in bijection with the image: the repaired statement gives 1 for the constant map and 𝔠 for `x ↦ |x|`, whose image is `[0,∞)`.

## R02 (P2) — State the completely metrizable Alexandrov converse

**Location:** `TauCetiRoadmap/BorelEquivalenceRelations/README.md:215–216` versus `TauCetiRoadmap/BorelEquivalenceRelations/Suggested.lean:75–76`. The README says “a subset of a metrizable space that is completely metrizable”; Lean requires `[PolishSpace s]`.

**Claim:** The prototype tests only the separable special case of the promised converse.

**Witness:** Give an uncountable set the discrete metric and take `s=univ`. Both ambient and subspace are completely metrizable, and `s` is Gδ. The subspace is not separable and therefore is not Polish.

**Repair:** Replace `[PolishSpace s]` by `[TopologicalSpace.IsCompletelyMetrizableSpace s]` in the converse signature, and describe that general theorem in its docstring. This replacement elaborates at the pins in a scratch copy. The discrete example then satisfies the hypotheses; `ℚ ⊆ ℝ` remains excluded because it is not completely metrizable in its subspace topology. Retain the README's generality.

## R03 (P3) — Remove the forbidden option

**Location:** `TauCetiRoadmap/BorelEquivalenceRelations/Suggested.lean:20`, `set_option autoImplicit false`.

**Claim:** The acceptance file violates the explicit no-`set_option` rule; the worker reports `set_option=1`.

**Witness:** This is the only option command. Deleting it in a scratch copy leaves the entire file elaborating with only admitted-theorem warnings.

**Repair:** Delete this line. The tested repair does not require changing any signature.

## R04 (P3) — Remove process wording and pull-request references

**Location:** `TauCetiRoadmap/BorelEquivalenceRelations/README.md:723,785`, “checkpoint”; also README lines 46, 164–186, 229, 297, 526, 689–700 and `Suggested.lean:69,74,108,215`.

**Claim:** The two `checkpoint` occurrences fail the residue gate. The document and declaration comments also identify suppliers/designs by pull-request number, contrary to the timeless-form requirement.

**Witness:** The supplied gate reports exactly the two residue lines, 723 and 785. The commit-pinned source links remain meaningful after deleting the process noun; the numbered review links add no mathematical locator.

**Repair:** Retain the source revision as a revision, remove the process wording, and replace PR-number prose with the named theorem/module or roadmap section. Keep legal source/design links with descriptive labels. No mathematical hypothesis changes.

## R05 (P3) — Do not advertise undeclared API names as acceptance declarations

**Location:** `TauCetiRoadmap/BorelEquivalenceRelations/README.md:277`, `isThinOn_image_iff`; related examples at lines 222, 268 and 270.

**Claim:** The README presents API identifiers as this roadmap's declarations although they are not declared in `Suggested.lean`.

**Witness:** The gate reports `readme-ids-missing=1` for `isThinOn_image_iff`. Neither a declaration nor a mention of that identifier occurs in the acceptance file. Its mathematical transport property is meaningful independently of the spelling.

**Repair:** State thinness transport in prose without a backticked declaration name. Do the same for other API-only names, including analytic intersection with a Borel set, the quotient-cardinality corollary and Cantor-scheme extraction. Do not add padding declarations to satisfy the scanner. On the identity embedding, both thinness predicates have the same value: false for equality on Cantor space, true for the universal relation.

## R06 (P3) — Supply exact locators and distinguish the source versions

**Location:** `TauCetiRoadmap/BorelEquivalenceRelations/README.md:193–603,756–785`.

**Claim:** The seeded sample cannot be certified at the README's claimed theorem/page locators: most targets have no such locator. A bibliography entry or whole source-file link does not locate each claim, especially a generalization beyond that source.

**Witness:** Sections 5.1–5.4 give no theorem/page locator. Section 2.3 gives no locator for amalgamation positivity. The accessible Miller survey has 25 manuscript pages; the bibliography cites the 22-page published article without a version/numbering correspondence.

**Repair:** Put an exact source locator beside every target, identifying the version actually read and any generalization. For example, cite Miller's author manuscript, Proposition 6, p.5 for independence; Theorem 8 and its ideal argument, pp.5–6; Lecture I, Theorem 11 and Lemma 12, p.7 for the category route. Cite the actual assignment-family theorem in `infinitarylogic`, `Descriptive/G0Dichotomy.lean`, lines 310–352, for the countable-index, arbitrary-combination formulation, rather than treating the survey's finite homomorphism-family observation as that statement. Add the required source records in the author's repair; this review changes no manifest. The source table below distinguishes verified text from unavailable texts and extends no source's hypotheses silently.

## R07 (P3) — Restore per-definition Checks, precise dependency lists and declaration documentation

**Location:** `TauCetiRoadmap/BorelEquivalenceRelations/README.md:49–64,193–610`; `Suggested.lean:3–17,55,79,89,306,470` and other undocumented declarations.

**Claim:** The folder does not have the required roadmap shape or at least three discriminating Checks per definition. The layer-level consumption table does not identify every individual theorem's inputs. Several declarations lack mathematical docstrings, and the module docstring describes a selection of provisional milestones rather than headline acceptance tests.

**Witness:** There are zero `**Checks.**` blocks, zero `*Needs:*` lines, and no layer-ending `### Examples`/`### Dependencies` sections. For instance, `DenseWords`, `SparseWords` and `IsSmallFamily` have no three-test suites.

**Repair:** Preserve the mathematics but organize it under Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, and the prescribed layer sections. Give each definition its prose API and three actual controls. For density/sparseness use: empty word set `(false,true)`, `{[]}` `(false,true)`, all words `(true,false)`, and canonical words `(true,true)`. For small families use the empty family (small), the singleton empty assignment (not small), and the full singleton-coordinate family (small exactly when the relation is countably Borel colorable). Add item-specific dependencies and mathematical docstrings on retained declarations. These controls distinguish the intended objects; the eight global examples do not replace them.

## R08 (P3) — Delete routine API padding from the acceptance file

**Location:** `TauCetiRoadmap/BorelEquivalenceRelations/Suggested.lean:79–81,470–475,532–534`; also the API-only declarations listed below.

**Claim:** Several admitted declarations test a library specialization or unpacking/composition of definitions, rather than a headline theorem.

**Witness:** Four independent replacements elaborated without errors: `IsGδ.standardBorelSpace` by `exact hs.measurableSet.standardBorel`; reducibility reflexivity by the identity function; transitivity by composition; the easy E₀ obstruction by composing with an assumed smoothness reduction.

**Repair:** **Delete them from `Suggested.lean`**; keep the mathematics in the README, with the standard-Borel specialization cited to Mathlib `MeasurableSet.standardBorel`. Also remove the routine cylinder bridge, antichain injectivity/monotonicity/subtype API, adjacency unpacking, unique-word-length API and coloring-interface conversion from this acceptance test. They belong to the README API, whether or not a bare `simp` finds their proofs. Remove definitions used only by deleted API, notably `wordCylinder` and the unused `IsThinOn`. Keep the deep theorems and the concrete definitions they actually need. Identity and composite reductions still give the same relation truth values in the table below.

## Verified sound

This was a full-folder review, including inherited content. The actual PR diff is the addition of `T₁` to the comeagre-set consequence at README line 201; it is a correction to the existing roadmap, not a replacement roadmap. The counterexample without `T₁` is a two-point indiscrete space: it is nonempty, perfect and Baire, its only comeagre set is the whole two-point set, and that set is countable. With `T₁`, singletons in a perfect space are closed with empty interior, so the new wording and the existing Lean hypothesis agree.

Read the root `README.md` Writing a roadmap section and `CONTRIBUTING.md` (the literal parent-relative files were absent), and main-roadmap examples `ComputabilityTheory` and `Completed/EffectiveBounds`. No PR files were edited. The head is `6c542e985ca22d16721ff91bc8e539c7ddf31fed`; the outside-folder diff is empty. No sorry-valued data, admitted examples, computational algorithm, route-specific substitute for Silver, or consumer-to-supplier cycle was found. The proof routes use mathematical recursions/fusion, not executable algorithms.

### Gate, elaboration and signatures

The worker's gate is **FAIL** with `set_option=1`, `residue=2`, `readme-ids-missing=1`; all other reported counters, including `build`, `depcheck`, `stray-files` and `outside-folder`, are zero. R03–R05 cover every failing rule. A failed gate prevents acceptance even when its remaining defects are P3.

Independent `lake env lean` elaboration of `TauCetiRoadmap/BorelEquivalenceRelations/Suggested.lean` exited 0, with only the 61 `sorry` warnings. There are 80 declarations: 61 theorems, 18 definitions and one instance. A scratch copy with `#check @name` for **all 80** elaborated successfully. The two automated binder-loss leads are not defects: `RelIndependent` needs neither topology nor measurability, and `IsSmallFamily` uses only the measurable structure, which its elaborated type retains. The ambient Polish/Borel hypotheses remain on the separation, amalgamation, dichotomy and smoothness theorems that use them. The material signature mismatch found is R02; no original signature was changed.

All 61 admissions were tried with `simp`, `rfl` and `infer_instance`, using failing branches followed by the original `sorry`. None closed with those bare tactics. The four targeted `exact` probes in R08 closed; these are recorded as deletion findings, not requests to prove API in place. The original file without its option also elaborated successfully. The corrected general Alexandrov signature was separately elaborated, still admitted: this checks statability, not its proof.

Mechanical supplier-order output, verbatim:

```text
depcheck: 205 roadmaps, 1498 edges, 0 problem(s)
```

No UPWARD or CYCLE line appeared. There are no declared gaps and no `*Needs:*` lines to resolve; the missing per-target dependency presentation is R07. Reading the prose/table edges gives Mathlib → Layer 0 → Layers 1 and 2 → Layer 3 → Layer 4 → Layer 5, with the more limited dependencies of the E₀ results stated explicitly. CountableModelCounting and CountableStructureSpaces are consumers, not suppliers.

### Headline coverage

The README's end results are oriented and symmetric G₀ dichotomy; Silver in Polish, standard-Borel, cardinal and relative forms; the analytic perfect set theorem; smoothness via countable separation and for closed relations; Silver in reducibility form; and generic ergodicity/non-smoothness of E₀. Its deep supporting milestones include Gδ/complete-metrizability, Borel perfect sets, Kuratowski–Ulam, finite-arity Mycielski, comeagre continuity/Cantor stabilization, KST independent Borel supersets, invariant Lusin separation and amalgamation positivity.

All main summits have actual carriers and signatures in the file. The oriented dichotomy is tested by its general sparse-word existence theorem and dense-word exclusivity theorem; together they give the packaged canonical-word form. Silver's four forms are at lines 424,430,437,444, analytic perfect sets at 452, closed smoothness at 494 and E₀ non-smoothness at 520. There is no missing-carrier excuse needed for these. The full Alexandrov converse is statable but narrowed (R02); routine API is overrepresented (R08). No free proposition stands in for a missing mathematical condition.

### Pinned libraries and ownership

Pins inspected: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Paths below are relative to the repository. A supplier-name probe covered all 65 backticked tokens in the supplier table: two tokens are the namespace `PiNat`, and four require the table's implicit `CantorScheme` qualification; the remaining 59 resolved directly. Source inspection resolves those four qualified names. The independent native-instance probe fails for `PolishSpace (ℕ → Bool)` as claimed, but succeeds for Baire-space Polishness and Cantor-space standard-Borel/Borel instances.

| Object inspected | Pinned file and line | What it supplies / does not assert |
| --- | --- | --- |
| Polish spaces | `.lake/packages/mathlib/Mathlib/Topology/MetricSpace/Polish.lean:62,74,97,131,245,263` | Completely metrizable + second countable; nonempty continuous Baire-space surjection; closed/open subspaces; common Polish refinements and clopenability. Polishness does not assert nonemptiness. |
| Perfectness | `.lake/packages/mathlib/Mathlib/Topology/Perfect.lean:101,222,257,278` | `PerfectSpace`, closed-set countable/perfect decomposition and non-isolation characterization. The class does not itself supply `T₁` or nonemptiness. |
| Cantor injection | `.lake/packages/mathlib/Mathlib/Topology/MetricSpace/Perfect.lean:77,135` | `Perfect.exists_nat_bool_injection` and closed uncountable-set injection. The complete-metric perfect-set result needs nonemptiness. |
| Cantor schemes | `.lake/packages/mathlib/Mathlib/Topology/MetricSpace/CantorScheme.lean:68,119,139,158` | `CantorScheme.ClosureAntitone`, `VanishingDiam`, its continuity theorem, and totality from nonempty sets plus completeness. |
| Cylinders/restriction | `.lake/packages/mathlib/Mathlib/Topology/MetricSpace/PiNat.lean:109,191` | Cylinder membership fixes coordinates below `n`; restriction conses the newest coordinate first. The roadmap's reversal is necessary. |
| Analytic sets | `.lake/packages/mathlib/Mathlib/MeasureTheory/Constructions/Polish/Basic.lean:185,228,238,243,284,365` | Empty set or continuous Baire-space image; continuous images, nonempty countable intersections in Hausdorff spaces, countable unions, continuous preimages in the stated source setting. Analyticity does not assert Borelness or nonemptiness. |
| Separation | `.lake/packages/mathlib/Mathlib/MeasureTheory/Constructions/Polish/Basic.lean:511,523` | Analytic measurable separation and the analytic/complement criterion for measurability. |
| Lusin–Souslin | `.lake/packages/mathlib/Mathlib/MeasureTheory/Constructions/Polish/Basic.lean:821,835,854,882` | Borel images under the indicated continuous/measurable injections and measurable embeddings, with the source/target hypotheses in the native signatures. |
| Standard-Borel subspaces | `.lake/packages/mathlib/Mathlib/MeasureTheory/Constructions/Polish/Basic.lean:1099,1109` | Clopenable realization and `MeasurableSet.standardBorel`; the latter already supplies the Gδ specialization in R08. |
| Borel isomorphisms | `.lake/packages/mathlib/Mathlib/MeasureTheory/Constructions/Polish/Basic.lean:1126,1133` | Borel Schröder–Bernstein and uncountable-standard-Borel equivalence to Cantor space. |
| Countable separation | `.lake/packages/mathlib/Mathlib/MeasureTheory/MeasurableSpace/CountablyGenerated.lean:322,450` | Countable measurable point separation and a measurable injection into Cantor space. Does not assert that an arbitrary quotient is standard Borel. |
| Category operations | `.lake/packages/mathlib/Mathlib/Topology/Baire/BaireMeasurable.lean:159,172,197,209`; `Topology/Baire/Lemmas.lean:169` under the same Mathlib root | Open approximants, open-map preimage of meagre sets, homeomorphism transport and nonmeagreness of nonempty open sets in Baire spaces. |
| Setoid direction | `.lake/packages/mathlib/Mathlib/Data/Setoid/Basic.lean:200`; `.lake/packages/mathlib/Mathlib/Topology/Order.lean:152` | Bottom setoid is equality; smaller topologies in Lean's order are finer. Both antichain monotonicity directions are correct. |
| Eventual equality | `.lake/packages/mathlib/Mathlib/Order/Filter/Germ/Basic.lean:74,79` | `germSetoid` has relation `EventuallyEq`; `Germ` is its quotient. It does not bundle Borelness or countability of classes. |
| Tau Ceti analytic sets | `.lake/packages/TauCeti/TauCeti/MeasureTheory/MeasurableSpace/Analytic.lean:312` | Universal/null measurability of analytic sets under its hypotheses, not Silver, G₀, or the analytic perfect set theorem. |

Object searches covered analytic sets, perfect sets, residual/category sections, setoid quotients, countable separating families, eventual equality, graph colorings and family ideals in the pins. Main/open work was searched through `roadmaps grep`, with additional board-package and sibling-folder searches. Shared copies of this already-existing roadmap in sibling worktrees are not competing owners. No distinct owner of Silver, G₀, Mycielski or the antichain API was found. General finite-graph coloring occurrences and algebraic/smooth-representation notions of smoothness are different objects.

Three cross-roadmap references were resolved with `roadmaps show`, rather than inferred from their names:

- `TauCetiRoadmap/InfinitaryLogic/README.md:19,691` leaves invariant descriptive set theory, including Silver and G₀, outside its scope.
- `TauCetiRoadmap/CountableStructureSpaces/README.md:727–729` consumes exactly the four indicated results: Gδ Polishness/standard-Borelness, analytic products, and invariant separation. Its lines 330–331 and 582 use them in the claimed directions.
- `TauCetiRoadmap/CountableModelCounting/README.md:222–240` states the antichain, relative-Silver and cardinal contracts, and lines 117–119 prohibit reproving them. Its predicates are written inline as claimed at line 184. These are consumer contracts, not new suppliers of this roadmap.

The provided open-head index was searched for these objects; ownership claims above rely only on the resolved relevant roadmaps and supplied sibling folders. No declaration collision with a different readable roadmap was identified. The existing BorelEquivalenceRelations folder on main remains the owner; this repair does not call for a Part II or transfer ownership.

### Seeded source sample

All 15 requested sample headings were examined. None is explicitly marked “unverified” in the README. Exact published theorem/page checks are unavailable where the README supplies none; that is R06, not a guessed certification. The following are the text locations actually read. `infinitarylogic` is one work/revision; its file qualifier disambiguates the separately numbered source extractions.

| Seeded target | Read location and outcome |
| --- | --- |
| 0.1 Cantor and Baire space | `infinitarylogic`, `Descriptive/CantorStabilization.lean`, lines 57–90: local Cantor Polish instance, coordinate-flip non-isolation, countable-set meagreness and uncountability. This does not by itself supply the general infinite-product theorem; that target's finite-coordinate proof was checked independently. The new T₁ wording is correct. |
| 0.2 Gδ subspaces | `infinitarylogic`, `Descriptive/GDeltaPolish.lean`, lines 38–66: empty-inclusive forward implication using a closed diagonal embedding. Lines 17–30 expressly distinguish the absent converse. The full converse is narrower in Lean (R02). |
| 0.3 Analytic/Lusin–Souslin | `infinitarylogic`, `Descriptive/AnalyticClosure.lean`, lines 29–57: intersection/product/off-diagonal forms, with Hausdorffness where required. `infinitarylogic`, `Descriptive/BorelFunctionalGraph.lean`, lines 74–81,103–107,139–159 supplies the functional-Borel-graph result using pinned Lusin–Souslin at `Polish/Basic.lean:835,882`. The analytic-graph equivalence and saturation claims are separate targets, not claims that this functional-graph file already proves them. |
| 0.4 Perfect sets/cardinality | `infinitarylogic`, `Descriptive/CantorStabilization.lean`, lines 97–104: Borel refinement followed by the closed perfect set theorem. Pinned perfect injection and real measurable embedding supply the two cardinal bounds. Nonempty is necessary for equality with 𝔠. |
| 0.5 Antichains/transport/splits | `infinitarylogic`, `Descriptive/PerfectAntichain.lean`, lines 84–86,117–120,146–151,175–180,229–261,325–330; `Descriptive/AntichainTransport.lean`, lines 66–68,119–124; `Descriptive/CountableSplits.lean`, lines 41–46. Directions, nonemptiness and use of Borel extraction instead of transporting continuity agree. |
| 1.1 Kuratowski–Ulam | `kuratowskiulam1932` lines 88–106, §3, Theorem 1, printed pp.248–249; lines 163–166, §4, Theorem 2, p.250: meagre/nowhere-dense sections and Baire-property sections. OCR interleaves facing pages. `infinitarylogic`, `Descriptive/KuratowskiUlam.lean`, lines 118–122 has Baire assumptions for the converse; Miller manuscript Theorem 4, p.4, `miller2012` lines 151–154, also has them. The README's no-Baire, both-second-countable converse is a generalization, not literally either cited statement. No false instance found. |
| 1.3 Baire-measurable maps | `infinitarylogic`, `Descriptive/CantorStabilization.lean`, lines 111–148 verifies the simultaneous countable-discrete subcopy form. The general comeagre-Gδ continuity statement is not in that file; Kechris is not legally available here beyond its publisher record. Its countable-base/open-approximant argument was checked independently. |
| 1.4 G_S/independence | Miller author manuscript Proposition 6 and Corollary 7, p.5, `miller2012` lines 170–195; Lecture I Proposition 3, p.3, `millerlectures` lines 94–105. The word density, coordinate-flip argument and sparse/dense distinction agree. |
| 2.3 Family ideals | Miller author manuscript proof of Theorem 8, p.6, `miller2012` lines 222–230 treats finite homomorphism families. The actual generalization is in `infinitarylogic`, `Descriptive/G0Dichotomy.lean`, lines 289–352. Its countable-coordinate avoidance set is Borel; no continuity of `comb` is needed for positivity. |
| 4.1 Category route | Lecture I Theorem 11/Lemma 12, p.7, `millerlectures` lines 256–277; survey Theorem 11, p.7, `miller2012` lines 262–277. For the Borel specialization, pullback classes have the Baire property, independence makes them meagre, product meagreness precedes Mycielski. |
| 4.3 Consumer interface | The relative/counting forms are derived consequences, not separate claims in Miller. Their mathematical derivations and the actual consumer contract at CountableModelCounting lines 222–240 were checked. R06 asks for these locators to be attached to the claims. |
| 5.1 Reducibility | `hkl1990` lines 66–75, §1(A), p.904 explicitly gives relation reflection/preservation and the induced quotient injection. Empty carriers and direction were tested. |
| 5.2 Smoothness | `hkl1990` lines 22–30, p.903, and 74–75, p.904 gives separating families and reduction to equality; Theorem 1.1, p.905, lines 86–101 confirms the usual Polish-Borel context. The roadmap's measurable-space countable-separation equivalence is independently obtained by the native quotient σ-algebra and measurable Cantor injection. Closed smoothness follows by the invariant-separation route stated here. |
| 5.3 Silver reducibility form | Combine the verified Silver embedding with the quotient injection in `hkl1990` lines 66–70; both directions were checked. Gao supplies no accessible exact locator in this review. |
| 5.4 E₀ | `hkl1990` lines 60–65, p.904 gives eventual equality and non-smoothness (by a measure argument). The README's category argument and explicit repeated-coordinate antichain were checked independently. The source is not represented as containing that exact category proof. |

Additional sources: Mycielski's Theorem 1 and its construction, printed pp.141–142, `mycielski1964` lines 55–87,98–128, supplies simultaneous finite-arity avoidance on distinct tuples; the roadmap's nullary extension is harmless because the only meagre subset of the one-point nullary power is empty. The external binary source is not substituted for this general statement. Burgess's Corollary 2, printed p.325, `burgess1978` lines 116–120 supports the out-of-scope analytic-equivalence assertion. HKL Theorem 1.1, p.905 supports the excluded converse, including its continuous-embedding formulation. All eleven bibliography works were attempted through the source service; six mathematical texts and the external code work were obtained, and the remaining four are listed below.

### Adversarial table: all 80 Lean declarations

Notation: `C = ℕ → Bool`; `0∞` and `1∞` are constant sequences; `E₁(x,y)` means `x 0 = y 0`; `⊥` is equality and `⊤` the universal relation. `T/F` are computed truth values. Each row records concrete boundary or distinguishing values, not a claim that testing proves a universal theorem. “Keep” means no mathematical correction identified by this instance; API-only entries can still be removed under R08.

| Declaration (Lean line) | Instances tried | Values on hypotheses/left side and conclusion/right side | Result / change |
| --- | --- | --- | --- |
| `instPolishSpaceCantor` (34) | C; native search | Complete metrizability=T, second countability=T; Polish constructor=T; unassisted Polish instance search fails | Keep necessary instance |
| `perfectSpace_pi` (38) | Bool^ℕ; Bool^Fin 1 | Infinite-index hypothesis=T/F; isolated points=0/2 | Keep; finite index is excluded |
| `Set.Countable.isMeagre` (43) | `{0∞}` in C; indiscrete Bool | C: countable=T, meagre=T; indiscrete: T₁=F, whole set countable=T, meagre=F | Keep T₁ |
| `prependWord` (49) | `w=[]`, `[true,false]`, tail `1∞` | Empty prefix gives `1∞`; two-letter prefix at indices 0,1,2 gives true,false,true | Keep; subtraction used only after prefix |
| `wordCylinder` (53) | `[]`, `[true]` | Ranges are C and `{x:x0=true}`; 0∞ belongs T/F | Correct; API-only definition |
| `isOpenEmbedding_prependWord` (55) | Prefix `[true]` | Output coordinate 0=true; dropping first coordinate recovers tail exactly; range clopen=T | Correct API |
| `wordCylinder_reverse_res` (61) | x starts true,false; n=0,2 | `res x 2=[false,true]`; reverse=[true,false]; both cylinders fix `(true,false)`; n=0 both C | Correct reversal; API |
| `IsGδ.polishSpace` (70) | Empty subset, ℝ\ℚ | Empty: Gδ=T, Polish=T; irrationals: Gδ=T, Polish=T despite not closed | Keep |
| `isGδ_of_polishSpace_subtype` (75) | ℚ⊆ℝ; uncountable discrete univ | ℚ: complete metrizability=F, Gδ=F; discrete univ: complete=T, Polish=F, Gδ=T | R02: generalize binder |
| `IsGδ.standardBorelSpace` (79) | Empty, irrationals | Both Gδ=T and standard Borel=T; native measurable-subspace theorem applies | R08: delete specialization |
| `AnalyticSet.inter` (89) | `{0,1}∩{1,2}` in ℝ | Intersection={1}; all three analytic=T | Correct finite-index API specialization |
| `AnalyticSet.prod` (93) | `{0,1}×{2}`; ∅×C | Product={(0,2),(1,2)} / ∅; analytic=T/T | Keep mathematics |
| `AnalyticSet.offDiag` (97) | `{0}` and `{0,1}` | Off-diagonals=∅ and {(0,1),(1,0)}; analytic=T/T | Keep mathematics |
| `analyticSet_saturation` (103) | E₁ on C; A={0∞}; A=∅ | Saturations={x:x0=false} and ∅; analytic=T/T | Keep |
| `analyticSet_graph_iff_measurable` (109) | Identity ℝ; constant zero | Graphs=diagonal / ℝ×{0}; measurable=T, analytic=T in each | Keep |
| Borel perfect set theorem (116) | Irrationals; ℚ | Uncountability=T/F; irrational set has a Cantor copy, ℚ cannot contain an injection C→ℚ | Keep essential uncountability |
| `Perfect.mk_eq_continuum` (126) | C; ∅ | Nonempty=T/F; cardinal=𝔠/0 | Keep nonempty |
| `mk_le_continuum_of_standardBorelSpace` (130) | Empty, Bool, ℕ, C | Cardinals 0,2,ℵ₀,𝔠; all ≤𝔠 | Correct bound |
| `HasPerfectAntichainOn` (143) | E=⊥/⊤ on C, A=C; A=∅ | Values T/F/F; P=C witnesses equality; universal relation forces at most one point | Keep object |
| `HasCantorAntichainOn` (148) | Same; constant candidate | Values T/F/F; identity works for ⊥; constant candidate sends distinct inputs to related points | Keep object |
| `IsThinOn` (152) | E=⊥/⊤ on C | Perfect-antichain=T/F; thinness=F/T | Correct, but unused acceptance definition |
| Antichain injectivity (155) | Identity on C; constant map | Pairwise inequivalence=T/F; injective=T/F | Correct routine API |
| Antichain relation monotonicity (161) | ⊥≤E₀; ⊥≤⊤ | E₀ antichain gives equality antichain: T→T; ⊤ antichain=F | Correct direction |
| Antichain topology monotonicity (165) | Usual C topology → indiscrete topology | Finer≤coarser=T; identity into usual/indiscrete target continuous=T/T | Correct Lean order |
| Antichain subtype iff (172) | A=C; A={0∞}; A=∅, equality | Left/right respectively T/T, F/F, F/F | Correct API |
| Antichain quotient lower bound (177) | Equality on C; E₁ | Quotient=𝔠/2; antichain=T/F; 𝔠≤𝔠=T | Correct |
| Cantor iff perfect antichain (181) | Equality/universal relation on C | Both sides T/T for equality, F/F for universal relation | Keep |
| Antichain measurable-embedding transport (187) | Identity; prefix map `[true]`; A=∅ | Equality antichains T↔T for full domain; empty sets F↔F; prefix map image is its clopen cylinder | Keep; no Borel-A premise needed |
| Countable splits (202) | On ℝ, Pₙ(x): x=n; empty index | Exceptional set=ℕ; all predicates false outside it; empty-index exception set=∅ | Keep |
| `curry_le_residual` (216) | C×C minus diagonal; empty factor | Diagonal complement residual=T; every section C\{x} residual=T; empty product residual contains every subset | Keep correct filter direction |
| Residual sections iff (220) | s=C×C\Δ; s=∅; X=Y=ℚ | C cases T↔T and F↔F; ℚ product and factors meagre in themselves, both residual filters degenerate, both sides T | No Baire counterexample found |
| Meagre from sections (227) | Diagonal in C×C; whole square | Singleton sections meagre=T and diagonal meagre=T; whole-square sections meagre=F | Keep |
| `mycielski` (238) | k=0; k=1 R={0∞}; k=2 R=Δ | Nullary meagre R=∅, unique tuple avoids R; prefix-true map avoids 0∞; distinct tuples avoid Δ | Keep nonempty/perfect and injective tuple conditions |
| `mycielski_cantor` (245) | M=∅; M=Δ | Identity works; for a≠b, pair membership=F in both cases | Correct specialization |
| Comeagre-Gδ continuity (256) | Dirichlet indicator on ℝ; X=∅ | C=irrationals is residual Gδ; restriction constant 0, continuous=T; original function nowhere continuous; empty case C=∅ works | Keep relative continuity |
| Cantor subcopy continuity (264) | Empty map family; coordinate maps gᵢ(x)=xᵢ | e=id; each coordinate continuous=T; empty family imposes zero continuity tests | Keep |
| `orientedGS` (275) | S=∅; S={[]} | No edges / edges (false⌢x,true⌢x); reverse orientation=F | Keep |
| `gSGraph` (279) | S={[]}; pair y=false⌢x,z=true⌢x | Adj(y,z)=T, Adj(z,y)=T, Adj(y,y)=F | Keep symmetry/looplessness |
| `gSGraph_adj_iff` (283) | The preceding edge/reverse/diagonal | Left/right T/T, T/T, F/F | Correct API |
| `DenseWords` (288) | ∅; {[]}; all words; canonical words | F,F,T,T; `[true]` has no extension in {[]} | Keep |
| `SparseWords` (292) | ∅; {[]}; all words; canonical words | T,T,F,T; all words contain `[false]` and `[true]` of length 1 | Keep |
| `canonicalWord` (299) | n=0; n=pair(encode r,k), k≥length r | n=0 output=[] regardless of decode; second case length=n, prefix=r, padding length=n−length r | Keep; both conditional branches have length n |
| `canonicalWords` (304) | Length 0; length 1 | Exactly one word at each length; length-0 member=[] | Keep supporting definition |
| Canonical density (306) | r=[]; r=[true,false] | For k≥length r, n=pair(encode r,k)≥length r; first length(r) bits exactly r | Correct supporting result |
| Unique canonical length (309) | n=0; arbitrary n | Number of canonical members of length n=1; at 0 the member=[] | Correct API; R08 |
| `gZero` (314) | First level; diagonal | canonicalWord 0=[] gives edge false⌢x—true⌢x; all self-adjacencies=F | Keep |
| Borel oriented G_S (316) | ∅; {[]} | Empty relation is closed; single-prefix relation is compact image of C, hence closed; Borel=T/T | Correct; infinite S is countable union |
| Miller independence (321) | B=C; B={0∞}; S={[]} and B={x:x0=false} | Dense case C contains first-level edge; singleton nonmeagre=F; nondense case B nonmeagre=T and independent=T | Keep density and nonmeagreness |
| `RelIndependent` (335) | G=∅; one-point loop; two-vertex edge | Whole carrier independent=T/F/F; singleton endpoint in loopless edge graph independent=T | Keep loops included |
| Countable Borel coloring (339) | Empty relation; one-point loop; finite edge | Colorable=T/F/T; finite edge colors 0,1 satisfy 0≠1 | Keep |
| Coloring iff cover (342) | One-point loop; empty relation | Loop: coloring=F, independent cover=F; empty: coloring=T, cover B₀=X=T | Correct both directions |
| Simple-graph coloring iff (348) | K₂; empty graph | Map colors 0,1 gives both sides T; constant map on K₂ violates both coloring conditions | Correct interface API |
| Independent Borel superset (357) | One-point loop A=∅; K₂ A={0} | B=∅/{0}; analytic=T, independent=T, Borel=T, containment=T | Keep |
| Invariant separation (363) | E₁ on C; A={0∞}, B={x:x0=true} | Saturation(A)={x:x0=false}; choose this as separator; invariant=T, disjoint B=T | Keep; A need not be invariant |
| `IsSmallFamily` (373) | Φ=∅; ι=∅ and Φ={empty map}; G loop on one point | Small=T/F/F; empty assignment has zero values to capture | Keep; no lost topology needed |
| Small-family union (377) | Empty family sequence; singleton-coordinate families over ℕ with G=≠ | Empty union small=T; singleton pieces captured by singletons, union captured by countably many singletons | Correct; extra Polish binders unnecessary for this API |
| Cross-combination positivity (384) | X=Unit, G={(⋆,⋆)}, ι=Unit, Φ=univ; κ=Unit/Empty | Only independent B is ∅; Φ non-small=T; cross-family is one assignment, non-small=T for either κ | Keep; no nonempty κ needed |
| Sparse oriented homomorphism (401) | One-point loop target; empty target | Loop target not-colorable=T, constant homomorphism=T; empty target colorable=T so premise F | Keep loops and empty-carrier handling |
| Dense exclusivity (407) | Identity G₀→G₀; S={[]} into K₂ | Dense case coloring=F; nondense first-coordinate hom exists=T and coloring=T, so density is necessary | Keep |
| `g0_dichotomy` (413) | Empty graph on C; K₂; G₀ | (coloring,continuous hom)=(T,F),(T,F),(F,T); Xor=T each | Keep |
| `silver_dichotomy` (424) | Empty, equality on ℕ, E₁ on C, equality on C, E₀ | (#classes,antichain)=(0,F),(ℵ₀,F),(2,F),(𝔠,T),(𝔠,T) | Keep |
| Standard-Borel Silver (430) | Empty; equality on C | Countable alternative=T/F; measurable embedding antichain=F/T (identity in second case) | Keep |
| Cardinal Silver (437) | Same quotient list | 0≤ℵ₀, ℵ₀≤ℵ₀, 2≤ℵ₀, 𝔠=𝔠, 𝔠=𝔠 | Keep |
| Relative Silver (444) | A=∅; A=C, R=⊥, F=E₀; reversed R=⊤,F=⊥ | Empty quotient countable=T; refinement ⊥≤E₀=T and equality antichain=T; reverse premise F on distinct points | Keep relation implication direction |
| Analytic perfect set theorem (452) | Countable analytic set; closed Cantor copy; empty set | Uncountability=F/T/F; injection exists only in middle example; Hausdorff=T | Keep |
| `BorelReducible` (467) | Equality on Bool→equality Unit; reverse; Empty→Unit | Reducible=F/T/T; quotient injections 2→1 impossible, 1→2 possible, 0→1 possible | Keep direction and both implications |
| Reducibility reflexivity (470) | Any E, f=id | E(x,y)↔E(x,y)=T; measurable id=T | R08 routine identity |
| Reducibility transitivity (473) | E=ker f, F=ker g, actual composable reductions | E(x,y)=F(fx,fy)=G(gfx,gfy); composite measurable=T | R08 routine composition |
| `IsSmooth` (479) | ⊥ on C; ⊤ on C; E₀ | Smooth=T/T/F; identity/constant witness first two | Keep |
| Smooth iff separated quotient (484) | E₁; indiscrete measurable Bool with equality | First quotient size=2, separated=T, smooth=T; second separated=F, smooth=F | Keep; arbitrary measurable spaces meaningful |
| Countable quotient smooth (488) | Empty; E₁; equality ℕ | Quotient sizes 0,2,ℵ₀; all smooth=T; class sections Borel=T | Keep |
| Closed relation smooth (494) | Equality; universal relation; equal absolute values on ℝ | Graph closed=T in all; smooth=T; quotient sizes 𝔠,1,𝔠 | Keep; R01 concerns only example cardinality |
| Silver reducibility iff (499) | E₁; equality C; E₀ | (Cantor equality reduces, quotient uncountable)=(F,F),(T,T),(T,T) | Keep both directions |
| `eZero` (509) | 0∞ vs one-coordinate flip; 0∞ vs 1∞ | Eventually equal=T (N=1)/F; equality at all coordinates=F/F | Keep eventual, not literal equality |
| Borel E₀ (511) | Same pairs | Membership in ⋃N⋂n≥N equality sets=T/F; each tail-equality set closed=T | Keep |
| Generic ergodicity (515) | Eventually-zero sequences; complement; first-bit cylinder | First meagre=T,residual=F; complement F/T; cylinder neither but invariant=F | Keep invariance essential |
| E₀ non-smooth (520) | Candidate quotient separator countable family | Each invariant test constant on a comeagre set; common pattern would force a countable class comeagre, contradicting meagre=T and Baire | Keep deep obstruction |
| E₀ Cantor antichain (524) | Inputs differ at coordinate k | Repeated outputs differ at every pair(k,j), j∈ℕ; disagreement set infinite; E₀=F, continuity=T | Keep |
| Cantor equality reduces to E₀ (527) | Same repeated-coordinate map; equal inputs | Distinct: equality=F,E₀=F; equal: T/T; measurable=T | Correct consequence |
| E₀ reduction prevents smoothness (532) | E=E₀; E=⊤ | Premise=T/F; smoothness=F/T; composition would reduce E₀ to equality | R08 elementary consequence |

### Adversarial table: remaining README statements and conventions

The following 49 rows cover the remaining prose statements, conventions and worked examples.

These rows cover prose-only claims, the additional sampled/consumer targets, proof-route operations and all eight worked examples. They supplement, rather than replace, the declaration rows.

| Statement / location | Instances tried | Computed values | Result / change |
| --- | --- | --- | --- |
| Perfect and comeagre consequence, 0.1 | Indiscrete Bool; C | Indiscrete Bool: perfect=T,Baire=T,T₁=F,univ comeagre=T,card=2; C: singleton meagre=T, residual set uncountable=T | PR's T₁ repair excludes counterexample |
| Prefix order/cylinder inclusion, 0.1 | r=[true], s=[true,false]; reversed pair | r prefix s=T; cylinder(s)⊆cylinder(r)=T; reverse inclusion=F, witnessed by 1∞ | Correct contravariant inclusion |
| Coordinate flip, 0.1 | n=1, prefix s=[true] | `(true,false,tail)` maps to `(true,true,tail)`; flip twice=id; first coordinate unchanged | Correct normalization |
| Completely metrizable Gδ converse, 0.2 | Uncountable discrete univ; ℚ⊆ℝ | Complete=T/F; Gδ=T/F; Polish of first space=F | R02 |
| Analytic intersection with Borel set / projection, 0.3 | A=C, B={x:x0=true}; R={(0,1),(0,2)} | A∩B=B analytic=T; fst image R={0}, analytic=T | Correct; cite native image theorem for projection |
| Analytic relation neighborhood, 0.3 | G={(0,1)}, A={1}; A={0} | Symmetric neighborhoods={0}/{1}; analytic=T/T | Both orientations included |
| Functional Borel graph, 0.3 | G=∅; G={(0,1)}; G={(0,1),(0,2)} | Domains=∅/{0}/{0}; first two projections injective=T; last injective=F | Uniqueness premise excludes last case |
| Nonempty perfect cardinal bound, 0.4 | C; empty perfect set | Cardinal=𝔠/0, nonempty=T/F | Correct; upper bound needs separability |
| Antichain monotonicity in A, 0.5 | Equality C, A=∅⊆C | Has-antichain values F→T; implication from A to larger set=T | Correct, converse not promised |
| Cantor-to-perfect / reverse, 0.5 | Identity C; constant image | First image=C compact closed perfect=T; second image singleton perfect=F | Injectivity/nonempty perfectness exclude wrong model |
| Quotient cardinal from Cantor antichain, 0.5 | E₀; E₁ on C | Counts 𝔠/2; hypothesis T/F | Correct |
| Cantor-scheme extraction, 0.5 | Native cylinders indexed by newest-first restrictions | Branch intersection={x}; level-n diameter≤2⁻ⁿ→0; equality-sibling cross-relation=F; replacing both siblings by same nonempty set makes cross premise F | No sibling-disjointness field needed |
| Thinness transport, 0.5 / R05 | Identity embedding, equality/universal on C | Thin left/right F/F and T/T | Correct property; remove undeclared identifier |
| Splits range/concentration, 0.5 | Pₙ(x):x=n on ℝ; map encoding truth vectors | Exceptional points ℕ; outside pattern all-false; range={zero vector}∪{unit vectors}, cardinal ℵ₀ | Correct; countable domain allows all points exceptional |
| Nowhere-dense sections, 1.1 | Diagonal C×C | Product interior of closure=∅; section={x}, section interior of closure=∅ | Correct |
| Meagre product API, 1.1 | {0∞}×C; C×{0∞} | Both closed with empty interior; meagre=T/T | Correct in either coordinate |
| Baire-property sections, 1.1 | Diagonal and its complement | Sections singleton/open-complement respectively; BP=T for every x | Correct |
| Mycielski finite-stage caveat, 1.2 | E₀ on C | Every nonempty cylinder pair contains eventually equal points; finite-stage avoidance=F; repeated-coordinate Cantor range has avoidance=T on distinct points | Limit avoidance is necessary |
| G_S is Fσ, 1.4 | One prefix; countably many prefixes | One-prefix relation compact/closed=T; union has countably many closed pieces | Correct; clopen-domain compactness supplies closedness |
| Baire colorings/class meagreness, 1.4 | G₀; countable candidate coloring | Each independent Baire fiber meagre=T; countable union meagre=T contradicts nonmeagreness(C) | Correct |
| Pullback meagre classes, 1.4 | Identity into C, E=⊥ | G₀ endpoints unequal=T; pullback section={a}, meagre=T | Correct |
| Coloring pullback/monotonicity, 2.1 | K₂ colors 0,1; identity; empty subrelation | Pullback colors unchanged; removing edge makes constant coloring valid | Correct direction |
| Inequivalence coloring iff countable quotient, 2.1 | E₁, ⊤, E₀ | Quotient sizes 2,1,𝔠; Borel colorable=T,T,F | Correct and nonvacuous |
| Independent-superset construction, 2.2 | Two-vertex edge, A={0} | Neighborhood(A)={1}; choose every separator={0}; intersection independent=T | Decreasing construction preserves containment |
| Invariant-separation construction, 2.2 | E₁ and opposite cylinders | Saturating either cylinder returns itself; separator union remains first cylinder | Correct |
| Small-family seed, 2.3 | Nonempty coordinate set; empty coordinate set | Full family small iff coloring for nonempty indices; empty-index full family is singleton, not small even for empty relation on Unit | Nonempty-index premise essential |
| Plain combinations, 2.3 | Loop target on Unit; κ=Empty | Positive input singleton; combined family singleton empty assignment, still non-small | Arbitrary κ allowed |
| Analytic combined family, 2.3 | Finite indices, singleton loop family; continuous projection comb | Cross condition T; image singleton analytic=T | Correct; countable input indices control measurability/Polishness |
| Vertex shrinking/witness extension, 2.3 | Unit loop graph; constant Baire witness | All coordinate diameters=0≤2⁻ⁿ; word extension length m→m+1, represented edge unchanged | Consistent boundary case; use compatible metric |
| Fusion stages, 3 | S={[]}; n=0,1,2 | Vertices 1,2,4; edges 0,1,2; n=1 extension copies edge into 00–10 and 01–11 | Correct last-bit combination direction |
| Fusion Cauchy control, 3 | Child values selected from parent assignments | Successive value distance≤2⁻ⁿ; tail bound≤2^(1−n)→0; nested witness prefixes determine a single Baire sequence | Parent-value inheritance is necessary and supplied by combination/refinement |
| G₀-to-inequivalence corollary, 3 | E₀, E₁ | Non-countable-colorability=T/F; identity G₀→¬E₀ is F (G₀⊆E₀); existence for E₀ needs the actual theorem | No identity-map shortcut used |
| Silver route, 4.1 | Equality on C; universal relation | Equality pullback=Δ, sections meagre=T, Mycielski identity works; universal has one class, so uncountable premise F | Correct order of inputs |
| Relative/consumer interface, 4.3 | A=C, R=⊥, F=E₁; A=∅ | First alternative countable with 2 classes; empty quotient 0; no antichain is inferred from the countable alternative | Consumer contract matches |
| Equalities reducible iff cardinal inequality, 5.1 | Empty→Unit; Unit→Empty; Bool→Unit | Reducible T/F/F; cardinal inequalities 0≤1=T,1≤0=F,2≤1=F | Correct including emptiness |
| Smoothness with other uncountable standard-Borel target, 5.2 | ℝ vs C | Both cardinal 𝔠; Borel isomorphism exists; equality classifiers transfer in both directions | Correct uncountable-target premise |
| Smooth implies Borel / downward closure, 5.2 | E₁ classifier first bit; E₀→smooth hypothetical | E₁ graph is preimage of equality, Borel=T; composite hypothetical classifier would contradict E₀ non-smoothness | Correct |
| Countable quotient discrete/bireducible, 5.2 | E₁; universal relation on nonempty X | All subsets of 2-point/1-point quotient measurable; representative selector from finite discrete quotient measurable | Correct; empty X gives empty selector |
| Beginning reducibility order, 5.3 | Empty, Unit, ℕ, C, E₀ | Minimal representatives Fin 0,Fin 1,ℕ,C,and above C; quotient counts 0,1,ℵ₀,𝔠,𝔠 | Fin 0 is needed and allowed |
| E₀ classes countable/dense, 5.4 | Class of 0∞; arbitrary cylinder w | Class consists of finite-support sequences, cardinal ℵ₀; w⌢0∞ lies in the class and cylinder | Correct |
| E₀ atTop/cofinite convention, 5.4 | Disagreement {0}; disagreement all ℕ | Finite/Tail-bounded=T/T for {0}; F/F for ℕ | Correct on ℕ |
| E₀ no open sibling scheme, worked example 4 | Cylinders w and v | w⌢0∞ and v⌢0∞ are eventually equal after max(length w,length v) | Correct obstruction |
| Worked example 1 | Equality on ℝ | Quotient=ℝ, cardinal 𝔠, smooth=T, Cantor antichain=T | Correct |
| Worked example 2 | First coordinates on C and Baire space | Quotient counts 2 and ℵ₀; closed/smooth=T/T; Cantor antichain=F/F | Correct |
| Worked example 3 | Absolute value; constant zero | Quotient cardinal 𝔠/1; both graphs closed and smooth | R01 |
| Worked example 5 | Rational-difference relation on ℝ | 0~1/2=T, 0~√2=F; every class x+ℚ countable dense; graph Fσ=T; smooth=F | Correct; no E₀ bireducibility asserted |
| Worked example 6 | Inequivalence of E₀/E₁; G₀; G_{ {[]} } | Countable Borel colorability F/T/F/T; last coloring uses first bit | Correct |
| Worked example 7 | Mycielski applied to E₀ | Product-meagre=T; distinct inputs under repeated-coordinate map have E₀=F | Consistent with explicit antichain |
| Worked example 8 | ℝ×{0∞}; {0}×Baire space | Closed source uncountable in both; first projections ℝ/{0}; uncountable-projection premise T/F | Necessary premise is present |

## Not verifiable

- **Missing exact README locators:** the sample table reports what was actually read, not certification of nonexistent theorem/page citations. R06 covers this repair.
- **`kechris1995`:** the source service classified the Springer DOI as paywalled/uncertified. No local copy was supplied. Thus Kechris theorem numbers mentioned by other sources (notably 8.38, 8.41, 19.1) were not checked against the book itself. The existing code and independently checked arguments do not certify the book's pages.
- **`gao2009`:** the service reached the Taylor & Francis DOI landing page; publisher/book-catalog searches yielded no legal full text. The unresolved record is retained under the same key in `needs-references.toml`. Reducibility and smoothness were cross-checked against the legally read HKL paper, but Gao's exact numbering/pages remain unchecked.
- **`kst1999` and `silver1980`:** the source service classified the Elsevier records as paywalled/uncertified. Miller's own classical proof was read; this does not certify the original papers' exact theorem numbers. No paywall was bypassed.
- **Miller version correspondence:** the author survey is the 25-page manuscript with printed pages 1–25. Its numbering was not assumed to match the published pp.554–575. References in this report explicitly refer to the manuscript; the README should do likewise or verify the published numbering.
- **External formalization axiom claim:** all 19 linked source files/proof-map documents were legally fetched at `518a366` and the relevant signatures/proofs inspected. The source's complete transitive import graph was not rebuilt at its own pins, so README lines 725–733's global sorry-free/axiom claim is not independently certified by this review. The adaptation differences actually used are recorded in the sample table.
- **Mathlib proposal status:** the proposal numbers are design references, not suppliers at the pins. Their present merge state was not used to assert availability. Pinned declarations and native instance search, rather than current proposal status, were checked.

## Source issues

- **Misprint** in miller2012 at §3, definition of sparse word sets immediately before Theorem 8, manuscript p.5 (`miller2012` line 188): the source says sparsity is defined for a subset of infinite binary sequences; it should be a subset of finite binary sequences; affects nothing.
- **Error** in millerlectures at Theorem 11, opening sentence of its proof, printed p.7 (`millerlectures` line 261): the source says the two alternatives are mutually exclusive for arbitrary κ; it should be exclusivity only when κ<𝔠, since equality on Cantor space satisfies both for κ=𝔠; affects the proof.
