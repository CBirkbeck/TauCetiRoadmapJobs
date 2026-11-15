<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/16877#issuecomment-6901989406 -->
Red team round 2 pass b (claude) of 39912c6

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) two targets of Layer 6 have no locator

   - **Location.** `packages/CountableStructureSpacesPartII/README.md:1248–1250`: "Prove
     `exists_lt_scottHeight_of_borelComplete`, unbounded Scott height: for countable relational `L` and
     every `β < ω₁` some code `c ∈ K` has Scott height …"; `Suggested.lean:179–180`; and
     `README.md:1300–1304` (`mk_quotient_classIso_of_borelComplete`), `Suggested.lean:194`.
   - **Claim.** Every target has a locator or is marked as the roadmap's own.
   - **Witness.** The only locators of 6.2 (`README.md:1236–1237`, paolini-shelah-tfab Fact 1.7 and
     gao-idst §13.1) are attached to non-Borelness; the Scott-height bullet and its docstring cite
     nothing. A readable source states it: montalban-cst2 Theorem XI.3 (lines 8997–9001: Borel
     isomorphism problem ⇔ bounded Scott rank) and lines 9046–9051 (a class on top for Borel
     reducibility has unbounded Scott rank below `ω₁`). The count of 6.3 cites nothing either.
   - **Repair.**
     - `README.md:1250`, after "greater than `β`" insert: "(montalban-cst2 Theorem XI.3,
       lines 8997–9001, and lines 9046–9051, for the Scott rank of a class closed under isomorphism;
       here for the external height `scottHeight` and an arbitrary `K`)".
     - `Suggested.lean:179–180`, end the docstring with: "(Montalbán, Part 2, Theorem XI.3 and the
       paragraph after Definition XI.4, for the Scott rank)."
     - `README.md:1301`, after "`mk_quotient_classIso_of_borelComplete`" insert "(the roadmap's own
       corollary of the reduction of `eZero`)".
     - `sources.toml`, montalban-cst2 `locator`: append "Theorem XI.3 (lines 8997-9012), unbounded
       Scott rank of classes on top (lines 9046-9051)".
     Tested on the instance: the class of codes of one unary predicate has bounded height (base worked
     example 2, at most `ω`) and Borel isomorphism, as XI.3 (2) ⇒ (1) says; `graphClass` is on top and
     the theorem gives unbounded height, as lines 9046–9051 say.

2. **F02** (P3) Convention 10 fixes the ordinal universe that Layer 6.1 does not use

   - **Location.** `README.md:165`: "**Ordinals.** Ordinals are in `Ordinal.{0}`, ω₁ is
     `Ordinal.omega 1`, and `ω ^ γ` is `Ordinal.omega0 ^ γ`."
   - **Claim.** All ordinals of the roadmap live in universe 0.
   - **Witness.** `Suggested.lean:164`: "`theorem bfEquiv_omega0_opow_mul (γ δ ε : Ordinal.{w})`";
     `README.md:1195`: "for ordinals `γ`, `δ`, `ε` of one universe"; `README.md:276–277`: `BFEquiv`
     "with the level `α` in any ordinal universe". The convention and the headline disagree on
     generality.
   - **Repair.** Replace the first sentence of Convention 10 by: "Ordinals are in `Ordinal.{0}`,
     except in Layer 6.1, whose interval lemma and `bfEquiv_omega0_opow_mul` are stated for ordinals of
     any one universe (6.2 uses them in universe 0); ω₁ is `Ordinal.omega 1`, and `ω ^ γ` is
     `Ordinal.omega0 ^ γ`." Tested on the instance: the Lean binder `Ordinal.{w}` is now covered, and
     6.2 instantiates `w = 0` with `γ = 1 + β`, `β : Ordinal.{0}` from the base's
     `exists_uniform_bfSeparation`.

3. **F03** (P3) the `*Needs:*` line of 3.5 omits Layer 1.2

   - **Location.** `README.md:980`: "*Needs:* 3.4, Layer 0.1; Mathlib `Descriptive.tree`."
   - **Claim.** These inputs prove 3.5 (b): the class of marked connected acyclic graphs "is invariant
     Borel and Borel complete, by the Borel reduction from `treeClass`" (`README.md:971–973`).
   - **Witness.** From `BorelComplete treeClass` (3.4) and a reduction of `classIso treeClass` to the
     new class, the conclusion is the Transfer law of Layer 1.2 (`README.md:533–535`), which defines
     `BorelComplete` and is not listed; 3.3 and 3.4 list "Layer 1.2" for the same step
     (`README.md:892`, `:949–950`).
   - **Repair.** Replace the line by: "*Needs:* 3.4, Layer 1.2 (the Transfer law), Layer 0.1; Mathlib
     `Descriptive.tree`." Tested: with `K = treeClass`, `K₂` the marked-graph class and the cover-graph
     map corestricted by Layer 0.1, Transfer gives `BorelComplete K₂`.

Three P3 findings (S01–S03). No P1 or P2 finding survived the computed pass. The four findings of
round 1 are repaired at this head and no repair introduced an error.

## Round 1 findings at this head

| Finding | Status | Witness at 39912c6 |
|---|---|---|
| 1a/F01 = 1b/F01 (P3), two characterisations restate the definition | repaired | `packages/CountableStructureSpacesPartII/Suggested.lean` declares only `borelComplete_iff_graphClass` (line 141) and `borelComplete_iff_forall_permSpace` (line 148) in Layer 5; module docstring lines 20–21: "the characterisations of Borel completeness by the graphs and by the Borel `S∞`-spaces"; `README.md:29–30` names the same two; `README.md:1140–1143` keeps items 3 and 4 as prose targets without names. |
| 1a/F02 (P3), σ-algebra declared for ℕ only | repaired | `Suggested.lean:117–119`: "`instance instMeasurableSpacePerm {α : Type*} [TopologicalSpace α] : MeasurableSpace (Equiv.Perm α) := borel (Equiv.Perm α)`"; `README.md:1010–1014` defines it for every topological `α`. Checked for a new error: `Equiv.Perm.continuous_apply` and `continuous_inv_apply` (Tau Ceti `Topology/Algebra/Group/Perm.lean:53`, `:58`) precede the `[DiscreteTopology α]` variable (`:72`), so the new API bullet holds for every topological `α`; `instDiscreteTopology` (`:178`) and `instPolishSpace` (`:143`) sit under `[DiscreteTopology α]`, as `README.md:1014` and `:1022–1023` say; neither pin has a `MeasurableSpace (Equiv.Perm _)` or `MeasurableSpace (_ ≃ _)` instance (grep of both pins), so no diamond. |
| 1b/F02 (P3), docstring of `bfEquiv_omega0_opow_mul` cited a one-sided lemma as the theorem | repaired | `Suggested.lean:157–163` and `README.md:1209–1217` now say: Lemma II.38 gives the one-sided relation at level `2γ + 1` with the larger factor on the left, Observation II.35 gives both relations at `2γ`, induction gives `BFEquiv γ`. Recomputed against montalban-cst2 lines 2202–2208, 2219–2222, 2337–2339, 2424–2425: with `γ = 1`, `δ = 1`, `ε = 2`, II.38 gives `ω·2 ≤₃ ω` (`2 ≥ 1`) and denies `ω ≤₃ ω·2`; II.35 gives `≡₂`; the successor step of the induction (level `2γ + 2` gives, for each new element, a partner at `2γ + 1`, hence `≡_{2γ}`) is the forth and back clause of `TauCeti.BFEquiv` (`ModelTheory/BackAndForth/Equivalence.lean:49–57`). `sources.toml` carries the two added locators. |

`design/README.md` and `design/plan.json` still list the two deleted names (the repair report says
so); they are outside the package's `README.md` and `Suggested.lean` and are not raised here.

## Verified sound

**Counts.** 20 declarations read (13 theorems, 6 definitions, 1 instance; all 217 lines of
`Suggested.lean`); all 1446 lines of the README, 23 numbered sections with their targets; 44 line
locators into the 5 readable sources verified (the 16 citations of the 6 uncertified sources are
under Not verifiable); 92 Checks evaluated; 14 sibling citations resolved; every backticked library
name of the README (about 230 after removing variables and this roadmap's own names) grepped at the
pins, none missing.

**Elaborated signatures.** I ran no Lean (read-only pass). I compared the worker's `#check @name`
listing of the 20 declarations with the README statements: the file has no `variable` or `include`
line; `classIso` keeps `[L.IsRelational]` and `{α}`; `exists_lt_scottHeight_of_borelComplete`,
`mk_quotient_classIso_of_borelComplete` and `not_borelComplete_of_rank_bounded` carry
`[∀ n, Countable (L.Relations n)]`; the two theorems on `S∞`-spaces carry
`[MeasurableSpace X] [StandardBorelSpace X] [MulAction (Equiv.Perm ℕ) X] [MeasurableSMul₂ (Equiv.Perm ℕ) X]`.
Nothing changed since the repair.

**Dependency check.** Output of the brief's command:

```
depcheck: 240 roadmaps, 2256 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. NoncompactQuantumSymmetry is line 159 of the merge order, this
roadmap line 160. CountableStructureSpaces is another author's open pull request that adds a new
roadmap folder; BorelEquivalenceRelations, InfinitaryModelExistence and CountableModelCounting are
on main, InfinitaryLogic is completed.

**Suppliers resolved this round.**

| Citation | Where read | Result |
|---|---|---|
| CountableStructureSpaces Layer 0, closedness of the range of the graph coding | its open head | "Still to build" list of Layer 0 |
| CountableStructureSpaces Layer 1.2, `ContinuousSMul` | same | bullet "The action is jointly continuous (a `ContinuousSMul` instance), for every language"; the pin has only `ContinuousSMul (Equiv.Perm α) α` (`Perm.lean:80`) |
| CountableStructureSpaces Layer 4.4 `exists_uniform_bfSeparation` | same, both files | `AnalyticSet A`, all pairs non-isomorphic ⊢ `∃ β < ω₁`, no pair `BFEquiv β 0`; the form 6.2 uses |
| CountableStructureSpaces Layer 6.2 (five names) and worked example 2 | same | all present; strict well-orders, types `ω ≤ β < ω₁`; "Every code has Scott height at most `ω`" |
| CountableStructureSpaces "Out of scope" | same | Borel completeness of graphs and linear orders, Vaught transforms and the finer-topology theorem excluded there |
| NoncompactQuantumSymmetry Layer 4, M1.BorelRealization, `exists_polishTopology_continuousSMul` | its open head, both files | Polish group, `BorelSpace G`, `StandardBorelSpace X`, `MeasurableSMul₂ G X` ⊢ a Polish topology with the given Borel sets and `ContinuousSMul`; as cited |
| BorelEquivalenceRelations §5.1–§5.4 | main | headings 5.1–5.4 |
| InfinitaryModelExistence Layer 0.3, Layer 6 | main | small presentation in 0.3; "Layer 6: the graph translation" |
| CountableModelCounting Layer 0 (`isoSetoidOn α φ`, transport between presentations) | main | both present |
| InfinitaryLogic Layer 1 | `Completed/InfinitaryLogic` | present |

Ownership, by object (`roadmaps grep` over main and the open heads, READMEs and Lean files): no
other roadmap states Borel completeness of a class of structures, the Friedman–Stanley codings, a
universal `S∞`-space, a σ-algebra on `Equiv.Perm`, or a back-and-forth computation for ordinal
multiples; no other `Suggested.lean` declares `classIso`, `graphClass`, `linearOrderClass`,
`treeClass`, `universalLanguage` or `instMeasurableSpacePerm`. The Polish realization is owned by
NoncompactQuantumSymmetry alone. The base's 4.3 (`measurableSet_iso_inter_of_scottHeight_le`) is for
model classes `modelsOf φ`; 6.2 here argues from the pinned lemmas for an arbitrary `K` and does
not restate it.

**Library facts relied on, quoted at the pin.**

- `TauCeti.scottHeight` is the least level of external stabilization against every countable
  structure in `Type` (`ModelTheory/Scott/Height.lean:78–134`), not the internal rank, and
  `nonempty_equiv_of_bfEquiv_of_scottHeight_le` (`:186–189`) needs only `scottHeight M ≤ β`,
  `BFEquiv β 0` and countability. Tested on the model that would refute the internal reading:
  `(ℕ, P = ∅)` against `(ℕ, P = {0})` are `BFEquiv 0` and not isomorphic; the first has external
  height at least 1 (level 0 does not upgrade to level 1 against the second), so the lemma is not
  contradicted and the proof of unbounded height in 6.2 uses it correctly.
- `MeasurableSet.analyticSet_image` (`Mathlib/MeasureTheory/Constructions/Polish/Basic.lean:353`)
  needs a standard Borel source, `OpensMeasurableSpace` and second countability of the range: 6.4
  has them only for countable `L`, which its signature carries.
- `ContinuousSMul.measurableSMul₂` (`…/BorelSpace/Basic.lean:614`) needs
  `OpensMeasurableSpace (Equiv.Perm ℕ)`; 4.1 states the `BorelSpace` fact it follows from.
- `measurableSet_setOf_bfEquivSetoid` (`RelationalConfiguration/BackAndForth.lean:144`) needs a
  countable carrier, countably many relations of each arity and a level below `ω₁`; 6.2 and the
  fourth Check of 6.4 use it within those hypotheses.
- `orderStructure` is a `def` with `@[instance_reducible]`, not an instance
  (`Mathlib/ModelTheory/Order.lean:207–209`), so `letI := c.toStructure` in `linearOrderClass` and
  `treeClass` has no competitor.
- `Descriptive.tree` (`Mathlib/SetTheory/Descriptive/Tree.lean:32`) contains the empty set; 3.5 (a)
  restricts to infinite trees, which excludes it.

**The adversarial pass.** One row per statement; values on each side.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `classIso` (0.1) | `K = ∅`; `Fin 2`, one unary `P`; `A = {P = {0}}` in `K = {|P| = 1}` | empty setoid; 4 codes, 3 classes; 1 class in each | as README | none |
| set reducibility (0.2) | `X = Unit`, `Y = Empty`, `A = ∅`; graph of `eZero` to the diagonal | no map, clause false; two-valued map `(0,0)`/`(0,1)` reduces, `eZero` not smooth | converse fails as stated | none |
| relabelling (1.1) | `Fin 3`, `e = (0 1 2)`, `P = {0}`; `Fin 0` with a nullary symbol | `restrict e.symm`: `w ∈ P'` ⇔ `e.symm w = 0` ⇔ `w = 1`; `restrict e`: `w = 2`; two codes, two classes | convention as README | none |
| `BorelComplete` (1.2) | `K = ∅`; one-predicate codes; `K ∩ K₂` with `K₂` the one-point orbit of the empty graph | no map into `∅`; `ℵ₀` classes against `2^ℵ₀`; one class | as README | none |
| functional space (1.3) | one constant `k`, `F k = n → ∞`; relational `L` | unary graph relation `{n}` tends to `∅` (totality fails): range Gδ, not closed; range everything | as README | none |
| incidence graph (2.1) | `d = σ • c`; nullary symbol; two unary symbols without colours | `t_q ↦ t_{atom R (σ ∘ v)}`, `(σ • c).eval (atom R (σ ∘ v)) = c.eval (atom R v)`; one truth edge decides; `P₁ = {0}`, `P₂ = {0}` uncoloured-isomorphic | matches Convention 4 | none |
| clique tags (2.2) | edge, `κ = (0, 1)`; triangle | `2 + 3 + 4 = 9` vertices, `1 + 2 + 3 + 6 = 12` edges; tag 0 has `κ + 2` triangle neighbours; recognition fails on a triangle | as README | none |
| `borelComplete_graphClass` | `L'` with no symbols | only points, constant map, vertex set still infinite | sound | none |
| `ν`, coloured Cantor (3.1) | `3/4, 5, −1/6, 1/8008`; two-colouring by sign | `2, 0, 1, 3`; negatives are an initial segment, no automorphism swaps | as README | none |
| parent in `List ℚ` (3.2) | `x = p ++ [q]`; rival `p' ≠ p` of length `|x| − 1` below `x` | every `z` in `(p, x)` extends `p`; `p' < p < x` and `|p| < |x|` | unique | none |
| unravelling lemma (3.2) | loop code against empty graph; `adjAtom 0 1` against `adjAtom 1 0`; back step | colour of `[1]` differs; `τ`-related, bits agree at `(1,0)`, `(0,1)`; a parent-preserving bijection has a parent-preserving inverse | (i)–(iii) agree | none |
| `exists_continuous_reduction_linearOrderClass` | blocks `ω + (χ + 2)` over the dense `List ℚ`; empty against complete graph | finite condensation classes are the final parts, sizes `χ + 2 ≥ 2`; colour of `[1, 1/2]` occurs for one only | sound off `graphClass` too | none |
| `linearOrderClass`, `treeClass` | `(ℕ, ≤)`, `(ℕ, <)`, divisibility, `(ℕ, ≥)`, star, chains `c_n` | in; out (irreflexive); partial, not total; out of `treeClass` (no least element); in; `c_n → (ℕ, ≥)` | closed / Borel and not closed | none |
| `borelComplete_treeClass` | `χ = 0, 1` | chain above `(x, some 0)` of `χ + 2` nodes: 2, 3; originals are the nodes below an infinite chain | sound | none |
| two presentations (3.5) | star with `n` between `0` and `1` | `T_n → T`; `(0, 1)` adjacent in the cover graph of `T` only | Borel, not continuous | S03 |
| `instMeasurableSpacePerm` | `Fin 3`; `ℕ`; indiscrete `α` | `⊤`, 64 sets, evaluation at `0` alone gives 8; `{σ 0 = 0}`, `{σ 0 = 1}` clopen and proper; Borel sets of the induced topology, nothing more claimed | as README | none |
| `universalLanguage`, packing (4.2) | `m = 0, 1, 2` | `Nat.unpair = (0,0), (0,1), (1,0)`; `Nat.pair 0 1 = 1`, `Nat.pair 1 0 = 2`; `k ≤ m` | as README | none |
| `exists_equivariant_measurableEmbedding_universal` | `X = ℕ`, `S_n = {n}`; one point; `X = ∅`; injectivity | symbol `(1,0)` holds of `(a)` at `x` iff `x = a`; exactly the injective tuples; empty map; `g_k ∈` stabilizer of `{0..k−1}`, `g_k y ∈ S_n`, `g_k → 1` puts `y` in the closure of `S_n` | sound; condition at `(h • x, a)` is the condition at `(x, h⁻¹ ∘ a)` | none |
| `borelComplete_iff_graphClass` | `graphClass`; `∅`; one-predicate codes | true/true; false/false; false/false | both directions | none |
| `borelComplete_iff_forall_permSpace` | `X = ULift` of an invariant Borel class; `X = PUnit`, `K = ∅`; trivial action on Cantor space | objects change universe, the action is transported; both sides false; equality on Cantor space | both directions | none |
| interval lemma (6.1) | `γ = 0`; `γ = 1`; successor, both directions | trivial; nonempty against nonempty; a new point splits one interval, sub-intervals rebuild it by the induction hypothesis | sound | none |
| `bfEquiv_omega0_opow_mul` | `γ = 0`; `γ = 1`: `ω`, `ω·2`; `δ = 0`; successor step | level 0 trivial; `BFEquiv 2` holds (limit point needs level 3); empty against nonempty fails at 1; final segment `ω^(γ+1)·(δ − κ)`, `δ − κ ≥ 1`, partner at `ω^γ·μ' + ρ < ω^γ·2` | true as typed, in every universe | S02 |
| `not_measurableSet_classIso_of_borelComplete` | `ω^(1+β)` against `ω^(1+β)·2`; `K` a non-Borel transversal | distinct countable infinite ordinals, `BFEquiv (1+β)` hence `BFEquiv β`; diagonal of `K` measurable in `K × K`, so `K` is not Borel complete, consistent | sound for arbitrary `K` | none |
| `exists_lt_scottHeight_of_borelComplete` | heights bounded by `β`; the internal-rank counterexample above | isomorphism on `K` = level `β`, Borel for countable `L`; excluded by the external definition | sound | S01 |
| `borelReducible_eZero_of_borelComplete` | `0^ω`, `1 0^ω`; `0^ω`, `1^ω`; copy `F = ∅` alone | copies matched by `F ↦ F ∆ {0}`; finitely against cofinitely many `P`-points; reduces equality only | sound | none |
| `mk_quotient_classIso_of_borelComplete` | uncountable `L` | upper bound is `mk_le_continuum`, needs countability; present | sound | S01 |
| `not_borelComplete_of_rank_bounded` | analytic `K`; `graphClass` with `ρ = 0` on a non-measurable set of pairwise non-isomorphic codes; coded well-orders; reduced abelian `p`-groups by Ulm length (scope paragraph) | contrapositive of 6.2; diagonal measurable in the subtype square only; `K_α` countably many Borel orbits, `ρ` unbounded; (a) from Ulm, (b) from boundedness, conclusion consistent with torsion groups not being Borel complete | hypotheses as typed are the ones used | none |

Checks: all 92 evaluated against the theorems of their sections and against each other; none false,
vacuous or contradicting a theorem; every definition has at least three.

Headline theorems (README summary) against `Suggested.lean`: graphs, linear orders, trees: stated;
universal embedding: stated; characterisations (2) and (5): stated, (3) and (4) are the definition
again; not Borel, above `E₀`, continuum many classes, unbounded Scott height, obstruction, ordinal
multiples: stated. Non-smoothness is `not_isSmooth_of_borelReducible_eZero` applied to the `E₀`
theorem, rightly absent. The extension to function symbols needs the functional coding space, a
README target with no native carrier. Padding probe on the 13 theorems: none follows from the
pinned libraries by one lemma; `borelComplete_iff_graphClass` is short from
`borelComplete_graphClass` but not from the library, and both earlier passes kept it for that
reason; I do not raise it.

Policy: the pull request changes only `packages/CountableStructureSpacesPartII/` (10 files); no
pull-request numbers or process words in the README or docstrings; `theorem` throughout; no
`set_option`; `import Mathlib` and five `TauCeti.*` modules, all at the pin; no sorry'd data; no
declared gaps (`design/plan.json` has `"gaps": []`) and none needed.

Source independence: 12 passages compared with 5 sources (paolini-shelah-tfab Definitions 1.2, 1.4,
1.6, Fact 1.7; becker-kechris-bams lines 159–164, 172–177, 247–268; camerlo-gao-boolean lines
94–110; montalban-cst1 lines 4246–4288, 4623–4654; montalban-cst2 lines 2322–2339, 8997–9012),
none shared beyond what the mathematics forces; largest share paolini-shelah-tfab, 13 of 52
locators; contents compared with paolini-shelah-tfab (sections 1–5; all 13 locators lie in its
introduction and no layer corresponds to a section): independent. friedman-stanley-1989 could not
be read.

## Not verifiable

- friedman-stanley-1989 (7 citations), gao-idst (3), becker-kechris-1996 (2), hjorth-kechris-1996
  (2), kechris-cdst (1), mekler-1981 (1): uncertified, cited by locator only. Indirect support read:
  paolini-shelah-tfab line 125 and montalban-cst2 lines 9036–9040 attribute graphs, trees and linear
  orders to Friedman–Stanley; montalban-cst2 line 9057 cites the torsion-group theorem as their
  "Theorem 5" where the README says §4; camerlo-gao-boolean line 93 confirms kechris-cdst §16.C.
- Whether friedman-stanley-1989 "Theorem 1" is the graph theorem, and whether its §4 and
  hjorth-kechris-1996 §4–§5 state the lemma of 6.4 in the README's form: the locators alone. The
  README proves 6.4 from 6.2 and does not depend on the citation.
- Elaboration and truth of the sorry'd statements beyond the hand computations above: no Lean was
  run in this pass.

## Source issues

- **Error** in montalban-cst2 at Corollary II.39, printed page 38: the source says the second, negative, relation holds for any linear ordering as the right-hand factor; it should be for any nonempty one, since for the empty ordering both sides are the same order; affects nothing.
- **Misprint** in montalban-cst2 at §XI.2, printed page 208: the source says the graph result is in Part 1 at a theorem whose number is printed as an unresolved reference; it should be a numbered theorem of Part 1 (the graph coding is Theorem VI.27 there); affects nothing.

## For the human reviewers

- **Licence.** montalban-cst1 and montalban-cst2 are author's drafts (`sources.toml`, licence class
  author-page); the README cites the drafts' numbering (9 locators), not a published edition.
- **Not tested.** friedman-stanley-1989, primary source of the Layer 2–3 theorems and of the name
  of Layer 6.4, is uncertified: wording and arrangement were not compared with it.
- **Scope.** The Polish realization used in Layer 4.2 is supplied by NoncompactQuantumSymmetry
  Layer 4 (M1.BorelRealization), an operator-algebra roadmap; CountableStructureSpaces lists that
  theorem as out of its scope (its "Out of scope" section).
- **Scope.** The name "Friedman–Stanley obstruction" for the statement of Layer 6.4
  (`README.md:1321`) occurs in no source that could be read; the statement is the roadmap's own.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "39912c69dd2eeba2decc482737ef15d1f935914f", "job": "RT-CountableStructureSpacesPartII~2b", "model": "fable", "worker": "chris-x29"} -->
