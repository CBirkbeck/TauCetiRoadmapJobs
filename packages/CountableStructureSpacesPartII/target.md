Verdict: part-ii
Name: CountableStructureSpacesPartII
Base: CountableStructureSpaces
Owner: none

# CountableStructureSpaces, Part II: Borel reducibility of isomorphism relations and Borel completeness

The base roadmap `TauCetiRoadmap/CountableStructureSpaces` (open pull request #1316, author
cameronfreer) builds the coding space of countable relational structures on ℕ, the Polish group
S∞ = `Equiv.Perm ℕ` with its logic action, the isomorphism relation `structureIsoSetoid L` as the
orbit relation, model classes, the Borel back-and-forth levels, the external Scott height, the
López–Escobar theorem and the well-order class. It names Borel completeness of countable graphs
and linear orders as out of scope. This Part II starts there and develops the comparison of
isomorphism relations by Borel reducibility, up to Borel completeness and its characterisations.

## Scope

**Owns.**

1. The Borel reducibility preorder `≤_B` *between isomorphism relations of classes of countable
   structures*, stated against the general definition `BorelReducible` of
   BorelEquivalenceRelations §5.1: reflexivity and transitivity are consumed; this roadmap adds
   restriction of the source relation to a Borel subset, the induced injection on isomorphism
   types without injectivity on codes, and the contrast with reducibility `≤_R` of the relation
   as a *set* `E ⊆ X × X` (a Borel map on `X × X`), with `≤_B ⇒ ≤_R` and a Check that the
   converse fails (paolini-shelah-tfab, Definitions 1.2 and 1.4, Remark 1.5).
2. **Borel completeness.** For a countable relational language `L` and an invariant Borel class
   `K ⊆ StructureSpace L`, `BorelComplete K` holds when for every countable relational language
   `L'` (presented in universe 0, as CountableModelCounting does) and every invariant Borel class
   `K' ⊆ StructureSpace L'`, the isomorphism relation restricted to `K'` is Borel reducible to the
   isomorphism relation restricted to `K` (paolini-shelah-tfab, Definition 1.6; camerlo-gao-boolean
   lines 104–110). The extension to an isomorphism-closed class 𝐊 of countable structures through
   its members with carrier ℕ, written 𝐊_ω (paolini-shelah-tfab, Convention 1.9).
3. **Classes with function symbols.** The base coding space is relational. Groups, fields, Boolean
   algebras and abelian groups are treated as invariant Borel classes of codes in the relational
   language in which every operation is replaced by its graph: the graph language and the graph
   axioms are consumed from InfinitaryModelExistence Layer 6, and the class is the Borel set of
   codes satisfying the graph axioms together with the axioms of the theory. This roadmap owns the
   comparison with the functional model space (structures on ℕ with operations as elements of
   `(Fin n → ℕ) → ℕ`, product topology): an S∞-equivariant Borel isomorphism onto the Gδ set of
   codes of total functions, so that Borel completeness and Borel reducibility are the same on
   either side, and Borel completeness quantified over relational `L'` only is the same notion as
   quantified over all countable `L'`.
4. **Borel S∞-spaces**: standard Borel spaces with a jointly Borel action of S∞ (with the Borel
   structure of the Polish group of base Layer 1.1), their orbit equivalence relations, equivariant
   Borel embeddings, and the Becker–Kechris universality theorem for S∞ (target 4 below).
5. The headline theorems of the next section: Friedman–Stanley for graphs, linear orders and trees;
   the four characterisations of Borel completeness; complete analyticity and non-Borelness of the
   isomorphism relation of a Borel complete class; the Friedman–Stanley obstruction; Boolean
   algebras, groups and fields; the statement of the Paolini–Shelah theorem; the contrast with the
   lower part of the hierarchy.

**Boundaries.**

- The general theory of Borel reducibility (definition, preorder, smoothness, E₀, Silver in
  reducibility form) is BorelEquivalenceRelations §5 and is imported, never restated. The two
  general facts this roadmap needs beyond it (restriction to a Borel subset; `≤_B` versus `≤_R`)
  are stated in its own Layer 0 against `BorelReducible`; the design records them as candidates
  for the supplier and does not build a parallel API.
- Countable Borel equivalence relations, essentially countable relations, hyperfiniteness and the
  Glimm–Effros dichotomy are owned by no roadmap and are out of scope here. The "lower part of the
  hierarchy" layer uses only what BorelEquivalenceRelations owns: smooth relations are Borel, E₀ is
  not smooth. An essentially countable relation appears at most as a definition with the one
  remark that it is Borel; the design may drop it.
- Universal Borel G-spaces for Polish groups other than S∞ (becker-kechris-bams, Theorem 2.1 in
  general), Polish group actions in general, the topological Vaught conjecture: out of scope.
- The Ulm classification of countable abelian p-groups and the proof of the Paolini–Shelah theorem
  are out of scope: the first is a stated target whose proof needs Ulm's theorem, which no roadmap
  owns; the second is stated and not proved (target 7).
- Counting models, thinness and Vaught's conjecture: CountableModelCounting. López–Escobar, Scott
  height, the well-order class: the base.

**Generality.** The filed wording is already the general statement: every countable language, every
Borel class, Borel (not continuous) reductions, carrier ℕ throughout. Three points fix the
generality the design must keep: (a) Borel completeness is defined with the quantifier over
relational `L'` and proved equivalent to the quantifier over all countable `L'` through item 3;
(b) the S∞-completeness characterisation is for Borel actions on standard Borel spaces, not only
continuous actions on Polish spaces (becker-kechris-bams, §2); (c) where a source gives a
continuous reduction (Paolini–Shelah), the continuous form is recorded as a strengthening, and
the Checks include a continuous reduction for graphs into linear orders if the design's coding is
continuous.

## Final targets

Each is a headline of `Suggested.lean`, statable at the pins with Mathlib alone plus the simple
definitions (`RelQueryOn`, `StructureSpaceOn`, the action, the orbit relation, `BorelReducible`,
`BorelComplete`): no Lω₁ω syntax is needed for any statement. Notation: for a countable relational
`L` and invariant Borel `K ⊆ StructureSpace L`, `≅_K` is `structureIsoSetoid L` restricted to `K`;
`Graph_ω` is the closed invariant class of codes of simple graphs in `Language.graph` (symmetric
irreflexive binary relation); `LO_ω` the closed invariant class of codes of strict linear orders in
a language with one binary relation; `Tree_ω` the class of codes of trees in the sense of the
sources (rooted connected acyclic graphs, or subsets of `ℕ^{<ℕ}` closed under initial segments
with the extension order; the design fixes one of the two presentations and proves the other
reducible to it).

1. **The preorder on isomorphism relations.** For invariant Borel `K ⊆ StructureSpace L` and
   `K' ⊆ StructureSpace L'` and a Borel `A ⊆ K'`: `≅_{K'} ≤_B ≅_K` implies `≅_A ≤_B ≅_K`
   (restriction); a Borel reduction `f` of `≅_{K'}` to `≅_K` induces an injection of the set of
   isomorphism types of `K'` into that of `K`, and need not be injective on codes (Check: the
   constant-on-orbits reduction of a class with one orbit); `E ≤_B F` implies `E ≤_R F` for the
   graphs as subsets of the squares, and not conversely (Check: E₀ `≤_R` the diagonal of Cantor
   space, both being Borel sets with nonempty complement, while E₀ is not Borel reducible to it by
   BorelEquivalenceRelations `not_isSmooth_eZero`). Locators: paolini-shelah-tfab Definitions
   1.2 and 1.4 (lines 70–87), Remark 1.5 (lines 88–91); gao-idst §5.1 (uncertified).

2. **Friedman–Stanley.** `borelComplete_graph : BorelComplete Graph_ω`: for every countable
   relational `L'` and invariant Borel `K' ⊆ StructureSpace L'`, `≅_{K'} ≤_B ≅_{Graph_ω}`, by an
   explicit Borel map from `StructureSpace L'` to graph codes, proved Borel (each coordinate of the
   graph is a Boolean combination of finitely many coordinates of the input, so the map is
   continuous) and isomorphism-reflecting (an isomorphism of the coding graphs restricts to an
   isomorphism of the coded structures, the gadgets being recoverable from the graph). Hence
   `BorelComplete LO_ω` and `BorelComplete Tree_ω`, by explicit codings of graphs into trees and of
   trees into linear orders, each proved Borel and isomorphism-reflecting. Locators:
   friedman-stanley-1989 Theorem 1 and §2 (uncertified); gao-idst §13.2 (uncertified); the
   statement is recorded in paolini-shelah-tfab line 125 and camerlo-gao-boolean lines 111–114.

3. **Characterisations.** For invariant Borel `K ⊆ StructureSpace L`, the following are equivalent:
   (i) `BorelComplete K`; (ii) `≅_{Graph_ω} ≤_B ≅_K`; (iii) for every countable relational `L'`,
   `structureIsoSetoid L'` on all of `StructureSpace L'` is Borel reducible to `≅_K`; (iv) for
   every countable relational `L'` and every Borel, not necessarily invariant, `B ⊆ StructureSpace L'`,
   the restriction of `structureIsoSetoid L'` to `B` is Borel reducible to `≅_K`; (v)
   (S∞-completeness) for every Borel S∞-space `X`, the orbit equivalence relation of `X` is Borel
   reducible to `≅_K`. (i)⇔(ii)⇔(iii)⇔(iv) are target 2 plus restriction; (v)⇒(iii) is the logic
   action being a Borel S∞-space; (iii)⇒(v) is target 4. Locators: camerlo-gao-boolean lines
   94–105 (the equivalence of "C∞ ≤_B E" with reduction of every `Mod(L)`); gao-idst §13.1
   (uncertified); becker-kechris-1996 §2.7 and §3.4 (uncertified).

4. **Becker–Kechris universality for S∞.** Every Borel S∞-space Borel-embeds equivariantly into the
   logic action on `StructureSpace L∞`, where `L∞` has one `n`-ary relation symbol for each `n`;
   hence its orbit relation is Borel reducible to `structureIsoSetoid L∞`, and the logic action on
   `StructureSpace L∞` is a universal Borel S∞-space. Locators: becker-kechris-bams Theorem 2.1
   (line 132) and Corollary 2.2 (lines 174–177), with the proof sketches at lines 222–262 (the
   embedding through closed subsets of Baire space coded by trees); full proofs in
   becker-kechris-1996 §2.6–§2.7 (uncertified).

5. **Consequences of Borel completeness.** If `BorelComplete K` then: (a) `≅_K ⊆ K × K` is a
   complete analytic set, in the sense that every analytic subset of a standard Borel space is
   `≤_R`-reducible to it (paolini-shelah-tfab Definition 1.3, Fact 1.7, lines 79–81 and 103–106;
   kechris-cdst §27.C–D, uncertified); the route is the tree representation of analytic sets
   (base Layer 3), the ill-founded trees as a complete analytic set, and a Borel map from trees to
   pairs of structures that are isomorphic exactly when the tree is ill-founded, composed with
   target 2; (b) `≅_K` is not Borel, since the complement of the base's coded well-order class is
   analytic and not Borel (base Layer 6.2) and `≤_R` preserves Borelness; (c) `≅_K` is not smooth
   (BorelEquivalenceRelations §5.2: smooth relations are Borel) and E₀ `≤_B ≅_K` (through (v) of
   target 3, E₀ being the orbit relation of a Borel action of a countable group, which the design
   realises as a Borel S∞-space, or through a direct coding; the design chooses); (d) `K` has
   perfectly many isomorphism types: equality on Cantor space Borel-reduces to `≅_K`.

6. **The converse of 5(a) fails: the Friedman–Stanley obstruction.** (a) General lemma: if an
   invariant Borel class `K` is the union of an increasing ω₁-sequence of invariant Borel subclasses
   `K_α` on each of which isomorphism is Borel, and the rank `K → ω₁` is bounded on every analytic
   subset of `K`, then `K` is not Borel complete (the image of a Borel reduction from graphs is
   analytic, so lands in one `K_α`, making `≅_{Graph_ω}` Borel, against 5(b)). The boundedness
   hypothesis is discharged by the base's `analytic_treeHeight_bounded` when the rank is a tree
   height. (b) Stated target: the class of countable torsion abelian groups (equivalently abelian
   `p`-groups) has complete analytic isomorphism relation and is not Borel complete; its proof
   needs Ulm's theorem and the Ulm length as the rank, which no roadmap owns, and the design
   records it as a statement with that dependency. Locators: friedman-stanley-1989 §4
   (uncertified); hjorth-kechris-1996 §4–§5 (uncertified); the statement at paolini-shelah-tfab
   lines 103–106 and 126, camerlo-gao-boolean lines 115–118.

7. **Further Borel complete classes.** (a) `BorelComplete BA_ω`, countable Boolean algebras,
   through the Camerlo–Gao reduction from graphs: the Boolean algebra of clopen sets of the
   separable Boolean space `X_G` built from a graph `G` (camerlo-gao-boolean Theorem 1, lines
   405–416, and the theorem at line 555; a full legal proof is available). (b) `BorelComplete Gp_ω`,
   countable groups, through the Mekler coding of a graph in a class-2 nilpotent group of exponent
   `p` (mekler-1981 §2, uncertified; stated as classical in camerlo-gao-boolean lines 111–112 and
   paolini-shelah-tfab line 127). (c) `BorelComplete Field_ω`, countable fields of a fixed
   characteristic (friedman-stanley-1989 §3, uncertified). (d) The Paolini–Shelah theorem:
   `BorelComplete TFAB_ω`, countable torsion-free abelian groups, witnessed by a continuous map from
   graph codes to codes of torsion-free abelian groups that reflects and preserves isomorphism
   (paolini-shelah-tfab, Main Theorem, lines 169–171). This roadmap makes (d) statable and states
   it; its proof is a later roadmap, and the design keeps it out of `Suggested.lean` unless it
   commits to proving it. For (b) and (c) the design decides between proof and statement on the
   basis of the codings it can reconstruct; (a) is a proof target.

8. **The lower part of the hierarchy, for contrast.** On a model class of bounded Scott height
   isomorphism is Borel (base `measurableSet_iso_inter_of_scottHeight_le`, consumed, not
   restated); a smooth isomorphism relation is Borel (BorelEquivalenceRelations §5.2, consumed);
   hence a Borel complete class has unbounded Scott heights and non-smooth isomorphism relation,
   while a class with countably many isomorphism types (one unary predicate, base worked example 2)
   is smooth. E₀ sits strictly between: it is not smooth and is reducible to every Borel complete
   isomorphism relation (target 5(c)). Locators: gao-idst §5.2 and §13.1 (uncertified);
   BorelEquivalenceRelations §5.2–§5.4.

## Suppliers

- **CountableStructureSpaces** (base; pull request #1316, cameronfreer; not on the merge order,
  another author's open pull request): Layer 0 (`StructureSpaceOn`, `StructureSpace`, Polish and
  standard Borel instances, `toStructure`, `ofStructure`, `graphCode`), Layer 1 (`polishSpace_perm`,
  the action, `orbitRel_iff_nonempty_equiv`, `ActionInvariant`, `IsomorphismInvariant`,
  `analyticSet_orbitRel_graph`), Layer 2 (`modelsOf`, `measurableSet_modelsOf`,
  `standardBorelSpace_modelsOf` for the classes as standard Borel spaces), Layer 3 (`body`,
  `treeHeight`, `analytic_treeHeight_bounded`, `exists_tree_of_analyticSet`), Layer 4.1 and 4.3
  (`structureIsoSetoid`, `structureIsoSetoid_eq_orbitRel`,
  `measurableSet_iso_inter_of_scottHeight_le`), Layer 6.2 (`wellOrderClass`,
  `not_measurableSet_wellOrderClass` and the analyticity of its complement).
- **BorelEquivalenceRelations** (main): §0.3 (`AnalyticSet.prod`, Lusin–Souslin consequences),
  §0.4 (perfect sets in Borel sets), §5.1 (`BorelReducible`, `refl`, `trans`, injection on
  quotients, reductions between equalities), §5.2 (`IsSmooth`, smooth relations are Borel), §5.4
  (`eZero`, `not_isSmooth_eZero`, `borelReducible_bot_eZero`).
- **InfinitaryModelExistence** (main): Layer 6 (`graphLanguage`, graph expansion, `graphAxioms`,
  `relationalize`, reconstruction) for classes of structures with function symbols.
- **Mathlib** at the pin: `PolishSpace`, `StandardBorelSpace`, `MeasureTheory.AnalyticSet` with
  Lusin separation and Suslin, `MeasurableEmbedding`, `Descriptive.tree`, `Equiv.Perm`,
  `MulAction.orbitRel`, `Language.graph` with `SimpleGraph.structure` and `Theory.simpleGraph`,
  `Language.order`.
- Tau Ceti at the pin supplies nothing specific; the Infinitary, BackAndForth and Scott modules of
  the completed InfinitaryLogic roadmap are absent at Tau Ceti `358314d4` (base review R03), which
  is why no headline here uses Lω₁ω syntax.

## Consumers

- **CountableModelCounting** (main): a Borel complete class has perfectly many countable models
  (target 5(d)), a ready source of non-thin classes and of the failure of Borel complete invariants
  in its sense (its §4e).
- A future roadmap proving the Paolini–Shelah theorem (torsion-free abelian groups), and future
  roadmaps on the Ulm classification of abelian p-groups, countable Borel equivalence relations and
  Glimm–Effros, Polish group actions and universal G-spaces beyond S∞, and classification of
  separable C*-algebras and Boolean spaces (camerlo-gao-boolean, §4–§5).
- Any roadmap that needs "the isomorphism problem for countable X is as hard as possible" as a
  benchmark: countable groups, fields, Boolean algebras, linear orders, trees.

## Sources

Recorded in `packages/CountableStructureSpacesPartII/sources.toml`.

| id | work | what for | licence / status |
| --- | --- | --- | --- |
| paolini-shelah-tfab | Paolini–Shelah, *Torsion-free abelian groups are Borel complete*, Ann. of Math. 199 (2024); arXiv:2102.12371 | Definitions 1.2–1.6, Remark 1.5, Fact 1.7, Convention 1.9 (lines 70–121); Main Theorem (lines 169–171); the summary of Friedman–Stanley (lines 125–128) | open repository (arXiv), certified |
| becker-kechris-bams | Becker–Kechris, *Borel actions of Polish groups*, Bull. AMS 28 (1993); arXiv:math/9304208 | Borel embeddings and universal Borel G-spaces (lines 126–131), Theorem 2.1 (line 132), Corollary 2.2 (lines 174–177), Corollary 2.3 (line 186), proof sketches (lines 222–262) | open repository (arXiv), certified; announcement with sketches only |
| camerlo-gao-boolean | Camerlo–Gao, *The completeness of the isomorphism relation for countable Boolean algebras*, Trans. AMS 353 (2001) | definitions and the equivalence with S∞-completeness (lines 79–110), the classical list (lines 111–118), Theorem 1 (line 405) and its proof (lines 405–553), main theorem (line 555) | publisher open archive (AMS), certified |
| friedman-stanley-1989 | Friedman–Stanley, JSL 54 (1989), doi 10.2307/2274750 | Theorem 1 (graphs), §2 (trees, linear orders), §3 (fields), §4 (torsion abelian groups) | paywalled; uncertified, cited by locator; section numbers from memory |
| gao-idst | Gao, *Invariant Descriptive Set Theory*, CRC 2009 | §5.1–§5.2 (reducibility), §13.1–§13.2 (Borel completeness, Friedman–Stanley) | paywalled; uncertified |
| becker-kechris-1996 | Becker–Kechris, LMS Lecture Notes 232, 1996 | §2.5–§2.7 (Mod_L, universal S∞-spaces), §3.4 | paywalled; uncertified |
| kechris-cdst | Kechris, *Classical Descriptive Set Theory*, GTM 156 | §9.B, §16.C, §27.C–D (complete analytic sets, isomorphism of countable structures) | paywalled; uncertified |
| hjorth-2000 | Hjorth, *Classification and Orbit Equivalence Relations*, AMS 2000 | Chapter 1 | paywalled; uncertified |
| hjorth-kechris-1996 | Hjorth–Kechris, APAL 82 (1996) | §4–§5 (Ulm-type classification, obstruction) | paywalled; uncertified |
| mekler-1981 | Mekler, JSL 46 (1981), doi 10.2307/2273227 | §2 (graphs in class-2 nilpotent groups of exponent p) | paywalled; uncertified |

No text is listed as missing: the paywalled works are cited by locator, as the issue form
prescribes.

## Risks

1. **Proofs of the central theorems are legally readable only in part.** The Friedman–Stanley
   codings (graphs, trees, linear orders, fields), Gao's chapter 13 and the full Becker–Kechris
   proof of universality are paywalled. Mitigation: the codings are standard and short enough for
   the design to write from scratch with its own proofs (graph coding of a relational structure;
   tree coding of a graph; linear-order coding of a tree through well-ordered and ℚ-shuffled
   blocks); the Becker–Kechris announcement contains the proof sketches of Theorem 2.1 and
   Corollary 2.2 (becker-kechris-bams lines 222–262); Camerlo–Gao is fully readable. The design
   must not guess section numbers of the paywalled works beyond what the manifest records.
2. **The base is an open pull request with blocking findings** (board report
   `packages/CountableStructureSpaces/reports/PRREVIEW-CountableStructureSpaces~1.md`: 13 findings,
   6 blocking, among them removal of Lω₁ω-dependent declarations from its `Suggested.lean`). The
   interface this Part II consumes (Layers 0–3, 4.1, 4.3, 6.2) is the part least likely to move,
   and no headline here depends on infinitary syntax; the design must re-check the base's names at
   its head before citing them.
3. **Nothing infinitary exists at the pins.** Tau Ceti `358314d4` has no `ModelTheory/Infinitary`,
   `BackAndForth` or `Scott` modules, and Mathlib `f6090c70` has no Borel reducibility, no topology
   on `Equiv.Perm ℕ` and no structure space. `Suggested.lean` must carry the few definitions it
   needs (coding space, action, orbit relation, `BorelReducible`, `BorelComplete`, Borel S∞-space)
   and nothing else; every headline above is statable that way.
4. **Function symbols.** Groups, fields and abelian groups need the graph translation
   (InfinitaryModelExistence Layer 6, on main) or a functional model space; the comparison between
   the two is a target of this roadmap (Scope item 3) and a possible source of ownership friction
   with InfinitaryModelExistence, which owns the translation but not the coding space. The design
   must consume the translation by name and own only the coding-space side.
5. **Heavy stated targets.** The Paolini–Shelah theorem (an Annals paper) and the torsion abelian
   group obstruction (needing Ulm's theorem) cannot be proved in this roadmap; they are stated
   targets, and `Suggested.lean` must not promise them unless the design plans their proofs. The
   general obstruction lemma (target 6(a)) and Boolean algebras (target 7(a)) are proof targets.
6. **S∞-completeness needs Borel actions on standard Borel spaces.** Defining Borel S∞-spaces and
   equivariant Borel embeddings is new library; it touches general Polish group actions, which no
   roadmap owns, and the design must keep it to S∞ and to what target 4 needs.
7. **Ownership of two general reducibility lemmas** (restriction; `≤_B` versus `≤_R`): they belong
   naturally to BorelEquivalenceRelations §5.1, which is on main and does not state them. The design
   states them in its Layer 0 against `BorelReducible` and records them as upstream candidates; it
   must not redefine reducibility.
