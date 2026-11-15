<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/16877#issuecomment-6901972624 -->
Red team round 2 pass a (claude) of 39912c6

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) the bounded-Scott-height step restates a base target without citing it

   **Location.** `packages/CountableStructureSpacesPartII/README.md:1250–1259`: "Otherwise every code
   of `K` has Scott height at most `β`, and for `c, d ∈ K` isomorphism is equivalence at level `β` … and
   is measurable for the product of the subtype σ-algebras".

   **Claim.** The step is presented as this roadmap's own, with only pinned lemmas named.

   **Witness.** CountableStructureSpaces Layer 4.3, `measurableSet_iso_inter_of_scottHeight_le`, at its
   open head: codes of `modelsOf φ` of Scott height at most `β < ω₁` have Borel isomorphism, "namely
   `bfEquivSetoid L ℕ β` restricted". Same object, special case `K = modelsOf φ`.

   **Repair.** After "against the theorem." in that bullet insert: "For `K = modelsOf φ` this step is
   CountableStructureSpaces Layer 4.3, `measurableSet_iso_inter_of_scottHeight_le`; the argument is
   repeated here because `K` is an arbitrary set of codes and the graph is taken in `K × K`, not in the
   ambient square." Add to the *Needs:* of 6.2, after "`measurableSet_setOf_bfEquivSetoid`":
   "(CountableStructureSpaces Layer 4.3 is the case of a model class)". Tested on the instance: for
   `K` a non-measurable set of pairwise non-isomorphic graph codes (the set `A` of the second Check of
   6.4) the base statement does not apply, and the README's argument does.

2. **F02** (P3) closedness of the linear-order codes is a base worked example, not cited

   **Location.** `packages/CountableStructureSpacesPartII/README.md:855`: "API: it is closed and
   invariant; the code of `(ℕ, ≤)` with `orderStructure` is in it."

   **Claim.** Closedness of `linearOrderClass` is stated as API of this roadmap with no owner, while
   closedness of `graphClass` (`README.md:716–717`) cites the base.

   **Witness.** CountableStructureSpaces, Worked example 3, at its open head: "In Mathlib's
   `Language.order` the codes of linear orders form a closed set". Same set (the models of
   `linearOrderTheory`, with the symbol read as `≤`).

   **Repair.** Replace the sentence by: "API: it is closed (CountableStructureSpaces worked example 3;
   each axiom of `linearOrderTheory` is universal, so the class is an intersection of clopen sets,
   `isClopen_setOf_eval`) and invariant; the code of `(ℕ, ≤)` with `orderStructure` is in it." Add to
   the supplier list `README.md:326`, as a new bullet: "Worked example 3: the codes of linear orders in
   `Language.order` form a closed set (the API of 3.3)." and to the Dependencies of Layer 3
   (`README.md:1003–1004`): "CountableStructureSpaces Layer 6.2 (a Check of 3.3) and worked example 3".
   Tested: the code of `(ℕ, <)` fails reflexivity at the single atom `(0, 0)`, a clopen condition.

3. **F03** (P3) the Tau Ceti contract for the permutation topology is narrower than its use

   **Location.** `packages/CountableStructureSpacesPartII/README.md:260–263`:
   "`Equiv.Perm.instTopologicalSpace` (pointwise convergence of `σ` and `σ⁻¹` on a discrete space),
   `Equiv.Perm.instIsTopologicalGroup`, `Equiv.Perm.instPolishSpace` (countable carrier) and
   `Equiv.Perm.hasBasis_nhds_one_fixingSubgroup`".

   **Claim.** This is the exact contract with `TauCeti/Topology/Algebra/Group/Perm.lean`.

   **Witness.** Layer 4.1 (`README.md:1010–1024`, `1036–1038`) defines the instance for every
   topological `α` and uses `Equiv.Perm.continuous_apply`, `Equiv.Perm.continuous_inv_apply` and
   `Equiv.Perm.instDiscreteTopology`; none is in the contract. Pin: `Perm.lean:38–44` (topology under
   `[TopologicalSpace α]` only), `:53`, `:58`, `:178` (`[DiscreteTopology α] [Finite α]`).

   **Repair.** Replace the bullet by: "`TauCeti/Topology/Algebra/Group/Perm.lean`:
   `Equiv.Perm.instTopologicalSpace`, for every topological space `α` (the topology induced by
   `σ ↦ (σ, σ⁻¹)` from the product of the two spaces of functions with pointwise convergence), with
   `Equiv.Perm.continuous_apply` and `Equiv.Perm.continuous_inv_apply` (the evaluations of `σ` and
   `σ⁻¹` at a point are continuous); and for a discrete `α`: `Equiv.Perm.instIsTopologicalGroup`,
   `Equiv.Perm.instPolishSpace` (countable `α`), `Equiv.Perm.instDiscreteTopology` (finite `α`) and
   `Equiv.Perm.hasBasis_nhds_one_fixingSubgroup` (the pointwise stabilizers of finite sets form a
   neighbourhood basis of `1`)." Tested on `α = Fin 3`: the three named instances give a discrete
   group of order 6, as the second Check of 4.1 uses.

Three P3 findings (S01–S03), all citation or contract wording. No P1 or P2: every statement of
`Suggested.lean` and every bold README target was instantiated on the cases in the table below and
none failed.

## Round 1 findings at this head

| Round 1 finding | Status | Witness at 39912c6 |
|---|---|---|
| pass a F01 = pass b F01 (P3): two characterisations restate the definition | repaired | `packages/CountableStructureSpacesPartII/Suggested.lean:138–153` has only `borelComplete_iff_graphClass` and `borelComplete_iff_forall_permSpace`; module docstring line 20: "the characterisations of Borel completeness by the graphs and by the Borel `S∞`-spaces"; `README.md:29–30` names the same two; Layer 5 items 3 and 4 (`README.md:1140–1143`) are prose targets without names. Neither deleted name occurs in the README or the Lean file. |
| pass a F02 (P3): σ-algebra declared for ℕ only | repaired | `Suggested.lean:117–119`: "`instance instMeasurableSpacePerm {α : Type*} [TopologicalSpace α] : MeasurableSpace (Equiv.Perm α) := borel (Equiv.Perm α)`"; `README.md:1010–1014` defines it "For every topological space `α`". Elaborated type in the worker's signature listing: `{α : Type u_1} → [TopologicalSpace α] → MeasurableSpace (Equiv.Perm α)`. One contract line was not updated with it: S03. |
| pass b F02 (P3): docstring of `bfEquiv_omega0_opow_mul` misattributes the source | repaired | `Suggested.lean:160–163`: "Lemma II.38 there gives the relation at the odd level `2γ + 1` with the factor of larger size on the left (with the sizes reversed it can fail, Corollary II.39); by Observation II.35 …". Checked against montalban-cst2 lines 2202–2208, 2219–2222, 2337–2339, 2424–2425; the derivation of `BFEquiv γ` from both one-sided relations at level `2γ` was recomputed (row 15 of the table). |

No repair introduced an error. The two Checks added to Layer 4.1 (`README.md:1045–1052`) were
recomputed: `{σ | σ 0 = 0}` contains the identity and `{σ | σ 0 = 1}` the transposition of `0` and
`1`, both clopen; on `Equiv.Perm (Fin 3)` the evaluation at `0` has three fibres of two
permutations, `2 ^ 3 = 8` sets, and the identity and the transposition of `1` and `2` share a fibre.

## Verified sound

**Counts.** 20 declarations read (6 definitions, 1 instance, 13 theorems), all 217 lines of
`Suggested.lean`; all 1446 lines of the README, 22 numbered sections; 38 line locators into the 5
readable sources verified; 92 Checks evaluated; 16 cross-roadmap citations resolved; about 115
library names resolved at the pins.

**Elaborated signatures.** I ran no Lean (this pass is read-only). I compared the 20 elaborated
types of the worker's `#check @name` listing with the README statements, one by one. The file has no
`variable` or `include` line. Nothing changed: `classIso` keeps `[L.IsRelational]` and `{α}`;
`exists_lt_scottHeight_of_borelComplete`, `mk_quotient_classIso_of_borelComplete` and
`not_borelComplete_of_rank_bounded` carry `[∀ n, Countable (L.Relations n)]`, the others omit it, as
Convention 1 says; the two theorems on Borel `S∞`-spaces carry all four instance arguments.

**Dependency check** (the brief's command):

```
depcheck: 240 roadmaps, 2256 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

**Suppliers resolved this round.**

| Citation | Where read | Result |
|---|---|---|
| CountableStructureSpaces Layer 0 (closedness of the range of the graph coding) | head of its open pull request (another author's new roadmap folder) | listed under "Still to build" of Layer 0 |
| CountableStructureSpaces Layer 1.2 (`ContinuousSMul`) | same | bullet "The action is jointly continuous (a `ContinuousSMul` instance), for every language" |
| CountableStructureSpaces Layers 4.1, 4.2 | same | both headings; `bfEquivSetoid`, `scottHeight` at the pin |
| CountableStructureSpaces Layer 4.4 `exists_uniform_bfSeparation` | same, README and Lean | analytic `A` of non-isomorphic pairs, `∃ β < ω₁`, no pair `BFEquiv β` on empty tuples; the form 6.2 uses |
| CountableStructureSpaces Layer 6.2 (five names) | same | all five; strict well-orders; types `ω ≤ β < ω₁` |
| CountableStructureSpaces worked example 2 | same | Scott height at most `ω`, countably many Borel orbits |
| CountableStructureSpaces scope | same, "Out of scope" | Borel completeness of graphs and linear orders excluded there |
| NoncompactQuantumSymmetry Layer 4, M1.BorelRealization, `exists_polishTopology_continuousSMul` | head of its open pull request | `[PolishSpace G] [BorelSpace G] [StandardBorelSpace X] [MeasurableSMul₂ G X]`, conclusion a Polish topology with the same Borel sets and `ContinuousSMul`; as cited |
| BorelEquivalenceRelations §5.1–§5.4 | main | headings 5.1–5.4 |
| InfinitaryLogic Layer 1 | `Completed/InfinitaryLogic` | "Layer 1: back-and-forth, potential isomorphism, and Karp's theorem" |
| InfinitaryModelExistence Layer 0.3, Layer 6 | main | small presentation in 0.3; "Layer 6: the graph translation" |
| CountableModelCounting Layer 0 (`isoSetoidOn α φ`, transport between presentations) | main and its open revision | both present in both |

Merge order: NoncompactQuantumSymmetry is the line before this roadmap; the other suppliers are on
main or are another author's new roadmap folder.

**Ownership.** Searched by object in READMEs and Lean files of main and the open heads: Borel
completeness, the Friedman–Stanley codings, a σ-algebra on `Equiv.Perm`, a universal `S∞`-space.
No owner other than this roadmap; CountableModelCounting's "Borel complete invariant" is a different
notion. The six definition names and `bfEquiv_omega0_opow_mul` occur in no `Suggested.lean` on main
or at an open head. One combined name search failed on a revision the tool could not resolve; the
names were then searched one by one, without error. At the pins: no `BorelComplete`, no
`MeasurableSpace (α ≃ β)` instance in Mathlib or Tau Ceti, no back-and-forth result for ordinal
multiples or intervals (`ModelTheory/BackAndForth/DiscreteOrder.lean` treats discrete orders without
endpoints at level `ω`; `Scott/WellOrder.lean` has one theorem, on Scott sentences).

**Library facts relied on, read at the pin.** `TauCeti.BFEquiv`
(`ModelTheory/BackAndForth/Equivalence.lean:49–57`): level 0 is `SameAtomicType`, a successor keeps
the previous level and adds one-element forth and back, a limit is all lower levels.
`nonempty_equiv_of_bfEquiv_of_scottHeight_le` (`ModelTheory/Scott/Height.lean:186–189`): countable
`M`, `N`, `scottHeight M ≤ β`, `BFEquiv β` on empty tuples; no further hypothesis.
`Setoid.BorelReducible` (`SetTheory/Descriptive/BorelReducibility.lean:100–101`) asks only for
measurable spaces. `Measurable.measurableEmbedding` needs a standard Borel source and a countably
separated target, both present in 4.2. `MeasurableSet.analyticSet_image` needs second countability
of the range, which 6.4 has from the countability of `L`. `orderStructure` is a `def`
(`Mathlib/ModelTheory/Order.lean:209`), so the `letI` of `linearOrderClass` and `treeClass` has no
competitor. `Descriptive.tree` is closure under removing the last entry.

**The computed pass.** One row per statement.

| # | Statement | Instances tried | Values computed | Result |
|---|---|---|---|---|
| 1 | `classIso` (0.1) | `Fin 2`, one unary `P`; `K = ∅`; `P` infinite and coinfinite | 4 codes, classes `|P| = 0, 1, 2`: 3; empty setoid; one class | as README |
| 2 | set reducibility (0.2) | `X = Unit, Y = Empty, A = ∅`; `eZero` against the diagonal; analytic pull-back | no map, clause false; two-valued map works while `eZero` is not smooth; finer Polish topology then coarser | as README |
| 3 | relabelling (1.1) | `Fin 3`, `e = (0 1 2)`, `P = {0}`; `Fin 0` | `restrict e.symm`: `e.symm w = 0 ⇔ w = 1`; `restrict e`: `w = 2`; 1 code or 2 codes, 1 or 2 classes | as README |
| 4 | `BorelComplete` (1.2) | `K = ∅`; one unary predicate; `graphClass ∩` orbit of the empty graph | no map into `∅`; `ℵ₀` classes against `2^ℵ₀`; one class | not complete in all three |
| 5 | functional space (1.3) | one constant, `F k = n → ∞`; action on tables | relation `{n}` tends to `∅`, outside the range; graph of `σ • F` at `w` is graph of `F` at `σ⁻¹ ∘ w` | Gδ, not closed, equivariant |
| 6 | incidence graph (2.1) | colour-preserving isomorphism; nullary symbol; two unary symbols uncoloured | image of `atom R v` is `atom R (σ ∘ v)`; `d.eval (atom R w) = c.eval (atom R (σ⁻¹ ∘ w))`; swap of symbols is an uncoloured isomorphism | matches Convention 4 |
| 7 | clique tags (2.2) | one edge, `κ = (0, 1)` | `2 + 3 + 4 = 9` vertices, `1 + 2 + 3 + 6 = 12` edges; tag `0` has `κ + 2` triangle neighbours | as README |
| 8 | `graphClass`, `borelComplete_graphClass` | empty language; loop; one-way edge | one code, constant map into an infinite vertex set; both excluded | sound |
| 9 | dense colouring (3.1) | `3/4, 5, −1/6, 1/8008`; negative/non-negative colouring | `2, 0, 1, 3`; initial segment cannot map onto a final one | as README |
| 10 | order on `List ℚ`, parent (3.2) | `[] < [−1] < [0]`; `x = [1, 5]`, rival `[q]`, `q < 1` | dense, least element `[]`, no greatest; `[(q + 1)/2]` lies between with length 1 < 2 | parent unique |
| 11 | unravelling lemma (3.2) | `c = {adj 0 1}`, `d = {adj 1 0}`; loop against empty graph; child of `Ψ x` | bits at `(1, 0)` both true; colour of `[1]` unmatched; `Ψ(parent y) = parent(Ψ y)` gives back | (i)–(iii) agree |
| 12 | `linearOrderClass`, `exists_continuous_reduction_linearOrderClass`, `borelComplete_linearOrderClass` | `(ℕ, ≤)`, `(ℕ, <)`, divisibility; blocks `ω + (χ + 2)`; empty against complete graph; constant-true code | in, out, out; finite condensation classes are the final parts, size `χ + 2 ≥ 2`; colours differ at `[1, 1/2]`, agree at `[1, 2]`; image still linear | iff holds on all codes |
| 13 | `treeClass`, `borelComplete_treeClass`, 3.5 | `(ℕ, ≤)`, star, `(ℕ, ≥)`, chains `c_n`; `χ = 0, 1`; star with `n` between `0` and `1` | in, in, out, `c_n →` code of `≥`; chain above `(x, some 0)` has 2, 3 nodes; edge `0—1` lost in every `T_n` | Borel, not closed; cover graph Borel, not continuous |
| 14 | `instMeasurableSpacePerm`, `universalLanguage`, `exists_equivariant_measurableEmbedding_universal` | `X = ∅`; `X = ℕ`, `S_n = {n}`; one point; `g' = g h`; `m = 0, 1, 2` | empty map; symbol `(1, 0)` holds of `a` at `x` iff `x = a`; injective tuples; condition at `(h • x, a)` is that at `(x, h⁻¹ ∘ a)`; `unpair = (0,0), (0,1), (1,0)`, `pair 1 0 = 2` | equivariant for Convention 4, injective |
| 15 | interval lemma, `bfEquiv_omega0_opow_mul` (6.1) | `γ = 0, 1`; `ω` against `ω·2` and `ω + 1` at level 2; successor step; `δ = 1, ε = 2` in the source's relations | trivial; any two nonempty orders; holds, fails (empty upper interval); final segment `ω^(γ+1)·(δ − κ)`, `δ − κ ≥ 1`, `m'` at `ω^γ·μ' + ρ < ω^γ·2`; `ω·2 ≤_3 ω`, both at level 2, hence `BFEquiv 1` | true as typed; `δ, ε ≠ 0` needed from `γ = 1` |
| 16 | `borelComplete_iff_graphClass`, `borelComplete_iff_forall_permSpace` | `K = graphClass`, `∅`, one unary predicate; `X = PUnit`; universe `w ≠ 0` | true/true; false/false; false/false; (5) at `K = ∅` fails on a nonempty `X`; `ULift` of the coding space | iff both ways, every `w` |
| 17 | `not_measurableSet_classIso_of_borelComplete` | `β = 0`; uncountable `L` | `ω` against `ω·2`, countable, infinite, distinct, `BFEquiv 1`; only preimages under `f × f` used | sound without countability |
| 18 | `exists_lt_scottHeight_of_borelComplete` | heights bounded by `β` on a non-measurable `K` | isomorphism on `K` is the level-`β` relation pulled back to `K × K` | sound for arbitrary `K` (S01 for the citation) |
| 19 | `borelReducible_eZero_of_borelComplete`, `mk_quotient_classIso_of_borelComplete` | `0^ω` against `1 0^ω` and `1^ω`; uncountable `L` | copies matched by `F ↦ F ∆ {0}`; finitely against cofinitely many `P`-points; upper bound needs `mk_le_continuum` | sound; countability present where needed |
| 20 | `not_borelComplete_of_rank_bounded` | `K = ∅`; analytic `K`; `graphClass` with `ρ = 0` on a non-measurable antichain; coded well-orders | conclusion true; contrapositive of 6.2; diagonal measurable in `A × A`, not in the ambient square; `K_α` a countable union of Borel orbits, `ρ` unbounded | not vacuous; (a) as typed is what the proof uses |

Checks: 92 evaluated against the statements of their sections and against each other; none false or
vacuous; every definition has at least three.

**Headline theorems and padding.** Headlines of the README summary, all stated: graphs, linear
orders and trees Borel complete; the continuous reduction of graphs to linear orders; the universal
embedding; the characterisations by graphs and by Borel `S∞`-spaces; ordinal multiples; not Borel;
unbounded Scott height; `E₀` below; continuum many types; the obstruction. Non-smoothness is one
pinned lemma from the `E₀` theorem and is rightly absent; Layers 1.3 and 3.5 need carriers the pins
lack. One-tactic probe on the 13 theorems: none follows from the pins alone.
`borelComplete_iff_graphClass` follows from `borelComplete_graphClass` in a few lines; it was kept
in round 1 as the working criterion of the subject and I do not raise it.

**Policy.** The pull request changes only `packages/CountableStructureSpacesPartII/`. No
pull-request number, process narrative, `lemma` keyword, `set_option`, `#eval` or sorry'd data; one
`import Mathlib` and five `TauCeti.*` modules, all at the pin. `design/plan.json` has `gaps: []`;
none is needed. `design/README.md` and `design/plan.json` still list the two names deleted in
round 1; the package README and Lean file do not.

Source independence: 12 passages compared with 5 sources, none shared; largest share paolini-shelah-tfab, 13 of 52 locators; contents compared with paolini-shelah-tfab (sections 1–5; every locator lies in section 1): independent.

## Not verifiable

- friedman-stanley-1989, gao-idst, becker-kechris-1996, kechris-cdst, hjorth-kechris-1996,
  mekler-1981: uncertified, cited by locator only; none of their 16 locators was checked.
- The locator "Theorem 1" of friedman-stanley-1989 for graphs (`README.md:740`,
  `Suggested.lean:68`): paolini-shelah-tfab lines 122–125 credit graphs, linear orders and trees to
  that paper, camerlo-gao-boolean lines 111–114 credit graphs to earlier classical results and only
  trees, linear orders and fields to it. The theorem number could not be checked.
- Whether friedman-stanley-1989 §4 and hjorth-kechris-1996 §4–§5 state Layer 6.4 in the form given.
  The README proves it from 6.2, so the statement does not depend on the citation.
- Elaboration: not run in this pass; the types compared are the worker's listing at this head.

## Source issues

- **Error** in montalban-cst2 at Corollary II.39, printed page 38 (line 2424): the source says the one-sided relation at level `2α + 1` fails from `ω^α` to `ω^α + ω^α·A` for any linear ordering `A`; it should be for any nonempty `A`, the two orders being equal when `A` is empty; affects a stated result.

## For the human reviewers

- **Licence.** montalban-cst1 and montalban-cst2 are author's drafts (`sources.toml`, author page);
  9 of 52 locators cite the drafts' numbering (Lemma VI.18, Theorem VI.27, Lemmas II.37, II.38, XI.2).
- **Not tested.** friedman-stanley-1989, primary source of Layers 2–3 and of the name of Layer 6.4,
  is uncertified: wording and arrangement were not compared with it.
- **Scope.** The name "Friedman–Stanley obstruction" (`README.md:1321`, `Suggested.lean:201`) was
  found in no readable source; the statement of 6.4 is the roadmap's own formulation.
- **Scope.** The Polish realization of Borel actions is supplied by NoncompactQuantumSymmetry
  Layer 4, an operator-algebra roadmap; whether descriptive set theory should own it is a decision.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "39912c69dd2eeba2decc482737ef15d1f935914f", "job": "RT-CountableStructureSpacesPartII~2a", "model": "fable", "worker": "chris-x82"} -->
