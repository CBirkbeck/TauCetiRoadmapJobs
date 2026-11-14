# Review of HanfNumbers (pull request #1319 at c0ccdae)
**Verdict:** needs changes

## R01 (P3) — Five API declarations remain in the acceptance file

**Location:** `TauCetiRoadmap/HanfNumbers/Suggested.lean:66`, `:76`, `:309`, `:465`, `:474`: `partitionRel_iff_finset`, `PartitionRel.mono`, `hanfNumber_isHanfBound`, and the two relational specializations.
**Claim:** These are acceptance-test headlines.
**Witness:** The two relational statements close with one `exact` of their `_of_countable` versions. The other three are the order-free reformulation, monotonicity, and attained-infimum API, already specified in README 0.1 and 3.1.
**Repair:** Delete these five declarations from `Suggested.lean`. Keep their mathematics as README prose, remove their backticked API labels at README `:293`, `:294`, `:663`, `:1027`, `:1040`, and remove the two relational “headline” labels. Replace the reference at Lean `:57` by “README 0.1, the order-free form”.

## R02 (P3) — Previously identified locator omissions remain

**Location:** `TauCetiRoadmap/HanfNumbers/README.md:321`: “Then some `H ⊆ I` with `λ⁺ ≤ #H` is end-homogeneous for `c`”; also 1.1–1.3, 2.1–2.3, 4.1 and 5.6.
**Claim:** The target statements carry exact source locators.
**Witness:** None of those subsections supplies a source theorem, section or page at its claims; `:325` names only “the Erdős–Rado tree argument”.
**Repair:** Add Erdős–Rado 1956, proof of Theorem 39(i), pp. 469–470 at 0.3; Marker’s notes pp. 55, 57 at 2.1; p. 54, definition and Exercise 5.1 at 4.1. Identify the custom interfaces in 1.1–1.3, 2.2–2.3 and 5.6 as such, citing their classical background: Exercise 5.7 p. 57, Theorem 5.11 and Corollary 5.13 p. 59, and the named graph-translation supplier.

## R03 (P3) — Definitions still lack discriminating Checks

**Location:** `TauCetiRoadmap/HanfNumbers/README.md:269`, `:271`, `:393`, `:414`, `:434`, `:506`, `:703`, `:838`; conventions for iteration and categoricity; Checks at `:671`, `:962`, `:1000`.
**Claim:** Every definition has at least three discriminating Checks, written without Lean counterpart names.
**Witness:** There remain only five Checks blocks. Hanf number, smallness and completeness each have two Checks; the other listed definitions have none. The completeness Check at `:1003` still names `isCompleteSentence_scottSentence`.
**Repair:** Give each listed definition three computed Checks, including positive and negative cases; the table below supplies distinguishing instances. Add “exactly two elements has Hanf number 3”, “(ω₁, <) has ℵ₁ complete 1-types”, and the one-element/nonempty-sentence completeness comparison. Remove the declaration name from the Scott-sentence Check.

## R04 (P3) — Twelve README API names still have no declaration

**Location:** `TauCetiRoadmap/HanfNumbers/README.md:475`, `:661`, `:784`, `:840`, `:843`, `:866`, `:867`, `:868`, `:886`, `:887`, `:1005`, `:1033`.
**Claim:** The backticked names identify declarations of this roadmap.
**Witness:** All twelve have zero occurrences in `Suggested.lean`: `skolemSymbols`, `IsHanfBound.mono`, `morley_hanf_theory`, the two global-bound names, three ladder names, two sharpness API names, the countable-companion name and the complete-entailment name.
**Repair:** Replace those labels with prose: Skolem symbols; monotonicity of Hanf bounds; the countable-theory form; global bound; bounded-spectrum criterion; ladder satisfaction; ladder model; ladder cardinal bound; successor-beth lower bound; cofinal beth supremum; countable companion; complete strengthening. Preserve the mathematical statements and the external Provenance mention at `:1244`; add no API declarations to Lean.

## R05 (P3) — The module docstring retains the superseded framing

**Location:** `TauCetiRoadmap/HanfNumbers/Suggested.lean:13`: “The statements here suggest Lean forms for the milestones, so that contributors and reviewers converge on names and signatures”.
**Claim:** The module docstring identifies the file as the headline acceptance test.
**Witness:** Lines 12–15 still say it is “not exhaustive” and that discharging its statements finishes neither a layer nor the roadmap. Only the two witness docstrings were repaired.
**Repair:** Replace lines 12–15 by: “**This file is not the roadmap.** The roadmap is README.md. This file states the roadmap’s headline theorems against the pinned Mathlib and Tau Ceti, each with sorry, with the definitions they need.”

## R06 (P3) — Pull-request references remain in the roadmap

**Location:** `TauCetiRoadmap/HanfNumbers/README.md:238`, `:240`, `:246`, `:248`: “Mathlib #42758”, “Mathlib #42189”, “Mathlib #43488”, “Mathlib #40782”.
**Claim:** The edited supplier discussion complies with the timeless-roadmap rule.
**Witness:** Removing “now”, “closed” and “open” leaves all four pull-request references and the proposal-dependent sentence at `:1175`.
**Repair:** Replace lines 234–250 by: “Neither pinned library has an infinite Ramsey theorem, an Erdős–Rado theorem or partition-relation vocabulary; Layer 0 colours increasing tuples of a linear order of every arity and cardinality.” Delete the proposal sentence at lines 1175–1177.

## R07 (P3) — The description still presents merged suppliers as open dependencies

**Location:** Pull-request description, **Series**: “Dependencies: … #1319 on #1315” and “Suggested review order: #1315 and #1317 first, then #1316”.
**Claim:** These sentences describe the dependencies and review order at this head.
**Witness:** Main contains `TauCetiRoadmap/InfinitaryModelExistence/README.md`, `TauCetiRoadmap/BorelEquivalenceRelations/README.md` and `TauCetiRoadmap/CountableModelCounting/README.md`; HanfNumbers consumes main’s InfinitaryModelExistence. CountableStructureSpaces remains open.
**Repair:** Replace the dependency and suggested-order sentences by: “InfinitaryModelExistence, BorelEquivalenceRelations and CountableModelCounting are on main; CountableStructureSpaces is open. This roadmap consumes InfinitaryModelExistence as it is on main and waits for no open pull request. Review focus: template extraction, Layers 2.2–3.4.”

## R08 (P3) — The description incorrectly says Mathlib lacks pigeonhole

**Location:** Pull-request description, **Partition calculus**: “Mathlib has none of these”, following a list that includes pigeonhole for successor cardinals.
**Claim:** The pinned library supplies none of the listed combinatorics.
**Witness:** Mathlib already proves `Cardinal.infinite_pigeonhole_card` (`Mathlib/SetTheory/Cardinal/Pigeonhole.lean:47`) and `Cardinal.isRegular_succ` (`Mathlib/SetTheory/Cardinal/Regular.lean:76`). Setting θ=κ⁺ gives a fibre of size κ⁺ for at most κ colours, for infinite κ.
**Repair:** Replace that sentence by: “Mathlib supplies cardinal pigeonhole and regularity; this roadmap introduces partition-relation vocabulary and develops end-homogeneous sets and the finite-exponent Erdős–Rado theorem.”

## Previous findings

- R01 — repaired: README `:955` now requires relational L for smallness transfer and names the tuple-system bridge; the use in 5.4 is relational.
- R02 — not repaired: all five declarations remain at Lean `:66`, `:76`, `:309`, `:465`, `:474`; carried as R01.
- R03 — not repaired: the same subsections lack claim-level locators; carried as R02.
- R04 — not repaired: five Checks blocks remain, with the same missing cases and named counterpart; carried as R03.
- R05 — not repaired: the twelve backticked API names remain absent from Lean; carried as R04.
- R06 — partly repaired: Lean `:263` and `:273` now state the witness mathematics; the module framing at `:12` remains; carried as R05.
- R07 — partly repaired: “now”, “closed” and “open” are gone; four pull-request references and the proposal sentence remain; carried as R06.
- R08 — not repaired: the description’s Series paragraph still names merged sibling pull requests as dependencies; carried as R07.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result / change |
| --- | --- | --- | --- |
| 5.2 relational potential-isomorphism transfer | Infinite pure sets of sizes ℵ₀ and ℵ₁ | Realized 1-types: 1 = 1; 2-types: 2 = 2; both small | Restriction matches the supplier |
| 3.3 disjunction witness, revised docstring | Arity 0; ψ₀ = ⊥, ψ₁ = ⊤; σ = ⊤ | Disjunction true; adding ψ₀ fails; adding ψ₁ remains approximated at every ℶ_α | One index works uniformly |
| 3.3 conjunction witness, revised docstring | Arity 0; ψ₀ = ⊤, ψ₁ = ⊥; σ = ⊤ | Conjunction false; declaring ψ₀ false fails; declaring ψ₁ false works at every ℶ_α | Dual quantifiers agree |
| 3.3 witness route at positive arity | n = 2, α = 0, countably many colours | ℶ₂ ≥ ℶ₁⁺; homogeneous output ℵ₁ ≥ ℶ₀; one of ℵ₀ indices occurs unboundedly below ω₁ | Existing conditions survive restriction |
| 0.1 order-free relation | (κ, λ, n, μ) = (3, 2, 1, 2); (2, 2, 1, 2) | Tuple and subset forms: true/true, then false/false; largest fibres ≥2, then 1 | API remains padding, R01 |
| 0.1 monotonicity | 3 → (2)¹₂; enlarge source to 4 | A two-colouring has largest fibre ≥2 in both cases | API remains padding, R01 |
| 3.1 attained Hanf number | Sentence “exactly two elements” | Bounds are κ ≥ 3; infimum = 3; bound at 3 true, at 2 false | API remains padding, R01 |
| 5.4 relational smallness iff completeness | Infinite pure set; ordered field ℝ | 1-types: 1 versus 2^ℵ₀; both sides true versus both false | One-exact specialization, R01 |
| 5.5 relational categorical completion | Infinite pure sets, κ = ℵ₁ | Choose σ = φ; model size ℵ₁; completeness true; categoricity true | One-exact specialization, R01 |
| 0.3 end-homogeneous existence | λ = ℵ₀, n = 0, constant pair colouring | Source ℶ₁⁺; initial segment ℵ₁; every pair colour 0 = 0 | Locator absent, R02 |
| Homogeneity | Pair colour (x+y) mod 2 | Evens: 0 = 0; on {0,1,2}: c(0,1)=1 ≠ c(0,2)=0 | Missing Checks, R03 |
| End-homogeneity | Pair colours x mod 2 and y mod 2 | First: same-prefix colours equal; second: c(0,1)=1 ≠ c(0,2)=0 | Missing Checks, R03 |
| Iterated exponential | κ = 2; n = 0,1,2 | Values 2, 4, 16; next value always 2 to the previous power | Missing Checks, R03 |
| 1.1 indiscernibility | Δ = {x₀<x₁}; identity on ℕ; a(n)=(−1)ⁿn in ℤ | Identity: true on every pair; second sequence: true at (0,2), false at (0,1) | Locator and Checks absent |
| 1.2 template and its realization | Singleton index, arity 2; infinite injective index | Singleton: no tuples, ⊥ belongs vacuously; infinite: ⊥ excluded; realization of own template agrees | Locator and Checks absent |
| 1.2 coherence | Injective pure-set sequence indexed by ℕ | x₀=x₁ false; reindex into three positions: false; x₀=x₀ true on both sides | Locator absent, R02 |
| 1.3 disequality and Morley seed | φ = ⊤; injective and constant sequences | Seed truth values (true,true) versus (true,false); constant sequence cannot realize the injective seed | Locator and Checks absent |
| 2.1 Skolem tower and symbols | One binary formula x₀=x₁; countable seed | One unary witness symbol for that formula; each closure stage ≤ℵ₀; ω-stage union ≤ℵ₀ | Locator absent; name undeclared |
| 2.2 EM source | Equality fragment; a(n)=n versus a(n)=n mod 2 | Equality on increasing pairs: always false versus false at (0,1), true at (0,2) | Source true versus false |
| 2.2 Skolem template | Equality-only template; then demand ⊥ true | Finite equality patterns realizable; {⊥} has 0 realizations | Finite satisfiability excludes wrong template |
| 2.3 term model and truth | Empty language, equality template, J = ∅ or ℵ₁ | E = J; equality true exactly on identical indices; sizes 0 and ℵ₁ | Locator absent, R02 |
| 2.3 cardinality and functoriality | Equality template, identity on infinite J | #E = #J ≤ max(ℵ₀,#J); induced map sends j to j | Locator absent, R02 |
| 3.3 approximation predicates | σ = ⊤; both pos and neg contain disequality | At κ=1 no pairs: true; at κ=2 contradiction: false; cofinal approximation false | Missing Checks, R03 |
| 3.1 Hanf predicates and monotonicity | “Exactly two elements”; κ=2,3,4 | Arbitrarily large false; bounds false,true,true; Hanf number 3 | Missing Check and undeclared API |
| 3.4 countable-theory form | Empty theory, κ = ℵ₁ | Conjunction ⊤; a pure set of size ℵ₁ satisfies every sentence in the empty theory | Undeclared API label, R04 |
| 4.1 global bound and infimum | κ=2; sentence “exactly two elements” | Nonempty model of size 2 exists; arbitrarily large false; κ=2 is not a global bound | Locator and Checks absent |
| 4.1 beth global bound | Same sentence; κ = ℶ_ω₁ | 2 < ℶ_ω₁, so triggering model absent; sentence-level bound true | Undeclared API label, R04 |
| 4.1 bounded-spectrum criterion | “Exactly two elements”, maximal size 2 | At κ=2 bound false; its Hanf number 3; global number ≥3 >2 | Undeclared API label, R04 |
| 4.2 ladder satisfaction and model predicate | α=0, V_(ω+1), U₀=V_ω | Six clauses true; ladder sentence true; removing all U₀ elements violates constant clause | Undeclared API labels, R04 |
| 4.2 ladder cardinal bound | Same α=0 model | #U₀=ℵ₀; #U₁=2^ℵ₀=ℶ₁; upper bound attained | Undeclared API label, R04 |
| 4.3 successor-beth lower bound | α=0 ladder | Maximal size ℶ₁; sentence Hanf number ℶ₁⁺; global number ≥ℶ₁⁺ >ℶ₁ | Undeclared API label, R04 |
| 4.3 cofinal beth supremum | α ranges below ω₁ | sup ℶ_(α+1)=ℶ_ω₁; finite-index subfamily gives only ℶ_ω | Undeclared API label, R04 |
| 5.2 smallness | (ℝ,<); ordered field ℝ; (ω₁,<) | Complete 1-types: 1, 2^ℵ₀, ℵ₁; smallness true,false,false | Third Check absent, R03 |
| 5.4 complete sentences | “Exactly one”; “at least one”; ⊥ | Complete true,false,false; second sentence allows ∃x∃y x≠y both true and false | Missing Check, R03 |
| 5.4 countable companion | Infinite pure set of size ℵ₁ | Companion size ℵ₀; 1-types 1=1, 2-types 2=2; finite partial bijections extend both ways | Undeclared API label, R04 |
| 5.4 complete strengthening | Infinite pure set; φ = “at least two” | σ = “infinite”; σ true; φ true in every σ-model | Undeclared API label, R04 |
| Categoricity | Infinite pure sets, κ=ℵ₀; Scott(ℚ,<), κ=ℵ₁ | Pure sets: one isomorphism type; DLOs: countable versus uncountable cofinality give ≥2 types | Checks absent, R03 |
| 5.6 type transfer and headlines | Infinite sets with f=id; κ=ℵ₁ | Graph relation is equality; 1-types 1=1; complete sentence f=id ∧ infinite; size ℵ₁; categoricity true | Own-interface locator absent, R02 |
| Description’s pigeonhole claim | θ=ℵ₁; domain ℵ₁; colours ℵ₀ | cf(ℵ₁)=ℵ₁; ℵ₀<ℵ₁; Mathlib gives fibre ≥ℵ₁, hence exactly ℵ₁ | Correct the description, R08 |

Untouched statements not implicated by these findings stand as in the previous review of `c61d644`.

- Source checks: 3 changed mathematical passages checked against Marker’s proof of Theorem 5.2, pp. 57–58 (marker lines 1914–1928), Definition 6.11 p. 77 (marker lines 2603–2607), and the pinned tuple-system API; seeded §5.2 falls in the diff.
- Pinned declarations opened: `TauCeti/ModelTheory/BackAndForth/Presentation.lean:207`, `Karp.lean:148`, `:176`, and `TauCeti/ModelTheory/ModelExistence/Types.lean:72`, `:95`; Mathlib `SetTheory/Cardinal/Pigeonhole.lean:47` and `Regular.lean:76`. The transfer’s relational hypothesis is explicit.
- Cross-roadmap citations resolved: IME 0.1–0.4, 1.1–1.2, 2.2–2.3, 4.1 and Layer 6 on main; InfinitaryLogic Layers 0–3; BanachSpaceTheory B4.1. No dropped IDs or conflicting roadmap heads in the overlap data.
- Gate rerun: every counter 0, OK; targeted build exits 0; direct elaboration exits 0 with 29 sorry warnings only; 0 changed files outside the folder.
- Dependency-check output: `depcheck: 244 roadmaps, 2197 edges, 0 problem(s)`; no UPWARD or CYCLE.
- Signature/probe check: 51 actual declarations checked with explicit `#check @name`; the supplied scanner’s 52nd name, “in”, is docstring text. No statement changed and no binder repair is needed; both relational one-exact probes pass.

Overlap check: read InfinitaryModelExistence, InfinitaryLogic, CountableModelCounting, CountableStructureSpaces, RandomGraphs and GrothendieckUniverses, including the listed open heads. Types/graph translation belong to IME; back-and-forth belongs to InfinitaryLogic; the von Neumann hierarchy belongs to Mathlib; smallness and Hanf/EM constructions belong to HanfNumbers. No competing ownership of the changed targets.

Source independence: changed passages only; 3 mathematical passages compared with 2 sources (Marker and pinned Tau Ceti), with no copied expression identified. The other edits change editorial wording about Mathlib proposals. Marker has the largest share, 16 of 18 explicit source-attributed citations in the layers. Arrangement comparison was not repeated: no layer was added, removed or reordered.

## Not verifiable

- Source limitations for untouched material remain as in the review of `c61d644`; no newly changed mathematical passage required an unavailable text.
- The description’s external integration-harness claims were not rerun; local build and elaboration were rerun.

## Source issues

- **Misprint** in marker at proof of Theorem 5.2, second claim, printed p. 58: the displayed equivalence ends with the index j_n; it should end with j_m; affects nothing.
- **Error** in marker at Theorem 5.11, printed p. 59: the conclusion permits every cardinal κ; it should require κ infinite; affects a stated result.
- **Misprint** in marker at Theorem 6.12, printed p. 78: the hypothesis names φ while the conclusion names ψ; both should name φ; affects nothing.

## For the human reviewers

- none
