<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/16877#issuecomment-6901399139 -->
Red team round 1 pass a (claude) of 78b884a

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) two of the four characterisations are restatements of the definition (padding)

   **Location.** `packages/CountableStructureSpacesPartII/Suggested.lean:143–156`,
   `borelComplete_iff_forall_structureSpace` and `borelComplete_iff_forall_measurableSet`.

   **Claim.** They are stated as headline theorems of Layer 5.

   **Witness.** `classIso K'` is by definition `Setoid.comap Subtype.val (isoSetoid L' ℕ)`
   (`Suggested.lean:44–46`), so each direction is one pinned lemma and `BorelReducible.trans`, with no
   theorem of this roadmap:

   - (3) ⇒ (1) and (3) ⇒ (4): `(Setoid.borelReducible_comap measurable_subtype_coe _).trans (h L')`
     (Tau Ceti `SetTheory/Descriptive/BorelReducibility.lean:115`, `:127`).
   - (1) ⇒ (3): the map `x ↦ ⟨x, trivial⟩` into the subtype `Set.univ`, with `Iff.rfl`, then
     `(h L' Set.univ MeasurableSet.univ _).trans`.
   - (4) ⇒ (1): instantiate `B := K'`.

   Both mirror the README's own API bullets "Whole space" and "Restriction" of Layer 0.1
   (`README.md:365–372`), and the README's proof (`README.md:1129–1130`) uses only Layers 0.1 and 1.2
   for them. Characterisations (2) and (5) are different: (2) needs `borelComplete_graphClass` and (5)
   needs the universal embedding.

   **Repair.** Delete `borelComplete_iff_forall_structureSpace` and
   `borelComplete_iff_forall_measurableSet` from `Suggested.lean` (the README keeps statements (3) and
   (4) of Layer 5 as targets, in prose, without the two backticked names). Then:

   - module docstring, `Suggested.lean:20`: replace "four characterisations of Borel completeness
     (Layer 5)" by "two characterisations of Borel completeness, by the graphs and by the Borel
     `S∞`-spaces (Layer 5)";
   - `README.md:29–31`: replace "the four characterisations `borelComplete_iff_graphClass`,
     `borelComplete_iff_forall_structureSpace`, `borelComplete_iff_forall_measurableSet`,
     `borelComplete_iff_forall_permSpace`" by "the characterisations `borelComplete_iff_graphClass`
     and `borelComplete_iff_forall_permSpace`";
   - `README.md:1122` and `README.md:1125`: drop the two parenthesised names.

2. **F02** (P3) the σ-algebra on permutations is declared for ℕ only

   **Location.** `packages/CountableStructureSpacesPartII/Suggested.lean:115–116`:
   "`instance instMeasurableSpacePerm : MeasurableSpace (Equiv.Perm ℕ) := borel (Equiv.Perm ℕ)`";
   `README.md:1007–1009` and Convention 5 (`README.md:150–152`).

   **Claim.** Layer 4.1 owns the σ-algebra of the permutation group.

   **Witness.** Tau Ceti's topology is declared for every carrier:
   `TauCeti/Topology/Algebra/Group/Perm.lean:38–42`, `variable {α X : Type*} [TopologicalSpace α]`,
   `instance instTopologicalSpace : TopologicalSpace (Equiv.Perm α)`. The roadmap itself uses other
   carriers (`classIso` on `Fin 2`, `Fin 3`, `README.md:401–404`, `510–515`), and CountableModelCounting
   Layer 0 works on `Fin n`. An instance on `Equiv.Perm ℕ` alone is a special case that a later general
   instance would duplicate. For `α = Fin n` the general instance is the Borel σ-algebra of a discrete
   finite group, the discrete one, which is what `MeasurableSMul₂ (Equiv.Perm (Fin n)) X` needs.

   **Repair.** In `Suggested.lean` replace the declaration by

   ```lean
   /-- The σ-algebra of a permutation group: the Borel σ-algebra of Tau Ceti's topology
   `Equiv.Perm.instTopologicalSpace` (pointwise convergence of a permutation and its inverse). For
   `α = ℕ` it is the σ-algebra of `S∞`. Neither pin puts a σ-algebra on `Equiv.Perm α`. -/
   instance instMeasurableSpacePerm {α : Type*} [TopologicalSpace α] :
       MeasurableSpace (Equiv.Perm α) :=
     borel (Equiv.Perm α)
   ```

   and in `README.md:1007–1009` say "Define `instMeasurableSpacePerm`, the σ-algebra on
   `Equiv.Perm α` for every topological carrier `α`, as the Borel σ-algebra `borel` of Tau Ceti's
   topology; for `α = ℕ` it makes `Equiv.Perm ℕ` a Borel space and (countable carrier,
   `Equiv.Perm.instPolishSpace`) a standard Borel space"; Convention 5 keeps its wording for ℕ. The
   five declarations that mention `Equiv.Perm ℕ` are unchanged. I ran no Lean: the repair worker
   elaborates the new instance and rechecks `#check @exists_equivariant_measurableEmbedding_universal`
   and `#check @borelComplete_iff_forall_permSpace`.

Two P3 findings (R01 padding, R02 generality of one instance). No P1 or P2: every statement of
`Suggested.lean` and every bold README target was instantiated on the degenerate cases below and
none failed; every supplier citation resolves at the cited head or pin; every line locator into the
five readable sources was read and supports its claim.

## Verified sound

**Counts.** 22 declarations read (7 definitions, 15 theorems), all 226 lines of `Suggested.lean`;
all 1421 lines of the README, 21 numbered sections with their targets; 40 line locators into the 5
readable sources verified; 90 Checks evaluated; 14 cross-roadmap citations resolved; about 110
library names resolved at the pins (file and declaration).

**Elaborated signatures.** I ran no Lean (read-only pass). I compared the 22 elaborated types of the
worker's signature listing with the README statements: none lost a binder; `classIso` keeps
`[L.IsRelational]` and the carrier `α`; the two theorems that need countability of `L`
(`exists_lt_scottHeight_of_borelComplete`, `mk_quotient_classIso_of_borelComplete`) and
`not_borelComplete_of_rank_bounded` carry `[∀ n, Countable (L.Relations n)]` in their own
signatures, as README 6.2–6.4 say; the others omit it, as Convention 1 says.

**Dependency check.** Output of the brief's command:

```
depcheck: 241 roadmaps, 2244 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

**Suppliers resolved.**

| Citation | Where read | Result |
|---|---|---|
| CountableStructureSpaces Layer 0 (closedness of the simple-graph codes) | head of its open pull request (a new roadmap of another author) | "Still to build: … closedness of the range of the graph coding" in Layer 0 |
| CountableStructureSpaces Layer 1.2 (`ContinuousSMul`) | same | bullet "The action is jointly continuous (a `ContinuousSMul` instance)" |
| CountableStructureSpaces Layers 4.1, 4.2 | same | headings exist; implemented names at the pin |
| CountableStructureSpaces Layer 4.4 `exists_uniform_bfSeparation` | same, README and Suggested.lean | analytic `A`, non-isomorphic pairs, `∃ β < ω₁`, no pair `BFEquiv β`; as used in 6.2 |
| CountableStructureSpaces Layer 6.2 (`wellOrderClass`, `exists_mem_wellOrderClass_type_eq`, `analyticSet_compl_wellOrderClass`, `not_measurableSet_wellOrderClass`, `analytic_type_bounded`) | same | all five names, strict well-orders, types `ω ≤ β < ω₁` |
| CountableStructureSpaces worked example 2 | same | Scott height at most `ω`, countably many Borel orbits |
| CountableStructureSpaces scope (Borel completeness excluded) | same, "Out of scope" | excluded there, so owned here |
| NoncompactQuantumSymmetry Layer 4, M1.BorelRealization, `exists_polishTopology_continuousSMul` | head of its open pull request, README and Suggested.lean | Polish group with Borel σ-algebra, standard Borel `X`, `MeasurableSMul₂`; same hypotheses as cited |
| BorelEquivalenceRelations §5.1–§5.4 | main, and its open revision | headings 5.1–5.4 in both |
| InfinitaryLogic Layer 1 | `Completed/InfinitaryLogic` | `BFEquiv`, `IsTupleBFSystem`, `countable_potentialIso_iff_iso` |
| InfinitaryModelExistence Layer 0.3 (small presentation), Layer 6 (graph translation) | main, and its open revision | both sections in both |
| CountableModelCounting Layer 0 (`isoSetoidOn α φ`, transport between presentations) | main, and its open revision | both in both |

Ownership: no roadmap on main or open pull request states Borel completeness, the Friedman–Stanley
codings, a universal `S∞`-space, set reducibility, or a σ-algebra on `Equiv.Perm` (searched by
object in READMEs and Lean files); no `Suggested.lean` declares a name of this file. The pins have
no `BorelComplete`, no σ-algebra instance on `Equiv.Perm`, no back-and-forth computation for ordinal
multiples (`TauCeti/ModelTheory/Scott/WellOrder.lean` has one theorem, on Scott sentences).

**Library facts relied on, quoted at the pin.** `TauCeti.BFEquiv`
(`ModelTheory/BackAndForth/Equivalence.lean:49–57`): level 0 is `SameAtomicType`; the successor is
the previous level and one-element forth and back; a limit is all lower levels. `Language.order`'s
`orderStructure` is a `def`, not an instance (`Mathlib/ModelTheory/Order.lean:207–209`), so the
`letI := c.toStructure` of `linearOrderClass` and `treeClass` has no competitor. The σ-algebra of
`RelationalConfiguration` is the product one (`RelationalConfiguration/Basic.lean:182–183`), for
every language; `BorelSpace` only under countability. `graphExpansion` reads the value in the last
coordinate (`GraphTranslation/Language.lean:234`), as README 1.3 says. `Descriptive.tree` is closed
under removing the last entry (`Mathlib/SetTheory/Descriptive/Tree.lean:33`).

**The adversarial pass.** One row per statement; values on each side.

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| `classIso` (0.1) | `K = ∅`; `K = univ`; `Fin 2`, one unary `P` | empty setoid; inclusion bijective, same classes as `isoSetoid`; 4 codes, classes `|P| = 0, 1, 2`: 3 | as README |
| set reducibility (0.2) | `X = Unit, Y = Empty, A = ∅`; `eZero` graph to the diagonal | no map exists, clause `IsEmpty X ∨ Nonempty Y` false; two-valued map `(0,0)`/`(0,1)` works, while `¬ IsSmooth eZero` | converse fails, as stated |
| relabelling (1.1) | `Fin 3`, `e = (0 1 2)`, `P = {0}` | `restrict e.symm`: `P(w) ⇔ e.symm w = 0 ⇔ w = 1`; `restrict e`: `w = 2` | convention as README |
| `BorelComplete` (1.2) | `K = ∅`; `K` one-predicate codes; `K ⊆ K₂` | no map into `∅`; quotient countable vs `2^ℵ₀` source classes; transfer by comap | as README |
| functional space (1.3) | one constant `k`, `F k = n → ∞` | unary graph relation `{n}` converges to `∅`: range not closed, Gδ | as README |
| incidence graph (2.1) | colour-preserving isomorphism; nullary symbol; `d = σ • c` | `t_q ↦ t_{atom R (σ ∘ v)}`; `(σ • c).eval (atom R (σ ∘ v)) = c.eval (atom R v)` | matches Convention 4 |
| clique tags (2.2) | edge with `κ = (0, 1)` | vertices `2 + 3 + 4 = 9`; edges `1 + 2 + 3 + 6 = 12`; tag clique size `κ + 3 ≥ 3` | as README |
| `borelComplete_graphClass` | `L'` empty; codes off `graphClass` not needed | vertex set infinite (points), map constant; continuous by coordinates | sound |
| dense colouring (3.1) | `3/4, 5, -1/6, 1/8008`; `σ` a transposition | `ν = 2, 0, 1, 3`; `ν (π r) = σ (ν r)` from the isomorphism of predicates `ν⁻¹(m)` to `ν⁻¹(σ m)` | as README |
| parent in `List ℚ` (3.2) | `x = p ++ [q]`; a rival `p'` of the same length | any `z` in `(p, x)` extends `p`; `p' < p < x` with `|p| < |x|` excludes `p'` | unique, as README |
| unravelling lemma (3.2) | loop code against empty graph; `adjAtom 0 1` against `adjAtom 1 0`; edges `{0,1}`, `{0,2}` | colour of `[1]` differs; `τ`-related, colours agree at `(1,0)` and `(0,1)`; differ at `[1, 1/2]` | (i)–(iii) agree in each |
| `exists_continuous_reduction_linearOrderClass` | blocks `ω + (χ + 2)`; empty against complete graph | finite condensation classes are the final parts, sizes `χ + 2 ≥ 2`; colour of `[1, 1/2]` occurs for one only | sound, also off `graphClass` |
| `linearOrderClass`, `treeClass` | `(ℕ, ≤)`, `(ℕ, <)`, `(ℕ, ≥)`, star, chains `c_n` | in, out (irreflexive), out of `treeClass` (infinite down-sets), in, `c_n → (ℕ, ≥)` | closed / not closed as README |
| `borelComplete_treeClass` | `χ = 0, 1` | chain above `(x, some 0)` has `χ + 2` nodes: 2, 3; original nodes are those with an infinite chain above | sound |
| trees, two presentations (3.5) | star with `n` inserted between `0` and `1` | `T_n → T`, adjacency `(0,1)` false for all `T_n`, true for `T` | Borel, not continuous, as README |
| `universalLanguage`, packing (4.2) | `m = 0, 1, 2` | `Nat.unpair = (0,0), (0,1), (1,0)`; `Nat.pair 1 0 = 2`; `k ≤ m` | as README |
| `exists_equivariant_measurableEmbedding_universal` | `X = ∅`; `X = ℕ`, `S_n = {n}`; one point | empty map is an embedding; symbol `(1,0)` holds of `(a)` at `x` iff `x = a`; injective tuples | sound; equivariance: condition at `h • x, a` is the condition at `x, h⁻¹ ∘ a` |
| `borelComplete_iff_graphClass` | `K = graphClass`, `∅`, one-predicate codes | true/true; false/false; false/false (countably many classes) | iff holds both ways |
| `borelComplete_iff_forall_permSpace` | `X` in `Type w` from codes in `Type 0`; trivial action on Cantor space | `ULift` of an invariant Borel class is a Borel `S∞`-space; gives equality on Cantor space | iff holds both ways; R01 for the other two |
| interval lemma (6.1) | `γ = 0`; successor; empty interval | trivial; new point lands in one interval, lower levels rebuild it; empty against nonempty fails at level 1 | sound in the one-step convention |
| `bfEquiv_omega0_opow_mul` | `γ = 0`; `γ = 1`, `ω` against `ω·2`; `δ = 0`; final segments | `1·δ` against `1·ε` at level 0; holds even at level 2, fails at 3; empty against nonempty fails at level 1; `−(ξ+1) + ω^(γ+1)·δ = ω^(γ+1)·(δ − κ)`, `δ − κ ≥ 1` | true as stated; `δ, ε ≠ 0` needed |
| `not_measurableSet_classIso_of_borelComplete` | `ω^(1+β)` against `ω^(1+β)·2`; uncountable `L` | distinct countable infinite ordinals, `BFEquiv (1+β)` hence `BFEquiv β`; only preimages are used | sound without countability |
| `exists_lt_scottHeight_of_borelComplete` | bounded height `β` | isomorphism on `K` is the level-`β` relation, Borel for countable `L` | sound for arbitrary `K` |
| `borelReducible_eZero_of_borelComplete` | `0^ω` against `1 0^ω`; against `1^ω` | copies matched by `F ↦ F ∆ {0}`; finitely against cofinitely many `P`-points | sound |
| `mk_quotient_classIso_of_borelComplete` | uncountable `L` | upper bound uses `mk_le_continuum`, needs countability; present in the signature | sound |
| `not_borelComplete_of_rank_bounded` | analytic `K`; `K = graphClass`; coded well-orders; `ρ` with values `≥ ω₁` | reduces to 6.2; no `ρ` satisfies (a), (b); `K_α` a countable union of Borel orbits; excluded on singletons by (b) | sound; hypothesis (a) in the subtype square is what the proof uses |

Checks: all 90 evaluated against the statements of their sections; none false, none contradicting
a theorem. Every definition has at least three.

Policy: the package changes only its folder; no pull-request numbers or process words in the README
or docstrings; `theorem` throughout; no `set_option`; one `import Mathlib` and five `TauCeti.*`
modules, all present at the pin; no sorry'd data; every target has a locator or is marked as the
roadmap's own construction; no declared gaps (`design/plan.json` has `gaps: []`), and none needed.

Headline theorems (README summary) against `Suggested.lean`: graphs, linear orders and trees Borel
complete: stated; universal embedding: stated; characterisations: stated (R01 on two); not Borel,
above `E₀`, continuum many classes, unbounded Scott height, obstruction: stated; back-and-forth for
ordinal multiples: stated. Non-smoothness is one pinned lemma
(`not_isSmooth_of_borelReducible_eZero`) from the `E₀` theorem and is rightly absent. The extension
to function symbols (1.3) needs the functional coding space, a README target; on native carriers it
is the definition again, so nothing statable is missing.

Source independence: 21 passages compared with 5 sources, none shared (the closest is the parent
relation of README 3.2 against montalban-cst1 lines 4282–4283: the same three conditions, which the
mathematics forces, no run of six shared words); largest share paolini-shelah-tfab, 14 of 63
locators; contents compared with paolini-shelah-tfab (sections 1–5) and montalban-cst1 (chapter
list): independent.

## Not verifiable

- friedman-stanley-1989 (Theorem 1, §2, §3, §4), gao-idst (§5.2, §13.1), becker-kechris-1996 (§2.6,
  §2.7, §3.4), kechris-cdst (§16.C), hjorth-kechris-1996 (§4–§5), mekler-1981 (§2): recorded as
  uncertified, cited by locator only. Corroborated indirectly where possible: paolini-shelah-tfab
  lines 122–127 attribute the graph, linear order and tree results and the torsion-group result to
  Friedman–Stanley; camerlo-gao-boolean line 93 confirms the kechris-cdst locator.
- Whether friedman-stanley-1989 §4 and hjorth-kechris-1996 §4–§5 state the lemma of README 6.4 in
  the form given (a rank bounded on analytic subsets): the README itself says the torsion-group
  theorem of those sections is not an instance of 6.4, so the locator supports the method, and I
  could not check that it supports the statement. The statement is proved in the README from 6.2
  and does not depend on the citation.
- Elaboration: not run in this pass; the repair of R02 must be elaborated by the repair worker.

## Source issues

- none

## For the human reviewers

- **Licence.** montalban-cst1 and montalban-cst2 are author's drafts from the author's page
  (`sources.toml`, licence class author-page); the README cites the drafts' numbering (Lemma VI.18,
  Theorem VI.27, Lemmas II.37, II.38, XI.2), not that of a published edition.
- **Scope.** The supplier of the Polish realization of Borel actions is NoncompactQuantumSymmetry
  Layer 4 (M1.BorelRealization), an operator-algebra roadmap; the citation resolves at its open
  head. Whether a descriptive-set-theory roadmap should own that theorem is an ownership decision.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "78b884ab52c7ffbaf7b3f895926dca87015f26eb", "job": "RT-CountableStructureSpacesPartII~1a", "model": "fable", "worker": "chris-x26"} -->
