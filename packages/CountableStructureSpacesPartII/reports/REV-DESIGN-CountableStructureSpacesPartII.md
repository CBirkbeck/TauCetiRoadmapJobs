<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/6568#issuecomment-6658063082 -->
Review (claude) of 7791b62

Verdict: needs_changes

1. **F01** (P2) Non-closedness of the functional graph-code range needs a function symbol

   - **Location:** `packages/CountableStructureSpacesPartII/design/README.md` line 413
     ("its range is the set of codes in which every graph relation is the graph of a total
     function, a Gδ set that is not closed") and `design/plan.json` target 1.5 ("its range is the
     Gδ, non-closed set").
   - **Claim:** for every `L` with countably many function and relation symbols, the range of the
     graph-code map is not closed.
   - **Witness:** `L = Language.graph` (relational, allowed by the hypothesis "function symbols
     allowed"): the function table is the empty map, `graphLanguage L` has only base symbols, and
     the range is the whole coding space, which is closed. The roadmap's own third Check of 1.3
     ("For relational `L` the function table is the empty map, and the graph-code map is the base's
     coding composed with the relabelling of symbols") describes exactly this case.
   - **Repair:** state the clause with its hypothesis: "a Gδ set, which is not closed when `L` has
     at least one function symbol (and is the whole space when `L` is relational)". The second Check
     of 1.3 (values `n` at `0` converging to a code with no value at `0`) is the witness for the
     non-closed case; keep it. Tested: with one constant symbol the codes `c_n` with graph relation
     `{n}` converge to the all-false code, which fails totality, so the range is not closed;
     with `L = Language.graph` every code is in the range. Apply the same clause to plan.json 1.5.

2. **F02** (P3) Finite-condensation sentence of 3.3 omits "finite"

   - **Location:** README line 639: "the finite condensation classes of the image (maximal sets any
     two of whose points bound a finite interval) are exactly the final finite parts of the blocks".
   - **Claim:** every maximal set of points pairwise bounding a finite interval is a final finite
     part of a block.
   - **Witness:** in the block of `[]` of any graph code, the indices `≥ χ_c([]) + 2` in increasing
     order form a copy of `ω`; any two of its points bound a finite interval, and it is maximal (a
     point of the finite part is separated from it by the tail of `ω`). So the `ω`-parts are also such
     classes. plan.json 3.6 `finite_condensation_classes` states it correctly ("and that are
     finite").
   - **Repair:** "the condensation classes that are finite are exactly the final finite parts of the
     blocks, of size `χ_c(x) + 2`; the `ω`-parts are the infinite classes". The proof is unchanged:
     an order isomorphism maps finite classes to finite classes of the same size, in order.

3. **F03** (P3) Check of 4.1 on uncountable languages is not a ZFC statement as written

   - **Location:** README lines 752–754: "For a language with uncountably many unary symbols the
     coding space has cardinality greater than the continuum (base Layer 0), so it is not standard
     Borel"; plan.json 4.1 test `uncountable_language`.
   - **Claim:** `2 ^ κ > 𝔠` for every uncountable `κ`.
   - **Witness:** for `κ = ℵ₁` the space has cardinality `2 ^ ℵ₁` (base Layer 0: `2 ^ #RelQueryOn`),
     and `2 ^ ℵ₁ = 2 ^ ℵ₀` is consistent with ZFC (it holds under Martin's axiom with `¬CH`), so the
     inequality is not provable for "uncountably many". The conclusion (not standard Borel) is still
     true, by a different reason: singletons are not measurable for the product σ-algebra of an
     uncountable product.
   - **Repair:** either "with at least continuum many unary symbols the space has cardinality
     `2 ^ 𝔠 > 𝔠`", or keep "uncountably many" and argue by non-measurability of singletons.

4. **F04** (P3) Layer 5 has no `### Examples` subsection

   - **Location:** README lines 806–839: Layer 5 ends with `**Checks.**` then `### Dependencies`.
   - **Claim:** house shape requires every layer to end with `### Examples` and `### Dependencies`.
   - **Witness:** the other six layers have both; Layer 5 has only `### Dependencies` (line 837).
   - **Repair:** add `### Examples` before `### Dependencies`, naming `graphClass`, the empty class
     and the one-unary-predicate class, which the Checks already use.

5. **F05** (P3) Locators missing in README 1.1 and 2.2

   - **Location:** README 1.1 (lines 327–357) and 2.2 (lines 497–518) carry no parenthetical
     locator; plan.json 1.1 cites becker-kechris-bams lines 159–164 and plan.json 2.3 cites
     montalban-cst1 Theorem VI.27, lines 4623–4654.
   - **Claim:** every theorem carries a locator at the claim.
   - **Witness:** becker-kechris-bams line 162 states the relabelling form of the logic action;
     montalban-cst1 lines 4632–4654 are the flag gadgets that distinguish coded vertices.
   - **Repair:** add "(own construction; the relabelling action is becker-kechris-bams lines
     159–164)" to 1.1 and "(own construction; flags distinguishing coded vertices:
     montalban-cst1 Theorem VI.27, lines 4623–4654)" to 2.2.

6. **F06** (P3) plan.json 6.7 cites a passage about Σ¹₁-completeness for non-smoothness

   - **Location:** `design/plan.json` target 6.7 `not_isSmooth_of_borelComplete`, locator
     "montalban-cst2 lines 9046–9054 (classes on top have unbounded Scott rank)".
   - **Claim:** that passage supports `¬ IsSmooth (classIso K)`.
   - **Witness:** montalban-cst2 lines 9046–9054 argue Σ¹₁-completeness of the isomorphism set and
     unbounded Scott rank; smoothness is not mentioned. The README's 6.3 cites camerlo-gao-boolean
     lines 94–100 and BorelEquivalenceRelations §5.4 for this consequence.
   - **Repair:** set the 6.7 locator to "camerlo-gao-boolean lines 94–100; BorelEquivalenceRelations
     §5.4 `not_isSmooth_of_borelReducible_eZero`", matching the README.

7. **F07** (P3) Camerlo–Gao locators for trees describe rooted binary trees

   - **Location:** README 3.5 (line 700: "rooted trees as partial orders: camerlo-gao-boolean
     lines 257–263"); plan.json 3.9 and 3.12 locators (lines 257–263, 276–281).
   - **Claim:** the cited passage defines the roadmap's `treeClass` (partial order with least
     element and finite linearly ordered principal down-sets).
   - **Witness:** camerlo-gao-boolean lines 257–263 define rooted *binary* trees through a parent
     function with at most two children per node, and lines 276–281 identify them with subtrees of
     `2^{<ℕ}`; the roadmap's trees are finitely or infinitely branching subsets of `List ℕ`.
   - **Repair:** cite the passage as "rooted binary trees as partial orders, the binary case" or
     move the citation to a Check; the definition itself is the roadmap's own.

8. **F08** (P3) `Ordinal.toType` is spelled `Ordinal.ToType` at the pin

   - **Location:** README line 139 (From Mathlib list).
   - **Witness:** `Mathlib/SetTheory/Ordinal/Basic.lean` line 642 uses `o.ToType`
     (`ToType.mk : Set.Iio o ≃o o.ToType`); no `Ordinal.toType` exists at the pin.
   - **Repair:** write `Ordinal.ToType`.

9. **F09** (P3) Closing section "Motivation for a future roadmap" is outside the house shape

   - **Location:** README lines 1008–1023.
   - **Claim:** the shape ends with `## Downstream consumers`, optionally `## Worked examples`, and
     `## References`; "future roadmap" is deferral language.
   - **Witness:** the section repeats the deferrals already listed under `## Scope and ownership`
     (lines 65–68) with their locators, and `## Downstream consumers` already points to it.
   - **Repair:** move the locators (camerlo-gao-boolean Theorem 1 line 405 and line 555;
     paolini-shelah-tfab lines 103–106 and 169–171; mekler-1981 §2; friedman-stanley-1989 §3–§4;
     hjorth-kechris-1996 §4–§5; montalban-cst2 Lemma XI.2 lines 8946–8980) into the deferral
     sentence of `## Scope and ownership`, and delete the section.

10. **F10** (P3) "Not analytic" consequence of 6.2 should name its ambient space

   - **Location:** README lines 905–907: "The set of non-isomorphic pairs in `K × K` is not analytic
     (Suslin, …)".
   - **Claim:** analyticity is meant in the subtype product `K × K`.
   - **Witness:** for `K` Borel but not Gδ (the base's API warning in its Layer 2 gives such a
     model class) the subspace topology on `K` is not Polish, and Mathlib's
     `AnalyticSet.measurableSet_of_compl` needs the complement in the whole space; the proof as
     sketched works in `StructureSpace L × StructureSpace L`, where the complement of the
     non-isomorphic pairs is the union of the analytic set `iso ∩ (K ×ˢ K)` and the Borel set
     `(K ×ˢ K)ᶜ`.
   - **Repair:** "the set `{p ∈ K ×ˢ K | ¬ p.1 ≅ p.2}` is not an analytic subset of
     `StructureSpace L × StructureSpace L`" under the standing hypothesis that `K` is invariant Borel.

One P2 finding (a theorem clause stated without the hypothesis it needs) and nine P3 notes. The
mathematics of the seven layers is sound: every sampled target, every headline theorem and every
proof route was recomputed on instances (table under `## Verified sound`), every supplier
citation resolves at the supplier's current head or on main, every cited Mathlib declaration
exists at the pin (one spelling slip), and no roadmap on main or in an open pull request owns the
objects this roadmap builds. The repairs are short; the fix round should take minutes.

## Verified sound

**Principles.** No route-specific shortcut; no re-planned roadmap (Borel reducibility, the coding
space, the logic action, back-and-forth, the small presentation, the graph translation and the
Polish realization are consumed by name; `SetReducible`, `classIso`, `BorelComplete`, the
functional coding space, the codings, Borel S∞-spaces and the universal embedding exist nowhere
else, see the ownership search below); every supplier is earlier (gate output below); the README
is in the author's words (compared against every sampled passage); no algorithm; no Lean file at
the design stage, so no sorry'd data or `set_option` to check.

**Dependency check.** Output of the gate command on the design README:

```
candidate: CountableStructureSpacesPartII is not in the merge order yet; checked as if placed after NoncompactQuantumSymmetry (the intake inserts it when its design is accepted)
depcheck: 236 roadmaps, 2181 edges, 0 problem(s)
```

No UPWARD or CYCLE line. The base `CountableStructureSpaces` is an open pull request by another
author that adds a new roadmap folder, so citing it is allowed; it is not in the merge order,
and its interface is a stated contract (the brief's rule for sections still in a pull request).
Every name this roadmap takes from it was found at its head: 37 names (`RelQueryOn`,
`StructureSpaceOn`, `StructureSpace`, `toStructure`, `ofStructure`, `encodeVia`,
`nonempty_equiv_encodeVia`, `isClopen_setOf_apply`, `mk_structureSpaceOn_le_continuum`,
`graphCode`, `measurableEmbedding_graphCode`, `instTopologicalSpacePerm`,
`hasBasis_nhds_one_fixingSubgroup`, `isTopologicalGroup_perm`, `polishSpace_perm`, `smul_apply`,
`continuousSMul_structureSpaceOn`, `orbitRel_iff_nonempty_equiv`, `ActionInvariant`,
`IsomorphismInvariant`, `actionInvariant_iff_isomorphismInvariant`, `analyticSet_orbitRel_graph`,
`modelsOf`, `measurableSet_modelsOf`, `standardBorelSpace_modelsOf`, `analytic_treeHeight_bounded`,
`structureIsoSetoidOn`, `structureIsoSetoid`, `structureIsoSetoidOn_eq_orbitRel`,
`structureIsoSetoid_eq_orbitRel`, `bfEquivSetoid`, `scottHeight`,
`measurableSet_iso_inter_of_scottHeight_le`, `exists_uniform_bfSeparation`, `lopez_escobar`,
`wellOrderClass`, `exists_mem_wellOrderClass_type_eq`, `analyticSet_compl_wellOrderClass`,
`not_measurableSet_wellOrderClass`), each in `TauCetiRoadmap/CountableStructureSpaces/README.md`
or `Suggested.lean` at that head. The signatures consumed were read: `smul_apply` (Lean line 206,
`(σ • c) ⟨R, v⟩ = c ⟨R, ⇑σ⁻¹ ∘ v⟩`, matching Convention 4), `exists_uniform_bfSeparation`
(Lean 629–634, analytic set of non-isomorphic pairs in the ambient square, conclusion
`¬ BFEquiv β 0` on empty tuples), `measurableSet_iso_inter_of_scottHeight_le` (Lean 570–577, on
`modelsOf φ`), `exists_mem_wellOrderClass_type_eq` (Lean 819–822, `ω ≤ β < ω₁`),
`analytic_treeHeight_bounded` (Lean 357–361), `lopez_escobar` (Lean 732–735).

**Other suppliers, resolved now.** BorelEquivalenceRelations on main: `BorelReducible`
(Suggested.lean 467, `∃ f, Measurable f ∧ ∀ x y, E x y ↔ F (f x) (f y)`), `BorelReducible.refl`
(470), `BorelReducible.trans` (473, across three universes), `IsSmooth` (479), `eZero` (509,
`Filter.germSetoid atTop Bool`), `measurableSet_eZero` (511), `borelReducible_bot_eZero` (527),
`not_isSmooth_of_borelReducible_eZero` (532), `isSmooth_of_countable_quotient` (488),
`HasCantorAntichainOn.continuum_le_mk_quotient` (177), `isSmooth_iff_countablySeparated` (484),
`borelReducible_bot_cantor_iff` and `not_isSmooth_eZero` (README §5.3–§5.4), `AnalyticSet.prod`
(README §0.3). InfinitaryLogic (`Completed/InfinitaryLogic`): `SameAtomicType` (Suggested.lean
182), `BFEquiv` (191), `BFEquiv.monotone` (218), `IsTupleBFSystem` (239, both structures in one
universe, fine on `ℕ`), `potentialIso_iff_exists_isTupleBFSystem` (249, relational),
`potentialIso_of_equiv` (275), `countable_potentialIso_iff_iso` (305),
`potentialIso_iff_BFEquiv_all` (README Layer 1 list). InfinitaryModelExistence on main:
`smallPresentation`, `smallPresentationEquiv` (README 0.3, lines 219–221), `GraphRelation`,
`graphLanguage`, `graphExpansion`, `graphAxioms`, `reconstructStructure` (README Layer 6, lines
611–635; `G_f(x̄, y)` read as `f(x̄) = y`, matching the roadmap's `Fin.init w`/`Fin.last n`
reading). CountableModelCounting on main: transport between presentations (README lines
318–324, a homeomorphism of code spaces for a language equivalence of relational languages,
preserving isomorphism). NoncompactQuantumSymmetry at its head: `exists_polishTopology_continuousSMul`
(Suggested.lean 120–127) with exactly the hypotheses the roadmap lists (Polish topological group
with `BorelSpace`, standard Borel `X`, `MulAction`, `MeasurableSMul₂`), and M1.BorelRealization
(README 1010–1030) owning the Vaught-transform proof.

**Mathlib at the pin (f6090c70).** Opened: `MeasurableSMul₂` (`MeasureTheory/Group/Arithmetic.lean`
463), `ContinuousSMul.measurableSMul₂` (`Constructions/BorelSpace/Basic.lean` 615; needs
`SecondCountableTopologyEither` and `BorelSpace` on the acted space, both supplied by the base
under countability), `Prod.borelSpace` (657), `MeasurableSet.image_of_measurable_injOn`
(`Constructions/Polish/Basic.lean` 835; target `CountablySeparated`, which a standard Borel target
is), `Measurable.exists_continuous` (330), `AnalyticSet.measurableSet_of_compl` (523),
`MeasurableSet.analyticSet_image` (352, `[SecondCountableTopology (range f)]`, automatic for a
second-countable target), `AnalyticSet.preimage` (365), `MeasurableSet.analyticSet` (316),
`StandardBorelSpace` (82), `AnalyticSet` (185), `measurable_subtype_coe`
(`MeasurableSpace/Constructions.lean` 192), `Measurable.subtype_mk` (223), `Measurable.prodMap`
(414), `Setoid.comap` (`Data/Setoid/Basic.lean` 483, used), `Equiv.Perm.applyMulAction`
(`Algebra/Group/Action/End.lean` 42), `Descriptive.tree` (`SetTheory/Descriptive/Tree.lean` 29, a
`CompleteSublattice (Set (List A))`, so `T ∈ Descriptive.tree ℕ` is the right phrasing),
`Nat.unpair_right_le` (`Data/Nat/Pairing.lean` 108), `Nat.right_le_pair` (103),
`Encodable.ofCountable` (`Logic/Encodable/Basic.lean` 389), `equiv_between_cg`
(`ModelTheory/PartialEquiv.lean` 499, needs an initial `FGEquiv` and `IsExtensionPair` both ways),
`IsExtensionPair` (380), `Structure.cg_of_countable` (used in `ModelTheory/Order.lean` 506),
`Order.iso_of_countable_dense` (`Order/CountableDenseLinearOrder.lean` 245), `Language.graph`
(`ModelTheory/Graph.lean` 49, in `Language.{0,0}`, `deriving IsRelational`),
`Theory.simpleGraph` (68), `Theory.simpleGraph_model_iff` (72), `Language.order`
(`ModelTheory/Order.lean` 75, `Language.{0,0}`), `linearOrderTheory` (162), `orderStructure` (208),
`Theory.fieldOfChar` (`ModelTheory/Algebra/Field/CharP.lean` 46), `Theory.field`, `Language.ring`
(`ModelTheory/Algebra/Ring/Basic.lean` 59), `Ordinal.omega` (`SetTheory/Cardinal/Aleph.lean` 203),
`Ordinal.omega0` (`SetTheory/Ordinal/Basic.lean` 770), the lexicographic `LinearOrder (List α)`
(`Data/List/Lex.lean` 141; `nil` first, so a proper prefix comes first, as Convention 8 says),
`padicValNat`. Not at the pin, as the roadmap says: Borel reducibility, a topology on
`Equiv.Perm ℕ`, a space of structures. `Ordinal.toType` is a spelling slip (R08). Tau Ceti at
the pin (358314d4): `TauCeti/ModelTheory` contains only `Algebra`; "From Tau Ceti: Nothing" is
accurate. The plan's baseline hashes equal the pins in `lake-manifest.json`.

**Ownership against open work.** `roadmaps grep` over main and the 455 open heads for
"Borel complete", "BorelComplete", "Friedman.Stanley", "universal.*S∞|Becker.Kechris",
"SetReducible|set reducib", "classIso|universalLanguage|graphClass|linearOrderClass|treeClass",
"MeasurableSMul₂", "S∞-space": no roadmap states Borel completeness, the Friedman–Stanley
codings, the universal S∞-space or set reducibility. CountableModelCounting's "Borel complete
invariant" (its README 534–584) is a different notion (a Borel invariant complete for a class).
ProfiniteCohomology's `graphClass` is a cohomology class, unrelated. The base's
`Out of scope` (its README 705–708) names Borel completeness of graphs and linear orders and the
Becker–Kechris theorem as not its own; NoncompactQuantumSymmetry owns only the Polish realization
and is cited for it. This roadmap is the owner of what it declares in `## Scope and ownership`.

**Sources, seeded sample.** Read at the cited lines in the cached texts:

| Target | Locator | Found |
| --- | --- | --- |
| 0.1 | paolini-shelah-tfab Definition 1.4 line 83; camerlo-gao-boolean 106–110 | lines 83–87 define `≤_B`; lines 106–110 define reducibility between invariant Borel classes and Borel completeness of a class |
| 0.2 | paolini-shelah-tfab Definition 1.2 lines 70–73, Remark 1.5 lines 88–91 | lines 70–73 define `≤_R` with a Borel map on `X₁`; lines 88–91 contrast domains `X×X` and `X` and state `≤_B ⇒ ≤_R`, converse open |
| 1.2 | paolini-shelah-tfab Definition 1.6 lines 95–101; camerlo-gao-boolean 106–110 | Borel completeness of a Borel class `K₁`: every Borel class `K₂` reduces to it (lines 95–101) |
| 1.3 | camerlo-gao-boolean 87–93; paolini-shelah-tfab 60–64 | lines 87–93: Mod(L) for an arbitrary countable language, standard Borel, S∞-action; lines 60–64: groups and abelian groups as Borel subsets |
| 2.1 | montalban-cst1 Theorem VI.27 lines 4572–4659 | the spider/flag coding of a relational structure in a graph, with a unary predicate in the first step (different gadgets, as the README says) |
| 2.2 | (none in README, R05); plan: montalban-cst1 4623–4654 | flags and connectors distinguishing coded vertices |
| 2.3 | friedman-stanley-1989 Theorem 1 (uncertified); camerlo-gao-boolean 111–112; paolini-shelah-tfab 125 | lines 111–112 list graphs as Borel complete (classical, via [Ho93]); line 125 lists graphs, linear orders and trees |
| 3.2 | montalban-cst1 Lemma VI.18 lines 4205–4285 | labelled trees of tuples with atomic-diagram labels (4205–4211), infinitely repeated (4238–4245), dense labelled linear orders on `ℚ^{<ℕ}` (4252–4265), recovery of the parent from lengths (4278–4285) |
| 3.5 | camerlo-gao-boolean 257–263, 276–281 | rooted binary trees as partial orders and as subtrees of `2^{<ℕ}` (R07) |
| 4.1 | becker-kechris-bams 126–131 | Borel G-spaces, Borel embeddings, invariant Borel image, universal spaces |
| 4.2 | becker-kechris-bams Theorem 2.1 line 132, Corollary 2.2 lines 174–177, sketches 247–268 | universal Borel G-space; the logic action on the language with one `n`-ary symbol per `n` is universal for S∞; the tree coding into `F(ℕ^ℕ)^ℕ` and Dougherty's coding into `L∞` |
| 6.1 | montalban-cst2 Lemma II.37 lines 2322–2331, Lemma II.38 and Corollary II.39 lines 2337–2425 | interval lemma for `≤_α` on linear orders; `ω^α·A ≤_{2α+1} ω^α·B ⟺ |A| ≥ |B|` for orders with first elements |
| 6.2 | paolini-shelah-tfab Fact 1.7 lines 103–106; montalban-cst2 Theorem XI.3 lines 8997–9012 | Borel complete classes have complete analytic isomorphism; Borel isomorphism ⟺ bounded Scott rank |
| 6.4 | friedman-stanley-1989 §4; hjorth-kechris-1996 §4–§5 (both uncertified) | not readable |
| 6.5 | montalban-cst2 lines 9046–9054; gao-idst §5.2 (uncertified) | lines 9046–9054: classes on top have Σ¹₁-complete isomorphism and unbounded Scott rank |

Also checked: paolini-shelah-tfab Notation 1.8 and Convention 1.9 (lines 110–121), Main Theorem
(169–171, a continuous reduction from graphs); camerlo-gao-boolean Theorem 1 (line 405) and the
main theorem (555); becker-kechris-bams logic action (157–164) and `L∞` (172–173);
montalban-cst2 Lemma XI.2 (8946–8980). All agree with the README's use of them. The manifest
records every cited work with one key each; the uncertified entries are recorded as such.

**Adversarial table.** Instances computed on each side; a row with a change points to a finding.

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Conv. 4 witness | one unary `P`, 3-cycle `σ: 0↦1↦2↦0`, `c = code of P={0}` | `(σ•c)⟨P,![1]⟩ = c⟨P,![σ⁻¹1]⟩ = c⟨P,![0]⟩ = true`; `(σ•c)⟨P,![0]⟩ = c⟨P,![2]⟩ = false` | code of `P={1}`, agrees with base `smul_apply` | none |
| Conv. 8 | `[] , [0], [0,5], [1/2], [1]` | `nil < cons`; `[0]` prefix of `[0,5]`; first difference `0 < 1/2 < 1` | `[] < [0] < [0,5] < [1/2] < [1]` | none |
| Conv. 9 `ν` | `3/4, 5, -1/6, 1/8008` | `padicValNat 2` of `4, 1, 6, 8008 = 8·1001` | `2, 0, 1, 3`; `1/8008 < 1/1000` | none |
| 0.1 `classIso`, Checks | `K = {P=∅, P=ℕ}`; `K = ∅`; `K'` = `P` infinite coinfinite; `A = {P={0}}` | two fixed codes, two classes; empty map; one orbit, constant map `x≅y ↔ f x≅f y` both sides true; `A` one code, one class | all four Checks hold; `classIso K ≤_B classIso ∅ ↔ K = ∅` since a map into `∅` exists iff `K = ∅` | none |
| 0.2 `SetReducible` | `A={0}⊆ℕ`, `B` = diagonal of Cantor²; `A → ∅`; `A → univ` | preimage of diagonal under `0↦(0,0), n+1↦(0,1)` is `{0}`; preimage of `∅` is `∅`; of `univ` is `univ` | Checks hold | none |
| 0.2 converse fails | graph of `eZero` vs diagonal | map with values `(0,0)` on the graph and `(0,1)` off it is measurable since `measurableSet_eZero`; `eZero ≤_B ⊥` on Cantor = `IsSmooth eZero`, refuted by `not_isSmooth_eZero` | `≤_R` holds, `≤_B` fails | none |
| 0.2 analyticity pulls back | `X, Y` Polish, `f` measurable | `Measurable.exists_continuous` gives finer Polish `t' ≤ t` with `f` continuous; `AnalyticSet.preimage` in `t'`; identity `(X,t') → (X,t)` continuous, `AnalyticSet.image_of_continuous` | analytic in the original topology | none |
| 1.1 relabelling | `e` = transposition `(0 1)`, code `P={0}`; `α = Fin 0`; 3-cycle twice | value at `⟨P,![1]⟩` is `c⟨P,![e.symm 1]⟩ = c⟨P,![0]⟩ = true` → `P={1}`; no queries → one point; two applications of `0↦1↦2↦0` send `{0}` to `{2}` | Checks hold; `relabel σ = σ•·` on `ℕ` by the same formula | none |
| 1.2 `BorelComplete` Checks | `K = ∅`; countably many `P_i` each `∅` or `ℕ`; `K ∪ K₂`, `K ∩ K₂` | no map `univ → ∅`; fixed codes, `2^ℵ₀` types, injection into a countable quotient impossible; `K ⊆ K ∪ K₂` restriction; `graphClass ∩ orbit(empty graph)` = one code | Checks hold | none |
| 1.2 universes | `L'` in `{u',v'}` | `smallPresentationEquiv L'` + CountableModelCounting transport: homeomorphism preserving isomorphism and invariant Borel classes | reduces to `{0,0}` | none |
| 1.3 functional space, action | `(σ•F)⟨f,v⟩ = σ(F⟨f,σ⁻¹∘v⟩)` | with `w = σ∘v`: `f^{σ•F}(σ v) = σ(f^F v)`, so `σ` is an isomorphism `F → σ•F` | matches Conv. 4 | none |
| 1.3 graph-code equivariance | `w : Fin (n+1) → ℕ` | `[σ(F⟨f, σ⁻¹∘init w⟩) = w(last)] = [F⟨f, init(σ⁻¹∘w)⟩ = σ⁻¹(w last)] = (σ•graphcode F)⟨G_f, w⟩` | equivariant | none |
| 1.3 range Gδ, "not closed" | one constant `k`: `c_n` with relation `{n}`; `L = Language.graph` | `c_n → all-false` (each coordinate eventually `false`), totality fails; relational `L`: empty table, range = whole space, closed | not closed iff `L` has a function symbol | **R01** |
| 1.3 Check `𝔽₂(t)` vs `ℚ` | `Theory.fieldOfChar 2` | `𝔽₂(t)` countable of characteristic 2, has a code; `ℚ` has characteristic 0 | Check holds | none |
| 2.1 incidence graph, `⇒` | `d = σ•c`, `q = ⟨R,v⟩` | truth edge at `t_{⟨R,σ∘v⟩}` in `H_d` iff `d⟨R,σ∘v⟩ = c⟨R,σ⁻¹∘σ∘v⟩ = c q` | colour-preserving isomorphism | none |
| 2.1 incidence graph, `⇐` | colour-preserving `φ` | `φ(p_a) = p_{σa}`; `t_q ↦ t_{q'}` same `R` (odd colours `3+2ι(R)`, `ι` injective); unique colour-`(2+2j)` neighbour `s_{q,j} ↦ s_{q',j}`; unique point neighbour `p_{vj} ↦ p_{σ(vj)} = p_{v'j}`; so `q' = ⟨R,σ∘v⟩`; truth edge present iff present, so `d(σq) = c(q)` for all `q`, i.e. `d = σ•c` | reflects isomorphism | none |
| 2.1 Checks | one binary `R`, `R={(0,1)}`; empty `L'`; nullary `R`; two unary symbols uncoloured | neighbours of `t_{⟨R,![0,1]⟩}`: `s_0, s_1, u` = 3; of `t_{⟨R,![1,0]⟩}`: 2; no queries, no edges; nullary tuple vertex has no position neighbours; swapping symbols is an uncoloured isomorphism of `P₁={0}` with `P₂={0}` | Checks hold; bipartite (points, tuples) vs (positions, truth) | none |
| 2.2 clique tags | `H` = edge `{x,y}`, `κ=(0,1)`; `V=∅`; triangle; `κ=0,1` on one vertex | vertices `2+3+4 = 9`; edges `1 + 2 + 3 + 6 = 12`; empty; original vertices of a triangle lie in triangles; `1+3 = 4` vs `1+4 = 5` vertices, triangle+pendant vs `K₄`+pendant | triangle-freeness needed; colour recovered as `κ x + 2` other tag vertices of the tag-`0` neighbour | none |
| 2.3 `borelComplete_graphClass` | any `L' : Language.{0,0}`, any `K'` | one continuous map (coordinates constant or one coordinate of `c`), lands in `graphClass`, reflects/preserves isomorphism by 2.1, 2.2, 1.1; restrict by 0.1 | reduction for every `K'` | none |
| 3.1 coloured Cantor | `σ = id`; `σ = (0 1)`; two-colouring "negative" | `π = id`; `π(1/2)` must have colour 0; negatives are an initial segment, so no order automorphism swaps the two colours | density needed; `IsExtensionPair` both ways since each colour class is dense and `ℚ` has no endpoints | none |
| 3.2 parent definable | `x = p ++ [q]` | `z` with `p < z < x` must extend `p` by `q' < q`, so `|z| ≥ |x|`; a second `p'` of length `|x|-1`: `p' < p` puts `p` between, `p' > p` forces `p' > x` | parent unique | none |
| 3.2 `List ℚ` dense, least `[]`, no greatest | `x < y` | prefix case: `x ++ [q-1]` between; first-difference case: midpoint | dense; `[]` least; `[1] < [2] < …` unbounded | none |
| 3.2 unravelling lemma | `(i)⇒(ii)`: `Φ x = x.map π`; `(iii)⇒(i)` | `a(Φ x) = x.map (ν∘π) = σ ∘ a(x)`, atomic diagram preserved by the isomorphism `σ`; pairs `(a(x), a(Ψ x))`: empty pair (root fixed), atomic types equal (colours equal), forth/back via children `x ++ [r]` with `ν r = m` and parent preservation | tuple back-and-forth system; `potentialIso_iff_exists_isTupleBFSystem` + `countable_potentialIso_iff_iso` | none |
| 3.2 Checks | edge `{0,1}`: `[1/2, 1]`, `[1, 2]`; edges `{0,1}` vs `{0,2}` at `[1, 1/2]` | `a = (1,0)` adjacent distinct; `a = (0,0)` equal; `a = (0,1)` adjacent in the first, not in the second | Checks hold | none |
| 3.3 block order | block of `x`: type `ω + (χ_c(x)+2)` | indices `≥ χ+2` first (copy of `ω`), then `< χ+2`; two blocks `x < y` have infinitely many blocks between (density) | linear order; comparison depends on `χ_c(x)`, `χ_c(y)`, finitely many coordinates | none |
| 3.3 finite condensation | block of `[]` | the `ω`-part is a maximal set of points pairwise bounding a finite interval, and infinite | README sentence false as written; plan API right | **R02** |
| 3.3 reduction | `f c ≅ f d` | isomorphism maps finite condensation classes to finite ones of equal size, in the order of `List ℚ`; induced `Φ` preserves `χ`; 3.2 (ii) | reflects isomorphism; converse extends block by block | none |
| 3.4 `treeClass` Checks | `(ℕ,≤)`, star, `(ℤ,≤)`, `(ℕ,≥)`, chains `c_n` | down-sets `{0..x}` finite linear; star: down-sets of size ≤ 2; `ℤ` no least; `(ℕ,≥)`: down-set of `x` is `{y ≥ x}` infinite; `c_n(i,j) = [i ≥ j]` for `n > max(i,j)`, limit `(ℕ,≥)` | Borel (countable union over size bounds), not closed | none |
| 3.4 tagged tree | `χ_c(x) = 0, 1` | subtree above `(x, some 0)`: chain `(x,some 0) < (x,some 1)` plus leaves, height 2; with `χ = 1` height 3 | height `χ_c(x)+2`; originals = nodes starting infinite chains | none |
| 3.5 (a) | finite tree `{[],[0],[1],[0,0]}`; `List ℕ` | no bijection with `ℕ`; prefix order on `List ℕ`: least `[]`, down-sets finite linear | both directions | none |
| 3.5 (b) | chain `(ℕ,≤)` marked at `0` vs at `1`; star | ray marked at its end vs at its second vertex: orders differ (`1` would be least); star marked at the centre | cover relation closed, map Borel not continuous | none |
| 4.1 Checks | `ℕ` with `applyMulAction`; trivial action; uncountable language | `(σ,n) ↦ σ n` continuous hence measurable, one orbit; orbit relation `=`; `2^{ℵ₁} > 𝔠` not provable | third Check needs "at least `𝔠` symbols" or another reason | **R03** |
| 4.2 anchored code open | `(k,n)`, `a = (0,…,k-1)` | `{x | ∃ g ∈ F_k, g•x ∈ S_n} = ⋃_{g ∈ F_k} g⁻¹•S_n` | open, map measurable | none |
| 4.2 equivariance | `h ∈ S∞` | `(h•Φx)⟨R_{k,n},a⟩ = Φx⟨R_{k,n},h⁻¹∘a⟩`; with `g' = g h`: `g'•x = g•(h•x)` and `g'(h⁻¹(a i)) = g(a i) = i` | `Φ(h•x) = h•Φ x` | none |
| 4.2 injectivity | `x ≠ y`, `S_n ∋ x`, `closure S_n ∌ y` | codes agree ⇒ for every `k` some `g_k ∈ F_k` with `g_k•y ∈ S_n`; `F_k` is a neighbourhood basis of `1` (`hasBasis_nhds_one_fixingSubgroup`), so `g_k → 1`, `g_k•y → y`, `y ∈ closure S_n` | contradiction; injective | none |
| 4.2 `unpairCode` | `m = Nat.pair n k` | `(unpair m).2 = k ≤ m` (`unpair_right_le`); symbol `m` on `b` reads `(k,n)` on `b ∘ castLE`; distinct codes differ at some `(k,n,a)`, extend `a` to length `m` | continuous, injective, equivariant (`σ⁻¹∘b` restricts to `σ⁻¹∘(b∘castLE)`) | none |
| 4.2 Checks | `X = ℕ`, `S_n = {n}`, symbol `(1,0)`; one point, `S_0 = X`; no anchoring | `∃ g, g a = 0 ∧ g x = 0 ⟺ x = a`; `∃ g, g(a i) = i ⟺ a` injective; condition becomes "orbit meets `S_n`" | Checks hold | none |
| Layer 5 | `(1)⇒(3)` `K' = univ`; `(3)⇒(4)` inclusion; `(4)⇒(1)`; `(1)⇔(2)` via 2.3; `(5)⇒(3)` logic action, `ULift` for `u ≠ 0`; `(3)⇒(5)` via 4.2 | each step a composition of reductions from 0.1, 2.3, 4.1, 4.2 | equivalence | none |
| Layer 5 Checks | `graphClass`; `∅`; one unary predicate; trivial action on Cantor | all five hold; all five fail (nonempty instances); `2^{ℵ₀}` classes cannot inject into countably many; equality on Cantor reduces | Checks hold | none |
| 6.1 interval lemma | `γ = 0`; `γ = 1`; successor; limit | `BFEquiv 0` = atomic type = hypothesis, intervals trivially `BFEquiv 0`; `BFEquiv 1` = each interval nonempty iff its partner is; a new element falls in an interval or equals an entry, matched at level `γ` inside the interval, other intervals by `BFEquiv.monotone`; limits commute | holds at every `γ` | none |
| 6.1 Checks | `ω` vs `ω·2` at 2; `ω` vs `ω+1` at 2; empty vs nonempty at 1 | forth `m ↦ m` in the first copy; back `ω ↦ 1`, `0 ↦ 0` (needs only "something below/above"); max of `ω+1` cuts an empty upper interval, no element of `ω` does; empty order has no forth witness | `ω ≡_2 ω·2`, `ω ≢_2 ω+1`, `δ ≠ 0` needed | none |
| 6.1 `bfEquiv_omega0_opow_mul` | `γ+1`, `m ∈ ω^{γ+1}·δ` | `[0,m) = ω^γ·μ + ρ`, `ρ < ω^γ`; `(m,∞) = ω^{γ+1}·η`, `η ≠ 0` (`ρ'+1` absorbed by `ω^{γ+1}`); `m'` with `[0,m') = ω^γ·μ' + ρ`, `μ' ∈ {0,1}`; segments `BFEquiv γ` by induction and the sum form | `BFEquiv (γ+1) 0` | none |
| 6.1 Check `ω²` vs `ω²·2` | `γ = 2` | both: least element, no greatest, middle elements; `BFEquiv 2` reduces to these | `≡_2`, not isomorphic | none |
| 6.2 non-Borel | `BorelComplete K`, iso on `K×K` Borel | `linearOrderClass ≤_B classIso K`; iso on `linearOrderClass` Borel; non-iso pairs Borel in the closed square, analytic; `exists_uniform_bfSeparation` gives `β`; codes of `ω^{1+β}` and `ω^{1+β}·2` (infinite countable, `encodeVia`) non-isomorphic yet `BFEquiv (1+β)` by 6.1, `BFEquiv β` by `monotone` | contradiction | none |
| 6.2 consequences | invariant Borel `K` | `lopez_escobar` gives `φ`; bounded height + `measurableSet_iso_inter_of_scottHeight_le` makes iso Borel; Borelness pulls back along reductions; Suslin in the ambient square | hold; third consequence needs its ambient space named | **R10** |
| 6.2 Checks | one unary predicate; `K = ∅` | Scott heights `≤ ω` (base worked example 2) so iso Borel; empty relation Borel | consistent with not Borel complete | none |
| 6.3 `eZero` code | `x = 0^ω`, `y = 1 0^ω`; `x = 0^ω`, `y = 1^ω`; `F = ∅` only | `y^F = x^{F ∆ {0}}`; copies of `x` have finitely many `P`-points, of `y` cofinitely many; single copies of `x`, `y` differing at one coordinate are non-isomorphic | copies rigid (fix `Z`, follow `S`), `F ↦ x^F` bijects `Finset ℕ` with the class, codes isomorphic iff classes equal | none |
| 6.3 consequences | `BorelComplete K` | `eZero ≤_B structureIsoSetoid L' ≤_B classIso K` by Layer 5 (3); `⊥ ≤_B eZero`; injection `(ℕ → Bool) → Quotient`; `not_isSmooth_of_borelReducible_eZero` | `𝔠` types, not smooth | none |
| 6.4 obstruction | `ρ = 0`; one unary predicate; `K = ∅` | (a) = iso Borel, (b) trivial: contrapositive of 6.2; (a),(b) hold, conclusion = 1.2 Check; both hold, `¬ BorelComplete ∅` | not vacuous; image of a reduction analytic (`MeasurableSet.analyticSet_image`, `graphClass` standard Borel), bounded by (b), iso on `graphClass` Borel by (a) against 6.2 | none |
| 6.5 | one unary predicate | iso Borel, countably many classes, `isSmooth_of_countable_quotient` (needs Borel graph and countable quotient, both supplied); `eZero` has `𝔠` classes, no reduction into countably many | `E₀` strictly between | none |

**Shape and completeness.** Seven layers, 20 README subsections, 21 `*Needs:*` lines, every
layer with `### Dependencies`, six with `### Examples` (R04). Every definition has an API list
and at least three discriminating Checks (counted: 0.1: 4, 0.2: 4, 1.1: 3, 1.2: 4, 1.3: 4,
2.1: 4, 2.2: 4, 2.3: 3, 3.1: 3, 3.2: 4, 3.3: 3+3, 3.4: 3+3, 3.5: 3, 4.1: 3, 4.2: 4, 6.3: 3).
Every theorem states its hypotheses in the sentence; locators present except 1.1 and 2.2 (R05).
No LaTeX delimiters, no process words, no pull-request numbers, no machine paths, no
target-numbering tables. `plan.json`: 49 targets, 97 tests, `gaps = []`, suppliers listed by
section, baseline equal to the pins. No supplier gaps declared, none needed.

**Lean form, headline theorems, padding.** Not applicable at the design stage: there is no
`Suggested.lean` yet, and this lane does not elaborate. The headline theorems the package must
state are, from the Summary: `borelComplete_graphClass`, `borelComplete_linearOrderClass`,
`borelComplete_treeClass`, `exists_equivariant_measurableEmbedding_universal`, the five
characterisations of Layer 5, `not_measurableSet_classIso_of_borelComplete`,
`borelReducible_eZero_of_borelComplete`, `not_isSmooth_of_borelComplete`,
`not_borelComplete_of_rank_bounded`. All are statable at the pins with the few definitions the
roadmap names (coding space, logic action, orbit relation, `BorelReducible`, `classIso`,
`BorelComplete`, `graphClass`, `linearOrderClass`, `treeClass`, `universalLanguage`, Borel
S∞-space), since `Language.graph` and `Language.order` are in `Language.{0,0}`,
`MeasurableSMul₂` and `MulAction.orbitRel` exist, and the three classes are Borel sets defined by
first-order conditions on codes; the package stage must carry them.

## Not verifiable

- friedman-stanley-1989 (Theorem 1, §2, §3, §4): paywalled, recorded `uncertified`; the manifest
  itself says the section numbers are from memory. montalban-cst2 line 9057 cites the torsion
  abelian group result as "[FS89, Theorem 5]", so the §4 locator may be a theorem number; cannot
  be settled without the text.
- gao-idst §5.1–§5.2, §13.1–§13.2; becker-kechris-1996 §2.5–§2.7, §3.4; hjorth-kechris-1996
  §4–§5; mekler-1981 §2; kechris-cdst; hjorth-2000: paywalled, recorded `uncertified`, cited by
  locator only.
- Elaboration: no Lean file at the design stage; this lane does not elaborate.
- Ownership against open pull requests was checked through `roadmaps grep` over the 455 heads
  the brief lists; pull requests outside that index were not searched.

## Source issues

- **Misprint** in montalban-cst2 at XI.2, printed page 208 (line 9039): the source cites the
  graph result as "[Part 1, Theorem ??]", an unresolved cross-reference; it should be Part 1,
  Theorem VI.27; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "7791b62063ab7a9787f02dd674229570ed690c43", "job": "REV-DESIGN-CountableStructureSpacesPartII", "model": "fable", "worker": "chris-x17"} -->
