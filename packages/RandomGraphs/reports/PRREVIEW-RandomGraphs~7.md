# Review of RandomGraphs (pull request #1223 at 2210a66)

**Verdict:** needs changes

🤖 Independent AI review (Claude Opus 5.5), full re-review of `TauCetiRoadmap/RandomGraphs/` at `2210a669`. Ten findings, two blocking. The gate fails only on LaTeX; `Suggested.lean` elaborates with 74 `sorry` warnings and no errors.

## R01 (P2) — Satisfaction measurability is already at the pin and has a second owner

**Location:** `TauCetiRoadmap/RandomGraphs/README.md:203–207`: “prove joint measurability of realization in the graph and its free- and bound-variable assignments … The quantifier step is a countable union or intersection over actual vertices”; `Suggested.lean:126` `measurableSet_satisfies`.

**Claim:** Measurability of graph satisfaction events is new work, and this roadmap owns it.

**Witness:** Tau Ceti `TauCeti.RelationalConfiguration.measurableSet_setOf_realize` (`TauCeti/ModelTheory/RelationalConfiguration/ModelsOf.lean:133`) proves it for every `Lω₁ω` formula on countable carriers. CountableStructureSpaces `Suggested.lean:124` (`measurableSet_setOf_realize_graph`, Layer 2 “graph events”) also claims the graph event.

**Repair:** In the Tau Ceti supplier rows, cite `measurableSet_setOf_realize` together with `SimpleGraph.measurable_toRelationalConfiguration` (`TauCeti/Combinatorics/SimpleGraph/RelationalConfiguration.lean:250`). Reduce §0.3's target to the pullback along `toRelationalConfiguration`, adding joint measurability in the assignments. Give the graph event one owner. Either state it here for every countable `V` and every `Lω₁ω` graph formula, and CountableStructureSpaces Layer 2 cites §0.3; or cite that layer and delete `measurableSet_satisfies`. Test: on `ℕ`, `{G | G ⊨ ∃x∃y Adj(x,y)}` is the countable union over pairs `u ≠ v` of the cylinders `{G | G.Adj u v}`.

## R02 (P2) — The formula coding is specified for the graph language only

**Location:** `README.md:517–525`: “an **effective coding of graph formulas** … These are supporting targets for the two theorems, not a general computability library”; `Suggested.lean:319–379` (`GraphAlphabet`, `boundedCode`, `boundedDecode`, `computable_boundedCode_constructors`, `computable_boundedCode_cases`).

**Claim:** A coding of Mathlib's formula list encoding that only covers graphs is adequate library material.

**Witness:** FreeGroupsAndLimitGroups §3.1 (on main, `TauCetiRoadmap/FreeGroupsAndLimitGroups/README.md:672`) builds the same primitive-recursive structure on `BoundedFormula.listEncode` (validity, connectives, quantifiers) for the group language `L_A`. Neither roadmap states it for a general language.

**Repair:** State the coding, exact decoding and the computability of constructors and case analysis for an arbitrary `L` with `[Encodable (Σ n, L.Functions n)]` and `[Encodable (Σ n, L.Relations n)]`. Derive the graph case as an instance, cite FreeGroupsAndLimitGroups §3.1 as the group-language use of the same encoding, and delete “not a general computability library”. The proof of `boundedDecode_boundedCode` uses only `BoundedFormula.encoding.decode_encode`, so it carries over to a general `L` unchanged.

## R03 (P3) — Finite-round EF soundness is restated, not cited

**Location:** `README.md:455–460`: “Extend the existing `EFStrategy`/`BFEquiv` API with truth preservation for native first-order formulas of bounded rank … Prove finite-round soundness for an arbitrary relational language”.

**Claim:** Truth preservation up to bounded rank is a new target.

**Witness:** Tau Ceti already has `EFStrategy.bfEquiv` (`TauCeti/ModelTheory/BackAndForth/Game/Finite.lean:77`) and `BFEquiv.realize_iff_of_qrank_le` (`Karp.lean:217`, for tuples and repetitions). `BFEquiv.elementarilyEquivalent` (`Karp.lean:269`) already applies them to first-order sentences through `toInf`.

**Repair:** Cite these three declarations and `BoundedFormulaInf.qrank_toInf` (`TauCeti/ModelTheory/Infinitary/QuantifierRank.lean:208`) in the supplier table. Reduce §5.1's soundness target to the identity `foRank φ = qrank (toInf φ)` and the transfer through `Sentence.realize_toInf`. Check: `∀x∃y Adj(x,y)` has `foRank` 2 and `qrank` 2.

## R04 (P3) — Four declarations in `Suggested.lean` are padding

**Location:** `Suggested.lean:130` `satisfies_iso`, `:204` `radoGraph_adj`, `:667` `bind_infiniteSampleLawOnSpace_satisfies`, `:831` `productGraphon_isolated_expectation`.

**Claim:** Each is a headline of the acceptance test.

**Witness:** On a scratch copy, a single `exact` closes `satisfies_iso` (`StrongHomClass.realize_sentence` with `Iso.toLanguageEquiv`) and the bind identity (`Measure.bind_apply` with `measurable_infiniteSampleLawOnSpace`). `radoGraph_adj` restates Tau Ceti's `radoGraph_adj`. README:1048 calls the expectation “an elementary check”.

**Repair:** Delete all four from `Suggested.lean` and keep their statements in README §0.1, §4.2, §9.3 and §11.3. The expectation stays a Check with its values at `n = 0, 1, 2, 3`: `0, 1, 3/2, 7/4`. Previous R03 already asked for this one deletion.

## R05 (P3) — README and `Suggested.lean` use different names

**Location:** `README.md` throughout; `README.md:149–153`, `:377`, `:538`; all 111 declarations of `Suggested.lean`.

**Claim:** Every Lean name appears in the README, and every backticked name the README owns is declared in `Suggested.lean`.

**Witness:** Only 3 of the 111 Lean names occur in the README. The other 108 are absent, for example `isFraisseLimit_radoGraph` and `firstOrder_zero_one`. README:377 names `FirstOrder.Language.Equiv.toSimpleGraphIso`, but Lean declares `TauCetiRoadmap.RandomGraphs.Language.Equiv.toSimpleGraphIso`.

**Repair:** Name each kept declaration at its target, for example “Prove `isFraisseLimit_radoGraph`: …”, and make README:377 match the Lean name. For `ExtensionProperty.isFraisseLimit_finite_graphs`, `ExtensionProperty.embedding_from_countable`, `Theory.IsQFEquivalent` and `HasQuantifierElimination`, either declare them in `Suggested.lean` with real bodies or state the targets without backticked own names.

## R06 (P3) — The LaTeX gate still fails

**Location:** `README.md:9`: “For every fixed $`p\in(0,1)`$”, plus every ```` ```math ```` block (for example 12–16 and 611–618).

**Claim:** The mathematics is written in Unicode and code spans.

**Witness:** Rerunning the gate at this head gives `latex=524 … FAIL`, with every other category at 0. The previous head had 496.

**Repair:** Replace each $`…`$ with Unicode or a code span (`p ∈ (0,1)`, `EP_{≤d}`), and each math block with an indented block. For example: `B_d(n,p) = Σ_{t=0}^{d} Σ_{r=0}^{t} C(n,t) C(t,r) (1 − p^r (1 − p)^{t−r})^{n−t}`. Check it against `extensionError` (Lean 442–445): at `n = d = 0` both are 1, and at `n = 1, d = 0` both are 0.

## R07 (P3) — The README is not in roadmap form

**Location:** `README.md` headings at 27, 92 and 162–1127; **Checks** only at 390, 437, 558 and 770.

**Claim:** The README follows the TauCetiRoadmap shape, with API bullets and at least three Checks per definition.

**Witness:** No `**Summary.**`, `## Scope and ownership`, `## Exact supplier contracts`, `## How to read the build` or `## Downstream consumers`. Sections are “Milestone k —”, none ends with `### Examples`/`### Dependencies`, and the four Checks are paragraphs.

**Repair:** Rename the milestone sections to `## Layer k: …`, add the missing sections and the per-layer Examples and Dependencies, and give each definition API bullets and at least three bulleted Checks. Examples of Checks to add: `foRank (∀x∃y Adj(x,y)) = 2`, and negation keeps the rank; `cardEq 0` holds on `Fin 0` and fails on `Fin 1`; `windowEdgeDensity` is 0 at `n = 0, 1` and 1 on the complete graph; `witnessCount` on `C = ∅` is 0.

## R08 (P3) — Locators sit in References instead of at the claims

**Location:** README §2.2 (291–313), §3 (325–341), §5.1 (462–477), §7.1 (644–661), §7.2 (671–697), §9.1 (811–822) and §11.1 (943–958); the Erdős–Rényi reference (1172–1175).

**Claim:** Each sourced theorem carries its locator at the claim.

**Witness:** The relevant locators (Hodges Thm 7.1.2 and Lemmas 7.1.3–7.1.4; Spencer Thms 2.2.3 and 9.1.3–9.1.4; Fagin Thm 2 and Cors 3, 5; Cameron Fact 1; Bollobás Thms 1.21–1.22) appear only under References. Erdős–Rényi has no locator at all.

**Repair:** Move each locator to its claim, for example §9.1 “(Cameron, Fact 1 and the remark after its proof, pp. 1–2)” and §7.1 “(Fagin, Theorem 2 and Corollary 3, p. 52; Corollary 5, p. 53)”. At §11.2, cite Erdős–Rényi Theorem 3a (§3, p. 34): `k`-cycles at `N ∼ cn` edges are Poisson with mean `(2c)^k/(2k)`. With `k = 3` and `p ∼ 2c/n` this mean is `(np)³/6`.

## R09 (P3) — Many declarations lack a docstring stating the mathematics

**Location:** `Suggested.lean`: 56 declarations have no docstring, for example `:58` `representativeClass`, `:147` `IsExtensionWitness`, `:463` `sentenceProbability_error` and `:794` `triangle_factorialMoment_limit`. The docstrings at `:70`, `:81`, `:493`, `:656` and `:768` do not state the mathematics.

**Claim:** Every declaration has a docstring stating its mathematics.

**Witness:** Line 768 reads “This convergence criterion is proved as part of the roadmap.” Line 81 reads “The target is not required to be countable.” Neither states the theorem.

**Repair:** Give every declaration a docstring that states the mathematics. For `:463`: “For a sentence of quantifier rank at most `d + 1` and `n ≥ d`, the probability that `G(n,p)` satisfies it differs from its truth in the Rado graph by at most `B_d(n,p)`.”

## R10 (P3) — Mutual singularity is stated in ad hoc form

**Location:** `Suggested.lean:683–687` `binomialRandom_singular_separator`: “`∃ S, MeasurableSet S ∧ binomialRandom ℕ p S = 1 ∧ binomialRandom ℕ q S = 0`”.

**Claim:** The statement uses Mathlib's vocabulary for the mutual singularity of README §9.4.

**Witness:** Mathlib's `MeasureTheory.Measure.MutuallySingular` (`Mathlib/MeasureTheory/Measure/MutuallySingular.lean:41`) is exactly such a measurable set: null for one law, co-null for the other.

**Repair:** State `SimpleGraph.binomialRandom ℕ p ⟂ₘ SimpleGraph.binomialRandom ℕ q` for `p ≠ q`. The README keeps the separator `{G | windowEdgeDensity G → p}`. Check: at `p = 0, q = 1` it has mass 1 under `p` and 0 under `q`.

## Previous findings

- R01: repaired. Lean 250–259, 288–291, 406–415, 484–517, 558–608 and 648–671 add the missing headlines; vertex connectivity uses `SimpleGraph.IsVertexConnected`. The added bind identity is padding (this report's R04).
- R02: repaired. README 508–515 and Lean 24–27 make the computability theorems the endpoints, with pattern elimination as the proof route. The graph-only scope is this report's R02.
- R03: partly repaired. Six declarations were deleted, but `productGraphon_isolated_expectation` is kept (Lean 831). This report's R04.
- R04: not repaired. LaTeX hits went from 496 to 524. This report's R06.
- R05: repaired. The proposal-status narration and pull-request labels are gone (README 147–155). The remaining `2fd255d99` hashes are file locators.
- R06: partly repaired. 23 `*Needs:*` lines and four Checks paragraphs were added. Layer headings, Checks for each definition and the Examples/Dependencies sections are still missing. This report's R07.
- R07: partly repaired. Locators were added at §4.2 (409–412) and §5.2 (492–498), and §§7.3, 8.2, 9.2 and 11.2 are marked as derivations. Seven sections still carry their locators only under References. This report's R08.
- R08: repaired. The description now gives 74 `sorry` warnings (verified) and no longer mentions `autoImplicit` or `nonempty_iso_rado`.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
| --- | --- | --- | --- | --- |
| 0.1 Graph/language transport | `K₂` with its vertex swap `e`; pairs `(0,0)`, `(0,1)` | `∃x∃y Adj(x,y)`: true/true; the two pairs have different equality atoms, so different atomic types | sound | `satisfies_iso` is padding (R04) |
| 0.3 Satisfaction as event; `measurableSet_satisfies` | `Fin 0`; `ℕ` with `∃x∃y Adj(x,y)` | On `Fin 0`, `∃x(x=x)` gives `∅` and `∀x ⊥` gives `univ`; on `ℕ`, a countable union of cylinders; the Tau Ceti pullback agrees | true | R01 |
| 2.1 Chains, factorization | Empty-language chain `∅ ⊂ {0} ⊂ {0,1} ⊂ …` | Limit age = all finite sets = union of the stage ages; a 2-point embedding factors at stage 2 | sound; Mathlib `DirectLimit.lean:317`, `Fraisse.lean:202` | none |
| 4.1 Combinatorial and syntactic extension | `Fin 0`, `K₁`, `C₄`; `E_{r,s}` on `K₁` | `Fin 0`: `EP≤0` false. `K₁`: `EP≤0` true, `EP≤1` false. `C₄`: `EP≤1` true, `EP≤2` false. `E₀,₀` true; `E₁,₀` and `E₀,₁` false | sound; the Checks agree | none |
| 5.1 Rank agreement; `satisfies_iff_of_extension`, `formula_iff_of_extension` | `d = 0, 1`; `m = 2, q = 1` | Rank-1 sentences agree on nonempty graphs. `∀x∃y Adj(x,y)` holds in every `EP≤1` graph. A common neighbour needs a request of size 2 = `m+q−1` | indexing sound | R03 |
| 5.3 `radoAxiomsUpTo_models_iff` | `d = 0, 1` with `∀x∃y Adj(x,y)` (rank 2) | `T₁ ⊨` it, `R ⊨` it; `T₀` has the model `K₁` falsifying it, but rank 2 > 0+1, so no claim | sound; negative control holds | none |
| 7.1 `sentenceProbability_error`, `firstOrder_zero_one` | `n = 0, 1`, `d = 0`; `p = 0` | `n = 0`: `|0−1| = 1 ≤ B₀ = 1`. `n = 1`: `B₀ = 0`, rank-1 exact. `p = 0, d = 1, n = 3`: `B = 3` | bound holds | none |
| 7.3 `ae_eventually_all_bounded_rank(_varying)` | Coupled windows `restrictFin n` of one `G(ℕ,p)` | `Σ_n Pr(¬EP≤d) ≤ d + Σ_{n≥d} B_d < ∞`; Borel–Cantelli (`BorelCantelli.lean:62`) needs no independence | sound | none |
| 8.1 `rooted_firstOrder_limit`, `firstOrder_limit_firstVertices` | `m = 0`; `m = 2`, `ψ = Adj(x₀,x₁)` | `m = 0`: root event mass 1. Conditioned limits: 1 on `K₂`, 0 on `K̄₂`; unconditioned limit `p·1 + (1−p)·0 = p` | sound | none |
| 8.2 graph-property limits (five theorems) | diameter, vertex connectivity, `CliqueFree 0` | `EP≤2`: distance ≤ 2; `EP≤1`: a nonneighbour, so diameter 2. Connectivity `k`: requests of size `k+1`. `CliqueFree 0` false | sound | none |
| 9.1 `ae_isomorphic_rado` | `p = 1/3`; `p = 0` | Request `(U,Z)`, `N` candidates: `(1−q)^N → 0` (Cameron line 43–53); `p = 0`: empty graph a.s., excluded by `hp0` | sound | none |
| 9.3 `infiniteSampleLaw_zero_one_of_invariant`, `_sentence_zero_one` | `K ≡ 1`, `K ≡ 0`; half/half mixture | `∃ edge`: probability 1 and 0; mixture value `1/2`, integrand values 0 and 1 | sound; ergodicity at `Ergodic.lean:116`, any carrier | bind version is padding (R04) |
| 9.4 `ae_windowEdgeDensity` | `n = 0, 1`; empty and complete graphs | Density 0 at `n = 0, 1`; for `n ≥ 2`, `0` and `2·C(n,2)/(n(n−1)) = 1` | sound for `p ∈ [0,1]` | R10 (vocabulary) |
| 11.1 Poisson criteria | `λ = 0`; `ν_n = Poisson(λ)`; `Bin(n, λ/n)` | Moments `1, 0, 0, …` give `ν_n{0} ≥ 1 − E X_n → 1`; exact `λ^k`; `(n)_k(λ/n)^k → λ^k` | sound; `λ = 0` included | none |
| 11.2 triangle limits | `k = 0, 1, 2`; overlap types | `C(n,3)p³ → c³/6`; 20 disjoint ordered pairs at `n = 6`; shared edge `e−v = 5−4`, shared vertex `6−5` | sound | R08 (Erdős–Rényi locator) |
| `exists_isFraisseLimit_of_isFraisse` | Empty language, sets of size ≤ 2; uncountably many relation symbols | The limit is the 2-point set (finite allowed); FG members are countable, so the requests are countable | true; no existence theorem at the pin | none |
| `exists_embedding_comp_eq…`, `exists_equiv_comp_eq…` | `A = M`, `aM = id`; `ℚ` with root `0↦0, 1↦2` | Forces `e = aN`; an order automorphism exists; reduces to Mathlib `embedding_from_cg` (`PartialEquiv.lean:476`) | sound | none |
| `exists_graphEmbedding_over_root` | `A = ∅`; `G = H = R` with two different edges as roots | Gives universality (Cameron Prop. 6, line 235); the forth step uses Tau Ceti `isExtensionPair` | sound | none |
| `finiteGraphs`, `isFraisse_finiteGraphs`, `isFraisseLimit_radoGraph` | Empty graph, `K₂`, reflexive one-point structure, `R` | Members: yes, yes, no, no. `K₂` at `{0,1}` (`testBit 1 0`), `K̄₂` at `{0,2}` | sound; Cameron Thm 3, p. 8 | none |
| `radoAxioms_isComplete`, `_aleph0_categorical`, `_models_iff` | Triangle; loop; countable empty graph | Triangle true in `R` on `{0,1,3}` and entailed; loop false and refuted; the empty graph fails `E₁,₀` | sound; Cameron Prop. 11, Thm 6 | none |
| `nonempty_elementaryEmbedding_radoGraph`, `exists_elementaryEmbedding_radoGraph_comp_eq` | `m = 0`; repeated pair `a = (0,0)` | `m = 0` gives primeness; `heq` forces `b₀ = b₁`, consistent | sound | none |
| `typesWith_firstOrderAtomicDiagram_eq_singleton` | Pairs `(0,0)`, `(0,1)`, `(0,2)` in `R`; `m = 0` | Three distinct diagrams, three types; `m = 0`: `typesWith ⊤` is a singleton by completeness | sound | none |
| `exists_computable_quantifierElimination`, `_decide_rado` | `∃y Adj(x₀,y)`; `∃x Adj(x,x)`; triangle | Eliminate to `⊤` and `⊥`; the triangle is decided true | sound | coding scope R02 |
| `boundedCode`, `computable_boundedCode_*` | `inl i : Fin m ⊕ Fin k` | `encode = 2i`, independent of `m`; `imp` code `0 :: φ ++ ψ` | sound | R02 |
| `extension_failure_le`, `extensionError_le_exp`, `summable_extensionError` | `d = 0, n ≥ 1`; `p = 0` | `B₀ = 0 ≤ e^{−n}`; `C(n,t)C(t,r)` requests with `n−t` candidates; `δ = 0`: bound `(d+1)2^d n^d` | sound | none |
| `firstOrder_limit_varying_bounded_rank`, `firstOrder_limit_varying` | `p_n = 1/log(n+2)`; alternating `1/3, 2/3` | `a = 1/(2d)` gives `δ_n^d ≥ n^{−1/2}`, so `√n ≫ d log n`; alternating: `δ = 1/3` | sound | none |
| `infiniteSampleLaw_ae_rado`, `productGraphon_ae_isomorphic_rado` | `K = xy`; `K = 1_{x,y≤1/2}` | `xy` lies in `(0,1)` a.e.; the indicator fails `hK` and its sample is a clique ⊔ an independent set, not `R` | sound | none |
| `graphon_extension_failure_le`, `graphon_firstOrder_limit` | `ε = 1/2`; `t = 0` | Witness probability `≥ ε^t`; `t = 0`: `0^n = 0` for `n ≥ 1`, 1 at `n = 0` (`Fin 0` fails) | sound | none |
| `binomialRandom_radoSentenceInf(_of_finite)`, `not_tendsto…evenSentenceInf` | `Fin 0`, `Fin n`, `ℕ` | `Θ_R`: 0 on finite carriers, 1 on `ℕ`; `Θ_even`: 1, 0, 1, 0 for `n = 0, 1, 2, 3` | sound | none |
| `productGraphon_*` limits | `k = 1`; the dominator | `∫ e^{−Σu/2} = 2^k`; `∫∏(1−x_i y)dy ≤ 1 − Σx_i/(2k)`; `Pr(Z_n = 0) → e^{−2}` | sound | none |
| `radoGraph_adj` | `(0,1)`, `(0,2)`, `(1,3)`, `(1,1)` | Both forms give true, false, true, false | true | padding (R04) |
| `bind_infiniteSampleLawOnSpace_satisfies` | One `exact Measure.bind_apply …` | Closed; warnings 74 → 72 together with `satisfies_iso` | one-term | delete (R04) |
| `productGraphon_isolated_expectation` | `n = 0, 1, 2, 3` | LHS = RHS at each: `0`, `1`, `3/2`, `7/4` | true | delete (R04) |
| `binomialRandom_singular_separator` | `p = 0, q = 1` | Separator masses 1 and 0; equivalent to `⟂ₘ` | true | R10 |

- Gate rerun at `2210a66`: `latex=524`, all other categories 0, `FAIL`. Dependency check: `depcheck: 206 roadmaps, 1896 edges, 0 problem(s)` (no UPWARD or CYCLE line). No changes outside the folder.
- `lake env lean Suggested.lean`: 74 `sorry` warnings and no errors. A scratch file with 111 `#check @name` lines elaborates; all six flagged `[IsProbabilityMeasure μ]` binders are present, and no types changed. The one-tactic probe (`simp`, `rfl`, `infer_instance`, `decide`, `simp_all`, `norm_num`) closes none of the 74; a single `exact` closes two (R04).
- Sources read: `cameron2013` (arXiv 1301.7544v1) lines 13–53, 110–114, 235, 292, 309–321, 342–354, 395–414; `fagin1976` lines 74–86, 97–129, 140–144; `erdosrenyi1960` lines 1139–1160 (Theorem 3a, p. 34). Eleven locators were checked against the text.
- Library declarations opened at the pins (36): Mathlib `Fraisse.lean:117, 202, 279, 388`, `DirectLimit.lean:317`, `PartialEquiv.lean:380, 476, 499`, `Types.lean:68, 187`, `Topology/Types.lean:36–54`, `Order.lean:524, 532`, `Satisfiability.lean:386, 505`, `Semantics.lean:1015`, `BinomialRandomGraph/Defs.lean:50–91`, `BorelCantelli.lean:62`, `Poisson/Basic.lean:40`, `GiryMonad.lean:242`, `MutuallySingular.lean:41`. Tau Ceti `ExtensionProperty.lean:51, 64, 93, 98`, `Scott/RandomGraph.lean:99, 127, 174, 192`, `BackAndForth/Graph.lean:40`, `Karp.lean:217, 269`, `Game/Finite.lean:77`, `QuantifierRank.lean:208`, `AtomicDiagram.lean:41, 67, 74, 84`, `ModelsOf.lean:133`, `RelationalConfiguration.lean:205, 250`, `Ergodic.lean:116`, `Mixture.lean:81, 90`, `AlmostSure/Basic.lean:62`, `Infinite/Sampling.lean:138`, `FiniteSupportPerm.lean:171`, `VertexConnectivity.lean:217`.
- Cross-roadmap citations resolved on main: InfinitaryLogic Layer 1 (`Completed/InfinitaryLogic/README.md:403`) and worked examples (653–670); DenseGraphLimits Layers 9a–c (412, 433, 540); Exchangeability; GraphConnectivityAndFlows; StandardDistributions. The six “found nowhere” leads are the proposal-shaped names and the misqualified name in R05.
- Headline inventory: every chain endpoint in the README's Completion criteria has a statement in `Suggested.lean`. None is missing and none is forced through a stand-in.
- Overlap check: read CountableStructureSpaces, HanfNumbers, InfinitaryModelExistence, CountableModelCounting, CertifiedPermutationComputation, InfinitaryLogic, DenseGraphLimits and ComputabilityTheory, plus FreeGroupsAndLimitGroups (found by an object search). Shared objects: graph satisfaction measurability, owned by both CountableStructureSpaces Layer 2 and this roadmap (R01); formula coding, built separately here and in FreeGroupsAndLimitGroups §3.1 (R02); Rado graph and extension predicate, owned by InfinitaryLogic/Tau Ceti and consumed here; graphon samplers, owned by DenseGraphLimits and consumed here; PointProcesses' factorial-moment-measure criterion is a different statement.

## Not verifiable

- Spencer (2001), Theorems 0.1.2, 0.1.5, 2.2.3, 2.3.1–2.3.2, 9.1.3–9.1.4 and Definition 2.3: the sources service found only a paywalled Springer DOI (10.1007/978-3-662-04538-1).
- Bollobás (2001), Theorems 1.21–1.22 and 4.1, Corollary 4.9: only the Cambridge landing page; no legal open text.
- Hodges (1993), §7.1, Theorems 7.1.2 and 7.1.7, Lemmas 7.1.3–7.1.6, (1.8), pp. 326–329: only the Cambridge landing page; no legal open text.
- The status of the Mathlib proposals cited as design references was not fetched; no finding depends on it.

## Source issues

- **Gap** in cameron2013 at §1.1, property (∗), printed p. 1: the source says the correctly joined vertex is automatically distinct from all listed vertices; it should require the witness to avoid the negative vertices or prove a fresh witness exists; affects the proof.
- **Gap** in cameron2013 at Proposition 11, sentences σ_{m,n}, printed p. 9: the source's axioms do not require the witness to differ from the v's, so σ_{0,n} holds in every nonempty graph; it should add z ≠ v_j; affects the proof.
- **Error** in cameron2013 at Theorem 3(a), printed p. 8: the source says every iso-closed, hereditary, countable class with amalgamation is an age; it should also require the class to be nonempty; affects a stated result.
