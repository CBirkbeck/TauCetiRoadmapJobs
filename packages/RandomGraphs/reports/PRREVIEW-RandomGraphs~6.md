# Review of RandomGraphs (pull request #1223 at d648626)

**Verdict:** needs changes

🤖 Independent AI review. Incremental re-review of 122 changed lines since `1752d9d`, confined to `TauCetiRoadmap/RandomGraphs/`. Eight findings remain, two blocking. The targeted build and direct elaboration pass; the text gate fails. No pull-request file was changed.

## R01 (P2) — The acceptance test still omits statable headlines

**Location:** `TauCetiRoadmap/RandomGraphs/Suggested.lean:14`: “not exhaustive”; `TauCetiRoadmap/RandomGraphs/README.md:482`, 498, 607, 654, 672, 686, 767.

**Claim:** The acceptance test covers the statable endpoints and identifies those lacking native carriers.

**Witness:** Atomic isolation, finite consequences, all-rank varying-parameter and joint limits, the unconditioned rooted limit, graph-property endpoints, and general invariant-event/mixture conclusions remain absent. Their native carriers and the surviving omissions are itemized below.

**Repair:** Add these headline statements with their exact hypotheses and `sorry`; identify vertex connectivity and its missing native carrier in the module docstring. Rewrite that docstring as target signatures. Keep the newly added Fraïssé, completeness, categoricity and primeness statements. Test atomic isolation on the repeated pair `(0,0)` and the adjacent distinct pair `(0,1)`: their equality and adjacency diagrams differ, so they must isolate different types. The unconditioned adjacency limit must be `p`, whereas its two conditioned limits are 0 and 1.

Re-raised: R01 of `PRREVIEW-RandomGraphs~5` (earlier R02). The previously recorded reason, the repository's nonexhaustive-prototype guidance, does not discharge this job's explicit requirement to state every statable headline. Adding five missing headlines repairs part of the finding, not the rest.

## R02 (P2) — Executable implementations remain mandated

**Location:** `TauCetiRoadmap/RandomGraphs/README.md:468`: “a genuine terminating syntactic procedure”; line 477: “A semantic QE statement without the procedure does not discharge this target”; `TauCetiRoadmap/RandomGraphs/Suggested.lean:21`: “requires executable implementations”.

**Claim:** Besides existence and correctness of computable maps, implementation of an algorithm is required.

**Witness:** `exists_computable_quantifierElimination` and `exists_computable_decide_rado` already state the mathematical computability endpoints. The quoted requirement adds executable delivery; proving the semantic corollary at line 386 does not remove it.

**Repair:** Specify existence of computable maps and correctness as the endpoints; retain pattern elimination and consistency testing as a mathematical proof route, and remove the executable-delivery requirement. The test `∃y Adj(x₀,y)` still eliminates to truth in every model of `T_R`.

Re-raised: R02 of `PRREVIEW-RandomGraphs~5` (earlier R12). The recorded reason, “the roadmap's chosen endpoints”, does not override the binding exclusion of computational algorithms; the computability theorems themselves can remain.

## R03 (P3) — Proving padding in place does not remove it

**Location:** `TauCetiRoadmap/RandomGraphs/Suggested.lean:64`, 154, 164, 382, 603, 622, 738.

**Claim:** The acceptance test retains six declarations previously identified as padding and adds another elementary comparison.

**Witness:** Four retained declarations now have explicit projection/monotonicity/definitional proofs. The new Scott comparison is exactly transitivity of two equivalences. The extension-zero theorem is a boundary case; isolated expectation remains the README's elementary Check.

**Repair:** Delete from `Suggested.lean`:
`StrongAmalgamation.amalgamation`, `hasExtensionUpTo_zero_iff`, `HasExtensionUpTo.mono`, `exists_isQF_equivalent`, `satisfies_cardEq_iff`, `productGraphon_isolated_expectation`, and `satisfiesInf_radoSentenceInf_iff_scottSentence`. Keep their mathematics in the README. The removed `nonempty_iso_rado` is repaired. The new comparison's proof is correct, but a one-term corollary is not an acceptance-test headline. Rechecked values: empty-carrier extension is false, `CardEq 0` is true on the empty carrier, and isolated expectations at `n = 0,1,2` are `0,1,3/2`.

## R04 (P3) — The LaTeX gate still fails

**Location:** `TauCetiRoadmap/RandomGraphs/README.md:9`, 796–799, 811–819, 931 and throughout.

**Claim:** Mathematics uses the required Unicode/code-span form.

**Witness:** Both the supplied head gate and my rerun report `latex=496`; the other text-scanner categories pass. The changed density and infinitary paragraphs add delimiters rather than resolving the previous finding.

**Repair:** Replace dollar-delimited mathematics with Unicode prose, ASCII code spans or indented displays. Preserve the repaired closed interval `[0,1]` and the expectation's `n = 0` case. Check that the endpoint densities are still 0 and 1 and both sides of the expectation identity are 0 at `n = 0`.

## R05 (P3) — Process-specific narrative remains

**Location:** `TauCetiRoadmap/RandomGraphs/README.md:106`: “files at Tau Ceti `2fd255d99`”; lines 147–148: “closed without merging; its names still fix the target shapes”; lines 970–977.

**Claim:** The roadmap is timeless.

**Witness:** Pin hashes remain at lines 106–107 and 808; numbered proposal/status narrative remains at 147–155, 359, 379, 477 and 971–977. The scanner's `prnum=0` does not certify these manually visible passages.

**Repair:** Cite the verified library files and declarations without pin-status narration. Move proposal history to the pull-request description; describe any retained API-design provenance without process numbers or closure status. The supplier remains `SimpleGraph.HasExtensionProperty.realize_scottSentence_iff`, whose arbitrary-target-cardinality statement was verified at the pin.

## R06 (P3) — Definition Checks and target dependencies remain missing

**Location:** `TauCetiRoadmap/RandomGraphs/README.md:27` and its milestone sections, including the newly represented finite-graph class at line 375.

**Claim:** Definitions have an API and at least three discriminating Checks, with target-level dependencies and the prescribed layer structure.

**Witness:** There are zero `*Needs:*` lines and zero `**Checks.**` lists. The exact-supplier, build-reading, downstream-consumer, and per-layer Examples/Dependencies headings are absent. The new `finiteGraphs` definition has no such explicit checks.

**Repair:** Reshape the README into the required sections and layers, preserving its mathematics. Give each definition its API and three discriminating Checks, and each target its dependencies. For `finiteGraphs`: the empty graph and `K₂` belong; a one-point reflexive relation fails the graph axioms; the infinite Rado graph fails finiteness. Retain the earlier requested checks on bounded extension (`Fin 0`, `K₁`, `C₄`) and strong versus ordinary amalgamation.

## R07 (P3) — Claims still lack local source locators

**Location:** `TauCetiRoadmap/RandomGraphs/README.md:438`, 624, 686, 731, 767, 872; Cameron reference at 1040.

**Claim:** Each theorem has a verifiable locator or an identified derivation from named inputs.

**Witness:** The newly represented completeness/Fraïssé targets still inherit paragraphs without local locators. Cameron's graph-class identification is at printed p. 8, categoricity at Proposition 11, p. 9, and consequence equivalence at Theorem 6, p. 10.

**Repair:** Attach precise locators at the claims; identify the quantitative joint-sample and graphon calculations as derivations with named inputs. Use Cameron Theorem 3 and the following graph-class paragraph (p. 8), Proposition 11 (p. 9), Theorem 6 (p. 10); Fagin Theorem 1 (p. 51) supplies the completeness route, not verbatim graph axioms. The `xy` expectation derivation must explicitly include `n = 0` separately: empty sum 0; the integral formula for a selected vertex applies only when `n ≥ 1`.

## R08 (P3) — The head makes the pull-request description inaccurate

**Location:** pull-request description, “Not changed, by choice” paragraph: “`autoImplicit false`, rendered TeX, and Mathlib/Tau Ceti design references are kept”; “Native imports at the new pin”: “proves `nonempty_iso_rado` from `TauCeti.nonempty_iso_radoGraph_iff`”.

**Claim:** These describe the submitted head.

**Witness:** The head deletes `set_option autoImplicit false` and the entire `nonempty_iso_rado` declaration. Direct elaboration produces 62 `sorry` warnings, whereas the validation paragraph says 60.

**Repair:** Update the description to describe the head: the option and wrapper are removed; five missing headlines and the finite-class theorem were added; elaboration has 62 expected `sorry` warnings. This is author-written description text, not a generated block.

## Previous findings

- R01 — partly repaired: Lean 225–255 adds the finite class, Fraïssé identification, completeness, categoricity, consequence equivalence and primeness. The other listed endpoints and unavailable-carrier docstring remain missing; this report's R01.
- R02 — not repaired: README 468–480 and Lean 21 still require executable procedures; this report's R02.
- R03 — repaired: the `set_option` line is deleted; the head elaborates under default options.
- R04 — partly repaired: `nonempty_iso_rado` is deleted; four other items were proved in place, and the boundary theorem and expectation remain. The added Scott comparison is also padding; this report's R03.
- R05 — not repaired: the head gate reports 496 LaTeX delimiter hits; this report's R04.
- R06 — partly repaired: the Tau Ceti pull-request link and “prototype's” wrapper mention are removed, but hashes and proposal/status narration remain; this report's R05.
- R07 — repaired: both affected signatures use explicit native structure arguments; `statement-hygiene=0`, and elaborated types preserve the intended structures.
- R08 — repaired: README 853–857 replaces the dropped roadmap citation with the mathematical distinction between convergence criteria.
- R09 — repaired: README 397 gives `SimpleGraph.HasExtensionProperty.nonempty_iso` in full; `readme-ids-missing=0`.
- R10 — not repaired: there are still no target `*Needs:*` lines or definition `**Checks.**` lists; this report's R06.
- R11 — not repaired: the previously identified paragraphs still lack local locators; this report's R07.
- R12 — repaired: README 796–801 now covers all distinct parameters in `[0,1]`, retaining the Rado-isomorphism assertion only for interior parameters.
- R13 — repaired: README 106 and 815–819 cite the supplier's arbitrary-cardinality Scott characterization and distinguish the explicit extension conjunction. Its extra Lean corollary is covered by this report's R03.

## Verified sound

This review checks the diff and its dependencies, not all previously accepted text anew. References to “prior review” below mean `packages/RandomGraphs/reports/PRREVIEW-RandomGraphs~5.md`, at `1752d9d`.

**Gate, build, scope and signatures.** The worktree is at the requested full head. The outside-folder diff against `origin/main` is empty. Its roadmap files are README, Suggested and metadata. No declared supplier gaps were introduced.

The supplied gate includes `build=0`; my gate rerun reports:

```text
gate RandomGraphs: set_option=0 blob=0 latex=496 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 FAIL
```

The explicit dependency check returned:

```text
depcheck: 229 roadmaps, 2122 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. I separately ran `lake build TauCetiRoadmap.RandomGraphs.Suggested` successfully, followed the required direct-elaboration check, and elaborated a scratch copy with `#check @name` for all 103 declarations. The latter copy's source prefix is byte-for-byte identical to the head. Direct and signature elaborations each have 62 `sorry` warnings and zero errors. All five flagged `IsProbabilityMeasure μ` binders are present. The explicit structure arguments in the two repaired signatures preserve the previous meaning; the new primeness statement retains `hM : M ⊨ radoAxioms` and an unrestricted target universe.

A scratch one-tactic probe tried `simp`, `rfl` and `infer_instance` on every remaining admitted proof: none closed. Its fallback retained all 62 admissions (plus 62 probe-only unused-tactic warnings). This does not exempt boundary/Check padding. The four proofs inserted at lines 64, 164, 382 and 622 and the Scott comparison at 603 were also read directly: their displayed terms prove the elementary consequences identified in R03.

**Headline inventory.** Present: general Fraïssé existence and rooted extension; finite-graph Fraïssé identification; Rado completeness, categoricity and unrooted primeness; computable QE and decision; finite-rank agreement; quantitative extension estimates; fixed-parameter FO zero–one and joint bounded-rank stabilization; bounded-rank varying parameters; conditioned rooted limits; infinite binomial and graphon Rado laws; uniformly nondegenerate graphon FO limits; sentence zero–one for graphons; density separation; infinitary examples; Poisson criteria, sparse triangles and the product-graphon counterexample. Missing statable endpoints from the prior R01 remain: atomic type isolation and the parameter-preserving primeness form (§5.2), finite-consequence statement (§5.3), all-rank varying-parameter convergence and its joint form (§§7.2–7.3), unconditioned rooted mixture (§8.1), the native induced-copy/clique/degree/diameter conclusions (§8.2), and general invariant-event and evaluated-mixture conclusions (§9.3). Vertex connectivity is still the named endpoint lacking the specified native carrier at these pins; it must be recorded in the docstring.

**Pinned evidence reopened.** Paths here are relative to the respective library repository. Mathlib is pinned at `1b1ccf4b`, Tau Ceti at `2fd255d9`.

| Object / consumed fact | Pinned file and line | Comparison |
| --- | --- | --- |
| Native Fraïssé limit; age and ultrahomogeneity | Mathlib `Mathlib/ModelTheory/Fraisse.lean:279` | Countable carrier and function symbols, with age equality; correct for the new graph-class theorem. |
| Existing finite-set and finite-order analogues | Mathlib `Mathlib/ModelTheory/Fraisse.lean:429`; `Mathlib/ModelTheory/Order.lean:524`, 532 | Empty/order language, not the graph-language targets. These near-matches do not prove the additions. |
| Completeness, its realization corollary, categoricity | Mathlib `Mathlib/ModelTheory/Satisfiability.lean:386`, 403, 505 | Completeness includes satisfiability; categoricity compares models of the stated cardinal. No accidental vacuity: `R` supplies a model. |
| Elementary embeddings and isolated complete types | Mathlib `Mathlib/ModelTheory/ElementaryMaps.lean:44`; `Mathlib/ModelTheory/Types.lean:68`, 187 | Carriers for new primeness and still-missing isolation; equality patterns remain necessary. |
| Finite tuple diagram | Tau Ceti `TauCeti/ModelTheory/Scott/AtomicDiagram.lean:67`, 84 | Finite relational signature; graph specialization supplies the omitted headline's diagram. |
| Extension-pair bridge and countable graph uniqueness | Tau Ceti `TauCeti/ModelTheory/Scott/RandomGraph.lean:99`, 127, 192 | Correctly cited by full names; deleting the one-term wrapper loses no theorem. |
| Scott sentence characterizes extension in any target cardinality | Tau Ceti `TauCeti/ModelTheory/Scott/RandomGraph.lean:174` | Only the source graph is countable; new README wording and Lean comparison preserve this distinction. |
| Sampling strong law | Tau Ceti `TauCeti/Combinatorics/DenseGraphLimits/Sampling/AlmostSure/Basic.lean:62` | Probability carrier; no strict-interior parameter assumption. Supports endpoint density extension. |
| Mixture identity | Tau Ceti `TauCeti/Combinatorics/DenseGraphLimits/ExchangeableGraphLaw/Infinite/Mixture.lean:81`, 90 | Native measure bind and unique mixing law remain available for §9.3's missing headline. |
| Clique and diameter carriers | Mathlib `Mathlib/Combinatorics/SimpleGraph/Clique.lean:850`; `Mathlib/Combinatorics/SimpleGraph/Diam.lean:265` | Native finite-graph conclusions are statable. |

**Ownership and suppliers.** I reran `roadmaps grep` on the graph-class/Fraïssé objects, Rado theory, Scott-extension relation and factorial-moment objects, and searched board packages. The exact Lean-object search returned 19 matches, all in this roadmap; no competing declaration of the added graph-class or Rado-theory targets was found. The source-side random-graph predicates and Scott analysis remain owned by InfinitaryLogic/Tau Ceti; this roadmap owns the new graph-theory axiom set and graph-specific Fraïssé/probabilistic conclusions. The inherited general scalar factorial-moment criterion is not a point-process theorem requiring uniform exponential moments. No new supplier edge was added.

I reopened all five cited roadmap suppliers on main: `Completed/InfinitaryLogic/README.md:403` (Layer 1) and 670 (graph examples); `Completed/DenseGraphLimits/README.md:412`, 433, 540 (Layers 9a–c); `Completed/Exchangeability/README.md:931` (array layer); `TauCetiRoadmap/StandardDistributions/README.md:208` (distribution API); and `TauCetiRoadmap/GraphConnectivityAndFlows/README.md:157` (path/deletion/connectivity conventions). They are all on main, so none is an upward supplier. The first two were also read for repository shape. No overlap report item lists a dropped cited ID, an ID available only in a revision, or a conflicting head.

The closest actual Rado hit was read through `roadmaps show`: CountableStructureSpaces #1316, `TauCetiRoadmap/CountableStructureSpaces/README.md:699`, studies the Borel/Gδ isomorphism class using extension axioms, not the new Fraïssé or completeness targets. Its scope is invariant descriptive set theory. This is consistent with the prior ownership finding. Other open-work checks were restricted to the supplied heads and tool index; no claim of a full review of every open roadmap is made.

**Sources and seeded sample.** Two legal texts were fetched through the sources service without editing a manifest: Cameron's arXiv 1301.7544v1 and Fagin's institutional UIC copy. Rechecked: Cameron Proposition 9, printed p. 7 (`cameron2013 line 292`), Theorem 3 and graph-class paragraph, p. 8 (lines 309–321), Proposition 11, p. 9 (lines 342–354), and Theorem 6, p. 10 (lines 395–414); Fagin Theorem 1, p. 51 (`fagin1976 line 74`), Theorem 2 and Corollary 3, p. 52 (lines 97–129), Corollary 5, p. 53 (lines 140–144). Fagin works with general relational structures, so his theorem supplies a proof route; the graph restriction and edge normalization are checked separately, not silently equated to his model.

| Seeded target | Incremental treatment and evidence |
| --- | --- |
| 0.2 Finite patterns and restriction laws | Unchanged: prior review's pinned binomial-product and empty-pattern computations carried forward. |
| 0.3 Satisfaction as an event | Unchanged: prior countable-quantifier/cylinder check carried forward. |
| 2.1 Chains, factorization and extension requests | Unchanged: prior `DirectLimit.exists_fg_substructure_in_Sigma` and `age_directLimit` checks carried forward. |
| 2.2 Construction | Unchanged: prior direct mathematical check carried; Hodges remains not text-verified. |
| 4.1 Combinatorial and syntactic extension | Statement unchanged; repaired Lean structure argument re-elaborated; supplier uniqueness name resolved at the pin. |
| 4.2 Existence and identification | New class/Fraïssé signatures checked below; Cameron p. 8, lines 309–321, identifies the finite-graph class and limit. |
| 5.1 Shared finite-logic foundations | Unchanged: rank/budget rows carried forward. |
| 5.2 Complete theory and QE | New completeness, categoricity, consequence and primeness signatures checked; Cameron pp. 9–10 and Fagin p. 51 read; procedural requirement still R02. |
| 7.3 Joint almost-sure statements | Unchanged: prior summable-error/Borel–Cantelli calculation carried; missing varying-parameter endpoint remains R01. |
| 9.1 Infinite binomial graphs | Unchanged: prior row carried; Cameron p. 2, lines 36–53 also reopened, including every interior parameter. |
| 9.2 Graphon sampling | Unchanged: prior conditional-witness and negative-control calculations carried. |
| 9.3 Invariant-event laws and mixtures | Unchanged: prior half-mixture value carried; native bind supplier reopened. |
| 9.4 One isomorphism class, distinct labeled laws | Changed endpoint wording fully checked below and against the pinned sampling theorem. |
| 11.2 Sparse triangles | Unchanged: prior normalization/factorial-moment rows carried. |
| 11.3 Product graphon | Changed expectation domain checked at `n = 0,1,2,3`; unchanged Poisson/dominator computations carried. |

**Fresh adversarial computations.** Every added or changed mathematical declaration has a row; proof-only changes are included. “True/false” below are computed truth values, not claims to have formally proved the admitted headlines.

| Statement | Instances tried; computed values on both sides | Result | Change |
| --- | --- | --- | --- |
| `StrongAmalgamation.amalgamation` | For finite sets of size ≤1, strong AP is false (two disjoint singleton extensions cannot fit), AP is true; for all finite sets, both are true and forgetting the intersection equation gives the same amalgam. | Implication valid; displayed projection checked. | Proof added; padding remains R03. |
| `HasExtensionUpTo.mono` | `K₁`: budgets 0/0 give true/true; `C₄`: budgets 1/0 give true/true; reverse 0→1 on `K₁` would give true→false. | Direction `e ≤ d` correct. | Proof added; R03. |
| `Language.Equiv.toSimpleGraphIso` | Swap vertices of `K₂`: off-diagonal relation true before/after, diagonal false before/after; round trip maps `0↦1↦0`. | Explicit instances preserve the intended graph structure. | Signature repair succeeds. |
| `model_radoAxioms_iff` and its `radoAxioms` dependency | Empty graph: `E₀,₀` false and EP false; `K₁`: `E₁,₀` false and EP false; `R`: all axioms true and EP true. | Both directions agree. | Signature repair succeeds. |
| `finiteGraphs` | Empty graph and `K₂`: finite=true, simple-graph theory=true, membership=true. One-point loop relation: finite=true, theory=false, membership=false. `R`: finite=false, membership=false. | Excludes both wrong-model alternatives. | Simple native definition added. |
| `isFraisse_finiteGraphs` | Two singleton extensions of the empty root amalgamate to two vertices: sizes `1+1−0=2`; overlapping graph extensions over one vertex give size `2+2−1=3`, with zero cross edges permitted. Empty graph witnesses nonempty class. | HP/JEP/AP survive the small/empty cases; finite graph types form a countable union of finite sets. | New theorem; no native duplicate found. |
| `isFraisseLimit_radoGraph` | `K₂` embeds at `{0,1}`: bit `testBit 1 0=true`; edgeless two-point graph embeds at `{0,2}`: `testBit 2 0=false`. `K₁` as a putative limit has no `K₂` in its age, whereas `R` does. | Age equality distinguishes the intended infinite limit. | New headline. |
| `radoAxioms_isComplete` | Triangle is true in `R` on `{0,1,3}` (three edge bits true); a loop exists is false (all diagonal entries false). The decisions are respectively `T⊨triangle` and `T⊨¬loop`; `R` witnesses satisfiability. | No inconsistent-theory/vacuity shortcut. | New headline. |
| `radoAxioms_aleph0_categorical` | `R` versus its relabeled copy: both cardinalities ℵ₀, both model `T_R`, isomorphism exists. Empty countable graph: cardinal ℵ₀ but `E₁,₀` false, so not a model. | “Countable” alone is not substituted for modelhood. | New headline. |
| `radoAxioms_models_iff` | Triangle: semantic consequence=true, realization in `R`=true. Loop-existence: consequence=false, realization=false. | Equivalence has the intended truth values. | New signature. |
| `nonempty_elementaryEmbedding_radoGraph` | Target `R`: identity maps `0↦0`, preserving equality and adjacency truth values. Target empty graph on ℕ: `∃y Adj(0,y)` false versus true in `R`; model premise fails. Empty carrier also fails `E₀,₀`. | Model premise excludes false/vacuous targets; target cardinality unrestricted. | New primeness headline. |
| `exists_isQF_equivalent` | `∃y Adj(x₀,y)` and its output truth both realize true in any model; `∃x Adj(x,x)` and output falsum both realize false. | Extracting the output of computable QE is valid. | Proof added; R03. |
| README §9.4, `ae_windowEdgeDensity`, separator | At `n=0,1`, total division gives 0. For `n≥2`, empty graph: `2·0/(n(n−1))=0`; complete graph: `2·C(n,2)/(n(n−1))=1`. Hence limit-`p` event has masses 1 and 0 under parameters `p≠q`, including 0/1. | Widened interval correct; endpoints are not Rado. | Prior R12 repaired. |
| Scott comparison and README supplier addition | `R`: explicit conjunction=true, supplier Scott sentence=true. `Fin 0`: both false via `E₀,₀`. `K₁`: both false via `E₁,₀`. Extension-property target of larger cardinality: both true by the two characterizations. | Transitivity proof valid in arbitrary target universe. | Prior R13 repaired; new elementary Lean corollary is R03. |
| `satisfies_cardEq_iff` | `Fin 0,m=0`: `0≤0 ∧ ¬1≤0=true`, cardinal equality=true; `Fin 2,m=2`: true/true; `Fin 3,m=2`: false/false; infinite carrier with finite `m`: false/false. | Proof preserves the empty/infinite boundary. | Proof added; R03. |
| `productGraphon_isolated_expectation`, README §11.3 | `n=0`: empty sum and RHS both 0; `n=1`: one isolated vertex and RHS both 1; `n=2`: expected missing-edge count `2(1−∫xy)=2(1−1/4)=3/2`, RHS `3/2`; `n=3`: `3∫₀¹(1−x/2)²dx=7/4`, RHS `7/4`. | Removing `1≤n` is mathematically correct. | Generality repaired; Check padding remains R03. |
| Generic criterion distinction, README 853–859 | For `p_n∼c/n`, complete-graph contribution has log `C(n,3)log a+C(n,2)log p_n = (log a)n³/6−n²log n/2+O(n²)→∞` for `a>1,c>0`; fixed triangle factorial moments tend to `(c³/6)^k`. | Moment convergence does not supply a uniform exponential bound. | Dropped-name deletion preserves the mathematical distinction. |

**Carried-forward adversarial rows.** Unchanged statement types retain the prior computations below; old line numbers refer to `1752d9d`, not this head. Rows involving repaired proof bodies or changed prose are additionally recomputed above. Every row cites the prior report rather than presenting its work as new.

| Statement | Instances and computed values | Result | Provenance |
| --- | --- | --- | --- |
| `representativeClass` (54) | `F` constant: the class is the isomorphism type of `F 0`; `ι` empty: `∅` | sound | Prior review, adversarial row 1; unchanged statement type. |
| `StrongAmalgamation`, `.amalgamation` (59, 66) | finite sets of size ≤ 1 (README Milestone 1 example, `m = 1`): two one-point extensions of `∅` need disjoint images in a one-point amalgam: impossible, so strong AP fails while AP holds (the one-point set amalgamates); strong AP ⇒ AP by dropping the range equation (one term, prior R04) | README example and implication agree | Prior review, adversarial row 2; unchanged statement type. |
| `exists_isFraisseLimit_of_isFraisse` (71) | finite sets of size ≤ 2 in the empty language: limit the two-point set (finite, as Convention 4 allows); all finite structures in the empty language: limit `ℕ`, matching `empty.isFraisseLimit_of_countable_infinite`; a language with uncountably many relation symbols and finitely many types: members are still countable (no function symbols) and the requests are countable, so no relation countability is needed, as claimed | sound; no existence theorem at the pin (duplication checked) | Prior review, adversarial row 3; unchanged statement type. |
| `exists_embedding_comp_eq…`, `exists_equiv_comp_eq…` (82, 89) | `A = ∅` (statable only in a language without constants): Mathlib's theorems with `g = default`; `A = M`, `aM = id`: the conclusion forces `e = aN`, consistent since `aN` is an embedding; `M = N = ℚ`, `A = {0, 1}` with `aN` sending `0 ↦ 0`, `1 ↦ 2`: an order automorphism with that root exists | sound; root kept in the conclusion | Prior review, adversarial row 4; unchanged statement type. |
| `Satisfies`, `SatisfiesFormula` (102, 106) | `V = Fin 0`, `φ = ∀x ⊥`: true; `φ = ∃x (x = x)`: false (Convention 3: empty carrier meaningful) | sound | Prior review, adversarial row 5; unchanged statement type. |
| `foRank`, `foRank_eq_zero_iff_isQF` (112, 121) | values 3, 2, 0 above; `¬φ = φ → ⊥` keeps the rank; `.ex φ = ¬∀¬φ` adds 1; `.all` is never `IsQF` and `.imp` is `IsQF` iff both parts are | both directions sound | Prior review, adversarial row 6; unchanged statement type. |
| `measurableSet_satisfies [Countable V]` (126) | `V` countable: each quantifier is a countable union/intersection of cylinder sets; without countability the hypothesis is needed (an uncountable union need not be measurable) | hypothesis in scope and necessary | Prior review, adversarial row 7; unchanged statement type. |
| `satisfies_iso` (130) | `e = id`: trivial; `K₂ ≃g K₂` swapping vertices: adjacency preserved | sound | Prior review, adversarial row 8; unchanged statement type. |
| `sentenceProbability`, `binomialRandom_map_comap` (135, 139) | `n = 0`, `φ = ∃x (x = x)`: probability 0; `f = id`: `map id = id`; `V = Fin 0`: both sides the Dirac mass at the empty graph | sound | Prior review, adversarial row 9; unchanged statement type. |
| `IsExtensionWitness`, `HasExtensionUpTo`, `hasExtensionUpTo_zero_iff` (147, 150, 154) | `Fin 0`, `d = 0`: the request `(∅, ∅)` has no witness, `Nonempty` false; `K₁`: `EP_{≤0}` true, `EP_{≤1}` false (no neighbour); `C₄`: `EP_{≤1}` true, `EP_{≤2}` false (adjacent `u, v` have no common neighbour outside them: the other two vertices are each adjacent to one of them) | sound; boundary theorem is padding (prior R04) | Prior review, adversarial row 10; unchanged statement type. |
| `hasExtensionProperty_iff` (159) | `R` with `U = {0}`, `Z = {1}`: witness 5 under both predicates; the supplier's witness lies outside `U` since `Adj z z` is false | the equivalence holds both ways | Prior review, adversarial row 11; unchanged statement type. |
| `HasExtensionProperty.infinite` (169) | `Fin 0` fails `(∅, ∅)`; finite `V` fails `(∅, V)`; `R` serves every request | sound | Prior review, adversarial row 12; unchanged statement type. |
| `extensionSentence`, `satisfies_extensionSentence` (183, 196) | `r = s = 0`: `distinct = ⊤` (empty conjunction), `witness = ⊤`, sentence `∃z ⊤` ↔ `Nonempty V` ↔ the request `(∅, ∅)`; `r = 1, s = 1`: `∀y₀ y₁ (y₀ ≠ y₁ → ∃z (Adj z y₀ ∧ z ≠ y₀ ∧ ¬Adj z y₁ ∧ z ≠ y₁))`; on `K₁`: `E_{1,0}` false (no witness), `E_{0,1}` false (`z ≠ y₀` impossible), `E_{0,0}` true | both directions sound, `r = 0`, `s = 0` included | Prior review, adversarial row 14; unchanged statement type. |
| `radoGraph_adj` (214) | `(0,1)`: `0 < 1 ∧ testBit 1 0` true; `(0,2)`: `testBit 2 0 = false`, `testBit 0 2 = false`: both forms false; `(1,3)`: true; `(1,1)`: both false; `testBit j i = true` forces `2^i ≤ j`, so `i < j` | the two forms agree | Prior review, adversarial row 16; unchanged statement type. |
| `exists_graphEmbedding_over_root` (225) | `A = Fin 0`: universality of `H` for countable `G` (Cameron Prop. 6); `F = K₂`, `G = H = R`, two different edges as roots: the forth construction extends | sound; `H` of any cardinality | Prior review, adversarial row 18; unchanged statement type. |
| `satisfies_iff_of_extension` (233) | `d = 0`: rank-1 sentences are Boolean combinations of `∃x θ(x)` with `θ` quantifier-free in one variable, decided alike in every nonempty graph; `d = 1`: "no dominating vertex" (rank 2) is false in every `EP_{≤1}` graph; the 2-round game: second move `x ≠ a` needs the request `({b}, ∅)` or `(∅, {b})` of size 1 | the indexing `d + 1` is right at `d = 0, 1` | Prior review, adversarial row 19; unchanged statement type. |
| `formula_iff_of_extension` (241) | `m = 1, q = 1`, `φ = ∃y Adj(x₀, y)`: budget `d = 1`; `K₁` (fails `EP_{≤1}`) versus `K₂` (fails it too: `(∅, {v})` has no witness) excluded, as they must be, since `φ` differs on `K₁` and `K₂`; repetition: the second coordinate equal to the first reuses the mate | sound; `1 ≤ q` excludes the junk `m + 0 − 1` | Prior review, adversarial row 20; unchanged statement type. |
| `boundedCode`, `boundedDecode`, round trip, `_eq_some_iff` (284–302) | proved in the file (built); codes independent of `m` since the code of `inl i : Fin m ⊕ Fin n` is `2i`; a formula code followed by a trailing symbol decodes to `none` by the re-encoding filter (Mathlib's decoder would return the prefix) | sound | Prior review, adversarial row 21; unchanged statement type. |
| `computable_boundedCode_constructors`, `_cases` (307, 323) | the five constructor codes are list operations on codes (`Encodable.list`), computable; case analysis reads the head symbol: `inr (inr (n+2))` falsum, `inr (inr 0)` imp, `inr (inr 1)` all | consistent with `listDecode` at the pin | Prior review, adversarial row 22; unchanged statement type. |
| `exists_computable_quantifierElimination`, `exists_isQF_equivalent`, `exists_computable_decide_rado` (335, 356, 361) | `m = 0`: quantifier-free sentences are `⊥`, `⊥ → ⊥` and their combinations; completeness picks one; `∃y Adj(x₀, y) ↦ ⊤`; `triangleSentence ↦ ⊤` (decided true in `R`, witness `{0,1,3}`); `∃x Adj(x,x) ↦ ⊥`; non-codes unconstrained | sound; `exists_isQF_equivalent` is one term (prior R04); the mandated implementation is prior R02 | Prior review, adversarial row 23; unchanged statement type. |
| `witnessProbability`, `witnessCount`, `witnessCount_mass`, `no_witness_mass` (371, 375, 382, 391) | `p = 0, r = s = 0`: `q = 1`; `C = ∅`, `j = 0`: both sides 1; `j > \|C\|`: `choose = 0` and the event is empty; `U = {u}`, `Z = ∅`, `C = {c}`: `Pr(c ∼ u) = p` | sound; the natural subtraction `\|C\| − j` is harmless | Prior review, adversarial row 24; unchanged statement type. |
| `extensionError`, `extension_failure_le`, `extensionError_le_exp`, `summable_extensionError` (399, 405, 410, 417) | values 1, 0, 2, 6 above; `d = 0, n ≥ 1`: `B₀ = 0 ≤ e^{−n}`; the union bound counts `C(n,t)C(t,r)` requests with `n − t` independent candidates (`t ≤ d ≤ n`); `C(n,t) ≤ n^t ≤ n^d` needs `n ≥ 1`, `(1 − q)^{n−t} ≤ e^{−δ^t(n−t)} ≤ e^{−δ^d(n−d)}` needs `δ ≤ 1/2` and `t ≤ d`; `Σ_n n^d e^{−cn} < ∞` for `c = δ^d > 0` | all four sound, hypotheses exact | Prior review, adversarial row 25; unchanged statement type. |
| `sentenceProbability_error`, `firstOrder_zero_one` (423, 429) | `n = 1, d = 0`: error 0, and rank-1 sentences have probability exactly `1_{R ⊨ φ}` on `Fin 1`; `n = d = 0`: error 1 | sound | Prior review, adversarial row 26; unchanged statement type. |
| `firstOrder_limit_varying_bounded_rank` (435) | `p_n = 1/log(n+2)`, `d = 2`: `(n−2)/log²(n+2) − 2 log(n+2) → ∞`; `p_n` alternating `1/3, 2/3`: `δ = 1/3`; the growth bound `→ 0` as in the 7.2 row | sound (the `1 ≤ d` hypothesis is the README's; at `d = 0` the condition is vacuous and the conclusion still holds, so nothing is lost) | Prior review, adversarial row 27; unchanged statement type. |
| `ae_eventually_all_bounded_rank` (446) | no independence across `n`: Borel–Cantelli's first lemma needs only `Σ Pr(¬EP_{≤d}(X_n)) ≤ Σ B_d(n,p) < ∞`; `R` has `EP_{≤d}` for every `d` | sound; quantifier order right | Prior review, adversarial row 28; unchanged statement type. |
| `firstVertices`, `rootEvent`, `rootedProbability`, `rootEvent_pos`, `rootedTruth`, `rooted_firstOrder_limit` (464–486) | `m = 0`: the root event is everything, probability 1; `H = K₂`, `n = 0`: `Pr = p`; `ψ = Adj(x₀, x₁)`: conditional limit 1 on `H = K₂`, 0 on `H = K̄₂`; independence of the copy `a` by homogeneity (Cameron Prop. 9); division by the positive root probability for `0 < p < 1` | sound | Prior review, adversarial row 29; unchanged statement type. |
| `ae_isomorphic_rado` (495) | Cameron Fact 1 at every interior `p`; `p = 0`: the empty graph a.s., excluded by `hp0` | sound | Prior review, adversarial row 30; unchanged statement type. |
| `infiniteSampleLaw_const` (503) | `K = const μ p`: every edge Bernoulli(`p`) independently, whatever `μ` | sound | Prior review, adversarial row 31; unchanged statement type. |
| `infiniteSampleLaw_ae_rado` (507) | `K = xy` on `[0,1]`: `0 < K < 1` a.e. (both coordinates in `(0,1)` a.e.), used by 11.3; `K = const 1/2`: the binomial case; `K = 1_{x,y ≤ 1/2}`: fails the hypothesis and the sample is a.s. a disjoint union of a clique and an independent set, not `R` (negative control); the proof: for a.e. root tuple, the conditional success probability of a fresh candidate is positive, so infinitely many independent candidates give a witness | sound; the a.e. hypothesis on `μ ⊗ μ` is the right one | Prior review, adversarial row 32; unchanged statement type. |
| `graphon_extension_failure_le`, `graphon_firstOrder_limit` (512, 521) | `ε ≤ K ≤ 1 − ε` a.e. gives each candidate success probability `≥ ε^t` conditionally on the coordinates; `C(n,t)2^t` requests; `d = 0, n ≥ 1`: bound 0; `ε = 1/2`: the binomial bound with `q = 2^{−t}` | sound | Prior review, adversarial row 33; unchanged statement type. |
| `infiniteSampleLaw_sentence_zero_one` (530) | `K = const 1`: `∃ edge` has probability 1; `K = const 0`: 0; the half–half graphon mixture of README 9.3 is not a single graphon, and gives `1/2` only as a mixture | sound: dissociation gives the 0–1 law per graphon | Prior review, adversarial row 34; unchanged statement type. |
| `SatisfiesInf`, `radoSentenceInf`, `satisfiesInf_radoSentenceInf_iff`, `binomialRandom_radoSentenceInf`, `_of_finite` (560, 566, 569, 573, 578) | `unpair` is onto `ℕ × ℕ`, so `Θ_R = ⋀_{r,s} E_{r,s}`; `Fin 0`: `Θ_R` false (`E_{0,0}` fails), probability 0; `Fin n`: `EP` forces an infinite carrier, probability 0 for every `p`; `ℕ`, `0 < p < 1`: probability 1 (9.1) | Values unchanged; supplier citation repaired in this head. | Prior review, adversarial row 36; unchanged statement type. |
| `cardEq`, `satisfies_cardEq_iff`, `evenSentenceInf`, `binomialRandom_evenSentenceInf`, `not_tendsto…` (583, 585, 592, 595, 601) | `cardEq 0` on `Fin 0`: `cardGe 0` true, `cardGe 1` false: true; `cardEq 2` on `Fin 2`: true, on `Fin 3`: false; `n ≤ #V ∧ ¬(n+1 ≤ #V) ↔ #V = n` for finite cardinals; the sequence `1, 0, 1, 0, …` has no limit | sound | Prior review, adversarial row 37; unchanged statement type. |
| `triangleSentence`, `noIsolatedSentence`, `triangleCount`, `isolatedCount`, `satisfies_*` (611, 620, 625, 629, 633, 637) | rank 3 and 2 (computed); distinctness of the three vertices follows from adjacency (no loops); `K₃`: `triangleCount = 1`; `K̄₂`: `isolatedCount = 2`, sentence false; `Fin 0`: `noIsolatedSentence` true, count 0 | sound | Prior review, adversarial row 38; unchanged statement type. |
| `poisson_pointMass_limit…`, `poisson_totalVariation…` (642, 653) | `r = 0`: moments `→ 0^k`, i.e. `1, 0, 0, …` (Lean's `0^0 = 1`), so `ν_n{0} → 1`; `ν_n = Poisson(r)` constant: moments `r^k` exactly; Scheffé for the `tsum` (terms bounded by 2) | sound, `λ = 0` included | Prior review, adversarial row 39; unchanged statement type. |
| `triangle_factorialMoment_limit`, `triangle_poisson_mass_limit`, `sparse_triangle_sentence_limit` (665, 677, 687) | `k = 0`: 1; `k = 1`: `C(n,3) p_n³ → c³/6`; `k = 2`: disjoint pairs `(n)_6 p_n^6/36 → (c³/6)²` (coefficient 20 at `n = 6`, computed), overlaps `O(n^5 p^6) + O(n^4 p^5) = O(1/n)`; `c = 0`: Poisson(0), probability of a triangle `→ 0`; `p_n = min(1, c/(n+1))` is in `I` | sound; the `e − v ≥ 1` overlap bound checked on the two overlap types | Prior review, adversarial row 40; unchanged statement type. |
| `productGraphon` (692) | symmetric, measurable, values in `[0,1]` (fields proved in the file); `W(1/2, 1/2) = 1/4` | sound | Prior review, adversarial row 41; unchanged statement type. |
| `productGraphon_isolated_expectation`, `_factorialMoment_limit`, `_poisson_mass_limit`, `_noIsolated_limit`, `_ae_isomorphic_rado` (698, 703, 710, 716, 722) | `E Z_n = n∫(1 − x/2)^{n−1}dx = 2(1 − 2^{−n})`: values 1, 3/2, 7/4; the rescaling `u = nx` gives the limit `∫_{[0,∞)^k} e^{−Σu_i/2} du = 2^k`; the dominator: `∫_0^1 ∏(1 − x_i y) dy ≤ ∫_0^1 (1 − y·max x_i) dy ≤ 1 − Σx_i/(2k)`, and `(1 − S/(2kn))^{n−k} ≤ e^{−S/(4k)}` for `n ≥ 2k`; `Pr(Z_n = 0) → e^{−2}`; `0 < xy < 1` a.e. | sound; README's integral and dominator agree with the Lean limits | Prior review, adversarial row 42; unchanged statement type. |

The fresh table has 17 rows; the carried table has 38. Together they cover the changed mathematical statements, the seeded targets, and the headline and padding objects discussed in findings. Deleted `nonempty_iso_rado` needs no current statement row. Supplementary checks for still-missing headlines: an adjacent named pair has conditional adjacency limit 1, a nonadjacent pair 0, their Bernoulli mixture is `p·1+(1−p)·0=p`; the half-empty/half-complete graphon mixture gives invariant edge-existence probability `1/2`; a common-neighbor witness yields distances at most 2 and an exhibited nonedge makes the diameter exactly 2. These are the prior report's computed instances, retained for R01.

## Not verifiable

- **Hodges (1993), §7.1; Spencer (2001), the cited extension/rank and varying-parameter theorems; Bollobás (2001), Theorems 1.21–1.22, 4.1 and Corollary 4.9:** unchanged locators retain the prior review's limitations. That review tried the sources service: Spencer resolved to a paywalled Springer page; Hodges and Bollobás to Cambridge landing pages without a readable legal text. I did not refetch unchanged unavailable texts or claim to have checked their wording. Their mathematical computations are carried above. No manifest was edited and this review is not parked.
- **Closure status of the three Mathlib proposals:** I opened the linked [graph characterization proposal](https://github.com/leanprover-community/mathlib4/pull/20649), [existence proposal](https://github.com/leanprover-community/mathlib4/pull/18876), and [prerequisite proposal](https://github.com/leanprover-community/mathlib4/pull/18749). The web tool returned older cached pages; live API retrieval failed. These do not certify the newly asserted November 2026 status. No status-based mathematical finding is inferred from stale pages; R05 concerns the process narrative itself.
- **Sources for the graphon derivation:** §11.3 supplies a calculation, not an external theorem locator. Its changed expectation identity was checked directly above; this does not turn the unchanged full Poisson argument into a newly source-certified theorem.

## Source issues

- **Gap** in cameron2013 at §1.1 property (∗), printed p. 1: the source says a suitable witness automatically differs from all negative vertices; it should require avoidance explicitly or prove a fresh-witness replacement; affects the proof.
- **Error** in cameron2013 at Theorem 3(a), printed p. 8: the source says hereditary, isomorphism-closed classes with countably many types and amalgamation are ages; it should additionally require a nonempty class; affects a stated result.

These two source issues were recorded previously and the relevant text was reopened (`cameron2013 line 26` and line 309). Neither is copied into the roadmap's native definitions: its witness excludes the forbidden vertices and its Fraïssé predicate requires nonemptiness.
