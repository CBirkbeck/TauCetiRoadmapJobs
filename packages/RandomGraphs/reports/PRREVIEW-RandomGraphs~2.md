# Review of RandomGraphs (pull request #1223 at c05fb07)

**Verdict:** needs changes

🤖 Independent AI review of `TauCetiRoadmap/RandomGraphs/README.md` and `TauCetiRoadmap/RandomGraphs/Suggested.lean` at `c05fb07`. Nothing in the pull request was changed. This is a full re-review after the repair of the previous review (which read `314f27c`): 11 findings, 2 of them blocking. The mathematics of the stated theorems was recomputed on instances and no false statement was found; the blocking findings are the failing build gate and the acceptance-test coverage. The pull request touches no file outside the roadmap folder.

## Status of the previous review's findings

| Previous | Status at `c05fb07` | Where |
| --- | --- | --- |
| R01 (P1) finite atomic diagram not at the pin | Partly repaired: the row now cites the exact Tau Ceti file and hypotheses ("`TauCeti.firstOrderAtomicDiagram (a : Fin n → M)`…, for relational `L`"), which match the file (`tauceti-atomicdiagram` lines 66–90). It is still absent at the pin `358314d` and no roadmap on main plans it. See R07. |
| R02 (P1) build warning | Not repaired, by the author's choice. Gate still `build=1 FAIL`. See R01. |
| R03 (P2) sorry'd data | Repaired: `extensionSentence` has a real body, `productGraphon` proves its three fields, the two admitted functions are gone; gate `sorry-data=0`. |
| R04 (P2) executable procedures | Partly repaired: the Lean file now states existence of computable maps on codes (a theorem, not an implementation). The README prose still demands procedures and implementations. See R10. |
| R05 (P2) missing statable headlines | Partly repaired: semantic QE and the total-variation criterion were added; primeness, completeness, categoricity, the Fraïssé identification of `R`, atomicity, the unconditioned rooted limit, the all-rank variants and the Milestone 8 graph properties are still absent, and Milestone 10 is still not named as unstatable. See R03. |
| R06 (P2) direct-limit duplicate | Repaired: README 2.1 now cites `FirstOrder.Language.DirectLimit.exists_fg_substructure_in_Sigma` (at the pin, `Mathlib/ModelTheory/DirectLimit.lean:317`). |
| R07 (P3) padding | Partly: `eliminateQuantifiers_isQF` is gone; the other three remain and a new one-tactic corollary was added. See R04. |
| R08 (P3) `set_option` | Not repaired, by choice. See R02. |
| R09 (P3) LaTeX | Not repaired, by choice (gate `latex=476`). See R05. |
| R10 (P3) pull-request numbers and process text | Not repaired. See R06. |
| R11 (P3) `readme-ids-missing` | Not repaired (gate still lists both names). See R07. |
| R12 (P3) README shape, Needs lines, Checks | Not repaired. See R08. |
| R13 (P3) locators | Not repaired. See R09. |
| R14 (P3) Lean form and README/Lean agreement | Partly: the new declarations carry docstrings; the module docstring and name agreement are unchanged. See R11. |

## R01 (P1) — The build gate still fails

**Location:** `TauCetiRoadmap/RandomGraphs/Suggested.lean:1`. **Claim:** the acceptance test builds with `sorry` as its only warning.

**Witness:** the worker's gate at this head reports `build=1 FAIL` with the warning that the file "imports `Mathlib` from package `mathlib`, which is designed for use with the module system". The file elaborates (my probe copy elaborated with only `sorry` warnings and the expected probe errors), so this is build hygiene, not a false statement; P1 follows the brief's classification of a failing build.

**Repair:** start the file with `module`, make the four imports `public import …`, delete the option in R02, and rerun the gate. The previous review elaborated such a copy successfully. On main, 7 of the 132 `Suggested.lean` files already use `module`; the gate is per-file, so that count does not exempt this one.

## R02 (P3) — `set_option` is forbidden

**Location:** `TauCetiRoadmap/RandomGraphs/Suggested.lean:33`, `set_option autoImplicit false`. **Witness:** gate `set_option=1`. **Repair:** delete the line. My probe copy without it elaborated; all 86 `#check @name` types are unchanged (the worker's `signatures.md` reports no dropped binder, and I compared the 86 types with the README statements, see Verified sound).

## R03 (P2) — Statable headline theorems are absent from the acceptance test, and the unstatable one is not named

**Location:** `TauCetiRoadmap/RandomGraphs/Suggested.lean:6–31` (module docstring, "not exhaustive … suggested forms"); README 376–396, 437–490, 601–616, 648–650, 666–678, 680–705, 758–777, 796–811.

**Claim:** the Lean file states the roadmap's headline theorems against the pins. These README endpoints are statable with pinned carriers and are not stated:

- **Completeness and categoricity of `T_R`** (README 437–441): `radoAxioms.IsComplete` (`Mathlib/ModelTheory/Satisfiability.lean:385`), `(ℵ₀).Categorical radoAxioms` (`Satisfiability.lean:504`), and "no finite model" as `∀ M [Structure M] [Finite M], ¬ M ⊨ radoAxioms`.
- **Primeness** (README 486–490): `∀ M [Structure M], M ⊨ radoAxioms → Nonempty (ℕ ↪ᵉ[Language.graph] M)` under `radoGraph.structure` (`ElementaryEmbedding`, `Mathlib/ModelTheory/ElementaryMaps.lean:44`), and the version retaining a named tuple.
- **`R` is the Fraïssé limit of finite graphs** (README 373–378, 393): `IsFraisseLimit {M : Bundled Language.graph.Structure | Finite M ∧ M ⊨ Theory.simpleGraph} ⟨ℕ, radoGraph.structure⟩` (`Mathlib/ModelTheory/Fraisse.lean:279`).
- **Atomicity** (README 476–484): with a real-bodied finite diagram of a tuple of `R` (a `BoundedFormula.iInf` over signed equality and adjacency atoms, the same shape as `extensionSentence`), `radoAxioms.typesWith (Formula.equivSentence δa) = {radoAxioms.typeOf a}` (`Mathlib/ModelTheory/Types.lean:68`, `187`).
- **Unconditioned rooted limit** (README 666–678): the finite sum over graphs `H` on `Fin m` of `p^{e(H)}(1−p)^{C(m,2)−e(H)}·1_{(R,a_H)⊨ψ}`; every ingredient is in the file already (`rootEvent`, `SatisfiesFormula`, `rootedTruth`).
- **All-rank varying parameter and its joint almost-sure form** (README 601–616, 648–649): hypothesis `∀ a > 0, Tendsto (fun n => n^a · min(p n, 1 − p n)) atTop atTop`.
- **Milestone 8 graph properties** (README 685–695): fixed cliques (`cliqueFinset`), fixed degrees (`degree`), induced copies of a fixed graph (`↪g`), and diameter exactly 2 (`SimpleGraph.diam`, `Mathlib/Combinatorics/SimpleGraph/Diam.lean:265`), each as an a.a.s. limit. Vertex connectivity needs `IsVertexConnected` from GraphConnectivityAndFlows §1.5, which is not at the pin: name it in the docstring as not statable.
- **Invariant events and the mixture identity** (README 760–772): the event form for finitely supported permutations, and the `bind` evaluation over `GraphonSpaceI` (at the pin, `ExchangeableGraphLaw/Infinite/Mixture.lean:82`, `91`).
- **Milestone 10** is not statable: the pin has no `TauCeti/ModelTheory/Infinitary` (the directory `TauCeti/ModelTheory` contains only `Algebra`). The docstring must say which two sentences lack the syntax.

**Witness:** each named carrier was opened at the pin (file and line above). The docstring at lines 9–12 instead says the file is "not exhaustive" and lists no unstatable headline.

**Repair:** state each listed endpoint with its exact hypotheses and no stand-in, and rewrite the module docstring as "<title>: target signatures", saying which headlines are not statable and what each lacks (Milestone 10: the infinitary syntax; vertex connectivity: `IsVertexConnected`; the finite-diagram semantics of 5.2: `firstOrderAtomicDiagram`). Test: for the primeness statement on `M = ℕ` with `radoGraph.structure`, the identity is an elementary embedding; for completeness, the triangle sentence is decided true (witness `{0, 1, 3}`: bits 0 of 1, 0 of 3, 1 of 3 are all 1) and `∃x Adj(x,x)` false.

## R04 (P3) — Padding in the acceptance test

**Location:** `TauCetiRoadmap/RandomGraphs/Suggested.lean:155`, 163, 336, 627.

**Claim:** these are headline statements. **Witness:**

- `hasExtensionUpTo_zero_iff` (155) is the boundary case `d = 0` (README Convention 5 already states it: EP₀ means a nonempty carrier; values: `Fin 0` false, `Fin 1` true).
- `HasExtensionUpTo.mono` (163) closes with one term, retested at this head: `exact fun U Z hUZ hc => h U Z hUZ (hc.trans hed)`.
- `exists_isQF_equivalent` (336) closes with one term from the computable statement, tested at this head: `exact (exists_computable_quantifierElimination.{w}.choose_spec.2 m φ).imp fun ψ h => ⟨h.2.1, h.2.2⟩` (the probe copy then has 53 `sorry` warnings instead of 55).
- `productGraphon_isolated_expectation` (627) mirrors the README's elementary check at line 917 (`n = 1`: 1; `n = 2`: 3/2; `n = 3`: 7/4, recomputed below).

**Repair:** delete these four declarations from `Suggested.lean`; the README keeps each as an API bullet or Check. This is deletion, not a request to prove them in place.

## R05 (P3) — LaTeX delimiters throughout the README

**Location:** `TauCetiRoadmap/RandomGraphs/README.md:9`, 12–16, 63, 75–84 and throughout (gate `latex=476`). **Claim:** house style. **Witness:** every formula uses `$\`…\`$` or `math` fences. **Repair:** Unicode prose with ASCII in code spans, display formulas as indented code blocks; keep `0^0 = 1`, `n ≥ d`, and the exponent `−(n−d)δ^d` exactly. The checked case `n = d = 0` must still give `B₀(0, p) = 1`.

## R06 (P3) — Pull-request numbers and process narrative in the README and docstrings

**Location:** README 106 ("implemented in Tau Ceti #18726"), 107 ("at revision `85f3eb5`"), 143–155, 357, 376–377, 471–472 ("Mathlib #41113"), 839 ("PointProcesses roadmap proposal" by pull-request link), 954–970 (the whole "Coordination and provenance" section); `Suggested.lean:149`, 324 (proposal numbers), 27–30 ("later than this repository's Tau Ceti pin").

**Witness:** gate `prnum=1` at line 957; the other occurrences use the `#NNNN` form the gate does not match. A reader a year from now can tell which parts were contentious.

**Repair:** cite suppliers by roadmap and section (InfinitaryLogic Layer 1; InfinitaryLogic worked examples, "Simple graphs, including the random graph"; GraphConnectivityAndFlows §1.5; DenseGraphLimits Layers 9a–c; Exchangeability Layer 8), describe the shape taken from the Mathlib proposals in the Conventions without numbers, drop the revision hash and the pin remark, and move the "existing formalizations" table to a provenance subsection of References without the coordination instructions.

## R07 (P3) — Supplier declarations named as if pinned, and one supplier object no roadmap owns

**Location:** README 106, 127–133, 346–359, 380–396, 444–447.

**Claim:** `SimpleGraph.HasExtensionProperty`, `hasExtensionProperty_radoGraph`, `HasExtensionProperty.nonempty_iso`, `FirstOrder.Language.Equiv.toSimpleGraphIso`, `SimpleGraph.Iso.toLanguageEquiv`, `SimpleGraph.sameAtomicType_iff`, `TauCeti.EFStrategy`, `TauCeti.BFEquiv`, the modules `BackAndForth.Game.Finite`, `BackAndForth.Graph`, `BackAndForth.Equivalence`, `Infinitary.QuantifierRank`, and `TauCeti.firstOrderAtomicDiagram` are existing suppliers.

**Witness:** none of these names occurs in Tau Ceti at the pin `358314d` (grep of the whole package: 0 hits each; `TauCeti/ModelTheory` has only `Algebra`). On Tau Ceti main they do exist (`tauceti-main-backandforth-graph` lines 44, 65; `tauceti-main-backandforth-game-finite` line 45; `tauceti-main-backandforth-equivalence` line 53; `tauceti-atomicdiagram` line 71). `Completed/InfinitaryLogic/README.md` on main plans `BFEquiv` (line 412–420) and the `QuantifierRank` module (line 222) and has the one-line worked example "Simple graphs, including the random graph" (line 670); it names no `HasExtensionProperty`, `radoGraph`, `EFStrategy`, `sameAtomicType_iff`, `toLanguageEquiv`, nor a finite first-order atomic diagram (its `atomicDiagram`, line 578, is the infinitary conjunction). The gate reports `readme-ids-missing` for `HasExtensionProperty.nonempty_iso` and `hasExtensionProperty_radoGraph`.

**Repair:** in the supplier table and at lines 346–396, cite the InfinitaryLogic sections (Layer 1 for `BFEquiv`; the random-graph worked example for the extension property, the Rado graph and its countable uniqueness) and state the consumed facts in prose, without backticked names that no permitted supplier declares. For the finite first-order atomic diagram, which no roadmap on main plans, make it a target of 5.2 here: "the finite conjunction over equality and adjacency atoms on `Fin n` of those true of the tuple and the negations of those false of it, with realization equivalent to atomic-type agreement in every graph structure" (the pattern formulas 5.2 already builds are this object); cite the Tau Ceti main file as provenance. Test: on the repeated pair `(a, a)` the diagram asserts `x₀ = x₁` and `¬Adj(x₀, x₁)`; on an edge `(a, b)` it asserts `x₀ ≠ x₁` and `Adj(x₀, x₁)`.

## R08 (P3) — README shape: no target-level dependencies and no Checks

**Location:** `TauCetiRoadmap/RandomGraphs/README.md:27–47` (milestone table), 161–931 (every milestone).

**Witness:** the README has zero `*Needs:*` lines and zero `**Checks.**` lists; there is no `## Exact supplier contracts`, `## How to read the build`, `### Examples`/`### Dependencies` per layer, or `## Downstream consumers`. Definitions (representative class, strong AP, extension witness, `EP_{≤d}`, `E_{r,s}`, `B_d(n,p)`, witness count, rooted probability, the two Poisson examples) have no discriminating Checks.

**Repair:** adopt the layer shape of main (InfinitaryLogic, StandardDistributions are good models): one `*Needs:*` line per theorem, and at least three Checks per definition. Concrete ones that discriminate: for `EP_{≤d}`, `Fin 0` fails `d = 0`, `K₁` has `d = 0` but not `d = 1`, `C₄` has `d = 1` but not `d = 2` (opposite vertices have equal neighbourhoods, so the request "adjacent to one, not to the other" fails); for `E_{r,s}`, `E_{0,0}` on `Fin 0` is false and on `Fin 1` true, `E_{2,0}` on `Fin 1` is vacuously true; for strong AP, finite sets of size ≤ 1 over the empty root have AP but not strong AP; for `witnessProbability`, `p = 0, r = s = 0` gives 1 by `0^0 = 1`.

## R09 (P3) — Targets without a locator

**Location:** README 163–173 (0.1), 618–650 (7.3), 680–705 (8.2), 724–756 (9.2), 758–777 (9.3), 880–930 (11.3); 1025–1026 (Cameron reference with no section or theorem numbers).

**Witness:** these sections attach no theorem, section or page. The Cameron locators that support the sampled targets are: property (∗) and Facts 1–2, §1.1, p. 1–2 (4.1, 9.1); Theorem 3 and Proposition 11, pp. 8–9 (4.2, 5.2); Theorem 6 and Corollary 1, p. 10 (7.1). Fagin's Theorem 1 (Gaifman, p. 51), Theorem 2 and Corollary 3 (p. 52) and Corollary 5 (p. 53) support 5.2 and 7.1.

**Repair:** attach a locator at each claim; where a target is a new derivation (the uniform rank bound, the graphon witness bound, the product-graphon moment formula), say so and name its inputs instead of a source.

## R10 (P3) — Procedures and implementations are specified where theorems are meant

**Location:** README 449–474 ("the input and output format of the procedures", "consistency procedure", "a genuine terminating syntactic procedure", "A semantic QE statement without the procedure does not discharge this target"); `Suggested.lean:14–17` ("the README requires executable implementations").

**Claim:** the deliverable includes executable procedures. **Witness:** the principles exclude computational algorithms; the mathematics intended (effective QE and decidability of `Th(R)`) is a theorem, and the Lean file already states it as one: existence of a `Computable₂` map on codes with its correctness specification, and a `Computable` decision map. Both statements are true (the axioms are a recursive set, the theory is complete with QE, so search over quantifier-free candidates and proofs terminates) and were checked on instances below.

**Repair:** phrase 5.2 as the theorems the Lean states (existence of computable maps on the fixed coding, computability of the coding operations), with the pattern-formula elimination as the proof route rather than a mandated implementation; delete "executable implementation" from the docstring. Keep the coding targets: they are what makes the computable statement meaningful.

## R11 (P3) — README and Lean do not agree in form

**Location:** `TauCetiRoadmap/RandomGraphs/Suggested.lean:6–31`; README 791 (9.4), 290–296.

**Witness:** none of the 86 declared names appears in backticks in the README (one, `exists_isFraisseLimit_of_isFraisse`, appears in a code block). README 9.4 states singularity for distinct `p, q ∈ (0, 1)`; `binomialRandom_singular_separator` (line 528) states it for all distinct `p, q ∈ [0, 1]`, which is the true generality (at `p = 0, q = 1` the empty and complete graphs already separate). The docstring describes "suggested forms" and "prototype" names.

**Repair:** name each kept declaration in its README subsection and widen 9.4 to distinct `p, q ∈ [0, 1]`; rewrite the module docstring per R03.

## Verified sound

**Gate and dependency check.** The worker's gate at this head: `set_option=1 … latex=476 … prnum=1 sorry-data=0 … readme-ids-missing=2 … build=1 FAIL` (each failing category is a finding above). The dependency check I ran:

```text
depcheck: 234 roadmaps, 2148 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line; RandomGraphs is in the merge order (line 379). `git diff --stat origin/main...HEAD` outside the folder is empty; the folder contains only `README.md`, `Suggested.lean`, `metadata.toml`.

**Pins.** Mathlib `f6090c7095e1e56b3464c1daba5f24631f1290d2`, Tau Ceti `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a` (the worktree manifest; the content checkout has the same pins).

**Elaboration.** A scratch copy of the file without `set_option`, with every `sorry` replaced by `first | rfl | simp | infer_instance | sorry` and with `#check @name` for all 86 declarations, elaborated: 44 declarations fell through to `sorry`, 9 left `simp` with partial progress (unsolved goals, not closures), one (`HasExtensionUpTo.mono`) closed by the exact term above; no sorried theorem closed by `rfl`, `simp` or `infer_instance`. A second copy closed `exists_isQF_equivalent` by the exact term in R04 (53 remaining `sorry` warnings) and failed to close `hasExtensionUpTo_zero_iff` with `simp`. Two `rfl` examples confirmed that `radoAxioms` and `extensionSentence 0 0` unfold to the bodies read below. All 86 elaborated types were compared with the README statements: probability, countability, finite-generation, `d ≤ n`, `max 1 d ≤ n`, `1 ≤ q`, `1 ≤ d` and the interior-parameter hypotheses are all present in the elaborated types; no section binder was lost.

**Library declarations opened at the pin.**

| Declaration | File:line | What it says / does not include |
| --- | --- | --- |
| `BoundedFormula.listEncode`, `listDecode`, `encoding` | `Mathlib/ModelTheory/Encoding.lean:162`, 196, 277 | `falsum` ↦ `[inr (inr (n+2))]`, `equal` ↦ two `inl ⟨n, t⟩`, `rel` ↦ `[inr (inl R), inr (inr n)] ++ terms`, `imp` ↦ `inr (inr 0) :: …`, `all` ↦ `inr (inr 1) :: …`. Mathlib gives `Countable`, not `Encodable`, for bounded formulas (lines 317, 322), so `boundedCode` duplicates nothing. |
| `Term` encodable instance | `Encoding.lean:143` | Needs `Encodable α` and `Encodable (Σ i, L.Functions i)`; the file supplies the latter for the graph language. |
| `BoundedFormula.iInf` | `Mathlib/ModelTheory/Syntax.lean:628` | `[Finite β]`; used by `extensionSentence` and by the Tau Ceti diagram. |
| `Computable₂` | `Mathlib/Computability/Partrec.lean:247` | Primcodable types; `ℕ → ℕ → ℕ` qualifies. |
| `Theory.IsComplete`, `Cardinal.Categorical`, `Categorical.isComplete` | `Mathlib/ModelTheory/Satisfiability.lean:385`, 504, 508 | Carriers for R03. |
| `ElementaryEmbedding` | `Mathlib/ModelTheory/ElementaryMaps.lean:44` | Carrier for primeness. |
| `CompleteType`, `typesWith`, `typeOf` | `Mathlib/ModelTheory/Types.lean:59`, 68, 187 | Carriers for atomicity. |
| `IsQF` | `Mathlib/ModelTheory/Complexity.lean:72` | `falsum`, atomic, `imp`; agrees with `foRank = 0`. |
| `Language.graph`, `adj`, `SimpleGraph.structure`, `Theory.simpleGraph` | `Mathlib/ModelTheory/Graph.lean:49`, 53, 57, 68 | Relational; `RelMap adj x = G.Adj (x 0) (x 1)`; theory = irreflexive and symmetric. |
| `SimpleGraph.fromRel`, `fromRel_adj` | `Mathlib/Combinatorics/SimpleGraph/Basic.lean:135`, 139 | `a ≠ b ∧ (r a b ∨ r b a)`. |
| `DirectLimit.exists_fg_substructure_in_Sigma` | `Mathlib/ModelTheory/DirectLimit.lean:317` | R06 repaired. |
| `embedding_from_cg`, `equiv_between_cg` | `Mathlib/ModelTheory/PartialEquiv.lean:476`, 499 | Rooted adapters of Milestone 3 are consistent with them. |
| `isFraisse_finite_linear_order` | `Mathlib/ModelTheory/Order.lean:531` | Cited example. |
| `cliqueFinset`, `diam` | `Mathlib/Combinatorics/SimpleGraph/Clique.lean:852`, `Diam.lean:265` | Triangle count; diameter carrier for R03. |
| `poissonMeasure`, `binomialRandom`, `Nat.descFactorial` | `Probability/Distributions/Poisson/Basic.lean:40`, `Probability/Combinatorics/BinomialRandomGraph/Defs.lean:46`, `Data/Nat/Factorial/Basic.lean:332` | Rate in `ℝ≥0` including 0; law as comap of a Bernoulli product on non-diagonal pairs. |
| `Graphon` (fields `meas'`, `bdd'`, `mem01'`), `Graphon.const`, `sampleGraph`, `infiniteSampleLaw`, `restrictFin` | Tau Ceti `Combinatorics/DenseGraphLimits/Graphon/Basic.lean:79`, 160; `Sampling/Finite.lean:314`; `Sampling/Infinite.lean:126`; `Combinatorics/SimpleGraph/Maps.lean:77` | `restrictFin` is `comap Fin.val`; the product-graphon fields are the ones proved in the file. |
| `sampleGraph_const`, `infiniteSampleLaw_map_restrictFin`, `tendsto_homDensityFin_infiniteSampleLaw_ae`, `graphonMixtureLawEquiv_law`, `existsUnique_bind_infiniteSampleLawOnSpace`, `ergodicSMul_of_jointlyDissociated`, `isDissociated_iff_jointlyDissociated` | `Sampling/Finite.lean:372`; `Sampling/Infinite.lean:287`; `Sampling/AlmostSure/Basic.lean:62`; `ExchangeableGraphLaw/Infinite/Mixture.lean:82`, 91; `Probability/Exchangeability/Arrays/Ergodic.lean:307`; `ExchangeableGraphLaw/ArrayLaw.lean` | All present at the pin as the README's bullet list says. |

Absent at the pin, as reported in R03/R07: `IsVertexConnected` (Mathlib and Tau Ceti), every `TauCeti.ModelTheory.BackAndForth.*`/`Infinitary.*` module, `firstOrderAtomicDiagram`.

**Cross-roadmap citations resolved on main.** `Completed/InfinitaryLogic/README.md` Layer 1 (`BFEquiv`, lines 403–420), `QuantifierRank` module (line 222), worked example line 670; `Completed/DenseGraphLimits/README.md` Layers 9a (line 412), 9b (433), 9c; `Completed/Exchangeability/README.md` Layer 8 (line 931, arrays at 994); `TauCetiRoadmap/GraphConnectivityAndFlows/README.md` §1.5 (line 331, `IsVertexConnected k` at 344); `TauCetiRoadmap/StandardDistributions/README.md` (Poisson law, Layer 7; it does not state the factorial-moment criterion, lines 303–311 concern pgf derivatives). All suppliers are on main or earlier in the merge order; no upward citation.

**Ownership.** `roadmaps grep` over the 451 open pull requests and main for "Rado graph", "Fraïssé limit", "zero–one law", "radoGraph", "HasExtensionProperty", "factorial moment": the only other hits are CountableStructureSpaces (#1316, line 656, the Rado isomorphism class as a Borel set, an example, not a construction), PointProcesses (#417, factorial moment measures for point processes with its own hypotheses) and StochasticCalculus (Kolmogorov's tail law). No second owner of general Fraïssé existence, bounded extension, the extension sentences, the discrete Poisson criterion or the two Poisson examples. PointProcesses and CountableStructureSpaces are not among the sibling checkouts this brief supplies, so their ownership was checked only through the grep index.

**Seeded sample.**

| Target | Text and locator | Supports the statement as written? |
| --- | --- | --- |
| 0.3 Satisfaction as an event | No locator in the README. Native route: `Countable V` gives the discrete structure; quantifier steps are countable unions. | Internally consistent (row below); locator missing (R09). |
| 2.2 Construction | README names Hodges Thm 7.1.2, Lemma 7.1.6, construction (1.8), pp. 326–329 (not readable, see below); `cmt-fraisseexistence` (Tau Ceti-style existence with countable function symbols). | The stated generality (countable function symbols only, finite and empty limits allowed) is consistent with the construction read; the Hodges locators are unverified. |
| 4.1 Combinatorial and syntactic extension | `cameron2013` lines 26–32 (property (∗), §1.1, p. 1), 342–354 (σ_{m,n}, Prop. 11, p. 9). | Yes; the README's explicit "witness outside U ∪ V" is stronger than the source's (∗), see Source issues. |
| 5.2 Complete theory and QE | `cameron2013` lines 342–354 (Prop. 11, ℵ₀-categoricity via σ_{m,n}, p. 9), `fagin1976` lines 70–86 (Theorem 1, Gaifman: T consistent and complete, p. 51); `tauceti-atomicdiagram` lines 66–96 (finite diagram, hypotheses `[Finite (Σ k, L.Relations k)]`, relational `L`). | Completeness and categoricity: yes. The finite-diagram row matches the file exactly. Computable QE and decidability: no source locator (standard; the README should cite one, R09). |
| 5.3 Finite consequences | `fagin1976` lines 125–131 (Corollary 3, p. 52), 140–144 (Corollary 5, p. 53). | Yes: `T ⊨ σ` iff `p_n(σ) → 1`; finite subsets have models of every large cardinality. |
| 7.1 Finite laws | `fagin1976` lines 97–124 (Theorem 2, p. 52, bound `n^m(1 − 2^{−(2m+1)})^{n−m}` for a binary relation), `cameron2013` lines 395–417 (Theorem 6 and Corollary 1, p. 10, graph bound `N^{m+n}(1 − 2^{−(m+n)})^{N−m−n}`). | The sources prove the `p = 1/2` uniform model; the all-interior-`p` bound `(n)_{r+s}(1 − p^r(1−p)^s)^{n−r−s}` is the same argument and is checked below. |
| 7.2 Varying parameters | README cites Spencer Thms 9.1.3–9.1.4 (not readable). | Checked by computation below (growth condition and the `1/log(n+2)` example). |
| 7.3 Joint almost-sure statements | No locator. Route: Borel–Cantelli from `summable_extensionError`. | Consistent (rows below); locator missing. |
| 8.1 Finite named roots | No locator; Spencer §1.3 and Thms 2.3.1–2.3.2 named in References for the rooted form (not readable). | Values checked below (adjacency atom limit `p`). |
| 9.2 Graphon sampling | Native declarations at the pin (table above). | The constant-graphon identities are at the pin; the conditional witness bound is a derivation, checked below. |
| 9.3 Invariant-event laws and mixtures | `ergodicSMul_of_jointlyDissociated`, `isDissociated_iff_jointlyDissociated`, `graphonMixtureLawEquiv_law`, `existsUnique_bind_infiniteSampleLawOnSpace` at the pin. | Yes for finitely supported permutations and the bind identity; the half-empty/half-complete value 1/2 checked below. |
| 9.4 One class, distinct laws | `tendsto_homDensityFin_infiniteSampleLaw_ae` at the pin. | Yes; `K₂` hom-density `2|E|/n²` versus `2|E|/(n(n−1))`, ratio → 1. |
| 11.1 Discrete factorial-moment criterion | README cites Bollobás Thms 1.21–1.22 (not readable). | Checked by computation (Bonferroni squeeze, `r = 0`, discrete total variation). |
| 11.2 Sparse triangles | `erdosrenyi1960` lines 1139–1160 (Theorem 3a: cycles of order `k` with `N ∼ cn` edges are asymptotically Poisson with mean `(2c)^k/(2k)`). | For `k = 3` and `N = cn` edges, i.e. `np → 2c`, the mean is `(2c)^3/6`, which is `c'^3/6` with `c' = 2c`: consistent with 11.2's normalization. |
| 11.3 Product graphon | No external locator (a derivation). | Moment formula, scaling, dominator and limits checked below. |

**Adversarial computations.** Every declaration of `Suggested.lean` was instantiated; the rows below cover the sampled targets, the headlines and everything a finding touches.

| Statement | Instances and values | Result |
| --- | --- | --- |
| `representativeClass` (48) | Empty family: no `M` belongs. Family `[Fin 1]` in the empty language: `Fin 1` in, `Fin 2` out; duplicating the representative changes nothing. | Sound. |
| `StrongAmalgamation` (53) | Sets of size ≤ 1 over the empty root with `B = C = Fin 1`: AP holds (amalgam `Fin 1`, images meet in 1 point) but the root image is empty, so strong AP fails. Free graph amalgam of two edges over a shared vertex: images meet exactly in that vertex. | Discriminates AP from strong AP. |
| `exists_isFraisseLimit_of_isFraisse` (65) | Pure sets of size ≤ 2: limit has 2 elements (finite limit allowed); all finite pure sets: limit ℕ. Empty class is excluded by `IsFraisse.is_nonempty`. | Sound; no `Infinite`/`Nonempty` premise needed. |
| `exists_embedding_comp_eq_of_isExtensionPair` (76) | Empty language, `A = Fin 1`, root `0 ↦ 0` in `Fin 2`, `0 ↦ 7` in ℕ: `e(0) = 7, e(1) = 8`; both composites send the point to 7. | Sound literal equation. |
| `exists_equiv_comp_eq_of_isExtensionPair` (82) | `M = N = ℕ` pure sets, roots `0 ↦ 0` and `0 ↦ 1`: the transposition `(0 1)` works; an unrooted "some isomorphism" would allow the identity, which fails `0 = 1`. | Root kept. |
| `foRank` (106) | `⊥`, atoms: 0; `∃x x=x`: 1; `noIsolatedSentence`: 2; `triangleSentence`: 3; `imp` of ranks 1 and 3: 3. | Sound. |
| `measurableSet_satisfies` (120) | `Fin 0`: one graph, event for `∃x x=x` is ∅, mass 0. `Fin 2`, "there is an edge": event `{K₂}`, mass `p`. | Sound. |
| `satisfies_iso` (124) | Swap of `K₂`: edge sentence true/true, triangle false/false. A non-surjective embedding `Fin 0 → K₂` would change `∃x x=x` from false to true. | Isomorphism needed. |
| `binomialRandom_map_comap` (133) | Injection `Fin 2 ↪ Fin 3`: edge marginal `p` on both sides; `Fin 0`: Dirac on the unique graph. | Sound. |
| `IsExtensionWitness` (141) | In `R` with `U = {0}`, `Z = {1}`: `x = 5` works (bit 0 of 5 is 1, bit 1 of 5 is 0, `5 ∉ U ∪ Z`); `x = 0` fails `x ∉ U`; `x = 3` fails (adjacent to 1). | Both exclusions enforced. |
| `HasExtensionUpTo` (144) | `Fin 0`: `d = 0` false. `K₁`: `d = 0` true, `d = 1` false. `C₄`: `d = 1` true, `d = 2` false (opposite vertices have equal neighbourhoods). | Discriminating. |
| `HasExtensionProperty` (152) | `R`: true. Any finite graph: false (`U = ∅`, `Z = all`). | Faithful; R07 concerns its name, not its body. |
| `hasExtensionProperty_iff` (159) | `K₁`: both sides false (`d = 1`). `R`: both true; a request of size `t` is tested at `d = t`. | Sound both ways. |
| `extensionSentence` (169), read by `rfl` | `r = s = 0`: `(⊤ → ∃z ⊤)` ≡ nonempty: `Fin 0` false, `Fin 1` true. `r = 1, s = 0`: `∀y₀ ∃z (Adj(z,y₀) ∧ z ≠ y₀)`: `K₁` false, `K₂` true. `r = 0, s = 1`: `K₂` false, `K₁ ⊔ K₁` true. `r = 2, s = 0` on `Fin 1`: antecedent `y₀ ≠ y₁` never holds, so true. Positive indices are `i < r`, witness variable is `Fin.last`. | Body matches the README's `E_{r,s}` including vacuous cases. |
| `satisfies_extensionSentence` (182) | Same instances: finite-set side with `|U| = r, |Z| = s` gives the same four values. | Sound iff. |
| `radoAxioms`, `model_radoAxioms_iff` (189, 192) | `K₁`: graph axioms hold, `E_{1,0}` fails, EP false. `R`: all hold, EP true. Loop-free symmetric structure is automatic under `G.structure`. | Sound. |
| `radoGraph`, `radoGraph_adj` (199, 202) | `fromRel`: `i ≠ j ∧ (bit_i(j) ∨ bit_j(i))`; `bit_i(j) = 1` forces `2^i ≤ j`, so `i < j`. Pairs `(0,1)`: true; `(0,2)`: false; `(1,2)`: true; `(1,1)`: false; `{0,1,3}` is a triangle. | Convention pinned. |
| `radoGraph_extension`, `nonempty_iso_rado` (208, 211) | `U = {0}`, `Z = {1}`: witness 5. `G = R`: identity. `Fin 0`: EP false, no isomorphism. | Sound. |
| `exists_graphEmbedding_over_root` (216) | `F = K₁`, `G = K₂` rooted at an endpoint, root in `R` at 0: `e(0) = 0, e(1) = 1`. | Sound; `H` of any cardinality. |
| `satisfies_iff_of_extension` (224) | `d = 0`: `K₁`, `K₂` agree on `∃x x=x` (true) and disagree on `∃x∃y x≠y` (rank 2, outside the bound). `d = 1`: `EP_{≤1}` graphs all satisfy `∃x∃y Adj(x,y)` and all refute `∃x∀y (x=y ∨ Adj(x,y))`. Round `k ≤ d+1` places a request of size `k−1 ≤ d`. | Confirms `d+1`, excludes `d+2`. |
| `formula_iff_of_extension` (232) | `m = 2, q = 1`, budget 2: roots `(0,0)` in `R` and `R`: `∃y Adj(x₀,y)` true/true; equality atom `x₀ = x₁` true/true. Root `(0,0)` versus `(0,1)` is excluded by `heq`. | Repeated coordinates handled. |
| `boundedCode`, `boundedDecode`, `boundedDecode_boundedCode` (271–285) | Round trip is a proved theorem. For `α = Fin m` the code of `x : Fin m ⊕ Fin n` is `2x` or `2x+1`, independent of `m`; `falsum` at level `n` codes `[inr (inr (n+2))]`, so it depends on `n` only, as `bot n` says. | Sound; the "`m` separately" claim holds. |
| `computable_boundedCode_constructors` (290) | `eq (n, 2i, 2j+1)` for `x = inl i`, `y = inr j`: the atom's list is two `inl ⟨n, var·⟩` entries; `imp`: `inr (inr 0) :: l₁ ++ l₂`; `all`: `inr (inr 1) :: l`; each a computable list operation on decoded codes. Junk codes unconstrained. | True; needs real computability proofs, not one tactic. |
| `computable_boundedCode_cases` (308) | Tags: first symbol `inr (inr k)` with `k ≥ 2` ↦ 0, `inl` ↦ 1, `inr (inl _)` ↦ 2, `inr (inr 0)` ↦ 3, `inr (inr 1)` ↦ 4: disjoint. `left` of an `imp` needs the parse of `φ₁`'s extent, which `listDecode` performs. | True. |
| `exists_computable_quantifierElimination` (326) | `m = 0`: quantifier-free sentences over `Empty ⊕ Fin 0` have no terms, so `ψ ∈ {⊥, ⊥ → ⊥}`; completeness of `T_R` makes every sentence equivalent to one of them. `m = 2`, `φ = Adj(x₀,x₁)`: `ψ = φ`. `φ = ∃y Adj(x₀,y)`: `ψ = ⊤` (true in every EP model, false in `K₁`, which is not a model). | True; search over `(ψ, proof)` terminates since `T_R` is recursively axiomatized and has QE. |
| `exists_computable_decide_rado` (344) | Triangle sentence ↦ `true` (`{0,1,3}`); `∃x Adj(x,x)` ↦ `false`. A constant-true `D` fails the second. | True (decidability of `Th(R)`); corollary of the previous row plus `m = 0`. |
| `witnessProbability` (355) | `p = 1/2, r = s = 1`: 1/4; `r = s = 0`: 1 at `p = 0` and `p = 1` (`0^0 = 1`); `p = 0, r = 1`: 0. | Sound. |
| `witnessCount_mass`, `no_witness_mass` (362, 370) | `q = 1/4`, `|C| = 2`: masses 9/16, 6/16, 1/16 (sum 1); `j = 3`: `choose(2,3) = 0` on the right, empty event on the left. `C = ∅`: 1 = `(1−q)^0`. | Truncated exponent harmless. |
| `extensionError` (378) | `p = 1/2`: `B₀(0) = 1`, `B₀(1) = 0`, `B₁(4) = 1`, `B₁(5) = 5/8`, `B₂(2) = 6`. | Finite sum, may exceed 1. |
| `extension_failure_le` (383) | Exhaustive enumeration of all labeled graphs at `p = 1/2`: `(n,d) = (0,0)`: `1 ≤ 1`; `(1,0)`: `0 ≤ 0`; `(3,1)`: `1 ≤ 3/2`; `(4,1)`: `23/32 ≤ 1`; `(5,1)`: `1/2 ≤ 5/8`; `(2,2)`: `1 ≤ 6`. | Sound on `d ≤ n`. |
| `extensionError_le_exp` (388) | `p = 1/2`: `(2,2)`: `6 ≤ 48`; `(4,1)`: `1 ≤ 3.5701`; `(1,0)`: `0 ≤ e^{−1}`; `(1,1)`: `2 ≤ 4`. Proof shape: `Σ_r C(t,r)(1−q)^{n−t} ≤ 2^t e^{−(n−d)δ^d}` since `q ≥ δ^t ≥ δ^d`; `Σ_t C(n,t) ≤ (d+1)n^d` for `n ≥ 1`. | Sound; `max 1 d ≤ n` needed (`t = 0` term is `0^n`). |
| `summable_extensionError` (394) | `p = 1/2, d = 1`: `B₁(n) = 1, 2, 2, 3/2, 1, 5/8, 3/8, 7/32, …`, partial sum to `n = 60` is 9.000. `p = 0, d = 1`: `B₁(n) = n` for `n ≥ 2`, not summable. | Interior hypothesis necessary. |
| `sentenceProbability_error` (399) | `∃x x=x`, `d = 0`: `n = 0` error 1 = `B₀(0)`; `n = 1` error 0 = `B₀(1)`. The symmetric difference of `{G ⊨ φ}` and the Rado truth lies in `{¬EP_{≤d}}` since `R ⊨ EP_{≤d}`. | Uniform over sentences of the rank. |
| `firstOrder_zero_one` (404) | Edge sentence: `1 − (1−p)^{C(n,2)} → 1` for `0 < p < 1`; at `p = 0` it is 0 while `R ⊨ φ`: the endpoint must be excluded, and is. | Sound. |
| `firstOrder_limit_varying_bounded_rank` (410) | `p_n = 1/2, d = 1`: growth `(n−1)/2 − log(n+2)` = 2.02, 44.9, 492.6 at `n = 10, 100, 1000`. `p_n = 1/n`: `(n−1)/n − log(n+2)` = −1.58, −3.63, −5.91: sparse regime excluded. With `d ≥ 1`, `B_d ≤ (d+1)2^d exp(d log n − (n−d)δ^d) → 0`. | Sound. |
| `ae_eventually_all_bounded_rank` (421) | For each `d`, `Σ_n P(¬EP_{≤d}(X_n)) ≤ Σ_n B_d(n,p) < ∞`, so a.s. finitely many failures, with no independence across `n`. Quantifier order `∀ω ∀d ∀ᶠn ∀φ` matches README 7.3. | Sound. |
| `rootedProbability`, `rootEvent_pos` (445, 451) | `p = 1/2, H = K₂, φ = Adj(x₀,x₁)`: ratio 1. Empty `H`: 0. `p = 0, H = K₂`: 0/0 totalized to 0, outside the theorem's `0 < p`. Root event mass `p^e(1−p)^{C(m,2)−e} > 0`. | Interior hypotheses in place. |
| `rooted_firstOrder_limit` (462) | Adjacency atom with root `K₂`: constant 1 = truth at any edge of `R`; empty root: 0 = 0. Independence of the copy follows from homogeneity. | Sound. |
| Unconditioned rooted limit (README 666–678; R03) | `m = 2`, `ψ = Adj(x₀,x₁)`: `p·1 + (1−p)·0 = p`; `ψ = (x₀ = x₁)`: both terms 0. | Correct polynomial; absent from Lean. |
| `ae_isomorphic_rado` (475) | One-positive/one-negative request at `p = 1/2`: failure among `N` candidates `(3/4)^N → 0`; countable intersection. `p = 0`: empty graph a.s., excluded. | Sound. |
| `infiniteSampleLaw_const` (483) | One edge and one non-edge pattern: mass `p(1−p)` under both laws; `p ∈ {0,1}`: both Dirac. | Sound. |
| `infiniteSampleLaw_ae_rado` (487) | `W = 1/2`: conditional success 1/4. `W = xy`, root `x`: success `x/2 > 0` for a.e. `x`; `x = 0` is null. | A.e. hypothesis suffices. |
| `graphon_extension_failure_le` (492) | `W = 1/2, ε = 1/2, n = 4, d = 1`: failure 23/32 ≤ bound `0 + 4·2·(1/2)^3 = 1`. `n = d = 0`: `1 ≤ 1`. Conditional on the roots' latent values, outside candidates are independent with success `≥ ε^t` a.e. | Sound. |
| `graphon_firstOrder_limit` (501) | `W = 1/2`: triangle limit 1. `W = 0`: `ε > 0` fails and the triangle probability is 0 at every `n`. | No endpoint overclaim. |
| `infiniteSampleLaw_sentence_zero_one` (510) | `W = 0`, `W = 1`: edge sentence 0 and 1. The half-mixture gives 1/2 and is not a single-graphon law. | Ergodicity under finitely supported permutations. |
| `windowEdgeDensity`, `ae_windowEdgeDensity` (519, 522) | `n = 0, 1`: denominator `n(n−1) = 0`, value 0. `K₃` window: `6/6 = 1` while the `K₂` hom-density is `6/9`; ratio `n/(n−1) → 1`. `p = 0`: identically 0. | Normalization pinned. |
| `binomialRandom_singular_separator` (528) | `S = {density → p}`: `p = 1/3, q = 2/3`: masses 1 and 0. `p = 0, q = 1`: empty versus complete, same separation. | True for all distinct `p, q ∈ [0,1]` (R11). |
| `triangleSentence`, `triangleCount`, `satisfies_triangleSentence` (536, 550, 558) | `∃x₀∃x₁∃x₂` of three adjacencies; repeated coordinates make a loop atom false. `K₂`: false ↔ `0 < 0`; `K₃`: true ↔ `0 < 1`; `K₄`: count 4 (ordered embeddings would give 24). | Unordered normalization. |
| `noIsolatedSentence`, `isolatedCount` (545, 554) | `∀x₀∃x₁ Adj(x₀,x₁)` (outer variable 0). `Fin 0`: true ↔ `0 = 0`; `K₁`: false ↔ `1 = 0`; `K₂`: true. | Quantifier order right. |
| `poisson_pointMass_limit_of_factorial_moments` (567) | `ν_n = δ₀, r = 0`: moments `1, 0, 0, …` = `0^k`; masses `1, 0, …` = Poisson(0). Constant Poisson(2): first two factorial moments 2, 4; mass at 0 is `e^{−2}` = 0.1353. Bonferroni: for `X = 2`, `j = 0`, partial sums `1, −1, 0` bracket 0. | Sound; no uniform exponential moment. |
| `poisson_totalVariation_limit_of_factorial_moments` (580) | Each `tsum` is at most 2 (two probability vectors). `r = 0`: `ν_n{0} → 1` forces the distance to 0. Pointwise convergence plus finite truncation (missing mass `< ε`) gives distance `≤ ε'+2ε` eventually. | Sound (Scheffé on ℕ). |
| `triangle_factorialMoment_limit` (592) | `c = 1`: `C(n,3)(1/n)^3` = 0.1200, 0.1617, 0.1662 at `n = 10, 100, 1000` → 1/6. `k = 2`, `n = 1000`: disjoint pairs `(n)_6 p^6/36` = 0.02736 → `(1/6)^2` = 0.02778; edge-sharing pairs `≍ n^4 p^5 = 10^{−3}`. `k = 0`: 1. | Overlap `e − v ≥ 1` decays. |
| `triangle_poisson_mass_limit`, `sparse_triangle_sentence_limit` (602, 611) | `c = 1`: masses `e^{−1/6}` = 0.8465 and `e^{−1/6}/6` = 0.1411; triangle probability → 0.1535, strictly inside `(0,1)`. `c = 0`: 1, 0 and limit 0. | Sound. |
| `productGraphon` (618) | `W(0,1) = 0`, `W(1,1) = 1`, `W(1/2,1/2) = 1/4`; symmetric; measurable as a continuous function; bounded by 1 with `|xy| ≤ 1`; in `[0,1]`. | Fields proved (R03 of the previous review repaired). |
| `productGraphon_isolated_expectation` (627) | `n∫₀¹(1−x/2)^{n−1}dx = 2(1−2^{−n})`: `n = 1`: 1; `n = 2`: 3/2; `n = 3`: 7/4. | Correct; padding (R04). |
| `productGraphon_isolated_factorialMoment_limit` (632) | `k = 0`: 1. `k = 1`: `2(1−2^{−n}) → 2`. `k = 2`, `n = 2`: `2∫∫(1−xy) = 3/2`; limit `(∫₀^∞ e^{−u/2}du)^2 = 4`. Dominator: `k = 2`, `x = (1,1)`: `∫(1−y)^2 = 1/3 ≤ 1 − 2/4`; `x = (1/2,1/2)`: `7/12 ≤ 3/4`. | Sound. |
| `productGraphon_isolated_poisson_mass_limit`, `productGraphon_noIsolated_limit` (639, 645) | Poisson(2) masses 0.1353, 0.2707, 0.2707; the no-isolated-vertex probability → `e^{−2}` = 0.1353 while the infinite sample is Rado a.s. (`0 < xy < 1` a.e.). Finite values `n = 0, 1, 2`: 1, 0, 1/4. | Genuine failure of finite zero–one for this graphon. |
| `productGraphon_ae_isomorphic_rado` (652) | Roots `x, z ∈ (0,1)`: one-positive/one-negative success `x(1/2 − z/3) > 0`. | Sound. |
| README 7.2 all-rank example `p_n = 1/log(n+2)` | `n^{0.1}/log(n+2)` at `n = 10^6` is 0.288 and increases like `n^{0.1}/log n → ∞`; for fixed `d`, `n/(log n)^d` dominates `d log n`. Alternating `1/3, 2/3`: `δ_n = 1/3`. | Correct. |
| README 7.2 separation of the two conditions | `d = 1`, `δ_n = (log n + log log n)/n`: growth `(n−1)δ_n − log(n+2)` = 1.92, 2.63, 3.03 at `n = 10^3, 10^6, 10^9` → ∞, but `B₁(n) ≈ n(1−δ_n)^{n−1}` = 0.140, 0.072, 0.048 ≍ `1/log n`, not summable. | Convergence without summability, as the README says. |
| README 9.3 mixture value | Half `δ_empty` + half `δ_complete`, "there is an edge": `(1/2)·0 + (1/2)·1 = 1/2`; each component is 0 or 1. | Correct. |
| README 10 | `Θ_R` fails on every `n`-vertex graph (`E_{0,n}` has no witness): finite probability 0, infinite probability 1. `Θ_even` on `Fin n`: 1, 0, 1, … for every `p`. | Correct; not statable at the pin (R03). |
| README 11.2 uniform exponential moments fail | `p_n = c/n`, `a > 1`: `log E[a^{T_n}] ≥ C(n,3) log a + C(n,2) log p_n ≈ (log a)n^3/6 − (n^2/2) log n → ∞`. | Distinguishes 11.1 from PointProcesses' criterion. |

## Not verifiable

- **Spencer (2001)**, Thms 0.1.2, 0.1.5, Definition 2.3, Thms 2.2.3, 2.3.1–2.3.2, 9.1.3–9.1.4: not in the sources cache; the previous review found only the Springer subscription record. Not re-attempted; cited by locator alone.
- **Bollobás (2001)**, Thms 1.21–1.22, 4.1, Cor. 4.9: likewise (Cambridge record only).
- **Hodges (1993)**, Thm 7.1.2, Lemmas 7.1.3–7.1.4, 7.1.6, (1.8), Thm 7.1.7, pp. 326–329: likewise.
- **Mathlib proposals #20649, #41113, #41115, #18876**: their pages are in the cache, but the review did not audit their code; the README uses them for shape only, and their absence at the pin is confirmed.
- **PointProcesses (#417) and CountableStructureSpaces (#1316)**: not among the sibling checkouts; checked by grep index only.

## Source issues

- **Gap** in cameron2013 at §1.1 property (∗), printed p. 1: the source says a witness adjacent to the `u`'s and nonadjacent to the `v`'s is automatically distinct from all of them; it should require the witness outside the `v`'s explicitly, since a `v_j` is trivially nonadjacent to itself (with `m = 0` any graph satisfies the literal condition); affects the proof.
- **Error** in cameron2013 at Theorem 3(a), printed p. 8: the source says closure under isomorphism and substructures, countably many isomorphism types and amalgamation characterize ages; it should also require the class to be nonempty (the empty class satisfies the listed conditions and is no age); affects a stated result.
- none further found; the Fagin and Erdős–Rényi passages read agree with the roadmap's statements (the Erdős–Rényi mean is in the fixed-edge-count model, `N ∼ cn`, which the README's 11.2 normalization accounts for).
