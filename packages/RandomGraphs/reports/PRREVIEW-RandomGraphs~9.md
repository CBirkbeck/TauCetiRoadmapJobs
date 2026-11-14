# Review of RandomGraphs (pull request #1223 at 3a5d950)

**Verdict:** needs changes

## R01 (P1) — Whole-stage requests can be served vacuously

**Location:** `TauCetiRoadmap/RandomGraphs/README.md:376`: “Prove the direct-limit finite-extension property, ultrahomogeneity and exact age from them.”
**Claim:** The criterion states coverage and served requests, but never requires the stages to belong to the representative class. Those two properties alone do not imply ultrahomogeneity.
**Witness:** Take the constant identity chain Dᵢ = R ⊔ K₁ and the class of finite graphs. Coverage holds; every request Dᵢ ↪ B is impossible. The limit has isolated and nonisolated vertices, so is not ultrahomogeneous.
**Repair:** Write: “Let K be an isomorphism-closed class of finitely generated structures with HP and AP. Let every stage Dᵢ belong to K. Coverage of K and service of every whole-stage request imply exact age K and ultrahomogeneity.” The excluded chain has Dᵢ ∉ K. Add it as a negative Check; `cmt-ExtensionRichDirectLimit` lines 133–170 carry precisely the missing stage-membership hypotheses.

## R02 (P2) — The specification still requires algorithm implementation

**Location:** `TauCetiRoadmap/RandomGraphs/README.md:713`: “A computability proof needs an explicit witness: define both maps in Lean and prove these theorems for them.”
**Claim:** This makes implementation of QE and decision procedures a deliverable, although the review contract allows their mathematical computability and correctness theorems only.
**Witness:** `TauCetiRoadmap/RandomGraphs/Suggested.lean:503,520` already state existence of computable maps. The additional implementation requirement survives previous R02 verbatim.
**Repair:** Replace the requirement with: “Prove that computable QE and decision maps exist on the effective coding, with the stated semantic correctness. Finite equality-and-adjacency patterns provide a proof route.” Keep the mathematical coding and computability assertions; remove the prescribed executable procedure. The triangle and loop sentences still have decision values true and false.

## R03 (P2) — Embedding countability is already supplied by Mathlib

**Location:** `TauCetiRoadmap/RandomGraphs/README.md:387`: “Prove the required countability of embedding sets from finite generation and the countability of the target carrier.”
**Claim:** This replans an existing theorem with exactly the stated generality.
**Witness:** Pinned `Mathlib/ModelTheory/FinitelyGenerated.lean:241` states `FirstOrder.Language.Structure.FG.countable_embedding`: for a finitely generated source and countable target, the language-embedding type is countable, without counting relation symbols.
**Repair:** Delete this proof target and add `FirstOrder.Language.Structure.FG.countable_embedding` to the Mathlib supplier contract and §2.2 Needs. Write: “Use that theorem to enumerate outgoing embeddings.” For successor/predecessor on ℤ, the embeddings are translations, indexed by the image of 0 in ℤ.

## R04 (P2) — Fixed-assignment graph events have two owners

**Location:** `TauCetiRoadmap/RandomGraphs/README.md:225`: “From it, prove the fixed-assignment graph event (`measurableSet_setOf_realize_graph`).”
**Claim:** The new dependency imports only decoding, while planning the fixed-assignment graph-event consequence that its supplier also owns.
**Witness:** Pull request #1316, `TauCetiRoadmap/CountableStructureSpaces/README.md:440–446`, owns graph-event measurability and explicitly includes the same pullback at fixed assignments. Its preceding contract covers countable carriers without a countable-language hypothesis.
**Repair:** Consume CountableStructureSpaces Layer 2 for fixed-assignment graph events, specializing infinitary formulas through `BoundedFormula.realize_toInf`; remove the duplicate theorem from Suggested.lean. Keep joint measurability as this roadmap’s additional target. For Adj(0,1) on ℕ, both proposed fixed-assignment results give the same measurable edge cylinder, of binomial probability p.

## R05 (P2) — The finite-model endpoint is missing from the acceptance test

**Location:** `TauCetiRoadmap/RandomGraphs/README.md:959`: “every sentence true in R has finite models of every sufficiently large cardinality.”
**Claim:** This finite-consequence endpoint is statable at the pins but absent from Suggested.lean and its module docstring.
**Witness:** `TauCetiRoadmap/RandomGraphs/Suggested.lean:351` concerns entailment by bounded axioms, not finite models. The signature with conclusion `∀ᶠ n in atTop, ∃ G : SimpleGraph (Fin n), Satisfies G φ` elaborates at these pins.
**Repair:** Add that headline theorem with hypotheses `φ : Language.graph.Sentence` and `Satisfies TauCeti.radoGraph φ`, followed by `sorry`. For “every vertex has a neighbour”, Kₙ supplies the models for n ≥ 2; K₁ fails, so an eventual size quantifier is necessary.

## R06 (P3) — Boundary and semantic API statements remain in the headline file

**Location:** `TauCetiRoadmap/RandomGraphs/Suggested.lean:124,960,966`: `foRank_eq_zero_iff_isQF`, `satisfies_triangleSentence`, `satisfies_noIsolatedSentence`.
**Claim:** These are a rank-zero boundary characterization and two elementary syntax/count adapters, rather than headline theorems; the latter two mirror the README Checks.
**Witness:** `TauCetiRoadmap/RandomGraphs/README.md:1474–1485` checks exactly the triangle/positive-count and no-isolated/zero-count equivalences; `:652–654` lists the rank-zero statement as constructor API.
**Repair:** Delete these three declarations from `Suggested.lean`; retain their statements as README API/Checks, without undeclared backticked local names. The retained limit signatures use their definitions, not these declarations. On K₂/K₃, triangle truth/count-positivity is false/true; on Fin 0/K₁/K₂, no-isolated truth/count-zero is true/false/true.

## R07 (P3) — Definition APIs and discriminating Checks are still incomplete

**Location:** `TauCetiRoadmap/RandomGraphs/README.md:370–379`: extension requests and the sequence extension property; `:270,549,652,927`: prose “API” paragraphs.
**Claim:** The sequence definitions lack three discriminating Checks, and the definition APIs are still prose summaries instead of the required per-definition factual bullet lists.
**Witness:** Layer 2 has three general examples but no Checks for serving a request. Its Fin 0 ⊂ Fin 1 ⊂ … example checks factorization only. Several other definitions, including firstVertices and productGraphon, have no API list.
**Repair:** Give each definition its API bullets and three discriminating Checks. For sequence extension: the growing finite-set chain serves f(0)=1 into Fin 2 using g(1)=0,g(0)=1; a constant Fin 0 chain cannot serve Fin 0 ↪ Fin 1; a constant Fin 2 chain serves requests in sets of size ≤2 but fails coverage of Fin 3. Separate factorization Checks from these.

## R08 (P3) — Lean layers are not arranged in README order

**Location:** `TauCetiRoadmap/RandomGraphs/Suggested.lean:54,94`: “General Fraïssé and rooted interfaces (Layers 1–3)” precedes “Native realization and finite rank (Layers 0, 5)”.
**Claim:** The acceptance file does not use the required Layer k section comments in README order; later blocks also combine earlier and later layers.
**Witness:** The observed opening layer sequence is 1–3, then 0 and 5, then 4, then 5. The README sequence is 0,1,2,3,4,5.
**Repair:** Order the retained declarations by their README layers and use `/-! ## Layer k: <mathematical title> -/` comments. Put native realization in Layer 0, Fraïssé/rooted results in Layers 2–3, extension syntax in Layer 4, and rank/coding/theory in Layer 5; keep graph-property and Poisson blocks in Layers 8 and 11 respectively.

## R09 (P3) — The validation paragraph still contradicts this head

**Location:** PR description, Validation: “only the expected `sorry` warnings (77)” and “the semantic QE corollary … were moved out of the file”.
**Claim:** The count and the claimed removal are both false at the reviewed head.
**Witness:** Direct elaboration gives 75 sorry warnings and no errors. `TauCetiRoadmap/RandomGraphs/Suggested.lean:514` still declares `radoAxioms_hasQuantifierElimination` with `sorry`.
**Repair:** Write: “At 3a5d950, Suggested.lean elaborates with 75 sorry warnings and no errors. It includes the theory-level QE theorem alongside computable QE.” Refresh the count after subsequent repairs.

## R10 (P3) — The description omits the new roadmap supplier

**Location:** PR description, Scope and interfaces; `TauCetiRoadmap/RandomGraphs/README.md:117` adds CountableStructureSpaces Layer 0.
**Claim:** The description does not disclose the required decoding identity from CountableStructureSpaces, so its supplier account is incomplete.
**Witness:** `TauCetiRoadmap/RandomGraphs/README.md:222–225` explicitly says Tau Ceti does not supply the decoding identity and imports it from CountableStructureSpaces. The PR description never names that roadmap.
**Repair:** Add: “CountableStructureSpaces supplies the graph-coding decoding identity in Layer 0 and fixed-assignment graph events in Layer 2; RandomGraphs adds joint measurability and logical probability laws.” State this supply order in the description, incorporating the ownership repair above.

## Verified sound

Previous-finding disposition:

| Previous finding | Passage at this head | Disposition |
| --- | --- | --- |
| R01 general coding | README:719: “owned by this roadmap for a general language L”; Lean:382 | Repaired: general language, effective symbol presentation, unary-function instance. |
| R02 algorithm implementation | README:714: “define both maps in Lean” | Not repaired; R02 above. |
| R03 graphon joint theorem | README:1202: “graphon_ae_eventually_all_bounded_rank”; Lean:826 | Repaired; arbitrary joint law and graphon marginals retained. |
| R04 four padding declarations | README:1458: “As an elementary check”; the four former Lean names are absent | Repaired for all four named declarations. |
| R05 three unused definitions | README:298: “define its isomorphism closure”; the three former Lean definitions are absent | Repaired; definitions remain prose targets. |
| R06 name correspondence | README:954: “firstOrder_zero_one” | Repaired; all 112 named declarations occur in the README. |
| R07 LaTeX | README:10: “p ∈ (0, 1)” | Repaired; gate latex=0. |
| R08 shape/API/Checks | README:25: “Scope and ownership”; :645: “Checks (foRank)” | Partly repaired; all twelve layers have Examples/Dependencies; R07 above remains. |
| R09 local locators | README:1169: “Cameron’s Fact 1 (p. 1)”; :1377: “Theorems 1.21–1.22, pp. 25–26” | Local references added; the three books remain unverified. |
| R10 declaration docstrings | Lean:970: “For probability laws on ℕ with finite factorial moments…” | Repaired; 112 named declarations and four anonymous instances have docstrings. |
| R11 Lean PR identifiers | Lean:251: “graph-language extension property” | Repaired; numbered PR references absent from Lean. |
| R12 stale PR validation | PR: “sorry warnings (77)”; “semantic QE corollary … moved out” | Not repaired at this head; R09 above. |

Headline inventory: Fraïssé existence and rooted comparison; Rado Fraïssé identification, completeness, categoricity, computable QE/decidability, atomicity and primeness; finite-rank and finite-model consequences; exact witness laws and uniform errors; fixed/varying/rooted FO limits and joint stabilization; graph properties; infinite Rado/graphon laws, invariant events and singularity; infinitary distinctions; Poisson convergence, sparse triangles and the product-graphon counterexample. The absent finite-model signature is R05; all other listed families have signatures or the cited native mixture API.

Computed adversarial instances (truth values are T/F; R denotes the binary Rado graph; no row asserts that a `sorry` is proved):

| Statement | Instances | Left/construction value | Right/claimed value | Result | Change |
| --- | --- | --- | --- | --- | --- |
| 0.1 Graph/language transport | K₂ swap; K₂ versus edgeless pair | Adj(0,1)=T; swap gives T | same atomic edge; second structure gives F | consistent | — |
| 0.2 Finite patterns and restriction laws | p=1/2; one present, one absent pair | four equiprobable patterns; one allowed | 1/4; empty pattern 1 | consistent | — |
| 0.3 Satisfaction as an event | Adj(0,1); exists-edge on Fin 0,1,2 | edge cylinder mass p; 0,0,p | measurable; masses 0,0,p | ownership overlap | R04 |
| 1 representative isomorphism closure | empty family; two K₁ representatives | empty; one isomorphism class | empty; one class; K₂ excluded | consistent | — |
| 1 strong amalgamation | two K₁ extensions of empty root | ordinary amalgam size 1 | strong amalgam needs size 2 | consistent | — |
| 2.1 Chains, factorization and extension requests | constant R ⊔ K₁; K finite graphs | coverage T; served requests T | ultrahomogeneity F | counterexample | R01 |
| 2.1 corrected stage-membership criterion | same chain; growing Fin n chain | stages in K: F; T | bad chain excluded; good chain allowed | repair checked | R01 |
| 2.2 embedding countability | successor/predecessor ℤ → ℤ | embedding determined by f(0)=k | translations k∈ℤ; cardinal ℵ₀ | already native | R03 |
| 2 sequence-extension Checks | Fin 1 root maps 0↦1 in Fin 2 | g(1)=0; g(0)=1 | g(f(0))=0=d₁,₂(0) | computed | R07 |
| 4.1 Combinatorial and syntactic extension | K₁; E₀,₀ and E₀,₁ | fresh witnesses: 1; 0 | sentence values T; F | consistent | — |
| 5.2 Complete theory and QE | ∃y Adj(x,y); simpleGraph versus T_R | K₁: F; K₂: T; R: T | no QF equivalent for simpleGraph; ⊤ for T_R | consistent | — |
| 5.3 Finite consequences | ∀x∃y Adj(x,y), rank 2 | K₁ with budget 0: F | budget 1 forces T | consistent | — |
| 7.1 Finite laws | exists-edge, n=2, p=1/2, d=1 | error=1/2 | B₁(2,1/2)=2 | consistent | — |
| 7.1 finite-model endpoint | ∀x∃y Adj(x,y) | R: T; K₁: F; Kₙ n≥2: T | eventual finite sizes, threshold 2 | signature missing | R05 |
| 7.2 Varying parameters | pₙ alternates 1/3,2/3 | δₙ=1/3; nᵃδₙ=nᵃ/3→∞ | all-rank hypothesis T | consistent | — |
| 7.3 Joint almost-sure statements | p=1/2,d=1; arbitrary coupling | B₁(n)=4n/2ⁿ; sum n≥1 =8 | finite sum; limsup failure mass 0 | consistent | — |
| 8.1 Finite named roots | Adj(x₀,x₁), p=1/2 | conditional 1 and 0; weights 1/2,1/2 | unconditional 1/2 | consistent | — |
| 9.1 Infinite binomial graphs | one positive and one negative root, p=1/2 | N fresh candidates: no witness (3/4)ᴺ | limit 0; Rado-class mass 1 | consistent | — |
| 9.2 Graphon sampling | W=1/4+xy/2 | one edge 3/8; incident pair 7/48 | independent product 9/64; uniform ε=1/4 | consistent | — |
| 9.3 evaluated mixtures | half empty, half complete; exists-edge | (1/2)·0+(1/2)·1 | 1/2, not a zero–one mixture | consistent | — |
| 9.4 One isomorphism class, distinct labeled laws | p=0 versus q=1 | window densities 0 versus 1 for n≥2 | separator masses 1 versus 0 | consistent | — |
| 11.1 Discrete factorial-moment criterion | Bernoulli(1/n), n≥1; λ=0 | moments 1,1/n,0,…; TV=1/n | limits 1,0,0,…; TV→0 | consistent | — |
| 11.2 overlap counting | two triangles sharing edge / vertex | (v,e)=(4,5)/(5,6) | e−v=1 in both | consistent | — |
| 11.3 moment integral and domination | k=1; k=2,n=2 | E Zₙ=2(1−2⁻ⁿ); E(Z₂)₂=3/2 | 0,1,3/2,7/4; (2)₂·(1−1/4)=3/2 | consistent | — |
| 11.3 scaled domination | k=2,x=(1,1) | ∫(1−y)²dy=1/3 | bound 1−2/4=1/2 | consistent | — |
| 0.1 embeddings versus homomorphisms | K₁ induced in K₂; neighbour query | quantifier-free x=x:T/T; neighbour F/T | QF preserved; arbitrary FO not preserved | consistent | — |
| 0.1 repeated atomic coordinates | tuples(0,0) and(0,1) in K₂ | equality T/F; adjacency F/T | atomic types unequal | consistent | — |
| 0.2 complement and relabeling | single edge; p=1/3 | complement-edge mass2/3; swap mass1/3 | 1−p=2/3; p=1/3 | consistent | — |
| 0.2 disjoint coordinate independence | two distinct pairs sharing one vertex,p=1/2 | joint-present mass1/4 | (1/2)(1/2)=1/4 | consistent | — |
| 0.2 prescribed induced graph | one-edge graph on Fin3,p=1/2 | 1 of8 equally likely labeled graphs | p(1−p)²=1/8 | consistent | — |
| 0.3 Boolean probability identities | exists-edge on Fin2,p=1/3 | event1/3; negation2/3; contradiction0 | sum1; intersection0 | consistent | — |
| 1 representatives reindexing and transport | family(K₁,K₁); swap index order | one isomorphism class before/after | quotient cardinal1 | consistent | — |
| 1 representative cardinality | graphs on≤2 vertices | empty,K₁,edgeless pair,K₂ | 4 isomorphism classes; countable | consistent | — |
| 1 finite generation versus finite carrier | successor/predecessor on ℤ | closure{0}=ℤ; generator count1 | carrier cardinalℵ₀, not finite | consistent | — |
| 1 finite-order strong amalgam | a<b and a<c over a | choose a<b<c; intersection{a} | 3 vertices; intersection cardinal1 | consistent | — |
| 1 ordinary versus strong AP | sets of size≤2 over singleton | ordinary amalgam size2 | strong needs size3, excluded | consistent | — |
| 2.1 literal direct-limit factorization | Fin n chain; image{0,1} | stage2 map values0,1 | canonical inclusion composition values0,1 | consistent | — |
| 2.1 age union and countable limit | Fin n chain, empty language | union contains Fin k for every k | age(ℕ)=all finite sets; cardinalℵ₀ | consistent | — |
| 2.2 arbitrary relation signature | Fin2 with any number of empty predicates | carrier2; embeddings into itself2 | finite carrier; relation count does not enter | consistent | — |
| 3 rooted extension without empty roots | language with a constant; empty carrier | constant interpretations:0 | empty-root structure unavailable | consistent | — |
| 3 age inclusion universality | empty graph on Fin2 into R | copy{0,2}; adjacency0 | source adjacency0; root0 retained | consistent | — |
| 4 full-extension complement transport | R request U={0},Z={1} | R witness5 has edges1,0 | complement request swaps U,Z:0,1 | consistent | — |
| 4 finite avoidance and repeated witnesses | R U={0},Z={1}, avoid{5} | witness9; bit₀(9)=1,bit₁(9)=0 | fresh9≠5; same requested pattern1,0 | consistent | — |
| 4 finite bounded-axiom conjunction | K₁,d=0,1 | conjunction E₀,₀:T; add E₁,₀,E₀,₁:F | EP₀ T; EP₁ F | consistent | — |
| 4 tuple reordering | K₂ E₁,₁ on both orderings | no witness outside two vertices | F in both orders | consistent | — |
| 4 Rado complement and homogeneity | R edge(0,1), nonedge(0,2) | two edge-root copies have same pattern1 | automorphism orbit condition1=1; nonedge pattern0 excluded | consistent | — |
| 5 rank renaming and substitution | Adj(x₀,x₁); variable swap | rank0 before/after | max atomic depth0 | consistent | — |
| 5 ordinal/natural rank bridge | ∀x∃y Adj(x,y) | two nested quantifiers: natural2 | ordinal2 | consistent | — |
| 5 no finite Rado models | finite carrier n; negative request all vertices | outside-witness count0 | full extension F for every n | consistent | — |
| 5 atomicity with named parameters | name R vertex0; second vertex0,1,2 | equal,adjacent,nonadjacent | 3 distinguishable isolated types | consistent | — |
| 6 witness expectation and additivity | two candidates,q=1/4 | E count=0·9/16+1·6/16+2·1/16=1/2 | 2q=1/2; each candidate mean1/4 | consistent | — |
| 6 ordered versus finite-set bound | n=4,r=s=1,p=1/2 | (4)₂(3/4)²=27/4 | C(4,2)C(2,1)(3/4)²=27/4 | consistent | — |
| 6 sharper unordered bound | n=4,r=2,s=0,p=1/2 | ordered27/4 | unordered C(4,2)(3/4)²=27/8 | consistent | — |
| 6 error nonnegativity and budget monotonicity | n=4,p=1/2,d=0,1,2 | bounds0,1,29/2 | 0≤1≤29/2; complement leaves p unchanged | consistent | — |
| 7 no threshold for every sentence | finite graph on n vertices | CardEq(n):T | R satisfies CardEq(n):F | consistent | — |
| 7 all-rank logarithmic example | large n,pₙ=1/log(n+2) | nᵃδₙ=nᵃ/log(n+2)→∞ | at n=0 raw1/log2>1; finite prefix needs correction | consistent | — |
| 8 exact root-event mass | m=3,H=K₃,p=1/2 | three root edges present:1/8 | p³(1−p)⁰=1/8>0 | consistent | — |
| 8 induced-copy extension budget | K₃ built by three successive choices | request sizes0,1,2 | EP₂ suffices; K₂ cannot contain K₃ | consistent | — |
| 8 degree and nondegree lower bounds | C₄ and complement | minimum degrees2 and1 | k=1 both pass; k=2 complement fails | consistent | — |
| 8 connectivity after deletion | C₅,k=2; delete0 or1 vertex | cycle or path: connected | size5>2; vertex-connectivity≥2 | consistent | — |
| 9 density normalization against homDensity | R window3 has2 edges | K₂ homDensity=4/9 | edgeDensity=2/3=(3/2)(4/9) | consistent | — |
| 10 Scott comparison | R; K₁; edgeless ℕ | explicit extension conjunction:T,F,F | Scott characterization via EP:T,F,F | consistent | — |
| 11 moment finite-bound controls | Poisson0; j=0 and1 | masses1,0; factorial moments1,0,… | exp(0)·0⁰/0!=1; 0¹/1!=0 | consistent | — |
| 11 triangle parameter normalization | c=1,pₙ=1/(n+1) | npₙ=n/(n+1)→1 | mean limit1/6; disjoint term(n)₃pₙ³/6→1/6 | consistent | — |
| 11 exponential-moment exclusion | pₙ~1/n,a>1 | log lower bound=C(n,3)log a−C(n,2)log n | leading order n³log a/6→∞ | consistent | — |
| `exists_isFraisseLimit_of_isFraisse` | empty language, sizes≤0 and≤2 | limits Fin 0 and Fin 2 | cardinalities 0 and 2; both countable | consistent | — |
| `exists_embedding_comp_eq_of_isExtensionPair` | A=M=Fin 2; aM=id | e=aN | e∘id=aN | consistent | — |
| `exists_equiv_comp_eq_of_isExtensionPair` | ℚ order; root 0↦0,1↦2 | e(x)=2x; e(0)=0,e(1)=2 | root values 0,2 | consistent | — |
| `Satisfies` | exists-edge on Fin 0,K₁,K₂ | F,F,T | native realization F,F,T | consistent | — |
| `SatisfiesFormula` | K₂; Adj at (0,1)/(0,0) | T/F | native relation T/F | consistent | — |
| `foRank` | atom; ∀x∃y Adj; implication ranks1,2 | 0,2,2 | 0,2,max(1,2)=2 | consistent | — |
| `foRank_eq_zero_iff_isQF` | atom; ∀x⊥ | rank 0; rank 1 | IsQF T; F | boundary API | R06 |
| `measurableSet_setOf_realize_graph` | ℕ; Adj(0,1) | one edge cylinder; mass p | same measurable fixed-assignment event | duplicate ownership | R04 |
| `measurableSet_realize_jointly` | Fin 2; Adj; graph and assignments | 8 graph/tuple pairs; 2 satisfy | measurable finite subset of size 2 | consistent | — |
| `sentenceProbability` | exists-edge n=0,1,2 | 0,0,p | 0,0,p | consistent | — |
| `binomialRandom_map_comap` | Fin 2 ↪ Fin 3; p=1/2 | 4 of 8 graphs restrict to K₂ | K₂ mass 1/2 | consistent | — |
| `IsExtensionWitness` | K₂; U={0}; x=1 or0 | T/F | fresh adjacent T; root itself F | consistent | — |
| `HasExtensionUpTo` | Fin 0,K₁,C₄; budgets0,1,2 | Fin0:F; K₁:T,F; C₄:T,T,F | F; T,F; T,T,F from fresh-witness counts | consistent | — |
| `hasExtensionProperty_iff` | K₁; R | full extension F/T | all budgets F/T; K₁ fails budget1 | consistent | — |
| `HasExtensionProperty.infinite` | R; finite carrier n | R has infinitely many fresh witnesses | finite n has 0 outside full request | consistent | — |
| `extensionSentence` | K₁; (r,s)=(0,0),(1,0),(0,1) | T,F,F | one empty-request witness; no others | consistent | — |
| `satisfies_extensionSentence` | C₄; (1,0),(0,1),(2,0) | T,T,F | witness counts positive,positive,0 for adjacent positive roots | consistent | — |
| `radoAxioms` | R; K₁; edgeless ℕ | T,F,F | E₁,₀ true,false,false | consistent | — |
| `model_radoAxioms_iff` | R; K₁ | models T/F | full extension T/F | consistent | — |
| `exists_graphEmbedding_over_root` | K₂ rooted at0; target R | embedding0↦0,1↦1 | edge bit₀(1)=1; root0 retained | consistent | — |
| `finiteGraphs` | Fin0 graph; reflexive singleton; R | membership T,F,F | finite+simple T,F,F | consistent | — |
| `isFraisse_finiteGraphs` | two rooted edges over one vertex | free amalgam size3; new cross-edge absent | two induced edges; intersection size1 | consistent | — |
| `isFraisseLimit_radoGraph` | K₂ and edgeless pair | R copies {0,1} and {0,2} | adjacency 1 and 0; both in age | consistent | — |
| `Language.graph.ExtensionProperty` | R root A={0},B={1} | witness5: bit₀=1,bit₁=0 | fresh and adjacency T/F | consistent | — |
| `Language.graph.ExtensionProperty.embedding_from_countable` | K₂ into R | 0↦0,1↦1 | adjacency 1 on both sides | consistent | — |
| `Language.graph.ExtensionProperty.isFraisseLimit_finite_graphs` | R and K₁ | EP T/F | R qualifies; K₁ excludes K₂ from age | consistent | — |
| `Language.Theory.IsQFEquivalent` | T_R: ∃y Adj(x,y), ∃x Adj(x,x) | T,F | QF equivalents ⊤,⊥ | consistent | — |
| `Language.Theory.HasQuantifierElimination` | T_R; simpleGraph; inconsistent theory | T,F,T | one-variable neighbour values T; F/T; no models | consistent | — |
| `radoAxioms_isComplete` | triangle sentence; loop sentence | entails triangle, entails negated loop | R truth 1,0 | consistent | — |
| `radoAxioms_aleph0_categorical` | R and complement R | both EP; back-and-forth gives iso | one countable model class | consistent | — |
| `radoAxioms_models_iff` | triangle; loop | semantic consequence T,F | R truth T,F | consistent | — |
| `nonempty_elementaryEmbedding_radoGraph` | target R | identity embedding | all formula values unchanged | consistent | — |
| `exists_elementaryEmbedding_radoGraph_comp_eq` | root repeated (0,0) mapped to (3,3) | e(0)=3 twice | equality pattern T/T; adjacency F/F | consistent | — |
| `satisfies_iff_of_extension` | K₁,K₂,d=0; ∃x x=x | both EP₀; both sentence T | rank1≤1; agreement T | consistent | — |
| `formula_iff_of_extension` | m=2,q=1; same adjacent roots in R | common-neighbour formula T on both | budget2; witnesses exist outside both roots | consistent | — |
| `radoAxiomsUpTo` | d=0,1 | extension axioms {(0,0)}; {(0,0),(1,0),(0,1)} | 1 and3 extension axioms | consistent | — |
| `radoAxiomsUpTo_models_iff` | no-isolated sentence, d=1 | E₁,₀ entails it | R truth T | consistent | — |
| `FormulaAlphabet` | graph ⊥ at n=0,1 | lists [inr(inr2)],[inr(inr3)] | distinct tags2,3 | consistent | — |
| `boundedCode` | x₀=x₀ over Fin1 and Fin2 | two identical term-symbol codes in each | same number; variable value0 | consistent | — |
| `boundedDecode` | ⊥₀ code; extra-symbol suffix | some ⊥₀; none | exact parse retained; trailing symbol rejected | consistent | — |
| `boundedDecode_boundedCode` | ⊥₀ and unary-function equality | decoded values some ⊥₀; some(s(x₀)=x₀) | same formulas | proved round trip | — |
| `boundedDecode_eq_some_iff` | valid code c; c with extra suffix | some φ; none | encode φ=c: T; F | proved round trip | — |
| `computable_termCode` | variable x₀; unary s(x₀) | constructor tags0,1; argument lengths0,1 | head x₀,s; s has argument code x₀ | consistent | — |
| `computable_boundedCode` | ⊥, equality, relation, implication, ∀ | tags0,1,2,3,4 | imp children2; quantified child1; equality terms2 | consistent | — |
| `graphRelationsEquiv` | adj at arity2 | adj↦(); ()↦adj | one relation; arity2 | consistent | — |
| `exists_computable_quantifierElimination` | ∃y Adj(x,y); loop sentence | semantics T,F in T_R models | QF outputs ⊤,⊥; truth T,F | mathematics consistent | R02 prose |
| `radoAxioms_hasQuantifierElimination` | neighbour query; loop sentence | equivalent ⊤;⊥ | QF truth T;F | consistent | — |
| `exists_computable_decide_rado` | triangle; loop | R truth T,F | decision true,false | mathematics consistent | R02 prose |
| `radoTruth` | triangle; loop; no-isolated | 1,0,1 | R realizes T,F,T | consistent | — |
| `typesWith_firstOrderAtomicDiagram_eq_singleton` | R tuples (0,0),(0,1),(0,2) | equal; distinct-edge; distinct-nonedge | three distinct singleton type sets | consistent | — |
| `witnessProbability` | p=1/2,(r,s)=(1,1),(0,0) | 1/4,1 | p(1−p),1 | consistent | — |
| `witnessCount` | K₂,U={0},C={1}; C=∅ | 1;0 | one witness; none | consistent | — |
| `witnessCount_mass` | q=1/4, two candidates; j=0,1,2,3 | 9/16,6/16,1/16,0 | binomial masses9/16,6/16,1/16,0 | consistent | — |
| `no_witness_mass` | q=1/4,C size2; empty C | 9/16;1 | (3/4)²; (3/4)⁰ | consistent | — |
| `extensionError` | (n,d)=(0,0),(1,0),(3,1),(4,2),p=1/2 | 1,0,3/2,29/2 | finite sums1,0,3/2,29/2 | consistent | — |
| `extension_failure_le` | n=4,p=1/2,d=1,2 | failure masses23/32,1 | bounds1,29/2 | consistent | — |
| `extensionError_le_exp` | n=4,d=1,p=1/2 | B=1 | 16exp(−3/2)≈3.5701 | consistent | — |
| `summable_extensionError` | d=0,1,p=1/2 | sums1;9 including n=0 | finite:1; 1+Σₙ≥₁4n/2ⁿ=9 | consistent | — |
| `sentenceProbability_error` | exists-edge,n=2,p=1/2,d=1 | absolute error1/2 | bound2 | consistent | — |
| `firstOrder_zero_one` | exists-edge; p=1/2 versus excluded0 | 1−2^(−n(n−1)/2)→1; endpoint0 | R truth1; endpoint hypothesis F | consistent | — |
| `firstOrder_limit_varying_bounded_rank` | pₙ=1/2,d=1 | (n−1)/2−log(n+2)→∞ | exists-edge probability→1 | consistent | — |
| `firstOrder_limit_varying` | alternating1/3,2/3 | δ=1/3; nᵃ/3→∞ | exists-edge limit1; loop limit0 | consistent | — |
| `ae_eventually_all_bounded_rank` | p=1/2,d=1 | sum bounds9; limsup mass0 | eventual rank≤2 agreement mass1 | consistent | — |
| `ae_eventually_all_bounded_rank_varying` | alternating1/3,2/3 | δ=1/3; polynomial×(2/3)ⁿ summable | limsup fixed-budget failure mass0 | consistent | — |
| `firstVertices` | m=2,n=1; m=0 | images{0,1};∅ | Fin2↪Fin3; empty injection | consistent | — |
| `rootEvent` | H=K₂ or empty pair; p=1/2 | event masses1/2,1/2 | p,1−p | consistent | — |
| `rootedProbability` | H=K₂,φ=Adj; p=1/2 or0 | (1/2)/(1/2)=1; 0/0=0 | 1 in admitted domain; endpoint excluded | consistent | — |
| `rootEvent_pos` | m=0; H=K₂,p=1/2 | masses1;1/2 | both>0; H=K₂,p=0 gives0 | consistent | — |
| `rootedTruth` | Adj at (0,1)/(0,2); equality at(3,3) | 1,0,1 | R bit values1,0; equality T | consistent | — |
| `rooted_firstOrder_limit` | φ=Adj, root K₂ / empty pair | constant probabilities1/0 | rooted R truth1/0 | consistent | — |
| `firstOrder_limit_firstVertices` | m=2,φ=Adj | p·1+(1−p)·0=p | unconditioned edge probability p | consistent | — |
| `tendsto_binomialRandom_nonempty_embedding` | F empty; F=K₂ | probabilities1;1−(1−p)^C(n,2) | limits1;1 at interior p | consistent | — |
| `tendsto_binomialRandom_not_cliqueFree` | k=0; k=2,n=2 | mass1; mass0 | limit1; finite obstruction allowed | consistent | — |
| `tendsto_binomialRandom_le_degree` | k=1,C₄; K₄ | degrees(2,1); (3,0) with complements | event T;F | consistent | — |
| `tendsto_binomialRandom_diam_eq_two` | C₅; K₄; disconnected pair | diameters(2,2);(1,0);(0,1) | event T;F;F | consistent | — |
| `tendsto_binomialRandom_isVertexConnected` | k=0,K₁; k=1,K₂; k=2,K₂ | T,T,F | sizes1≥1;2≥2;2<3 | consistent | — |
| `ae_isomorphic_rado` | p=1/2; excluded p=0 | fresh-request failure limit0; edgeless at0 | Rado-class mass1;0 | consistent | — |
| `infiniteSampleLaw_const` | p=0,1/2,1; one edge | cylinder masses0,1/2,1 | binomial masses0,1/2,1 | consistent | — |
| `infiniteSampleLaw_ae_rado` | W=xy; root x∈(0,1) | positive witness probability x/2>0 | infinitely many trials give failure0 | consistent | — |
| `graphon_extension_failure_le` | W=1/2,ε=1/2,n=4,d=1 | failure23/32 | bound1 | consistent | — |
| `graphon_firstOrder_limit` | W=1/2; exists-edge | 1−2^(−C(n,2))→1 | R truth1 | consistent | — |
| `graphon_ae_eventually_all_bounded_rank` | W=1/4+xy/2,ε=1/4,d=1 | bound2n(3/4)^(n−1), n≥1 | summable; limsup failure mass0 | consistent | — |
| `infiniteSampleLaw_zero_one_of_invariant` | constant0 and1; exists-edge | invariant event masses0,1 | each in{0,1} | consistent | — |
| `infiniteSampleLaw_sentence_zero_one` | constant0 and1; exists-edge | sentence probabilities0,1 | each in{0,1} | consistent | — |
| `windowEdgeDensity` | complete atn=0,1,2; R atn=3 | 0/0=0,0/0=0,2/2=1;4/6 | 0,0,1;2/3 | consistent | — |
| `ae_windowEdgeDensity` | p=0,1 | densities0;1 for n≥2 | limits0;1 | consistent | — |
| `binomialRandom_mutuallySingular` | p=0,q=1 | density-zero event masses1,0 | support intersection mass0; singularity T | consistent | — |
| `SatisfiesInf` | embedded triangle in K₂,K₃ | F,T | FO truth F,T | consistent | — |
| `radoSentenceInf` | R; K₁ | all Eᵣ,ₛ T; E₁,₀ F | conjunction T;F | consistent | — |
| `satisfiesInf_radoSentenceInf_iff` | R; K₁ | infinitary truth T,F | full extension T,F | consistent | — |
| `binomialRandom_radoSentenceInf` | p=1/2 | all countably many requests served a.s. | Θ_R mass1 | consistent | — |
| `binomialRandom_radoSentenceInf_of_finite` | n=0,1,2 | fresh witness outside whole carrier count0 | Θ_R mass0,0,0 | consistent | — |
| `cardEq` | m=0,1 on Fin0,Fin1,Fin2 | m0:T,F,F; m1:F,T,F | cardinality equalities T,F,F / F,T,F | consistent | — |
| `evenSentenceInf` | Fin0,Fin1,Fin2,ℕ | T,F,T,F | even finite cardinal0,2; not1 or∞ | consistent | — |
| `binomialRandom_evenSentenceInf` | n=0,1,2,3 | masses1,0,1,0 | parity indicators1,0,1,0 | consistent | — |
| `not_tendsto_binomialRandom_evenSentenceInf` | even/odd subsequences | limits1,0 | one common limit impossible | consistent | — |
| `triangleSentence` | K₂,K₃ | F,T; rank3 | count>0:F,T; three existential quantifiers | consistent | — |
| `noIsolatedSentence` | Fin0,K₁,K₂ | T,F,T; rank2 | all vertices have neighbours T,F,T | consistent | — |
| `triangleCount` | K₂,K₃,K₄ | 0,1,4 | C(2,3),C(3,3),C(4,3) | consistent | — |
| `isolatedCount` | Fin0,K₁,K₂,edgeless Fin2 | 0,1,0,2 | vertex counts with degree0:0,1,0,2 | consistent | — |
| `satisfies_triangleSentence` | K₂,K₃,K₄ | truth F,T,T | count>0 F,T,T | semantic API/Checks | R06 |
| `satisfies_noIsolatedSentence` | Fin0,K₁,K₂ | truth T,F,T | count=0 T,F,T | semantic API/Checks | R06 |
| `poisson_pointMass_limit_of_factorial_moments` | νₙ=Bernoulli(1/n),n≥1;r=0 | mass0→1; mass1→0; others0 | Poisson0 masses1,0,0,… | consistent | — |
| `poisson_totalVariation_limit_of_factorial_moments` | same νₙ,r=0 | half absolute sum=(1/2)(2/n)=1/n | limit0 | consistent | — |
| `triangle_factorialMoment_limit` | c=1,k=1; c=0,k=0 | C(n,3)pₙ³→1/6; zeroth moment1 | (1³/6)¹=1/6;0⁰=1 | consistent | — |
| `triangle_poisson_mass_limit` | c=0,j=0; c=1,j=0 | zero-regime mass→1; positive regime→e^(−1/6) | Poisson masses1;≈0.846482 | consistent | — |
| `sparse_triangle_sentence_limit` | c=0,1 | limits0;≈0.153518 | 1−e⁰=0;1−e^(−1/6) | consistent | — |
| `productGraphon` | (0,1),(1,1),(1/2,1/2) | 0,1,1/4 | xy; symmetric and[0,1]-valued | consistent | — |
| `productGraphon_isolated_factorialMoment_limit` | k=0,1,2 | limiting integrals1,2,4 | 2⁰,2¹,2² | consistent | — |
| `productGraphon_isolated_poisson_mass_limit` | j=0,1 | limits e⁻²,2e⁻² | Poisson2 masses≈0.135335,0.270671 | consistent | — |
| `productGraphon_noIsolated_limit` | finite versus infinite sample | finite limit e⁻²≈0.135335 | infinite truth probability1 | consistent | — |
| `productGraphon_ae_isomorphic_rado` | root x>0; xy∈(0,1) a.e. | positive witness probability x/2 | fresh-request failure limit0; Rado mass1 | consistent | — |


- Sources: 15 seeded targets covered; 8 distinct Cameron locators and 4 Fagin locators read, plus the direct-limit/existence/rooted formalization passages; 3 book texts unavailable; Erdős–Rényi’s formula remains OCR-limited.
- Pinned declarations opened: 6 model-theory interfaces in `Mathlib/ModelTheory/{Fraisse,PartialEquiv,DirectLimit,FinitelyGenerated}.lean` (117,202;476,499;317;241), encoding at `Encoding.lean:144,163,278`, and 9 graph/sampling interfaces at Tau Ceti’s `ExtensionProperty.lean:51,64,93,98`, `Sampling/Finite.lean:372`, `Sampling/Infinite.lean:287`, `Sampling/AlmostSure/Basic.lean:62`, `Relational/Ergodic.lean:116`, `Infinite/Mixture.lean:81`.
- Ownership: 7 supplier roadmaps resolved; the 4 “missing name” leads are local declarations in Lean:262,270,277,283; 0 dropped/conflicting ids or second copies; 2 unrelated board packages.
- Dependency output: `depcheck: 244 roadmaps, 2197 edges, 0 problem(s)`; 0 UPWARD/CYCLE lines. Worker gate: every category 0, `OK`, including targeted build.
- Direct elaboration: 0 errors, 75 `sorry` warnings; all 112 `#check @name` signatures elaborate; all 7 flagged probability instances remain in scope; 0 signature changes; the additional finite-model headline signature elaborates.
- Padding: all 75 admitted statements survive single `simp`, `rfl`, `infer_instance` probes; native near-matches supply no direct replacement headline; R06 is the separate boundary/Check-API exclusion.
- Arithmetic: all 1,100 labeled graphs on 0–5 vertices tested for budgets 0–2; failure probabilities versus B checked, including `(23/32,1)` at `(n,d)=(4,1)` and `(1/2,5/8)` at `(5,1)`.
- Scope: head `3a5d950a225f6be3cab6a5d53d1b2c0ff8c51a51`; 0 outside-folder changes; 0 edits to the reviewed files; prior 4 padding and 3 unused-definition removals confirmed.

Overlap check: read CountableStructureSpaces, HanfNumbers, InfinitaryModelExistence, CountableModelCounting, FreeGroupsAndLimitGroups, InfinitaryLogic and DenseGraphLimits from all three closest lists. Graph decoding and fixed-assignment events belong to CountableStructureSpaces (R04); native Rado/EF/infinitary syntax to InfinitaryLogic/Tau Ceti; graphon sampling and mixtures to DenseGraphLimits; group-language syntax to FreeGroupsAndLimitGroups, with the general effective-language extension owned here. No shared target with the other three. PointProcesses’ uniform exponential-moment criterion does not cover the triangle counts; the weaker discrete criterion is owned here.

Source independence: 21 prose/signature passages compared across 7 readable sources, including five additional passages in Layers 1,3,6,11 and a Lean docstring; no non-mathematical expressive copying or reused example list found. Largest share: spencer2001, 16 of 60 literary locator occurrences (numbered ranges expanded, repeats within a paragraph counted once); its theorem text was unavailable. Its contents (lines 11–132) and Cameron’s section headings were compared: no matching consecutive layer/section arrangement. Dependencies 1→2→3,4→5,5–6→7 force those orders; the graphon/Poisson branches have different scope from Spencer’s chapters. Spencer’s wording, and the other two books’ wording, remains untested.

## Not verifiable

- spencer2001: Theorems 0.1.2,0.1.5,2.2.3,2.3.1–2.3.2,9.1.3–9.1.4, Definition 2.3 and §1.3; sources service reached Springer paywalled/uncertified DOI 10.1007/978-3-662-04538-1; only the contents were readable.
- hodges1993: §7.1, Theorems 7.1.2,7.1.7, Lemmas 7.1.3–7.1.6 and (1.8), pp.326–329; sources service reached Cambridge’s purchase page, no legal full text.
- bollobas2001: Theorems 1.21–1.22,4.1, Corollary4.9, pp.25–26,79,83; correct Cambridge DOI 10.1017/CBO9780511814068 offers purchase/institutional access; contents-PDF request timed out.
- erdosrenyi1960: Theorem3a, p.34, located at lines1139–1160; the retrieved OCR does not preserve the mean formula legibly, and local PDF-rendering utilities were unavailable.

## Source issues

- **Gap** in cameron2013 at §1.1 property (∗), printed p.1: the source says an extension witness is automatically distinct from all negative vertices; it should justify freshness or require it explicitly; affects the proof.
- **Gap** in cameron2013 at Proposition11, printed p.9: the source gives extension axioms without freshness from negative vertices; it should add those inequalities or derive fresh witnesses from the complete scheme; affects the proof.
- **Error** in cameron2013 at Theorem3(a), printed p.8: the source characterizes ages by closure, countability and amalgamation without nonemptiness; it should require a nonempty class, since the empty class satisfies those conditions; affects a stated result.

## For the human reviewers

- **Not tested:** Spencer has the largest locator share; its contents, but not theorem wording, were readable. Hodges and Bollobás theorem texts were unavailable. The Erdős–Rényi mean formula could not be independently read beyond damaged OCR.
- **Licence:** `TauCetiRoadmap/RandomGraphs/Suggested.lean:63,76,85` follows `cameronfreer/computable-model-theory`, `ModelTheory/FraisseExistence.lean` and `ModelTheory/RootedExtension.lean`, with matching names and mathematical signatures. Headers declare Apache-2.0; assess attribution/reuse. Locators: cmtfraisseexistence line286; cmtrootedextension lines72,81.
