# Review of HanfNumbers (pull request #1319 at 5def5c2)
**Verdict:** accepted

**Summary.** Accepted: no stated result, Check or example was found false, every sampled locator into Marker's notes and the Keisler–Knight preprint matches the text, and the file elaborates with `sorry` as its only warning. There are two small corrections (one Lean milestone does not instantiate to the start condition the README uses it for; two declarations follow from their neighbours in one step) and one format note, none blocking. One point is left for the human reviewers: the locators go to the 2013 lecture notes, not to the 2016 book, and the Lean reuses definitions from the author's own Apache-2.0 formalization.

## C01 — `isCofinallyApproximated_start` puts the ambient sentence itself in the condition, so it does not give the start condition that 3.4 builds on

An implementer who proves the declaration as stated cannot use it where the README uses it. In 3.3 the start condition is `{φ ↦ true, disEq ↦ true}`, approximated in models of `σ* = φ' ∧ sk(Γ₀)` (README line 708, with `σ*` fixed in 3.2, line 682). The Lean statement (`Suggested.lean` lines 230–233) concludes `IsCofinallyApproximated σ {⟨0, σ⟩, ⟨2, disEq⟩} ∅` from large models of `σ`. Instantiated at `σ := σ*` it yields the condition `{σ*, disEq}`; but `σ*` is not a member of `Γ*`, and the construction of 3.4 needs `φ'` in `pos` to obtain `Φ φ'`. Instantiated at `σ := φ'` it loses `sk(Γ₀)`, which finite satisfiability in 3.4 needs ("in a model of `σ*`, which obeys `w`"). No stated lemma moves between the two.

The smallest change: give the declaration a second sentence, for instance a hypothesis that for every `α < ω₁` some `N` has `N ⊨ σ`, `N ⊨ ψ` and `ℶ_α ≤ #N`, with conclusion `IsCofinallyApproximated σ {⟨0, ψ⟩, ⟨2, disEq⟩} ∅`; the README bullet then applies it at `σ = σ*`, `ψ = φ'`.

## C02 — `partitionRel_succ_one` and `morley_omitting_types_of_countable` follow from the adjacent declarations in one step, so as acceptance statements they ask an implementer for nothing

On a copy of the file, `erdos_rado hκ 0` closes `partitionRel_succ_one` (both sides reduce to `κ⁺ → (κ⁺)¹_κ`, since `iteratedTwoPow κ 0 = κ`), and `morley_omitting_types T S (Set.to_countable _) hS (fun _ _ => Set.to_countable _) h hκ` closes `morley_omitting_types_of_countable` once countability of `L.BoundedFormula Empty n` is derived from Mathlib's instance for `Σ n, L.BoundedFormula α n`; both elaborate without error.

Both statements are real README targets (0.2 is the base of the Erdős–Rado induction; 3.4 is the countable-language corollary). Either mark the two declarations in their docstrings as the `n = 0` case and the countable-language specialisation of the theorem beside them, or keep them in the README only, with their names there written in prose.

## N01 — Three definitions of `Suggested.lean` occur in no statement

`IsIndiscernibleOn` (line 110), `morleySeed` (line 139) and `hanfNumber` (line 287) are each mentioned only at their own declaration, while the module docstring says the file carries "the definitions they need". Would either drop the three (with prose names in README 1.1, 1.3 and 3.1) or say in the docstring that they are interface definitions kept for the README's Checks.

## Previous findings

- Padding by two specialisations: not repaired (`Suggested.lean` line 70 "theorem partitionRel_succ_one", line 339 "theorem morley_omitting_types_of_countable"). It touches no stated result, so it is C02 above and does not block.
- Three definitions serving no retained headline: not repaired (lines 110, 139, 287 unchanged). A matter of form: N01 above.
- Fewer than three Checks for the Skolem tower, Skolem templates, the term model and the ladder: unchanged, and no longer held. The number of Checks a construction has is not a ground for a remark; the plausible wrong variant of a Skolem template (dropping ω-completeness) is already separated by the height example of Layer 1.
- Series status in the description: repaired. It now reads "InfinitaryModelExistence, CountableStructureSpaces, BorelEquivalenceRelations and CountableModelCounting are on main", which is what main shows.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result / change |
| --- | --- | --- | --- |
| 0.1 `PartitionRel`, Checks | `0→(0)¹_0`; `3→(2)¹_2`; `2→(2)¹_2`; `n = 0`, `μ = 0` | empty `H`, `0 ≤ 0`: holds; fibre of 2 among 3: holds; two points, two colours: fails; no colouring into empty type: vacuous | True; locator MarkerNotes2013 line 1835 (`|X| ≥ κ`) matches |
| 0.1 homogeneity Checks | `(x+y) mod 2`; `x mod 2`; `y mod 2` on `{0,1,2}` | evens: colour 0; `(0,1)→1`, `(0,2)→0`; `(0,1)→0`, `(1,2)→1`; `(0,1)→1`, `(0,2)→0` | True |
| Convention 4 `iteratedTwoPow` | `κ = 2, 0, 3` | `2,4,16`; `0,1,2`; `2^(2^3) = 256 ≠ 64` | True |
| 0.3 `exists_isEndHomogeneousOn` | level count; source vs Marker's step | nodes per level `≤ λ^λ = 2^λ`; `< λ⁺` levels hold `≤ 2^λ` nodes `< (2^λ)⁺`; Marker lines 1852–1879: order of construction | True; README's caveat on Marker's order is right |
| 0.4 `erdos_rado`, `erdos_rado_beth` | `n = 0`; step with `λ = ℶₙ(κ)`; beth form | `n = 0` is pigeonhole; `(2^{ℶₙ})⁺` gives end-homogeneous `ℶₙ⁺`; `ℶₙ(ℶ_α) = ℶ_(α+n)` | True; Theorem 5.5 line 1847, Corollary 5.6 line 1882 |
| `exists_unbounded_fiber` | `D` empty; countable `D` | no `f` exists (domain nonempty); countable union of bounded sets bounded by regularity of `ℵ₁` | True |
| 1.2 templates, Checks | one-point order; injective `ℕ`-sequence; incoherent template | no increasing pairs: all arity-2 formulas in; `x₀=x₁` out, `x₀=x₂` out; constant sequence forces `x₀=x₂` true | True; converse of coherence needs infinite order, as stated |
| 1.3 Morley seed | injective; constant on 2 points; one-point order | `disEq` in template; `disEq` false at the pair; no pairs so realized | True; `#J ≤ #N` follows |
| 2.2 `IsEMSource`, Checks | `id : ℕ → ℕ`; `n mod 2`; constant; `Fragment` at the pin | false at all pairs; `(0,1)` false, `(0,2)` true; true at all pairs; `{x₀=x₁}` is component-closed (`Fragment.lean`, structure fields) | True; Exercise 5.7 line 1889 |
| 2.3 truth lemma | `∀y χ` both directions; `J = ∅` with no constants | `¬Φ(∀yχ)(τ̄)` gives `¬Φ χ(τ̄, w(τ̄))` by finite satisfiability; `∃x(x=x)` in `Γ` forces a closed Skolem term, so no empty-model clash | Sound |
| 2.4 `exists_emModel`, `_card_eq` | `J` infinite, `L'` countable; atomic order fragment of `ℚ` | `#J ≤ #E ≤ max(ℵ₀, #J, ℵ₀) = #J`; terms are variables, `EM(J) ≅ J` | True |
| 3.2 reduction | dummies; model sizes | `ℶ_α ≥ ℵ₀` so models nonempty; first projection, fixed element, empty relation interpret dummies | Sound; Marker line 1892–1895 |
| 3.3 decision and witness lemmas | `n = 0`; `n ≥ 1`; `pos ∩ neg ≠ ∅` at `κ = 1, 2` | constant truth value; `ℶ_(α+n) ≥ ℶ_(α+n−1)⁺ → (ℶ_α⁺)ⁿ`, colours `2` or `ℵ₀ ≤ ℶ_α`; approximated at 1, not at 2 | True for arbitrary `pos`, `neg`; Marker lines 1915–1941 |
| `isCofinallyApproximated_start` | `σ := σ*`; `σ := φ'` | `pos = {σ*, disEq}` with `σ* ∉ Γ*`; or ambient sentence loses `sk(Γ₀)` | True but not the README's start condition: C01 |
| 3.4 `exists_emSource_of_forall_beth`, `exists_model_card_eq_of_forall_beth` | universes; `κ < #L.Functions` | source in `Type` over `Language.{0,0}`; stretch along `κ.ord.ToType`, reduct keeps carrier: `#M = κ` | True; Theorem 5.2 line 1803, same hypothesis and conclusion |
| `morley_hanf` | derived on a copy of the file from the exact-cardinality theorem | one model `≥ ℶ_ω₁` gives all `ℶ_α`; model of size `max ℵ₀ κ ≥ κ` | True; four-line derivation elaborates |
| `morley_omitting_types` | constants `cᵢ`, `|I| = ℶ_ω₁`, type `{x ≠ cᵢ}`; empty type | omitting models: sizes `1..ℶ_ω₁` only; empty type cannot be omitted, hypothesis fails | Per-type countability needed, as stated; Corollary 5.8 line 1945 |
| 3.1 Hanf numbers, Checks; Convention 6 | `∀x ⊥`; ladder at `α = 0`; "exactly two elements" | `0`; `(2^ℵ₀)⁺`; `3` (2 not a bound, 3 vacuous); with empty models counted `1` vs `0` after adding a constant | True |
| 4.2 ladder | bound by induction; von Neumann model; `α = 0` with `Set ℕ` | `#U₀ ≤ ℵ₀`, `#U_{i+1} ≤ 2^{ℶ_i}`, limits countable unions; `#V_{ω+α+1} = preBeth(ω+α+1) = ℶ_(α+1)`; predecessors of `y` are `{{n} : n ∈ y}` | True; Exercise 5.3 line 1806 |
| 4.3 sharpness | `κ < ℶ_ω₁`; both Hanf conventions | `κ ≤ ℶ_(α+1)` for some `α < ω₁`, ladder refutes; single-model and cofinal forms both give `ℶ_ω₁` | True; KeislerKnight2004 lines 416–419, 436 |
| 5.1 highly order-transitive orders | `ℚ`; `ℤ`; `Fin 2`; finite `κ ≥ 2` | yes; translations fix differences, `(0,1) ↛ (0,2)`; only identity; no finite example | True; Exercise 5.12 line 1974 stated for all `κ` |
| 5.2 smallness, Checks | `(ℝ,<)`; ordered field `ℝ`; `(ω₁,<)` | finitely many order patterns per arity; `2^ℵ₀` cuts; `ℵ₁` definable points | True; Definition 6.11 line 2603 |
| 5.3 `exists_small_model_card_eq` | codes; reduct to arbitrary `L` | countably many `(k, terms)` codes; automorphisms of the `L'`-structure are automorphisms of the reduct | True; Theorem 5.11 line 1959, needs `κ` infinite |
| 5.4 companion, Scott completeness | back step; empty `M`; universes at the pin | witness in `M₀` by `F`-elementarity has type `q`; empty structure handled by Convention 7; `bfEquiv_of_realize_scottSentence` takes `N : Type w'` | Sound |
| 5.5 categorical completions | example 9 at `κ = ℵ₀`; finite `κ` | completion equivalent to the Scott sentence of `ℚ`; "infinitely many elements" is vacuously 3-categorical with no model of size 3 | True; Corollary 5.13 line 1977 |
| 5.6 countable languages | forward and backward transfer; empty `M`; example 10 | `σ = backTranslate θ` decides `ψ` via `relationalize ψ`; `θ` includes `∃x(x=x)` for reconstruction on nonempty carriers; identity function symbol | Sound; no relational hypothesis in Corollary 5.13, as stated |
| Convention 7, Checks | `ω₁ × ℚ` lexicographic and its reverse | cofinalities `ℵ₁` and `ℵ₀`, both dense without endpoints of size `ℵ₁` | True |
| Convention 9 | `ℶ_ω₁ → (ω)^{<ω}_2` | least such cardinal is inaccessible, above `ω₁`, hence above `ℶ_ω₁` | False relation, as stated |
| `partitionRel_succ_one`, `morley_omitting_types_of_countable` | one-term proofs on a copy of the file | both elaborate without error | Padding: C02 |

- Source locators checked against the text: 21 into MarkerNotes2013 (§5.1 p. 55; Theorems 5.2, 5.5, 5.11; Corollaries 5.6, 5.8, 5.13; Exercises 1.24, 2.34, 5.1, 5.3, 5.7, 5.12; Definition 6.11 and the remark after it; the two claims pp. 57–58), 3 into KeislerKnight2004 (§1.6, Theorems 1.6.1, 1.6.2). The README flags no locator as unverified.
- Library declarations opened at the pin: 26 Mathlib names of the supplier table (for example `Cardinal.infinite_pigeonhole_card`, `SetTheory/Cardinal/Pigeonhole.lean:47`; `ZFSet.card_vonNeumann`, `SetTheory/ZFC/VonNeumann.lean:141`; the `IsStrictOrderedRing` instance, `RingTheory/HahnSeries/Lex.lean:381`) and 48 Tau Ceti names (for example `Fragment`, `ModelTheory/Infinitary/Fragment.lean`; `bfEquiv_of_realize_scottSentence`, `ModelTheory/Scott/Sentence.lean:115`; `exists_countable_aElementary_substructure`, `ModelTheory/ModelExistence/LowenheimSkolem.lean:251`). All exist; a search for the three parts the README says are not at the pin (injectivity of the language-map action, a named symbol sublanguage of a sentence, a packaged isolator seed) finds none.
- Cross-roadmap citations resolved: InfinitaryModelExistence 0.1–0.4, 1.1, 1.2, 2.2, 2.3, 4.1 and Layer 6 on main (its ownership section names this roadmap as owner of indiscernibles, Hanf numbers and smallness); BanachSpaceTheory §B4.1 (infinite Ramsey, README line 627 on main); `Completed/InfinitaryLogic` "Out of scope" line 688; CountableModelCounting line 74.
- Duplication by object: no declaration or roadmap text for Erdős–Rado, partition relations, indiscernibles, Hanf numbers or highly order-transitive orders in the pinned Mathlib, the pinned Tau Ceti, the roadmaps on main or the open roadmap pull requests, other than the deferrals above.
- Automatic checks at this head: all passed. Elaboration rerun: 24 `declaration uses sorry` warnings, nothing else; no `set_option`, no sorry'd data; imports are Mathlib and four existing `TauCeti.*` modules. Elaborated signatures compared with the README: no section binder lost (every hypothesis is in the declaration's own signature).
- Dependency check: `depcheck: 133 roadmaps, 1473 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the roadmap folder.
- Pull request text: the title ("Add roadmap") and the description agree with the head on what was checked (a new roadmap, 24 warnings, four Tau Ceti imports, the series status, the suppliers, the README-only statements of 5.4 and 5.5).
- Headlines: Erdős–Rado, extraction, exact cardinality, `morley_hanf`, sharpness, small models and the two countable-language theorems of 5.6 are stated; the relational forms of 5.4 and 5.5 are special cases of 5.6; the term-model targets are named in the module docstring as README-only.

Overlap check: read InfinitaryModelExistence (main and its open revision), InfinitaryLogic (completed) and CountableModelCounting (main and its open revision); nothing shared: each leaves Ehrenfeucht–Mostowski models, Hanf numbers, small models and complete sentences to this roadmap. A search of the other listed roadmaps (CountableStructureSpaces, RandomGraphs, SaturationAndQuantifierElimination, ModalLogicCompleteness) for indiscernibles, Erdős–Rado, Hanf numbers and order-transitive orders finds no statement of them.

Source independence: 9 passages compared with 2 sources (the partition-relation definition, the Skolem expansion of 2.1, the set Γ of 1.1, Exercise 5.7 as restated in 2.2, the Hanf-number definitions of 4.1 and Convention 5, the ladder of 4.2, the proofs of 0.4 and 5.3), none shared beyond formula-forced runs of at most 7 words; largest share MarkerNotes2013, 25 of 28 locators; contents compared with MarkerNotes2013: independent (Layer 0 ↔ §5.1, Layers 1–3 and 5 all inside §5.2 with §6.3 and §2.2, Layer 4 ↔ one exercise of the chapter's preamble; §5.3–5.4 unused; the order 0, 2 → 3 → 4, 5 is forced by the dependency lines).

Research link: The headlines are Morley's computation of the Hanf number of Lω₁ω as ℶ_ω₁ (Morley 1965; Hanf 1964), stated as Theorem 1.6.2 of Keisler–Knight 2004, and the small-model and complete-sentence results of Marker's lectures (2013 notes, 2016 book), on Ehrenfeucht–Mostowski 1956 and Erdős–Rado 1956; rests on the README's references and the two texts read.

## Not verifiable

- Marker's 2016 book (chapter titles and page ranges in the references), Keisler 1971, Morley 1965, Hanf 1964, Erdős–Rado 1956 and Kanamori: not opened; the README cites them without theorem locators.
- The statements about `cameronfreer/infinitary-logic` at `518a366` (free of `sorry`, the dependency-cone guard, the module map of the Provenance section): the repository was not opened.
- The description's integration run on the author's fork and its record: outside the pull request's head.
- `isCofinallyApproximated_start` was not closed on a copy of the file: an eight-line attempt stops at unfolding `SentenceInf.Realize`, whose body is not exposed, so it is not a one-tactic statement.

## Source issues

- **Error** in MarkerNotes2013 at Theorem 5.11, printed page 59: the source says a sentence with arbitrarily large models has a model of every cardinality κ realizing countably many types; it should be every infinite κ, since "infinitely many elements" has no finite model; affects a stated result.
- **Error** in MarkerNotes2013 at Exercise 5.12, printed page 59: the source says every cardinal κ carries a linear order that is n-transitive for all n; it should be every infinite κ (or κ ≤ 1), since a finite order has only the identity automorphism; affects a stated result.

## For the human reviewers

- Scope: 25 of the README's 28 source locators go to Marker's 2013 lecture notes on the author's page (MarkerNotes2013), not to the refereed 2016 book, whose numbering was not compared (README references, lines 1397–1405).
- Licence: the README's Provenance section (lines 1208–1228) says the Lean is ported from `cameronfreer/infinitary-logic`, Apache-2.0, by the pull request's author; an earlier review matched `HighlyOrderTransitive` (`Suggested.lean` line 393) to that repository. Attribution is yours to assess.
