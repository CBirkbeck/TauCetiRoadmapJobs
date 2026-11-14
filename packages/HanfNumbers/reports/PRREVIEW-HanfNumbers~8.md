# Review of HanfNumbers (pull request #1319 at 8b141bc)
**Verdict:** needs changes

## R01 (P3) — Two specializations remain as acceptance-test padding

**Location:** `TauCetiRoadmap/HanfNumbers/Suggested.lean:70`, `:339`: `partitionRel_succ_one` and `morley_omitting_types_of_countable`.
**Claim:** These specializations belong among the headline acceptance statements.
**Witness:** At n=0, `exact erdos_rado hκ 0` proves the pigeonhole statement. The countable-language corollary closes with one `exact morley_omitting_types …`, supplying formula countability. Both scratch probes elaborate.
**Repair:** Delete these two declarations from `Suggested.lean`; keep their statements as README targets, replacing their backticked declaration labels by prose. Retain the general Erdős–Rado and omitting-types statements.

## R02 (P3) — Three definitions serve no retained headline

**Location:** `TauCetiRoadmap/HanfNumbers/Suggested.lean:110`, `:139`, `:287`: `IsIndiscernibleOn`, `morleySeed`, `hanfNumber`.
**Claim:** Every definition in this file is needed to state a headline theorem.
**Witness:** Each of these names occurs only at its own declaration in the file; no theorem signature or needed definition refers to it. The global Hanf number instead uses `IsHanfBound` directly.
**Repair:** Delete these three definitions from `Suggested.lean`. Keep their mathematical definitions, API and Checks in README 1.1, 1.3 and 3.1 as prose, without claiming these Lean declarations exist.

## R03 (P3) — Four constructions still lack three discriminating Checks

**Location:** `TauCetiRoadmap/HanfNumbers/README.md:535`, `:598`, `:652`, `:974`: Skolem tower, Skolem template, term model and beth ladder.
**Claim:** Each definition has at least three discriminating Checks.
**Witness:** Section 2.1 has none; 2.2's three Checks test sources, not the Skolem-template laws; 2.3 has only the later atomic-order example; 4.2 has only the α=0 ladder example, repeated at 4.3.
**Repair:** Add separate Checks lists. For the tower: equality on {0,1} requires f(x)=x, while f=0 fails at x=1; a false formula permits any witness function; the unary tautology produces a nullary symbol, excluding empty expansions. For Skolem templates: the injective equality template satisfies all three laws; declaring ⊥ true fails finite satisfiability; the finite-height assignment making every Pᵢ true and their conjunction false fails ω-completeness. For the term model: the injective empty-language template gives E=J, including E=∅; the constant template gives one element for nonempty J; the induced map for j↦2j sends each generator j to 2j. For the ladder: retain the α=0 cardinalities ℵ₀ and 2^ℵ₀; on two points with E empty, U₀=U₁=the carrier and constants enumerating it, every clause except extensionality holds; at α=ω, replacing Uω by the whole V_(ω+ω+1) makes its size ℶ_(ω+1)>ℶ_ω and violates the limit-union clause.

## R04 (P3) — The description still denies Mathlib's pigeonhole theorem

**Location:** Pull-request description, **Partition calculus**: “Mathlib has none of these”, following a list including pigeonhole for successor cardinals.
**Claim:** The pinned library supplies none of the listed combinatorics.
**Witness:** `Mathlib/SetTheory/Cardinal/Pigeonhole.lean:47` supplies `Cardinal.infinite_pigeonhole_card`; `Mathlib/SetTheory/Cardinal/Regular.lean:76` supplies `Cardinal.isRegular_succ`. At θ=κ⁺ these give a fibre of size κ⁺ for at most κ colours, with κ infinite.
**Repair:** Replace the sentence by: “Mathlib supplies cardinal pigeonhole and regularity; this roadmap introduces partition-relation vocabulary and develops end-homogeneous sets and the finite-exponent Erdős–Rado theorem.”

## R05 (P3) — The validation count describes an earlier head

**Location:** Pull-request description, **Validation**: “exits 0 with 29 `declaration uses sorry` warnings and nothing else”.
**Claim:** That count describes this head's acceptance file.
**Witness:** `Suggested.lean` contains 24 admitted theorems. Direct elaboration at 8b141bc exits 0 with exactly 24 declaration-uses-sorry warnings, not 29.
**Repair:** For this head, replace “29” by “24”; after the acceptance-file deletions, rerun the same elaboration and report its resulting count.

## R06 (P3) — The provenance paths omit the source directory

**Location:** `TauCetiRoadmap/HanfNumbers/README.md:1335`: “Paths are relative to” the commit's repository root; `:1366` lists `ModelTheory/Hanf.lean`.
**Claim:** The listed module paths resolve relative to that root.
**Witness:** At commit 518a366, root-relative `ModelTheory/Hanf.lean` returns 404; `InfinitaryLogic/ModelTheory/Hanf.lean` exists (infinitary-logic line 2). The indiscernibility, template and order-transitivity files likewise have the `InfinitaryLogic/` prefix.
**Repair:** Replace the base-path sentence by: “Module paths below are relative to the `InfinitaryLogic/` directory at commit `518a366cba97b1ae8c4dc64a297a396939bc3e0b` of `cameronfreer/infinitary-logic`; the explicitly linked dependency script is repository-root relative.”

## Verified sound

Previous review, finding by finding:

| Previous finding | Head passage or declaration | Disposition |
| --- | --- | --- |
| R01, five API declarations | README 0.1: “the order-free form”; Lean :57 points there | Repaired: all five declarations deleted; separate remaining padding is R01 above. |
| R02, locators | README :629: “sources and Skolem templates are this roadmap's interfaces”; :630 cites Exercise 5.7, p.57 | Repaired: all listed subsections now identify their source or custom interface. |
| R03, Checks | README :634: “Checks (Ehrenfeucht–Mostowski sources)” | Partly repaired: new Checks cover the former simple predicates; four constructions remain, R03 above. |
| R04, nonexistent API labels | README :989: “Ladder satisfaction”; :991: “Ladder cardinal bound” | Repaired: all twelve former labels are now prose. |
| R05, module framing | Lean :12: “This file is not the roadmap”; :13: “headline theorems against the pinned Mathlib and Tau Ceti” | Repaired. |
| R06, process references | README :251: “Neither pinned library has an infinite Ramsey theorem, an Erdős–Rado theorem or partition-relation vocabulary” | Repaired: former proposal references deleted. |
| R07, merged suppliers | Description, Series: “consumes InfinitaryModelExistence as it is on main and waits for no open pull request” | Repaired. |
| R08, pigeonhole claim | Description, Partition calculus: “Mathlib has none of these” | Not repaired; R04 above. |

Computed adversarial instances follow. Named theorem rows include all 24 admitted statements. The README's remaining construction milestones—`realize_em_iff`, `isSkolemTemplate_templateOf`, `isEMSource_em`, `exists_total_of_cofinallyApproximated`, `isSkolemTemplate_of_approximated`—are identified in the module docstring as lacking their tower/template/term-model carriers; their mathematics is also tested below.

| Statement | Instances tried | Values computed on each side | Result / change |
| --- | --- | --- | --- |
| Conventions: nonempty spectra | φ=∀x⊥; empty versus one-point carrier | Satisfaction true/false; nonempty spectrum ∅; every bound true; sentence Hanf number 0 | Empty-model convention preserved |
| Conventions: unused symbols | Pure infinity; add arbitrarily many constants | Interpret every added constant by one element; reduct and expansion both have size κ | No language-size term required |
| Conventions: cardinal universes | Pure sets in two universes | Lifted source and target sizes both κ; no structure transported merely by lifting morphisms | Signatures use the intended carriers |
| 0.1 homogeneity | c(x,y)=(x+y) mod 2; evens and {0,1,2} | Evens give 0=0; c(0,1)=1, c(0,2)=0 | Positive and negative controls |
| 0.1 restriction | Same colouring; restrict evens to {0,2} | One increasing pair, colour 0; restricted homogeneity true | API agrees |
| 0.1 end-homogeneity | c(x,y)=x mod 2 versus y mod 2 | Fixed prefix 0 gives 0=0 versus 1≠0 at final points 1,2 | Distinguishes end-homogeneity |
| 0.1 homogeneous implies end-homogeneous | Constant pair colouring 7 | All pair colours 7; equal-prefix pair colours 7=7 | Implication holds |
| 0.1 converse fails | c(x,y)=x mod 2 on ℕ | Equal prefixes give equal colours; pairs (0,1),(1,2) give 0≠1 | No converse asserted |
| 0.1 PartitionRel, positive colours | (κ,λ,n,μ)=(3,2,1,2), then (2,2,1,2) | Largest fibre ≥2 in first case; injective colouring has largest fibre 1 in second | True, then false |
| 0.1 zero-colour convention | (0,0,1,0) | Unique empty colouring; H=∅ has size 0 and is homogeneous; named-colour witness nonexistent | README's convention difference matches |
| 0.1 arity zero | Empty source, n=0; D=∅ | One empty tuple; no function from that singleton to D; universal colouring assertion vacuous | No hidden empty-colour witness |
| 0.1 order-free form | Three-point source, one-tuples, two colours | Tuples and singleton subsets each number 3; each formulation forces fibre ≥2 | Same relation |
| 0.1 monotonicity | Enlarge source 3→4; retain λ=2, μ=2, n=1 | Largest fibre lower bounds 2→2; restricting to three points supplies the target | Correct direction |
| 0.1 iteratedTwoPow | κ=2, n=0,1,2; κ=0, n=0,1,2 | 2,4,16; respectively 0,1,2; wrong linear exponent gives 64 at κ=3,n=2 instead of 256 | Recursion distinguished |
| 0.4 beth shift | κ=ℶ_α, n=0,1,2 | ℶ_α, ℶ_(α+1), ℶ_(α+2) on both sides | Ordinal addition direction fixed |
| partitionRel_succ_one | κ=ℵ₀ | ℵ₁ points, ℵ₀ colours; fibre ℵ₁; erdos_rado at n=0 has identical conclusion | Delete padding, R01 |
| exists_unbounded_fiber | Constant map ω₁→{0} | Fibre cardinal ℵ₁; supremum ω₁; for β<ω₁ choose α=β | Uniform colour, unbounded fibre |
| 0.3 exists_isEndHomogeneousOn | λ=ℵ₀, n=0; colour by parity of first coordinate | Source ℶ₁⁺; initial ℵ₁ points; equal-prefix colours identical | Hypotheses and cardinal output agree |
| 0.3 tree count | λ infinite, height β<λ⁺ | At level β, colour histories ≤λ^λ≤2^λ; ≤λ⁺ levels still total ≤2^λ | Source (2^λ)⁺ forces required height |
| erdos_rado | κ=ℵ₀; n=0,1,2 | Sources ℵ₁, ℶ₁⁺, ℶ₂⁺; targets ℵ₁; arities 1,2,3 | Successor and exponent shifts agree |
| erdos_rado_beth | α=0,n=1; α=1,n=0 | ℶ₁⁺→(ℵ₁)²_ℵ₀; ℶ₁⁺→(ℶ₁⁺)¹_ℶ₁ | Both are correct specializations |
| 1.1 IsIndiscernibleOn | Δ={x₀<x₁}; identity ℕ; a(n)=(−1)^n n in ℤ | Identity always true; second sequence true at (0,2), false at (0,1) | Mathematical definition sound; R02 |
| 1.1 restriction and reindexing | Identity sequence; embedding n↦2n | For i<j, i<j and 2i<2j both true | Restriction preserves values |
| 1.1 shrinking Δ | Previous nonmonotone sequence; Δ={⊤} | Every tuple gives true; enlarging to x₀<x₁ gives true/false | Correct monotonicity direction |
| 1.2 EMTemplate and templateOf | Singleton index versus injective ℕ, arity 2 | ⊥ belongs vacuously for singleton; ⊥ absent and disequality present for ℕ | Template need not itself be consistent |
| 1.2 RealizesOn | Constant versus injective sequences; injective equality template | Required disequality true; observed values false versus true | Constant sequence rejected |
| 1.2 own-template equivalence | Equality on identity ℕ and n mod 2 | Identity: indiscernible and realization true; mod 2: both false | Both directions distinguished |
| 1.2 coherence | Injective equality template; reindex (0,1) into (0,2) | Equality false before and after; assigning true then false violates coherence | Correct reindexing law |
| 1.3 disEq and morleySeed | φ=⊤; injective and constant sequences | Seed values (true,true) versus (true,false) | Constant seed indiscernible, but wrong template; R02 |
| 1.3 small index | Singleton index; injective-source template | Sentence true; zero increasing pairs; realization true; singleton map injective | No false two-point inference |
| 1.3 finite-character warning | Elements of finite height; all Pᵢ and ¬⋀ᵢPᵢ | Each finite requirement has a finite-height witness; whole set has 0 witnesses | Compactness shortcut excluded |
| 2.1 Skolem symbols and axiom | ψ(x,y):x=y on {0,1} | Correct f(0)=0,f(1)=1; f=0 makes implication true→false at x=1 | Add Check, R03 |
| 2.1 vacuous witness antecedent | ψ=⊥ on {0,1} | Existential false; implication true for either output 0 or 1 | Add Check, R03 |
| 2.1 nonempty expansion | Unary tautology in closure | Added symbol has arity 0; empty carrier has 0 interpretations; singleton has 1 | Nonempty hypothesis necessary; R03 |
| 2.1 countability and closure | Countable initial language and Γ₀ | Each stage ≤ℵ₀ symbols/formulas; countable union ≤ℵ₀; each finite term appears at a finite stage | Tower bound agrees |
| 2.1 elementary hull | Singleton original structure; X={0} | Generated hull {0}; equality truth preserved; size 1≤max(ℵ₀,1) | Supplier Tarski–Vaught used on Γ* |
| 2.2 IsEMSource | Equality fragment; identity ℕ versus n mod 2 | Equality always false versus false at (0,1), true at (0,2) | Source true versus false |
| 2.2 noninjective source | Same fragment; constant sequence | Equality always true; all source conditions true; eventual nonempty term model size 1 | Injectivity not smuggled into source |
| 2.2 witness assignment | Γ contains ∀y(y=x); two-element carrier | Counterexample at y≠x; proposed witness y=x makes body true, so obeying w fails | Wrong witness excluded |
| 2.2 Skolem template | Injective equality template versus assignment ⊥=true | Finite equality diagrams realizable; singleton {⊥} has 0 models | Add Check, R03 |
| 2.2 ω-completeness | Finite-height assignment | Each Pᵢ assigned true, conjunction false; required false component has 0 candidates | Excludes finitely satisfiable wrong template; R03 |
| isSkolemTemplate_templateOf | Equality-only identity source | Coherence false=false; finite diagrams realized by distinct naturals; no infinitary members | All three laws true |
| 2.3 quotient and skeleton | Empty-language injective template; J=∅,1,ℵ₁ | Equivalence identifies exactly equal generators; model sizes 0,1,ℵ₁ | Add Check, R03 |
| realize_em_iff | Same template; equality at generators j,k | Both sides true for j=k and false for j≠k | Atomic truth agreement |
| 2.3 infinitary truth | Constant ⊤ disjunction; constant ⊥ conjunction | Disjunction true with witness 0; conjunction false with counterexample component 0 | Witness directions agree |
| 2.3 universal truth | Skolem witness for a false universal | Witness term gives body false in template and model; universal false on both sides | No quantifier-free reduction needed |
| 2.3 sentence agreement | Γ contains ⊤ at arity 0 | Unique empty tuple; template value true; model satisfaction true | Sentence case not vacuous |
| 2.3 constant-template quotient | Empty language; nonempty J | Every generator equal; quotient cardinal 1, irrespective of size of J | Injective-template condition necessary; R03 |
| 2.3 cardinality | Injective template, J of size ℵ₁, no functions | #EM=ℵ₁≤max(ℵ₀,ℵ₁,0)=ℵ₁ | Bound attained |
| 2.3 functoriality | Equality template; identity and n↦2n | Induced maps j↦j and j↦2j; composition with identity unchanged | Add Check, R03 |
| isEMSource_em | EM(ℕ, injective equality template) | Skeleton identity; equalities false at all increasing pairs; no universal members | Source and injectivity recovered |
| exists_emModel | Constant source; J=∅ and J=ℵ₁ | Models have cardinalities 0 and 1; bounds ℵ₀ and ℵ₁ | General stretching permits collapse |
| exists_emModel_card_eq | Injective source, countable functions, #J=ℵ₁ | Lower bound ℵ₁; upper max(ℵ₀,ℵ₁)=ℵ₁; equality ℵ₁ | Exact cardinality obtained |
| 3.1 HasArbLargeModels | Pure infinity versus exactly two elements | Models at every infinite κ versus maximum 2; predicate true versus false | Spectrum quantifier distinguished |
| 3.1 IsHanfBound and monotonicity | Exactly two elements; κ=2,3,4 | Trigger true,false,false; bound false,true,true | Correct upward monotonicity |
| 3.1 hanfNumber and attainment | Exactly two elements | Bounds {κ:3≤κ}; infimum 3; bound at 3 true | Mathematical API sound; remove unused def, R02 |
| 3.1 existence of bounds | Pure infinity versus exactly two elements | Any κ works in first case; κ=3 works in second | Existence needs no model construction |
| 3.2 countable reduction | Sentence pure infinity; uncountable unused constants | Occurring symbols 0; expansion gives all constants same value; carrier size stays κ | General language retained |
| IsApproximatedAt | σ=⊤; disequality in both pos and neg | At κ=1, zero pairs and condition true; at κ=2, true∧false impossible | Noncofinal wrong assignment excluded |
| IsCofinallyApproximated | Previous contradictory assignment | Fails already at ℶ₀; predicate false; empty pos/neg with σ=⊤ gives true | Cofinal quantifier nonvacuous |
| 3.3 finite-size restriction | σ says exactly two; pos=neg=∅ | Approximation at 2 true, at 3 false | Cardinal monotonicity only downward |
| isCofinallyApproximated_start | σ=⊤; positive disequality | Pure set of size ℶ_α; identity skeleton; sentence and disequality true | Initial assignment at every α |
| IsCofinallyApproximated.decide | σ=∀x¬P(x); deciding P(x₀) | Negative extension true at every level; positive extension has no nonempty witnesses | Correct choice, not both branches |
| 3.3 decision at arity 0 | Decide ⊥ with σ=⊤ | Positive branch false; negative branch true at every beth level | Sentence case handled separately |
| IsCofinallyApproximated.exists_iSup_witness | ψ₀=⊥, ψᵢ=⊤ for i≥1, arity 0 | Disjunction true; index 0 fails; index 1 works uniformly | One index for all levels |
| IsCofinallyApproximated.exists_iInf_witness | ψ₀=⊤, ψᵢ=⊥ for i≥1, arity 0 | Conjunction false; index 0 cannot be false; index 1 is false uniformly | Dual direction correct |
| 3.3 positive-arity witness bound | n=2, α=0, countably many colours | ℶ₂≥ℶ₁⁺; homogeneous size ℵ₁≥ℶ₀; countably many indices below regular ω₁ | No lost successor in exponent |
| exists_total_of_cofinallyApproximated | Equality formulas over pure infinite sets | Equal variables assigned true; distinct positions false; every finite pattern realized | Completion preserves initial assignment |
| 3.4 witness scheduling | Disjunction first added at stage k | Witness chosen at its own subsequent obligation; index fixed once; truth remains true in later finite conditions | No limit-stage fresh choice required |
| isSkolemTemplate_of_approximated | Completed equality template | Reindexed equalities keep values; each finite condition realized; no unsatisfied countable witness obligation | Template laws recovered |
| exists_emSource_of_forall_beth | φ=⊤ over empty language | N=ℕ with equality fragment and identity sequence; #N=ℵ₀; injectivity true | Extraction has a concrete instance |
| exists_model_card_eq_of_forall_beth | φ=pure infinity; κ=ℵ₀,ℵ₁ | Pure sets give model cardinalities exactly ℵ₀,ℵ₁ | Cofinal assumption yields exact sizes |
| morley_hanf | Pure infinity; exactly two elements | First has arbitrarily large models; second has no model ≥ℶ_ω₁ | Both sentence-level bounds true |
| morley_omitting_types | T=∅; one type {⊥} versus {⊤} | First omitted by all tuples; second omitted by none on nonempty carriers | Conclusion true versus hypothesis false |
| 3.4 countability of each omitted type | Constants indexed by ℶ_ω₁; p={x≠cᵢ} | Omission forces M=range(c); #M≤ℶ_ω₁; no larger omitting model | Uncountable type would refute overgeneralization |
| morley_omitting_types_of_countable | Countable language, T=∅, S={{⊥}} | Formula family countable; generalized theorem gives same model/cardinality assertion | Exact specialization; delete, R01 |
| 3.4 countable-theory variant | Empty theory; κ=ℵ₁ | Conjunction ⊤; a pure ℵ₁-set satisfies 0 requirements | Derived variant agrees |
| 4.1 IsLω₁ωHanfBound | κ=2 and sentence exactly two | Trigger model size 2 exists; arbitrarily-large conclusion false; global predicate false | Global quantifier is substantive |
| 4.1 global upper bound | κ=ℶ_ω₁ | morley_hanf gives true for every sentence; infimum of global bounds ≤ℶ_ω₁ | Bound is attained |
| 4.1 bounded-spectrum criterion | Exactly two; proposed maxima 2 and 3 | At 2 trigger true and bound false; at 3 trigger absent | Criterion applies only at 2 |
| 4.2 ladder language | α=0,1,ω | Level index order types 2,3,ω+2; all symbol families countable | Countable encoding possible |
| 4.2 ladder satisfaction | α=0; V_(ω+1), U₀=V_ω | Six clauses true; bottom cardinal ℵ₀; top cardinal ℶ₁ | Positive case, R03 |
| 4.2 extensionality control | Two points; E=∅; both levels full; constants enumerate | Predecessor sets ∅=∅; two distinct points; other five clauses true | Sixth clause independently needed, R03 |
| 4.2 limit control | α=ω; enlarge Uω to V_(ω+ω+1) | Earlier union V_(ω+ω); new point V_(ω+ω) outside union; size ℶ_(ω+1)>ℶ_ω | Limit clause rejects wrong model, R03 |
| 4.2 successor bound | α=0, powerset model | #U₀=ℵ₀; predecessor injection gives #U₁=2^ℵ₀=ℶ₁ | Upper bound attained |
| 4.2 von Neumann realization | α=0 and α=ω | #V_(ω+1)=ℶ₁; #V_(ω+ω+1)=ℶ_(ω+1) | Ordinal addition agrees with beth indexing |
| exists_sentence_maximal_model | α=0 | Ladder model size ℶ₁; every ladder model ≤ℶ₁ | Maximal spectrum value attained |
| 4.3 successor lower bounds | α=0 ladder | Sentence Hanf number ℶ₁⁺; global Hanf number ≥ℶ₁⁺>ℶ₁ | Strict inequality direction correct |
| 4.3 cofinal supremum | All countable α versus finite α only | Sup ℶ_(α+1)=ℶ_ω₁ versus ℶ_ω | Finite-index shortcut insufficient |
| lomega1omegaHanfNumber_eq_beth_omega_one | All countable ladder heights | Lower bound ℶ_ω₁; upper bound ℶ_ω₁; equality | Both bounds use the same convention |
| 5.1 HighlyOrderTransitive | ℚ, ℤ, Fin 2 | ℚ sends (0,1) to (2,4); ℤ cannot send (0,1) to (0,2); Fin 2 fixes both points | Positive and two negative controls |
| 5.1 degenerate orders | Empty and singleton orders | Only empty tuples, or one singleton tuple; identity supplies every required automorphism | Both satisfy definition |
| HighlyOrderTransitive.of_field | K=ℚ, tuples (0,1),(2,4) | e(x)=2x+2; e(0)=2,e(1)=4; positive slope 2 | Field route has correct orientation |
| 5.1 density consequence | ℚ and ℤ; interval (0,1) | In ℚ, 1/2 lies between 0 and 1; in ℤ, the interval has 0 elements | Dense positive control, discrete negative control |
| exists_highlyOrderTransitive | κ=ℵ₀ and general infinite κ | ℚ gives ℵ₀; monomial injection gives κ≤#K≤max(κ,ℵ₀)=κ | Exact size, no inaccessible assumption |
| 5.2 IsLω₁ωSmall | Infinite pure sets; empty structure | Equality-pattern counts 1,2,5 at arities 1,2,3; empty has 0 positive-arity types and 1 zero-type | Both small |
| 5.2 negative smallness controls | Ordered field ℝ; order (ω₁,<) | Realized 1-type counts 2^ℵ₀ and ℵ₁ | Both nonsmall |
| 5.2 reduct and isomorphism | Pure infinite set with identity unary function | Expansion and reduct have 1 unary type, 2 binary types | Countability descends; isomorphisms preserve |
| 5.2 potential-isomorphism transfer | Pure sets of sizes ℵ₀ and ℵ₁ | Finite partial bijections extend both ways; 1-types 1=1 and 2-types 2=2 | Relational hypothesis matches supplier |
| exists_small_model_card_eq | Pure infinity, κ=ℵ₁ | Model cardinal ℵ₁; arity-n types are finitely many equality patterns | Large carrier, small type space |
| 5.3 term-code count | Countable Skolem language; homogeneous index order | ≤ℵ₀ term/support codes per arity; each code one orbit; ≤ℵ₀ realized types | Full types, not only fragment types |
| 5.4 countable companion | Pure set of size ℵ₁; empty structure | Companions ℵ₀ and 0; corresponding unary-type counts 1=1 and 0=0 | Empty case separated |
| 5.4 IsCompleteSentence | Exactly one; at least one; ⊥ | Complete true,false,false; at-least-one permits disequality both true and false | Satisfiability is included |
| isCompleteSentence_scottSentence | M=(ℚ,<) | Scott models are DLOs; every infinitary sentence has common value by back-and-forth; M supplies satisfiability | Completeness at all cardinalities |
| 5.4 complete strengthening | Infinite pure set; φ says at least two | σ says infinite; σ true; every σ-model satisfies φ | Entailment orientation correct |
| 5.5 IsCategorical | Pure infinity at ℵ₀; exactly two at ℵ₀ | First has 1 isomorphism class; second has 0, so universal comparison is vacuously true | Existence supplied separately |
| 5.5 completeness versus categoricity | DLO at ℵ₀ and ℵ₁ | Countable models one isomorphism class; ℵ₁-orders with cofinalities ω and ω₁ are nonisomorphic | Completeness does not imply uncountable categoricity |
| 5.6 graph translation | Infinite set with f=id | Graph relation equality; original and graph 1-type counts 1=1; reconstruction f=id | Types and satisfaction agree |
| isLω₁ωSmall_iff_exists_isCompleteSentence_of_countable | Infinite pure set; ordered field ℝ | Both sides true for pure set; both false for ℝ, which has 2^ℵ₀ unary types | Both directions distinguished |
| exists_isCompleteSentence_isCategorical_of_countable | Infinite sets with f=id; κ=ℵ₁ | Choose σ=(f=id ∧ infinite); model size ℵ₁; complete true; categorical true | Functional-language headline represented |
| 5.6 finite/cofinal boundary | φ says exactly two; κ=ℵ₀ | Categoricity predicate true vacuously; cofinal beth hypothesis false | Headline does not infer a nonexistent model |
| Description's library claim | θ=ℵ₁, countably many colours | cf(ℵ₁)=ℵ₁>ℵ₀; pinned pigeonhole gives fibre ≥ℵ₁ | Correct description, R04 |
| Description's validation count | This acceptance file | Admitted declarations 24; emitted sorry warnings 24; claimed count 29 | Correct count, R05 |
| Provenance path base | Root versus InfinitaryLogic/ prefix | Root Hanf module HTTP 404; prefixed module fetched with definitions at lines 60,70,80 | Correct base, R06 |

- Sources: all 15 seeded targets checked against the specified locators; Marker Exercise 1.24 (marker line 311), Chapter 5 (lines 1782–1981), Definition 6.11 (line 2603); Keisler–Knight §1.6 (keisler-knight lines 417–436); Erdős–Rado Theorem 39 proof (erdos-rado lines 2276–2351). No layer marks another locator unverified.
- Pinned cardinal/order declarations: 6 named declarations opened: `Mathlib/SetTheory/Cardinal/Pigeonhole.lean:47`, `Regular.lean:76`, `Aleph.lean:687`, `:712`, `:722`, `Subfield.lean:74`; Hahn-series field/order and von Neumann hierarchy implementations also checked. No existing general Erdős–Rado, EM or Hanf theorem found.
- Pinned model-theory declarations: 8 named declarations opened: `TauCeti/ModelTheory/Infinitary/Fragment.lean:69`, `ModelExistence/Types.lean:72`, `:95`, `:152`, `Scott/Sentence.lean:99`, `:108`, `:115`, `BackAndForth/Presentation.lean:207`; language-map, substitution, symbol restriction, elementary hull and graph reconstruction contracts checked at their pins. Fragment closure does not supply atoms or nonemptiness.
- Cross-roadmap citations: IME 0.1–0.4, 1.1–1.2, 2.2–2.3, 4.1 and Layer 6; InfinitaryLogic Layers 0–3; BanachSpaceTheory B4.1 resolved on main. No second copy, dropped cited ID, conflicting head or fully qualified declaration collision found.
- Gate: every worker counter is 0, including targeted build, statement hygiene, stray files and outside-folder changes; direct elaboration exits 0 with 24 sorry warnings only; worktree unchanged.
- Dependency-check output: `depcheck: 244 roadmaps, 2197 edges, 0 problem(s)`; no UPWARD or CYCLE. No undeclared supplier gap found.
- Signature/probe check: all 46 actual declarations checked with `#check @name`; the scanner's 47th name, “in”, is docstring text. No lost binder. All 24 admitted statements received simple-tactic probes; the two explicit specialization probes close, with 23 remaining admissions in the combined probe file.
- Headline coverage: all statable general endpoints are present; the five construction-carrier exceptions are named in the module docstring. No sorry'd data, stand-in predicate, computational target or route-specific restriction found.

Overlap check: read InfinitaryModelExistence (main and #1615), InfinitaryLogic, CountableModelCounting (main and #2012), CountableStructureSpaces (#1316), RandomGraphs (#1223), GrothendieckUniverses (#1783), and BanachSpaceTheory. IME owns language maps, fragments, types, elementary hulls and graph translation; InfinitaryLogic owns syntax/back-and-forth/Scott sentences; Mathlib owns the von Neumann hierarchy and cardinal pigeonhole; BanachSpaceTheory owns infinite Ramsey. The new language tower, EM term model, finite-exponent Erdős–Rado and Hanf/small-model endpoints belong here; no second owner found.

Source independence: 22 mathematical/prose passages compared with Marker, Keisler–Knight and Erdős–Rado, plus four definition passages against the external formalization. No copied expository passage or reused table identified. Marker has 25 of 28 named source-citation groups in the layers; the separate provenance file index concerns the formalization. Marker's contents were read: its §§5.1–5.4 do not map one-to-one to these six layers. Dependencies 3.3→0.4, 3.4→2.3 and 5.3→2.3/5.1 force the relevant order; templates and the single term model supply separate consumers. The identical order-transitivity declaration is recorded for licence review below.

## Not verifiable

- marker-book: Cambridge metadata supports the cited chapter titles/pages; the 2016 book's full text was unavailable. All “Marker's notes” locators were checked against the accessible 2013 notes, not transferred from the book.
- keisler: the 1971 book was unavailable through the sources service and author/publisher searches; bibliography-only reference, not used to certify a sampled target.
- morley: the 1965 chapter, pp.265–273, was unavailable through the sources service and publisher search; the countable-language omitting-types statement was checked in marker line 1945 instead.
- kanamori: publisher access was paywalled/uncertified; the background claim about κ(ω) was not source-certified.
- The external integration harness and complete proof-dependency cone were not executed. The cited guard script was read; local elaboration and the ownership audit do not certify its reported execution.

## Source issues

- **Misprint** in marker at proof of Theorem 5.2, second claim, printed p.58: the final tuple index is j_n despite the formula's m arguments; it should be j_m; affects nothing.
- **Error** in marker at Theorem 5.11, printed p.59: the conclusion allows every cardinal κ, including finite ones; it should require κ infinite; affects a stated result.
- **Error** in marker at Exercise 5.12, printed p.59: highly order-transitive orders are asserted for every cardinal; it should restrict to infinite cardinals, with 0 and 1 separate trivial cases; affects a stated result.
- **Misprint** in marker at Theorem 6.12, printed p.78: the hypothesis uses φ and the conclusion uses ψ; both should use φ; affects nothing.

## For the human reviewers

- Licence: `Suggested.lean:393` reproduces the name, binders and body of `HighlyOrderTransitive` from `cameronfreer/infinitary-logic`, `InfinitaryLogic/Methods/HighlyOrderTransitive.lean:30`, commit 518a366 (infinitary-logic line 34). Its header and repository LICENSE state Apache 2.0; assess attribution and compatibility.
