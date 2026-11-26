# Review of RandomGraphs (pull request #3170 at 57376f9)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 69 changed lines since `87e7f72`. This review checked the new subsection 9.5, its three `Suggested.lean` theorems, and the edits to the build table, the Layer 9 dependencies and the supplier table. The verdict is accepted, with no finding: the measurability of the de Finetti correspondence in both directions and the filter form of the Diaconis–Janson homeomorphism are true as stated, they elaborate at the pins, and both Checks compute correctly. There are two small corrections, neither blocking: the routes plan work the pinned Tau Ceti already has (the forward half has a five-line proof from pinned lemmas), and the ownership sentence no longer matches 9.5. There are also two format notes, one of them on untouched text. One question goes to the human reviewers: whether a general de Finetti result belongs in this graph roadmap.

## C01 — The routes of 9.5 plan steps that the pinned Tau Ceti already proves

As written, an implementer would rebuild three steps that the library already has. First, the forward route asks for the measurability of `P ↦ P^{⊗ℕ}` "on cylinders". That is `TauCeti.MeasureTheory.measurable_infinitePi_const` (`TauCeti/MeasureTheory/Measure/ProductKernel.lean:231`). Combined with `Measure.deFinettiBarycenter_eq_join_map` (`TauCeti/Probability/Process/PathLaw/Mixture.lean:60`), Mathlib's `Measure.measurable_join` and `Measure.measurable_map`, and two uses of `Measurable.subtype_mk`, it proves `measurable_deFinettiEquiv` in five lines. I checked that proof at the pins. Second, the inverse route's parenthetical (line 1239) asks to show that the Giry σ-algebra is the Borel σ-algebra of the weak topology. That is the instance `TauCeti.MeasureTheory.ProbabilityMeasure.borelSpace` (`TauCeti/MeasureTheory/Measure/ProbabilityMeasure/Borel.lean:140`), together with `MeasureTheory.ProbabilityMeasure.instSecondCountableTopology` (`…/ProbabilityMeasure/Separable.lean:48`) for a second-countable standard Borel pseudometrizable space. Only the Polishness of the weak topology is missing at the pins. Third, the homeomorphism route relies on `GraphonSpaceI.instCompactSpace` (`TauCeti/Combinatorics/DenseGraphLimits/GraphonSpace/Compact.lean:59`) and on `continuous_homDensityOnSpace` (`…/GraphonSpace/HomDensity.lean:139`), from which Möbius inversion gives the continuous induced densities. The *Needs:* line names neither.

The fix is to name these declarations in the *Needs:* line of 9.5 and cut the two routes down to what is actually missing: the Polishness of the weak topology and Lusin–Souslin. `measurable_deFinettiEquiv` can stay as the easy half of the equivalence, but its docstring or the README could say that it is the easy half.

## C02 — The ownership sentence at the end of the supplier contracts no longer matches 9.5

A reader of the scope would conclude that this roadmap leaves the de Finetti correspondence alone. The closing paragraph of the supplier contracts (line 1696) says "Generic samplers, representation theorems and general EF machinery retain their existing owners." The list of what this roadmap owns (lines 1608–1616) also says nothing on the point. Yet 9.5 now plans the measurable structure of de Finetti's representation over every standard Borel space, which contains no graph. It also plans the standard Borel instance on the Giry space, which no other roadmap on `main` or among the open heads plans. One clause in the ownership list would fix this: "the measurable and topological forms of the de Finetti and Diaconis–Janson correspondences (9.5), with the standard Borel structure of the Giry space". The other fix is to move the de Finetti half to a Part II of Exchangeability and cite it from there. Which of the two is a question for the human reviewers (below).

## N01 — Section 9.5 cites no source

Neither the two results of 9.5 nor the Polishness of the weak topology, which its inverse route needs and the pins lack, carries a locator. Elsewhere the README either gives one or says that no external theorem is cited (8.2, 9.2). Add a locator for each, or the sentence that the results are derived here. For comparison, the pinned Tau Ceti file that proves the Borel half cites Kechris, *Classical Descriptive Set Theory*, Theorem 17.24.

## N02 — Untouched text: README 5.2, lines 702–703, "every formula"

This repeats a note from an earlier review that is still unrepaired. The sentence says that "every formula is `Language.Theory.IsQFEquivalent` modulo `T_R`". However, `HasQuantifierElimination` (`Suggested.lean:262–264`) quantifies only over variable types in `Type`. Writing "every formula whose free variables form a type in `Type`" would match. This text belongs to a separate pull request.

<details><summary>What was checked</summary>

The worker's automatic checks all passed at this head. The check that every supplier this roadmap names comes earlier in the merge order, with no cycle between roadmaps, read 121 roadmaps and 1382 supply edges and found no problem, so the README depends on nothing it cannot merge after. Elaborating `Suggested.lean` exits with code 0, with 78 `sorry` warnings and no other message. Running `#check` on the three new theorems gives types that match the README; none of them uses a section variable. A one-tactic probe (`fun_prop`, `measurability`, `simp`) closes none of them. No file outside the pull request's own folders changed. The note from the earlier review on 5.2 is not repaired and lies in untouched text (N02). The sampled target 9.5 has no locator to verify. The other sampled targets lie in untouched text that this change does not affect, so they were not reopened. Ownership against the closest open roadmaps whose heads were not provided (SaturationAndQuantifierElimination, Forcing, QuasirandomGraphs, an open DenseGraphLimits revision) was not checked.

</details>

## Verified sound

| Statement | Instances tried | Left / computed | Right / claimed | Result | Change |
| --- | --- | --- | --- | --- | --- |
| `measurable_deFinettiEquiv` (9.5) | α = Unit; α = Bool, cylinders `{x₀=0}`, `{x₀=x₁=0}`; five-line proof at pins | Unit: both sides one point. Bool: `δ_{Ber(1/2)}` gives 1/2 and 1/4; `½δ_{δ₀}+½δ_{δ₁}` gives 1/2 and 1/2 | measurable; values are `∫ P(A) dπ`, measurable in π | true; proof elaborates | C01 |
| `measurable_deFinettiEquiv_symm` (9.5) | α = Unit; α = Bool (mixing laws = laws on [0,1]) | Bool: inverse is the Hausdorff moment map, moments `ρ{x₀=…=x_{k−1}=1}`; source P(P(α)) standard Borel twice, target countably separated by injective measurable code | measurable via Lusin–Souslin | true | C01, N01 |
| `tendsto_iff_tendsto_mixtureExchangeableLaw` | `δ_{const(1/2+1/n)}` → `δ_{const 1/2}`; constant `δ_{1/2}` vs `½δ₀+½δ₁`; `l = ⊥` | first: masses `1/2+1/n → 1/2`, `(1/2+1/n)³ → 1/8`; second: LHS false (T2), RHS fails at k=3 (1/8 vs 1/2); third: both true | iff holds in each case | true (compact source, injective, inducing) | none |
| README: the equivalence is a homeomorphism | marginal topology on `ExchangeableGraphLaw` | `CompactSpace (ProbabilityMeasure GraphonSpaceI)` synthesized (Prokhorov.lean:176 with Compact.lean:59); `law k` on finite type determined by singleton masses | continuous bijection, compact to Hausdorff | true; filter form equivalent (u = 0) | C01 |
| Check 1 of 9.5 | constant graphon p | `law 2 {⊤} = p`; `law 3 {⊤} = p³ = 1/8` at p = 1/2 | p; 1/8 | true | none |
| Check 2 of 9.5 | `½δ₀+½δ₁` vs `δ_{1/2}` | `law 2 {⊤}`: 1/2 and 1/2, `{⊥}`: 1/2 and 1/2; `law 3 {⊤}`: 1/2 vs 1/8 | k = 2 does not separate, k = 3 does | true | none |
| Route: pins lack a standard Borel Giry instance | search for `StandardBorelSpace (ProbabilityMeasure` in both pins | 0 hits; Borel half present (Borel.lean:140, Separable.lean:48) | "the pins lack that standard Borel instance" | true; Borel half pinned | C01 |
| *Needs:* names of 9.5 | each opened at its pin | `deFinettiEquiv` (DeFinetti/Correspondence.lean:104), `Measure.deFinettiBarycenter` (PathLaw/Mixture.lean:47), `mixtureExchangeableLawEquiv` (:68), `mixtureExchangeableLaw_law` (Mixture.lean:158), `probabilityMeasureCode_injective` (Coding.lean:129), `Measurable.measurableEmbedding` (Polish/Basic.lean:883) | all exist as cited | resolve | C01 (missing names) |
| Ownership sentence, line 1696 (affected) | 9.5 vs "representation theorems retain their existing owners" | 9.5 plans measurable/topological forms of two representation theorems; ownership list silent | sentence claims otherwise | out of date | C02 |
| Headline: zero–one law (unchanged) | `∃x∃y Adj`; isolated vertex | `1−(1−p)^{C(n,2)} → 1`; `≤ n(1−p)^{n−1} → 0` | `𝟙[R⊨φ]` = 1, 0 | true | none |
| Headline: rank-uniform bound (unchanged) | d = 0, 1 | `B₀ = 0ⁿ = [n=0] = Pr(¬EP≤0)`; `B₁ = n(p^{n−1}+(1−p)^{n−1})` (union bound) | bound holds | true | none |
| Headline: joint stabilization (unchanged) | fixed d | `B_d(n,p)` geometric in n, summable | Borel–Cantelli applies | true | none |
| Headline: Fraïssé existence (unchanged) | finite linear orders; `{∅}`, empty language | (ℚ,<), countable; limit ∅ | countable limit, possibly empty | true | none |
| Headline: rooted comparison (unchanged) | `Adj(x₀,x₁)`, H = K₂ and edgeless | limits 1 and 0, mixture p | unconditioned limit p | true | none |
| 5.2 sentence (untouched) | free-variable type in another universe | definition quantifies over `Type` only | "every formula" | wording broader | N02 |

- Source locators checked against a text: 0. Section 9.5 cites none, and no other locator is changed.
- Library declarations opened at the pins: 18, among them `measurable_infinitePi_const`, `ProbabilityMeasure.borelSpace`, `instSecondCountableTopology`, `GraphonSpaceI.instCompactSpace`, `continuous_homDensityOnSpace`, the Prokhorov compactness instance, `Measure.measurable_join` and `Measure.measurable_map`.
- Cross-roadmap citations resolved: the links to Exchangeability (completed, Layer 8) and DenseGraphLimits (completed, Layer 9b) resolve, and neither roadmap plans the 9.5 statements.
- Automatic checks: all passed. Supplier order: every supplier the README names comes earlier in the merge order and no two roadmaps supply each other (121 roadmaps, 1382 supply edges read, no upward or cyclic edge).
- Elaboration: exit 0, 78 `sorry` warnings, nothing else. `#check` on the three new theorems shows no dropped binder. In a scratch copy, `fun_prop`, `measurability` and `simp` close none of them.
- Pull-request text: the RandomGraphs bullet ("new §9.5 …", three declarations) and the count of sixteen roadmaps match the head. Nothing to correct.

Overlap check: read Exchangeability (Layer 8) and DenseGraphLimits (Layer 9b), both completed; InfinitaryLogic, CountableStructureSpaces and CountableModelCounting (main); and FreeGroupsAndLimitGroups and AmenableGroups at this head. I searched main and the 113 open heads I was given for a standard Borel Giry instance, for measurability of the de Finetti correspondence, and for a topology on exchangeable graph laws, and found nothing shared. The 9.5 objects are owned by RandomGraphs, through this change. Not checked: SaturationAndQuantifierElimination, Forcing, QuasirandomGraphs and the open DenseGraphLimits revision, whose heads were not given.

Source independence: changed passages only. I compared 7 passages (the two paragraphs of 9.5, its two Checks and three docstrings) with the pinned Tau Ceti docstrings of `deFinettiEquiv` and `mixtureExchangeableLawEquiv`; 9.5 cites no external source. Nothing is shared beyond formulas and standard names. The largest share of locators is cameron2013, 8 of 24 page locators, as before. The diff adds, removes and reorders no layer, so I did not compare the arrangement again.

Research link: the principal theorem is the graph case of the Glebskii–Kogan–Liogon'kii–Talanov/Fagin zero–one law (Fagin 1976; Cameron 2013, Theorem 6). Section 9.5 adds the measurable and topological forms of the de Finetti and Diaconis–Janson (2008, §5) representations. This rests on the README and on the pinned Tau Ceti docstrings.

## Not verifiable

- Kechris 1995, Theorems 17.23–17.24, which state that the weak topology on probability measures over a Polish space is Polish with the Giry σ-algebra as its Borel σ-algebra. The README does not cite it, and I did not open it; it is named only through the pinned Tau Ceti file.
- Spencer 2001, Hodges 1993, Bollobás 2001 and Fagin 1976 are cited in untouched text and were not reopened (see the earlier reviews).

Automatic checks set aside as false positives: the citation resolver's lead that four backticked names occur nowhere (they are this roadmap's own declarations in `Suggested.lean`, lines 239–264), and the signature lead that seven graphon theorems lost a probability-measure binder (the binder is in each elaborated type).

## Source issues

- none

## For the human reviewers

- **Scope (placement).** Section 9.5 (README lines 1226–1257; `Suggested.lean` lines 889–899) places in this graph roadmap two theorems about Exchangeability's de Finetti correspondence over any standard Borel space, together with the standard Borel instance on the Giry space. Neither mentions a graph, and no other target uses them. The description gives its reason: the source roadmaps are completed. Exchangeability has no Part II.
