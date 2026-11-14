# Review of RandomGraphs (pull request #1223 at fe9b305)

**Verdict:** needs changes

## R01 (P2) — General formula coding still has no settled ownership

**Location:** `TauCetiRoadmap/RandomGraphs/README.md:1151`: “one interface for a general `L`, owned where it first lands and consumed by the other roadmap”.
**Claim:** This leaves the general development contingent on merge timing while §5.2 and the Lean signatures still build only the graph specialization.
**Witness:** Main's `TauCetiRoadmap/FreeGroupsAndLimitGroups/README.md:672` already owns group-language syntax coding. Here, `Suggested.lean:377` fixes `Language.graph`; a language with a unary function cannot instantiate it.
**Repair:** Make §5.2 a definite general-language extension of FreeGroupsAndLimitGroups §3.1, owned here, with computably decodable symbol families, computable arities and an effective variable presentation. State its coding laws for arbitrary such languages; derive the graph case. Replace the quoted sentence with this ownership decision. Test both the graph language and a language with a unary function; retain the existing group-language development by citation.

## R02 (P2) — The roadmap requires an algorithm implementation

**Location:** `TauCetiRoadmap/RandomGraphs/README.md:550`: “define both maps in Lean and prove these theorems for them”; `:573`: “eliminated by testing which one-point extensions of each pattern are consistent”.
**Claim:** The specification makes implementation of the QE and decision procedures a deliverable, beyond mathematical computability and correctness theorems.
**Witness:** `Suggested.lean:441` and `:458` already express existence of computable maps mathematically; README:551 adds an implementation requirement explicitly excluded by the review's scope contract.
**Repair:** Replace the requirement with: “Prove that computable QE and decision maps exist on the effective coding, with the stated semantic correctness. Finite equality-and-adjacency patterns provide a proof route.” Keep the computability theorems and their examples; remove the requirement to implement the procedures.

## R03 (P2) — The graphon joint-stabilization headline is missing

**Location:** `TauCetiRoadmap/RandomGraphs/README.md:894`: “Derive the finite FO Rado-truth law, uniform rank estimates and arbitrary-coupling almost-sure stabilization for these graphon sample laws.”
**Claim:** The last endpoint is statable at the pins but absent from `Suggested.lean`; its module docstring identifies no missing carrier.
**Witness:** Lean:555,567 require binomial marginals; Lean:701 gives only marginal graphon convergence. For `W=1/4+xy/2`, incident-edge probability is `7/48`, versus `9/64` for independent edges of mean `3/8`.
**Repair:** Add the arbitrary-coupling theorem: for a probability space `(Ξ,ν)`, measurable `X_n` with `ν.map X_n = sampleGraph K n`, and the ε-bounds of Lean:692, assert `∀ᵐ ω, ∀ d, ∀ᶠ n, ∀ φ`, rank ≤ `d+1` implies agreement with Rado truth. This signature elaborates at the pins; ε=`1/4` covers the witness graphon.

## R04 (P3) — Four retained statements are padding

**Location:** `TauCetiRoadmap/RandomGraphs/Suggested.lean:140` `satisfies_iso`; `:214` `radoGraph_adj`; `:728` `bind_infiniteSampleLawOnSpace_satisfies`; `:895` `productGraphon_isolated_expectation`.
**Claim:** These imported-API consequences and the explicit README Check do not belong in the headline acceptance test.
**Witness:** Single `exact` applications close the isomorphism and bind statements. Tau Ceti `Combinatorics/SimpleGraph/ExtensionProperty.lean:98` supplies the adjacency formula. README:1095 calls the expectation “an elementary check”.
**Repair:** Delete these four declarations from `Suggested.lean`. Keep their mathematical statements in the README; the expectation Check gives `0, 1, 3/2, 7/4` at `n=0,1,2,3`.

## R05 (P3) — Three definitions support no headline signature

**Location:** `TauCetiRoadmap/RandomGraphs/Suggested.lean:60` `representativeClass`; `:65` `StrongAmalgamation`; `:177` `Language.Equiv.toSimpleGraphIso`.
**Claim:** The acceptance test retains definitions that no headline statement uses.
**Witness:** Each occurs only at its own declaration in this file. The existence theorem uses native `IsFraisse`, the rooted theorems use native embeddings, and no theorem mentions strong amalgamation.
**Repair:** Delete these three definitions from `Suggested.lean`; keep their definitions, API and Checks in the README. The retained signatures still elaborate without them.

## R06 (P3) — Most declared names are absent from the README

**Location:** `TauCetiRoadmap/RandomGraphs/README.md:693`: “Derive the fixed-… zero–one law”; `TauCetiRoadmap/RandomGraphs/Suggested.lean:529` `firstOrder_zero_one`.
**Claim:** README targets and the acceptance test cannot be matched by declaration name as required.
**Witness:** Of 117 named declarations, 100 names are absent from the README, including `firstOrder_zero_one`, `finiteGraphs`, `isFraisseLimit_radoGraph`, and `poisson_totalVariation_limit_of_factorial_moments`.
**Repair:** After removing padding, name every retained declaration at its mathematical target. For example: “Prove `firstOrder_zero_one`: for `0 < p < 1`, every sentence's probability tends to its Rado truth value.” Keep API-only targets in prose without undeclared Lean names.

## R07 (P3) — The LaTeX gate still fails

**Location:** `TauCetiRoadmap/RandomGraphs/README.md:9`: “For every fixed $`p\in(0,1)`$”; math blocks include :12 and :652.
**Claim:** The file violates the required Unicode/code-span mathematics format.
**Witness:** The worker's gate at this exact head reports `latex=524`, every other category `0`, and `FAIL`.
**Repair:** Replace dollar-delimited expressions with Unicode or plain code spans and math fences with indented formulas. Write `B_d(n,p) = Σ_{t=0}^d Σ_{r=0}^t C(n,t) C(t,r) (1 − p^r(1−p)^(t−r))^(n−t)`. Its values are 1 at `(n,d)=(0,0)` and 0 at `(1,0)`.

## R08 (P3) — Required roadmap structure and definition Checks are missing

**Location:** `TauCetiRoadmap/RandomGraphs/README.md:27` “Scope and dependency order”; `:167` “Milestone 0”; `:476` “Define natural-valued quantifier rank”.
**Claim:** The required Summary, ownership/contracts/build/downstream sections, Layer headings, per-layer Examples/Dependencies, and per-definition API/Check lists are absent.
**Witness:** All twelve main sections are “Milestone” headings. Only four `Checks` paragraphs occur; none is a bulleted per-definition list. `foRank`, the witness count, and the density lack three discriminating Checks each.
**Repair:** Adopt the specified headings and give every definition its API bullets and at least three bulleted Checks. For `foRank`, compute an atom as 0, `∀x∃y Adj(x,y)` as 2, and an implication of ranks 1 and 2 as 2, excluding additive rank. End every layer with Examples and Dependencies.

## R09 (P3) — Several claims still lack local source locators

**Location:** `TauCetiRoadmap/RandomGraphs/README.md:313` “construct such a sequence”; similarly §§3, 5.1, 7.1, 7.2, 9.1 and 11.1; the Erdős–Rényi reference at :1245.
**Claim:** The cited construction, rank and limit theorems have locators only in the final reference list; the Erdős–Rényi entry has none.
**Witness:** §9.1 contains no Cameron locator, although `cameron2013` lines 31–53 give Fact 1 and its interior-p extension. `erdosrenyi1960` line 1139 is Theorem 3a, printed p. 34.
**Repair:** Put each reference-list locator at its claim, explicitly distinguishing the stated generalization from the source theorem. Add “Cameron, Fact 1 and following remark, pp. 1–2” at §9.1. Locate Erdős–Rényi as Theorem 3a, §3, p. 34, noting its fixed-edge model and mean `(2c)^k/(2k)`; §11.2 independently derives the binomial case. Supply printed pages for the book locators after verification.

## R10 (P3) — Declaration docstrings remain incomplete

**Location:** `TauCetiRoadmap/RandomGraphs/Suggested.lean:60`, `:90`, `:157`, `:524`, `:858`; :832 says “This convergence criterion is proved as part of the roadmap.”
**Claim:** Numerous declarations have no mathematical docstring, and the quoted docstring describes process instead of a theorem.
**Witness:** There are 55 declarations, including anonymous instances, without an attached declaration docstring. The Poisson criterion's existing docstring states none of its hypotheses or conclusion.
**Repair:** Add mathematical docstrings to every retained declaration. For :833: “For probability laws on ℕ with finite factorial moments converging to λ^k for every k, every point mass converges to the corresponding Poisson(λ) mass, including λ=0.”

## R11 (P3) — Pull-request identifiers appear in the Lean exposition

**Location:** `TauCetiRoadmap/RandomGraphs/Suggested.lean:241`: “The graph-characterization proposal (mathlib4#20649) and the quantifier-elimination proposal (mathlib4#41113)”.
**Claim:** The acceptance test contains the process references forbidden in roadmap exposition and docstrings.
**Witness:** Both literal pull-request identifiers occur in the module's section commentary, although the gate reports `prnum=0`.
**Repair:** Delete that section commentary. Keep the mathematical declaration docstrings and place external provenance links in the README's references.

## R12 (P3) — The PR validation paragraph describes an earlier head

**Location:** PR description, “Validation”: “only the expected `sorry` warnings (74)” and “the semantic QE corollary … were moved out of the file”.
**Claim:** Both statements contradict this head.
**Witness:** Direct elaboration produces 77 admitted-declaration warnings. `TauCetiRoadmap/RandomGraphs/Suggested.lean:452` contains `radoAxioms_hasQuantifierElimination` with `sorry`.
**Repair:** Replace those claims with: “At fe9b305, Suggested.lean elaborates with 77 sorry warnings. It includes the theory-level quantifier-elimination theorem alongside the computable QE theorem.” Refresh the count after repairs; retain the correct description that this PR adds a new roadmap.

## Verified sound

Previous-finding disposition:

| Previous finding | Head passage | Disposition |
| --- | --- | --- |
| R01 measurability ownership | README:211: “At fixed assignments the graph event belongs to Tau Ceti” | Repaired; CountableStructureSpaces §2 also cites the library pullback. |
| R02 graph-only coding | README:1151: “owned where it first lands” | Partly repaired: effective-presentation caveat is valid; general target/ownership remains R01. |
| R03 EF soundness | README:481: “Finite-round soundness is already in Tau Ceti” | Repaired; the new target is the natural/ordinal rank bridge. |
| R04 padding | Lean:140,214,728,895 retain all four named declarations | Not repaired; R04. |
| R05 name correspondence | README:399: “Give `Language.Equiv.toSimpleGraphIso`” | Partly repaired: qualification and proposal definitions fixed; 100 names still absent, R06. |
| R06 LaTeX | README:9: “For every fixed $`p\in(0,1)`$” | Not repaired; 524 hits, R07. |
| R07 shape | README:167: “Milestone 0 — Native graph and logical probability interfaces” | Not repaired; R08. |
| R08 locators | README:852: “For each finite extension request” without a source locator | Not repaired; R09. |
| R09 docstrings | Lean:832: “This convergence criterion is proved as part of the roadmap.” | Not repaired; R10. |
| R10 singularity vocabulary | Lean:750: `SimpleGraph.binomialRandom ℕ p ⟂ₘ SimpleGraph.binomialRandom ℕ q` | Repaired; separator masses at p=0,q=1 are 1 and 0. |

Headline inventory: Fraïssé existence and rooted comparison; finite-graph Fraïssé identification; completeness, categoricity, QE, decidability, atomicity and primeness; witness laws and uniform error bounds; fixed/varying FO limits and joint stabilization; rooted limits and graph-property asymptotics; infinite Rado and graphon laws, ergodicity, mixtures and singularity; infinitary distinctions; factorial-moment Poisson convergence, sparse triangles and the product-graphon counterexample. All have native signatures except the graphon joint endpoint in R03.

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| 0.1 Graph/language transport | K₂, vertex swap; repeated tuple | Adj(0,1)=true on both; equality(0,0)=true, equality(0,1)=false | consistent | — |
| 0.2 Finite patterns and restriction laws | Two specified edges, one present, one absent; p=1/2 | Pattern mass=1/4=p(1−p); empty pattern=1; p=0,1 give 0 | consistent | — |
| 0.3 Joint realization; measurableSet_realize_jointly | Fin 0; ℕ, existence of an edge | Empty carrier event=∅; ℕ event=union of off-diagonal cylinders; preimage realization agrees | consistent | prior R01 repaired |
| 1 Representative closure; representativeClass | Empty family; two copies of K₁ | Closures=∅ and {K₁ up to iso}; K₂ membership=false | consistent | R05 |
| 1 StrongAmalgamation | Sets of size ≤1; empty root; two singleton extensions | Ordinary amalgam size=1; strong union requires size=2>1 | discriminates AP | R05 |
| 1 Free graph amalgam | Two edges sharing one root | Union has 3 vertices, 2 edges; new-new adjacency=false; image intersection=1 root | consistent | — |
| 1 Countable representatives and factorization | Finite sets, representatives Fin n | Size-2 structure maps to Fin 2; duplicate representative changes neither membership nor age | consistent | — |
| 2.1 Chains, factorization and extension requests | Fin 0⊂Fin 1⊂…; two-point embedding | Limit=ℕ; image {0,1} factors at stage 2; both composites send i↦i | consistent | — |
| 2.2 exists_isFraisseLimit_of_isFraisse | Empty language, classes size ≤0 and ≤2 | Limits have 0 and 2 elements; ages are exactly size ≤0 and ≤2 | consistent | — |
| 2.2 Function symbols and countability | ℤ with successor/predecessor, generator 0 | Generated carrier=ℤ, infinite; words form a countable set; relations add no generated elements | consistent | — |
| 3 exists_embedding_comp_eq_of_isExtensionPair | Root A=M finite, aM=id | Equation forces e=aN; e∘id=aN on every root element | consistent | — |
| 3 exists_equiv_comp_eq_of_isExtensionPair | ℚ,<; root 0↦0, 1↦2 | e(x)=2x is an order isomorphism; e(0)=0, e(1)=2 | consistent | — |
| Satisfies | Existence of an edge on K₂ and K̄₂ | Truth=true and false; native graph structures give the same values | consistent | — |
| SatisfiesFormula | Adj(x₀,x₁), K₂; tuples (0,1),(0,0) | Realizations=true,false; repetition forces the diagonal value false | consistent | — |
| foRank | Atom; ∀x∃y Adj; implication of ranks 1,2 | Ranks=0,2,2; recursive maximum agrees, additive convention gives 3 | consistent | — |
| foRank_eq_zero_iff_isQF | Atom; one universal quantifier | (rank=0,IsQF)=(true,true),(false,false) | consistent | — |
| satisfies_iso | K₂ vertex swap | Existence-of-edge truth=true↔true; one exact library transport closes the theorem | one-term proof | R04 |
| sentenceProbability | ∃edge; n=0,1,2 | Probabilities=0,0,p; p=0,1 at n=2 gives 0,1 | consistent | — |
| binomialRandom_map_comap | Fin 2 injection into Fin 3 | Restricted edge mass=p on both sides; p=0 gives the empty graph | consistent | — |
| 4.1 IsExtensionWitness | K₁; empty request and negative singleton | Empty-request witness exists; negative singleton has no fresh witness | consistent | — |
| 4.1 HasExtensionUpTo | Fin 0,K₁,C₄; budgets 0,1,2 | Fin0: false at 0; K₁: true,false; C₄: true at 1,false at 2 | consistent | — |
| hasExtensionProperty_iff | Rado; K₁ | Full/all-budgets=true/true for Rado; false/false for K₁, failing at d=1 | consistent | — |
| HasExtensionProperty.infinite | Hypothetical finite carrier; U=∅,Z=univ | Fresh-witness set=∅; full-extension hypothesis would require its cardinality ≥1 | consistent | — |
| Language.Equiv.toSimpleGraphIso | Identity and swap on K₂ | Both preserve true off-diagonal adjacency and false diagonal adjacency | consistent | R05 |
| extensionSentence | K₁; (r,s)=(0,0),(1,0),(0,1) | Truth values=true,false,false; witness inequality excludes recycling the negative vertex | consistent | — |
| satisfies_extensionSentence | K₁ and Fin 0; E₀,₀ | Sentence/finite-request values=true/true and false/false | consistent | — |
| radoAxioms | Rado; countable edgeless graph | Simple-graph axioms hold in both; E₁,₀=true in Rado,false in the edgeless graph | consistent | — |
| model_radoAxioms_iff | Rado; K₁ | Model/full-extension values=true/true and false/false | consistent | — |
| 4.2 Existence and identification; radoGraph_adj | Pairs (0,1),(0,2),(1,3),(1,1) | Ordered and symmetric formulas both give true,false,true,false | consistent | R04 |
| exists_graphEmbedding_over_root | Empty root; an edge prescribed as (0,1) in Rado | Empty-root equation has 0 constraints; rooted edge has preserved adjacency=true | consistent | — |
| finiteGraphs | Fin0,K₂,reflexive singleton,Rado | Membership=true,true,false,false; excluded conditions are looplessness and finiteness | consistent | — |
| isFraisse_finiteGraphs | Two rooted edges | Free amalgam has 3 vertices and 2 edges, with both induced copies retained | consistent | — |
| isFraisseLimit_radoGraph | K₂ and K̄₂ | Induced copies on {0,1} and {0,2}; respective edge counts=1,0 | consistent | — |
| Language.graph.ExtensionProperty | K₁; Rado | K₁ fails the positive singleton; Rado request U={0},Z={1} has witness 5 | consistent | — |
| Language.graph.ExtensionProperty.embedding_from_countable | Empty source; K₂ into Rado | Unique empty map; 0↦0,1↦1 preserves the one edge | consistent | — |
| Language.graph.ExtensionProperty.isFraisseLimit_finite_graphs | Rado; finite K₁ negative control | Rado age contains every finite graph; K₁ lacks K₂ and fails the premise | consistent | — |
| Language.Theory.IsQFEquivalent | Rado theory; ∃y Adj(x,y) | Equivalent formula=⊤; both evaluate true at every vertex | consistent | — |
| Language.Theory.HasQuantifierElimination | Rado; theory of all simple graphs | Rado has QE; all-graph theory fails: K₁ and K₂ have identical singleton atoms but different neighbor existence | consistent | — |
| radoAxioms_isComplete | Existence of a triangle; existence of a loop | Triangle entailed=true; loop entailed=false and negation entailed=true | consistent | — |
| radoAxioms_aleph0_categorical | Rado and its complement | Both have extension witnesses; number of countable isomorphism classes=1 | consistent | — |
| radoAxioms_models_iff | Triangle and loop sentences | Consequence/Rado truth=true/true and false/false | consistent | — |
| nonempty_elementaryEmbedding_radoGraph | Target Rado itself | Identity embedding exists; every formula has identical realization | consistent | — |
| exists_elementaryEmbedding_radoGraph_comp_eq | Repeated root a=(0,0), b=(v,v) | Equality matrix is all true; e(0)=v meets both root equations | consistent | — |
| 5.1 satisfies_iff_of_extension | d=0; K₁ and K₂ | Rank-1 nonemptiness=true/true; rank-2 neighbor sentence=false/true, outside the bound | consistent | — |
| formula_iff_of_extension | m=2,q=1; common-neighbor query | Fresh request has size 2=m+q−1; truth=true on both EP≤2 graphs | consistent | — |
| radoAxiomsUpTo | d=0,1 | d=0 adds E₀,₀; d=1 also adds E₁,₀ and E₀,₁; K₁ models only the first | consistent | — |
| 5.3 radoAxiomsUpTo_models_iff | ∀x∃y Adj, rank 2; d=1 | Finite consequence=true=Rado truth; d=0 countermodel K₁ lies outside the rank bound | consistent | — |
| Graph function-symbol instances | Σ n, graph.Functions n | Carrier cardinality=0; no function code can represent a symbol | consistent | — |
| graphRelationsEquiv; graph relation instances | Unique adjacency symbol | Σ n,Relations n has cardinality 1; adj↔(); arity=2 on decoding | consistent | — |
| GraphAlphabet | Graph term and relation branches | Terms are variables; relation branch has 1 symbol; constructor tags occupy the ℕ branch | consistent | — |
| boundedCode | Same variable index in Fin 1 and Fin 2 | Encodable code of inl 0 is 0 in both contexts; formula code is context-size independent | consistent | — |
| boundedDecode | A valid formula code; valid prefix with trailing symbol | Valid code returns some φ; trailing-symbol code returns none after unequal re-encoding | consistent | — |
| boundedDecode_boundedCode | ⊥ and an implication | Decoded code=some original formula in both cases; round-trip is proved in the file | consistent | — |
| boundedDecode_eq_some_iff | c=code φ; c≠code φ | Two sides=true/true and false/false by the re-encoding filter | consistent | — |
| computable_boundedCode_constructors | Variables 0,1; implication | Variable codes=0,2; implication encoding prefixes constructor tag and both subformula encodings | graph instance only | R01 |
| computable_boundedCode_cases | Falsum,equality,adjacency,implication,all | Specified tags=0,1,2,3,4; implication children recover their original codes | graph instance only | R01 |
| exists_computable_quantifierElimination | ∃y Adj(x,y); ∃x Adj(x,x) | Outputs can be ⊤ and ⊥; semantic values=true and false | mathematical theorem consistent | R02 |
| radoAxioms_hasQuantifierElimination | Neighbor-existence formula | Quantifier-free equivalent=⊤; truth agrees at every assignment | present | R12 description |
| exists_computable_decide_rado | Triangle; loop | Correct Boolean outputs=true,false | mathematical theorem consistent | R02 |
| radoTruth | Triangle; loop | Indicator values=1,0 | consistent | — |
| typesWith_firstOrderAtomicDiagram_eq_singleton | Rado tuples (0,0),(0,1),(0,2) | Three distinct diagrams; each typesWith set has cardinality 1, with different complete types | consistent | — |
| witnessProbability | p=1/2; r=s=1; r=s=0 | Probabilities=1/4 and 1; p=0,r=1 gives 0 | consistent | — |
| witnessCount | Two candidates; empty candidate set | Possible counts=0,1,2; empty candidate count=0 | consistent | — |
| witnessCount_mass | p=1/2,r=s=1,two candidates; j=0,1,2,3 | Masses=9/16,6/16,1/16,0; binomial expression gives the same values | consistent | — |
| no_witness_mass | Same request; two candidates; no candidates | Mass=9/16=(1−1/4)²; empty candidate mass=1=(1−1/4)^0 | consistent | — |
| extensionError | p=1/2; (n,d)=(0,0),(1,0),(3,1),(4,2) | B values=1,0,3/2,29/2; natural-subtraction terms beyond n vanish by choose=0 | consistent | — |
| extension_failure_le | Enumerated all graphs; (n,d)=(0,0),(3,1),(4,1) | Failure/B=1/1,1/(3/2),(23/32)/1; all inequalities hold | consistent | — |
| extensionError_le_exp | p=1/2,d=1,n=4; d=0,n=1 | B=1 ≤16e^(−3/2)≈3.5701; B₀=0≤e^(−1) | consistent | — |
| summable_extensionError | p=1/2; d=0,1 | B₀ sequence=1,0,…; B₁(n)=2n·2^(1−n) for n≥1, hence finite sum | consistent | — |
| sentenceProbability_error | ∃x x=x; (n,d)=(0,0),(1,0) | Absolute error/bound=1/1 and 0/0; the latter is an inequality, not division | consistent | — |
| firstOrder_zero_one | ∃edge; interior p and excluded endpoint p=0 | 1−(1−p)^C(n,2)→1; endpoint p=0 gives 0, differing from Rado truth | consistent | — |
| 7.2 firstOrder_limit_varying_bounded_rank | d=1,p_n=2log(n+2)/n eventually | Growth=log(n+2)−2log(n+2)/n→∞; rank-2 limit equals Rado truth | consistent | — |
| firstOrder_limit_varying | Alternating p=1/3,2/3; eventually p=1/log(n+2) | δ=1/3 or 1/log(n+2); n^aδ→∞ for each a>0 | consistent | — |
| 7.3 ae_eventually_all_bounded_rank | Nested windows, p=1/2,d=1 | Failure sum ≤ finite prefix+Σ2n·2^(1−n)<∞; exceptional limsup measure=0 | consistent | — |
| ae_eventually_all_bounded_rank_varying | Alternating p=1/3,2/3 | δ=1/3; failure bound O(n^d e^(−n/3^d)); limsup measure=0 | consistent | — |
| firstVertices | m=2,n=1; m=0 | Images={0,1}⊂Fin3; empty root image=∅ | consistent | — |
| rootEvent | m=2,H=K₂ or K̄₂ | Event probabilities=p and 1−p; m=0 gives 1 | consistent | — |
| rootedProbability | p=1/2; H=K₂; adjacency query | Numerator=1/2, denominator=1/2, quotient=1; incompatible endpoint denominator=0 is excluded in limits | consistent | — |
| rootEvent_pos | m=2; p=1/3 | Root masses=1/3 and 2/3>0; complete-root mass at p=0 is 0, excluded | consistent | — |
| rootedTruth | Adjacency query; Rado roots (0,1),(0,2) | Indicators=1,0 | consistent | — |
| rooted_firstOrder_limit | Adjacency query conditioned on two-vertex roots | Limits=1 for K₂ and 0 for K̄₂, matching rooted Rado truth | consistent | — |
| firstOrder_limit_firstVertices | m=2, adjacency; m=0 | Mixture=p·1+(1−p)·0=p; m=0 has one root of weight 1 | consistent | — |
| 8.2 tendsto_binomialRandom_nonempty_embedding | F=Fin0; F=K₂ | Empty-copy probability=1; K₂-copy probability=1−(1−p)^C(n,2)→1 | consistent | — |
| tendsto_binomialRandom_not_cliqueFree | k=0,1,2 | k=0 event always true; k=1 true for n≥1; k=2 requests an edge and nonedge | consistent | — |
| tendsto_binomialRandom_le_degree | k=0,1; EP≤1 | k=0 event mass=1; EP≤1 gives degree and complement-degree ≥1 | consistent | — |
| tendsto_binomialRandom_diam_eq_two | EP≤2; finite complete graph negative control | Common-neighbor distances≤2 and a nonedge gives distance=2; complete graph diameter=1 and fails EP≤1 | consistent | — |
| tendsto_binomialRandom_isVertexConnected | k=0,1; deleting fewer than k vertices | k=0 size condition n≥1; k=1 deletion count=0; EP≤2 gives paths of length≤2 | consistent | — |
| 9.1 ae_isomorphic_rado | p=1/3,U={0},Z={1} | Candidate success=2/9; no-witness probability=(7/9)^N→0; endpoint p=0 fails positive requests | consistent | — |
| infiniteSampleLaw_const | K≡0,1,1/2 | Single-edge masses=0,1,1/2 on both laws; n=0 cylinder mass=1 | consistent | — |
| 9.2 infiniteSampleLaw_ae_rado | K(x,y)=xy; K≡0 negative control | For root x>0, positive-request success=x/2>0; K≡0 gives 0 and violates hypothesis | consistent | — |
| graphon_extension_failure_le | ε=1/2,d=0,n=0,1; d=1,n=4 | Failure/bound=1/1,0/0; for constant half graphon, 23/32≤1 | consistent | — |
| graphon_firstOrder_limit | Uniformly bounded W; neighbor-existence sentence | Each finite fixed request succeeds eventually with probability→1; sentence limit=1=Rado truth | consistent | — |
| 9.2 Graphon joint stabilization | W=1/4+xy/2, ε=1/4 | Edge mass=3/8; incident pair mass=7/48≠9/64; exponential failure sums are finite | signature elaborates | R03 |
| infiniteSampleLaw_zero_one_of_invariant | Existence-of-edge event; K≡0,1 | Event masses=0,1; finite relabelings preserve both events | consistent | — |
| infiniteSampleLaw_sentence_zero_one | Same graphons and sentence | Disjunction is (0=0) or (1=1); half/half mixture instead has mass 1/2 | consistent | — |
| bind_infiniteSampleLawOnSpace_satisfies | Half empty/half complete mixing law | Both sides=1/2; single exact bind_apply closes the theorem | one-term proof | R04 |
| windowEdgeDensity | Empty/complete graphs; n=0,1,2 | Values=0,0,0 for empty; 0,0,1 for complete; denominator at n=0,1 is 0 | consistent | — |
| ae_windowEdgeDensity | p=0,1 | Almost-sure density limits=0,1; complete graph n≥2 gives 2C(n,2)/(n(n−1))=1 | consistent | — |
| binomialRandom_mutuallySingular | p=0,q=1; S={density→0} | S masses=1,0; S-complement masses=0,1, supplying native mutual singularity | consistent | — |
| SatisfiesInf | Embedded triangle sentence on K₃ and K₂ | Infinitary/native truth=true/true and false/false | consistent | — |
| radoSentenceInf | Rado and finite K₁ | Countable conjunction=true in Rado; K₁ fails E₁,₀, hence false | consistent | — |
| satisfiesInf_radoSentenceInf_iff | Rado and K₁ | Sentence/extension=true/true and false/false | consistent | — |
| binomialRandom_radoSentenceInf | p=1/2 on ℕ | Mass=1=claimed value; all requests have null failure events | consistent | — |
| binomialRandom_radoSentenceInf_of_finite | Fin0,Fin1; p=0,1 | All four event masses=0; a finite carrier has no witness outside itself | consistent | — |
| cardEq | m=0,1 on Fin0,Fin1 | Truth matrix=(true,false; false,true), matching cardinal equality | consistent | — |
| evenSentenceInf | Fin0,Fin1,Fin2; ℕ | Truth=true,false,true,false | consistent | — |
| binomialRandom_evenSentenceInf | n=0,1,2,3; any p | Masses=1,0,1,0=parity indicators | consistent | — |
| not_tendsto_binomialRandom_evenSentenceInf | Even and odd subsequences | Subsequence limits=1 and 0; no common real limit | consistent | — |
| triangleSentence | K₂,K₃; rank | Truth=false,true; three existential quantifiers give rank=3 | consistent | — |
| noIsolatedSentence | Fin0,K₁,K₂ | Truth=true,false,true; quantifier rank=2 | consistent | — |
| triangleCount | K₂,K₃,K₄ | Unordered counts=0,1,4; ordered embeddings would give 0,6,24 | consistent | — |
| isolatedCount | Fin0,K₁,K₂,edgeless Fin2 | Counts=0,1,0,2 | consistent | — |
| satisfies_triangleSentence | K₂,K₃ | Truth/positive count=false/false and true/true | consistent | — |
| satisfies_noIsolatedSentence | Fin0,K₁,K₂ | Truth/count-zero=true/true,false/false,true/true | consistent | — |
| 11.1 poisson_pointMass_limit_of_factorial_moments | λ=0; Bin(n,λ/n) eventually | Moments=(n)_k(λ/n)^k→λ^k; λ=0 masses=1 at 0,0 elsewhere | consistent | — |
| poisson_totalVariation_limit_of_factorial_moments | Constant Poisson(λ); Bernoulli(1/n),λ=0 | TV=0 for identical laws; Bernoulli-to-δ₀ TV=(1/2)(1/n+1/n)=1/n→0 | consistent | — |
| triangle_factorialMoment_limit | k=0,1,2; np_n→c | Moment 0=1; first→c³/6; disjoint pairs→(c³/6)²; overlap excess e−v≥1 | consistent | — |
| 11.2 Overlap counting | Two triangles sharing an edge or a vertex | (v,e)=(4,5),(5,6); e−v=1 in each; 20 ordered disjoint pairs at n=6 | consistent | — |
| triangle_poisson_mass_limit | c=0; j=0,1 | Limits=1,0; Poisson(0) has the same masses | consistent | — |
| sparse_triangle_sentence_limit | c=0,1 | Limits=0 and 1−e^(−1/6)≈0.153518; both match complement of Poisson zero mass | consistent | — |
| productGraphon | (x,y)=(0,1),(1,1),(1/2,1/2) | Values=0,1,1/4; swapping coordinates preserves them; boundary exceptions have measure 0 | consistent | — |
| 11.3 Exact isolated factorial moments | k=0; k=2,n=2 | Both sides=1 at k=0; k=2,n=2 gives 2∫(1−xy)=3/2 | consistent | — |
| 11.3 Rescaling bound and domination | k=2,x=(1,1); general k≥1 | Inner integral=1/3≤1/2; limit integral=2^k; dominator integral=(4k)^k<∞ | consistent | — |
| productGraphon_isolated_expectation | n=0,1,2,3 | Both sides=0,1,3/2,7/4 | README Check | R04 |
| productGraphon_isolated_factorialMoment_limit | k=0,1,2 | Limits=1,2,4=2^k; first moment 2(1−2^(−n))→2 | consistent | — |
| productGraphon_isolated_poisson_mass_limit | j=0,1 | Limits=e^(−2),2e^(−2), matching Poisson(2) | consistent | — |
| productGraphon_noIsolated_limit | n=0,1,2; limiting probability | Finite values=1,0,1/4; limit=e^(−2)≈0.135335, distinct from infinite truth 1 | consistent | — |
| productGraphon_ae_isomorphic_rado | One positive root x∈(0,1) | Witness success=x/2>0; infinite failure limit=0; Rado-class mass=1 | consistent | — |

- Sources: 14 mathematical locators read directly: `cameron2013` lines 26,31,32,110,235,292,309,342,395; `fagin1976` lines 74,97,125,140; `erdosrenyi1960` line 1139. All 15 seeded sections inspected; four also cite unavailable book material (§§2.2,5.1,7.2,11.1).
- Provenance: 10 linked formalization files fetched legally; representative closure, general existence and rooted signatures compared at `cmtrepresentativeage` line 34, `cmtfraisseexistence` line 286, `cmtrootedextension` lines 72,81. No manifest edited.
- Pinned Mathlib declarations opened: 16, including `Mathlib/ModelTheory/Fraisse.lean:117,202,279`, `Mathlib/ModelTheory/DirectLimit.lean:317`, `Mathlib/ModelTheory/PartialEquiv.lean:476,499`, `Mathlib/ModelTheory/Semantics.lean:1015`, `Mathlib/ModelTheory/Order.lean:524,532`, `Mathlib/ModelTheory/Types.lean:68,187`, `Probability/Combinatorics/BinomialRandomGraph/Defs.lean:50,91`, `MeasureTheory/OuterMeasure/BorelCantelli.lean:62`, `Mathlib/MeasureTheory/Measure/GiryMonad.lean:242`, `Mathlib/MeasureTheory/Measure/MutuallySingular.lean:41`.
- Pinned Tau Ceti interfaces opened: 18, including `TauCeti/ModelTheory/RelationalConfiguration/ModelsOf.lean:133`, `Combinatorics/SimpleGraph/RelationalConfiguration.lean:250`, `ExtensionProperty.lean:51,93,98`, `ModelTheory/BackAndForth/Graph.lean:40,62`, `Game/Finite.lean:77`, `Karp.lean:217`, `Infinitary/QuantifierRank.lean:208`, `Scott/AtomicDiagram.lean:67`, `Combinatorics/DenseGraphLimits/Sampling/Infinite.lean:287`, `Sampling/AlmostSure/Basic.lean:62`, `ExchangeableGraphLaw/Relational/Ergodic.lean:116`, `Infinite/Sampling.lean:138`, `Infinite/Mixture.lean:81,90`, `Combinatorics/SimpleGraph/Connectivity/VertexConnectivity.lean:217`.
- Supplier audit: 6 named roadmap interfaces resolved on main (InfinitaryLogic, DenseGraphLimits, Exchangeability, GraphConnectivityAndFlows, StandardDistributions, FreeGroupsAndLimitGroups); 0 overlap-tool conflicts/dropped ids; 0 relevant board-package competitors. Dependency output: `depcheck: 244 roadmaps, 2197 edges, 0 problem(s)`; no UPWARD or CYCLE.
- Worker gate: `latex=524`, all other categories `0`, `FAIL`; targeted build passes. Independent direct elaboration: 0 errors, 77 `sorry` warnings; all 117 `#check @name` signatures elaborate; all 6 flagged probability binders retained, no signature changes.
- Padding probe: 77 admitted theorems tested; 2 close with one `exact`, 75 survive `simp`, `rfl`, `infer_instance`. The missing graphon-joint signature also elaborates. Exhaustive graphs through n=4 verify the displayed failure probabilities.
- Head/scope: `fe9b305aa8cd66bb9d44f1f7c143f79a4f0a0aab`; 0 changes outside the folder, 0 tracked edits made during review; the roadmap is new, not a second copy on main.

Overlap check: read CountableStructureSpaces, HanfNumbers, InfinitaryModelExistence, CountableModelCounting, CertifiedPermutationComputation, InfinitaryLogic, DenseGraphLimits and ComputabilityTheory, plus FreeGroupsAndLimitGroups. Shared ownership: graph-event measurability is Tau Ceti's; Rado/EF/infinitary syntax is InfinitaryLogic/Tau Ceti's; graphon samplers and law representation are DenseGraphLimits'; group-language coding is FreeGroupsAndLimitGroups', with the general extension unresolved in R01. No shared target with the other five closest roadmaps. The discrete Poisson criterion differs from PointProcesses' uniform-exponential-moment criterion and the pin's compact-limit moment theorem.

Source independence: 22 passage comparisons across 6 source texts, including five further passages from §§1,3,5,6 and a Lean docstring; no non-mathematical wording or example-list reuse found. Largest share: cameron2013, 14 of 39 mathematical locators (ranges expanded, duplicates within each citation paragraph counted once). Cameron's §§1.1–1.10 were compared with the roadmap's layers: no consecutive scope/order mapping. Dependencies 1→2→3, 4→5 and 5–6→7 force those orders; graphon and Poisson branches have independent mathematical purposes. The three unavailable books' wording was not compared.

## Not verifiable

- Spencer (2001), Theorems 0.1.2,0.1.5,2.2.3,2.3.1–2.3.2,9.1.3–9.1.4, Definition 2.3 and §1.3: sources service classified DOI 10.1007/978-3-662-04538-1 as paywalled/uncertified; no text read.
- Bollobás (2001), Theorems 1.21–1.22,4.1 and Corollary 4.9: sources service reached only the Cambridge publisher landing page; no legal open text found.
- Hodges (1993), §7.1, Theorems 7.1.2,7.1.7, Lemmas 7.1.3–7.1.6 and (1.8), pp. 326–329: sources service reached only the Cambridge publisher landing page; no legal open text found.

## Source issues

- **Gap** in cameron2013 at §1.1, property (∗), printed p. 1: the source says the extension witness is automatically distinct from every negative vertex; it should justify freshness or include it in the defining request; affects the proof.
- **Gap** in cameron2013 at Proposition 11, printed p. 9: the source gives extension axioms without inequality to the negative vertices; it should add those inequalities or prove the full scheme implies fresh witnesses; affects the proof.
- **Error** in cameron2013 at Theorem 3(a), printed p. 8: the source characterizes ages by closure, countability and amalgamation alone; it should also require a nonempty class, since the empty class satisfies the listed conditions; affects a stated result.

## For the human reviewers

- **Not tested:** Spencer, Bollobás and Hodges were unavailable; their wording and contents could not be compared. Cameron, the largest locator source, was readable and its section arrangement was checked.
- **Licence:** `Suggested.lean:60,73,84,90` closely follows the cited computable-model-theory signatures (`ComputableModelTheory/ModelTheory/RepresentativeAge.lean`, `ComputableModelTheory/ModelTheory/FraisseExistence.lean`, `ComputableModelTheory/ModelTheory/RootedExtension.lean`). Their headers declare Apache-2.0; assess attribution/reuse under the project's licence. Source locators: cmtrepresentativeage line 34, cmtfraisseexistence line 286, cmtrootedextension lines 72,81.
