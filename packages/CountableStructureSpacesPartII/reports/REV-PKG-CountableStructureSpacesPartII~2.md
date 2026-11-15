<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/16877#issuecomment-6899120112 -->
Review (claude) of 0e52b90

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) the obstruction of 6.4 is the contrapositive of 6.2 for every `ρ`

   - **Location.** `packages/CountableStructureSpacesPartII/Suggested.lean` lines 210–221
     (`not_borelComplete_of_rank_bounded`, binder `(hK : MeasurableSet K)`);
     `packages/CountableStructureSpacesPartII/README.md` line 1291: "let `K ⊆ RelationalConfiguration
     L ℕ` be Borel and `ρ : RelationalConfiguration L ℕ → Ordinal.{0}`"; Summary lines 18–20; Scope
     lines 100–103; Downstream consumers line 1367.
   - **Claim.** A class stratified by a rank `ρ` into pieces `K_α` with Borel isomorphism, with `ρ`
     bounded on analytic subsets of `K`, is not Borel complete; a later roadmap applies it to torsion
     abelian groups.
   - **Witness.** `K` is Borel, hence analytic, so (b) at `A = K` gives `α < ω₁` with `K_α = K`, and
     (a) at `α` is the negation of 6.2. Scratch proof at the pins, 7 lines, no error:
     `obtain ⟨α, hα, hb⟩ := hbdd K subset_rfl hK.analyticSet`, then
     `not_measurableSet_classIso_of_borelComplete hB` on `K_α = K` (`Set.inter_eq_left`).
     So no instance has an unbounded rank: abelian `p`-groups (a Borel class, unbounded Ulm length)
     fail (b), and the stratification plays no part. The README's own proof never uses that `K` is Borel.
   - **Repair.** Drop the hypothesis that degenerates the statement; the README proof is unchanged.
     1. `Suggested.lean`: delete `(hK : MeasurableSet K)` from `not_borelComplete_of_rank_bounded`
        (the file then elaborates with `sorry` as the only warning; I checked on a scratch copy, and
        the 7-line proof above no longer applies). Docstring: "a class `K` of codes, not assumed
        Borel, with a rank `ρ` into the ordinals such that … is not Borel complete. For a Borel `K` the
        second hypothesis bounds `ρ` on `K` and the statement is the contrapositive of
        `not_measurableSet_classIso_of_borelComplete`."
     2. README 6.4, first sentence: "let `K ⊆ RelationalConfiguration L ℕ` be any set of codes (not
        assumed Borel) and `ρ : …`". Replace the first Check by: "For a Borel `K` (in particular with
        `ρ = 0`), `K` is an analytic subset of itself, so (b) gives `α` with `K_α = K`, (a) at `α` is
        the negation of the conclusion of 6.2, and the lemma is the contrapositive of 6.2 whatever `ρ`
        is: the lemma has content only for classes that are not analytic." Add the Check: "For
        `K = wellOrderClass lt` in the language of one binary symbol (coanalytic and not Borel,
        base Layer 6.2) and `ρ` the order type on `K`, `0` elsewhere: (b) is the base's
        `analytic_type_bounded`; each `K_α` has countably many classes, each an orbit, Borel by base
        Layer 4.1, so (a) holds; `ρ` is unbounded on `K` (`exists_mem_wellOrderClass_type_eq`). So the
        class of coded well-orders is not Borel complete." Add `analytic_type_bounded` and the Borel
        orbits of Layer 4.1 to the supplier contract of CountableStructureSpaces and to the
        Dependencies of Layer 6.
     3. Summary: "a class, Borel or not, stratified into pieces with Borel isomorphism by a rank
        bounded on its analytic subsets is not Borel complete". Scope (lines 100–103) and Downstream
        consumers: say that 6.4 applies to classes on whose analytic subsets the rank is bounded, such
        as the coanalytic class of reduced abelian `p`-groups with the Ulm length, and that the theorem
        for all torsion abelian groups is not an instance of it and belongs, with its proof, to the
        roadmap on algebraic classes.
     Tested on the refuting instance: with `K` Borel the statement is still true (it is 6.2); with
     `K = wellOrderClass lt` the set `A = K` is not analytic, `ρ` is unbounded on `K` and the
     conclusion does not follow from 6.2 alone.

2. **F02** (P3) "five characterisations" and "four characterisations"

   - **Location.** README line 15: "the five standard characterisations of Borel completeness";
     line 27: "the four characterisations"; `Suggested.lean` line 20: "four characterisations".
   - **Claim.** The number of characterisations proved in Layer 5.
   - **Witness.** Layer 5 (lines 1112–1120) lists five equivalent conditions, the first of which is
     the definition `BorelComplete K`; four `iff` theorems are stated.
   - **Repair.** Line 15: "and the equivalence of Borel completeness with four standard
     reformulations" (lines 27 and the docstring then agree).

Two findings: one P2 (the obstruction headline of 6.4 collapses to 6.2 under its own hypotheses)
and one P3 (a count that disagrees with itself). The five findings of round 1 are all repaired.
The elaboration passes with `sorry` as the only warning, every supplier citation resolves, and the
one-tactic probe closes none of the 15 theorems.

## Round 1 findings, one by one

- **F01 (padding `not_isSmooth_of_borelComplete`) — repaired.** The declaration is gone from
  `Suggested.lean` (15 theorems remain); the Summary list (README lines 25–32) no longer names it;
  6.3 reads "Prove that `classIso K` is not smooth (`not_isSmooth_of_borelReducible_eZero` applied
  to the reduction of `eZero`)" (lines 1273–1274).
- **F02 (needless countability of `L`) — repaired.** The four `borelComplete_iff_…` theorems,
  `not_measurableSet_classIso_of_borelComplete` and `borelReducible_eZero_of_borelComplete`
  elaborate with `[L.IsRelational]` only (my `#check` listing below). README Layer 5 head: "(relational
  `L`; countability of `L` is not used)" (line 1108); 6.2, 6.3, 6.5 and Convention 1 agree. The three
  theorems that keep the binder need it (pin: `measurableSet_setOf_bfEquivSetoid`,
  `TauCeti/ModelTheory/RelationalConfiguration/BackAndForth.lean` line 144; `mk_le_continuum`;
  `MeasurableSet.analyticSet_image` needs a second-countable range).
- **F03 (one `*Needs:*` line for Layer 5) — repaired.** Line 1129: "for (1) ⇔ (3) ⇔ (4), Layers 0.1
  and 1.2; for (1) ⇔ (2), also Layer 2.3; for (1) ⇔ (5), also Layers 4.1 and 4.2; …".
- **F04 (two comment slips) — repaired.** Docstring: "for every countable ordinal `β` some code of
  the class has Scott height greater than `β`"; section comment "Layer 0: Isomorphism relations of
  classes and two reducibilities".
- **F05 (which numbering is cited) — repaired.** References: "arXiv:2102.12371v6, whose numbering
  is cited; published in Ann. of Math. 199 (2024)"; the same for becker-kechris-bams; the manifest's
  version notes agree.

The repaired pattern of F02 (a hypothesis nothing uses) was looked for in the rest of the package;
it led to R01, where a hypothesis is not only unused but degenerates the statement.

## Verified sound

**Elaboration.** `lake env lean` on `Suggested.lean` from the content checkout: 15 warnings, all
"declaration uses `sorry`", no error. 22 declarations (7 definitions with real bodies, 15 theorems);
no `set_option`, no sorry'd data, `theorem` only; `import Mathlib` then five `TauCeti.*` modules,
all used. The worker's note of 23 declarations predates the deletion of F01.

**Binders.** `#check @name` for all 22 declarations in one scratch file, each compared with its
README statement: no lost binder; generality agrees everywhere (R01 aside, where README and Lean
carry the same degenerate hypothesis).

**Padding probe (all 15 theorems).** Each `sorry` replaced by
`first | rfl | infer_instance | simp | trivial | simp [BorelComplete, classIso, graphClass, linearOrderClass, treeClass] | aesop`:
15 errors, none closes. Targeted probes: `borelComplete_iff_graphClass` needs invariance of
`graphClass` and `borelComplete_graphClass` (not one lemma); `borelComplete_linearOrderClass` needs
the corestriction and its measurability; only the direction (4) ⇒ (1) of
`borelComplete_iff_forall_measurableSet` is a one-term proof, the other direction is not. The only
statement that follows shortly from another is R01.

**Headlines.** From the Summary: graphs, linear orders (with the continuous reduction), trees; the
universal embedding; the four `iff`s of Layer 5; ordinal multiples; not Borel; unbounded Scott
height; above E₀; continuum many classes; the obstruction. All are stated; none is declared not
statable, correctly. Non-smoothness is prose (6.3, 6.5), a one-lemma corollary.

**Names at the pins** (opened or `#check`ed this round):
`Setoid.BorelReducible.measurableSet_setOf` (no hypothesis beyond two measurable spaces, as 6.2
uses it), `BorelReducible.lift_mk_quotient_le`, `Setoid.isSmooth_of_countable_quotient`
(`TauCeti/SetTheory/Descriptive/BorelReducibility.lean` line 289),
`not_isSmooth_of_borelReducible_eZero`, `mk_le_continuum` (countable relations and carrier),
`nonempty_equiv_of_bfEquiv_of_scottHeight_le` (`scottHeight M ≤ β`, both countable),
`isoSetoid_le_bfEquivSetoid` and `measurableSet_setOf_bfEquivSetoid`
(`…/RelationalConfiguration/BackAndForth.lean` lines 127, 144), `BFEquiv.add_one` (previous level
kept, one-point forth and back with `Fin.snoc`), `isoSetoid_iff_exists_perm_smul_eq`,
`Equiv.Perm.continuous_inv_apply`, `Equiv.Perm.hasBasis_nhds_one_fixingSubgroup`,
`MeasurableSet.analyticSet_image`, `Measurable.exists_continuous`, `Descriptive.tree`,
`Theory.fieldOfChar`. `BorelSpace (Equiv.Perm ℕ)` for `instMeasurableSpacePerm` is `⟨rfl⟩`
(elaborated). Round 1 checked the remaining names of the supplier contracts by `#check`; the
repairs added none.

**Adversarial table** (sampled targets, headlines, the repaired passages, the targets of findings).

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 0.1 `classIso` | `Fin 2`, one unary predicate; `K = ∅`; `P` infinite coinfinite | 4 codes, 3 classes (`\|P\| = 0,1,2`); empty map into any class, and a map into `∅` only from `∅`; one orbit, constant map reduces | Checks correct |
| 0.2 set reducibility | `X = Unit, Y = Empty`; `eZero` against the diagonal | no map exists, clause `IsEmpty X ∨ Nonempty Y` needed; two-valued map `(0,0)`/`(0,1)` pulls the diagonal back to any Borel set, `eZero` not smooth | holds; converse fails as stated |
| 1.1 relabelling | `Fin 3`, `e = (0 1 2)`, `P = {0}`; `Fin 0` | `restrict e.symm`: true at `w` iff `e.symm w = 0` iff `w = 1`; `restrict e` gives `w = 2`; 1 or 2 codes on `Fin 0` | direction as stated; agrees with Convention 4 (`σ • c` true at `σ 0`) |
| 1.2 `BorelComplete` | `K = ∅`; one unary predicate; `K ∩ {empty graph}` | no map into `∅`; `ℵ₀` classes against `𝔠` for the family `P_i ∈ {∅, ℕ}`; one orbit | fails in all three, as the Checks say |
| 1.3 graph-code map | one constant, value `n → ∞`; relational `L` | unary graph relation `{n}` tends pointwise to `∅` (totality lost); empty table, range everything | range Gδ, not closed; closed when relational |
| 2.1 incidence graph | `R = {(0,1)}`; colours; converse | degrees 3 and 2; colours `0`, `1`, even `≥ 2`, odd `≥ 3` disjoint; image of `t_q` is `t_{atom R (σ ∘ v)}`, truth edge gives `d.eval (R (σ ∘ v)) = c.eval (R v)` | `d = σ • c` under `eval_perm_smul` |
| 2.2 clique tags | edge with `κ = (0,1)`; triangle | 9 vertices, `1 + 2 + 3 + 6 = 12` edges; tag 0 has `κ x + 2` triangle neighbours | holds; triangle-freeness needed |
| 3.2 order on `List ℚ` | `x ≺ y` prefix, `y = x ++ r :: t`; `x`, `y` differing at `i` | `x < x ++ [r − 1] < y`; `x < x ++ [0] < y` | dense, least element `[]`, no greatest |
| 3.2 parent | `x = p ++ [r]`, `p < z < x` | `z` extends `p` (length `≥ \|x\|`) or exceeds `p` at an index `< \|p\|` (then `z > x`) | parent definable |
| 3.2 unravelling | `c` = only `adj 0 1`, `d = τ • c`; loop against empty graph | bits at index pair `(1,0)`: both true; colour of `[1]` with a true diagonal bit occurs nowhere for the empty graph | (i)–(iii) agree; forth and back use a child of each colour and `Ψ⁻¹` of a child |
| 3.3 linear orders | blocks `ω + (χ + 2)`; `χ = 0` | finite condensation classes are the final parts, of size `χ + 2 ≥ 2`; the `ω`-parts are infinite classes; distinct blocks at infinite distance | reduction on all codes; lands in `linearOrderClass` |
| 3.4 trees | `χ = 0, 1`; `c_n → (ℕ, ≥)` | longest chain above `(x, some 0)`: 2, 3 nodes, the leaves give 2; for `i < j ≤ n`, `j` below `i` in `c_n` | height `χ + 2`; `treeClass` not closed |
| 3.5 | star `T`, `T_n` with `0 < n < 1`; node ↦ chain above the root | coordinates of `T_n` equal those of `T` once `n > max(i,j)`; edge `0–1` in the cover of `T` only | Borel, not continuous; (a) gives a prefix-closed set |
| 4.1 | `ℕ` with evaluation; uncountably many unary symbols | continuous on a discrete space, one orbit; no singleton is `pi`-measurable | Checks correct |
| 4.2 embedding | `X = ℕ`, `S_n = {n}`; equivariance; injectivity | symbol `(1,0)` at `(a)`, `x`: `g a = 0 ∧ g x = 0`, so `x = a`; `g' = g h` turns `(h • x, a)` into `(x, h⁻¹ ∘ a)`; `g_k → 1`, `g_k • y ∈ S_n` puts `y` in the closure | matches Convention 4; injective |
| 4.2 packing | `m = 0, 1, 2` | `unpair 0 = (0,0)`, `unpair 1 = (0,1)`, `unpair 2 = (1,0)`; `k ≤ m` | Checks correct |
| Layer 5 (after F02) | `K = graphClass`; `K = ∅`; one unary predicate; uncountable `L` | all hold; all fail; `𝔠` against `ℵ₀` classes; every arrow composes into `classIso K`, only `L'` needs countability | consistent; binder rightly dropped |
| 6.1 `bfEquiv_omega0_opow_mul` | `γ = 0, 1`; `ω`, `ω·2`, `ω + 1`; step `γ + 1` | level 0 trivial; `δ = 0` fails at `γ = 1`; `ω ≡₂ ω·2` (answer `ω` by `1`); after `α + 1 = ω^(γ+1)·q + r` the rest is `ω^(γ+1)·(δ − q)`, a nonzero multiple of `ω^γ` | induction re-derived; `δ, ε ≠ 0` needed |
| 6.1 interval lemma | `n = 0`; an empty interval; both directions | one interval, trivial; empty against nonempty fails at level 1; ⇒ follows from ⇐ inside the interval | iff holds |
| 6.2 not Borel | `β = 0`; `K = ∅` | `ω`, `ω·2`: infinite, countable, distinct, `BFEquiv 1`; hypothesis false | holds; `1 + β` keeps the orders infinite |
| 6.2 Scott height | `β` fixed, all heights `≤ β` | graph of `classIso K` = preimage of the Borel level `β` | holds for arbitrary `K` |
| 6.3 `eZero` | `0^ω`, `1 0^ω`, `1^ω` | copies `x ∆ F` enumerate the class once each; `F ↦ F ∆ {0}`; finitely against cofinitely many `P`-points | reduction correct |
| 6.3 cardinality | `L` with `2^𝔠` unary symbols | more than `𝔠` classes possible | binder needed |
| 6.4 obstruction | `K` Borel, any `ρ`, `A = K`; `K = wellOrderClass lt` | `K_α = K`, (a) negates 6.2 (elaborated proof); `A = K` not analytic, `ρ` unbounded | degenerate as stated: R01 |
| 6.5 | one unary predicate | classes `(\|P\|, \|¬P\|)`, countably many, each Borel; smooth; `eZero` does not reduce to it | holds |

**Sources (the seeded sample and all flagged locators).** Read at the cached texts:
paolini-shelah-tfab lines 56–58, 65–68 (0.1), 70–73 and 88–91 (0.2), 83–87 (Convention 2), 95–101
(1.2; the source quantifies over all Borel classes, which Layer 5 (4) recovers), 103–106 (6.2), 125
(2.3), 169–171; becker-kechris-bams lines 126–131 (4.1), 132, 172–177, 247–268 (4.2), 159–164
(Convention 4, 1.1); camerlo-gao-boolean lines 87–93 (1.3), 94–105 (Layer 5, 6.3), 106–110 (1.2),
111–112 (2.3), 257–263 and 276–281 (3.5); montalban-cst1 lines 4203–4288 (3.1–3.4: labelled
trees, dense labelled orders, the parent recovered from lengths, label plus two elements) and
4572–4659 (2.1, 2.2); montalban-cst2 lines 2322–2331 (Lemma II.37, for `α > 0`; the README's level 0
is trivial under its same-atomic-type hypothesis), 2337–2425 (Lemma II.38, Corollary II.39), 8946
(Lemma XI.2). Each supports the statement it is cited for. The roadmap's own constructions
(incidence graph, clique tags, the `ω`-prefixed blocks, the anchored embedding, the coding of E₀)
are marked as its own. All 11 cited works are in the manifest, none added.

**Suppliers.** Dependency check output: `depcheck: 246 roadmaps, 2242 edges, 0 problem(s)`; no
UPWARD or CYCLE line. Resolved this round: CountableStructureSpaces at its open head (a new roadmap
of another author): Layer 0 (closed range of the graph coding), Layer 1.2 (`ContinuousSMul`
instance, the acceptance check with the 3-cycle), Layer 3 (`analytic_treeHeight_bounded`, closed
node sets), Layers 4.1, 4.2, 4.4 (`exists_uniform_bfSeparation`, an analytic set of non-isomorphic
pairs), Layer 6.2 (`wellOrderClass lt`, strict; `exists_mem_wellOrderClass_type_eq` for
`ω ≤ β < ω₁`; `analyticSet_compl_wellOrderClass`; `not_measurableSet_wellOrderClass`), worked
example 2, and its statement that Borel completeness of graphs and linear orders is outside its
scope. NoncompactQuantumSymmetry at its open head: `## Layer 4: M1`, `### M1.BorelRealization`,
`exists_polishTopology_continuousSMul` with `[PolishSpace G] [BorelSpace G]`,
`[StandardBorelSpace X]`, `[MeasurableSMul₂ G X]`, universe-polymorphic, as 4.2 consumes it. On
main: BorelEquivalenceRelations §5.1–§5.4; InfinitaryModelExistence 0.3 and Layer 6;
CountableModelCounting Layer 0 (`isoSetoidOn`, transport between presentations); InfinitaryLogic
Layer 1 (completed). No declared gaps (`design/plan.json` has `gaps = []`); no forbidden supplier.

**Duplication.** Searched main, the open heads and the pins by object: Borel completeness, the
Friedman–Stanley codings, a universal S∞-space, set reducibility, a σ-algebra on `Equiv.Perm ℕ`,
back-and-forth equivalence of ordinal multiples: no other owner. Tau Ceti has no
`MeasurableSpace (Equiv.Perm _)` instance (only instance arguments in
`TauCeti/Probability/Distributions/Uniform/Permutation.lean` lines 38, 85). `graphClass` also names
`TauCeti.ContCohomology.graphClass`, in another namespace. The base's
`measurableSet_iso_inter_of_scottHeight_le` (Layer 4.3) is for model classes; 6.2 uses the same
argument for an arbitrary `K` and does not restate it. `scratch/overlaps.md`: no shared pull
request, dropped id or second copy; ownership against the open pull requests was checked with
`roadmaps grep`.

Overlap check: read CountableStructureSpaces, BorelEquivalenceRelations, CountableModelCounting, InfinitaryLogic; restricted isomorphism: CountableModelCounting owns `isoSetoidOn` for the models of a sentence and this roadmap owns `classIso` for arbitrary sets of codes; nothing else shared.

**Shape and style.** Seven layers, each with Examples and Dependencies; every definition (`classIso`,
set reducibility, relabelling, `BorelComplete`, the functional coding space, `graphClass`,
`linearOrderClass`, `treeClass`, Borel S∞-spaces, `universalLanguage`) has at least three Checks;
every theorem a locator or the mark "own construction". The layers are those the end theorems
need (vocabulary, definition, graphs, orders and trees, universality, characterisations,
consequences); no layer is named after a source. No LaTeX, process words, pull-request numbers or
machine paths in the README or the Lean file. Every backticked name the README attributes to this
roadmap is declared in `Suggested.lean` (22 names).

Source independence: 15 passages compared with 5 sources, none shared; largest share paolini-shelah-tfab, 13 of 51 locators; contents compared with paolini-shelah-tfab: independent (its introduction supplies definitions and history only; no layer follows its sections).

## Not verifiable

- friedman-stanley-1989 (Theorem 1, §2, §3, §4), gao-idst (§5.2, §13.1), becker-kechris-1996
  (§2.6–§2.7, §3.4), kechris-cdst (§16.C), hjorth-kechris-1996 (§4–§5), mekler-1981 (§2): recorded
  as uncertified; no text was read. In particular I could not check which form of the obstruction
  friedman-stanley-1989 §4 and hjorth-kechris-1996 §4–§5 state (see R01).
- The numbering of the Annals version of paolini-shelah-tfab; the README now cites arXiv v6.

## Source issues

- **Error** in montalban-cst1 at the proof of Lemma VI.18, printed page 91: the source says the finite sequences of rationals in the lexicographic order form a copy of the rationals; it should be a dense order with an endpoint, the empty sequence; affects the proof.

## For the human reviewers

- **Not tested.** `sources.toml` records the friedman-stanley-1989 and mekler-1981 locators as
  written from memory; the three Friedman–Stanley headlines and 6.4 cite that paper's "Theorem 1",
  "§2" and "§4" without a read text.
- **Licence.** montalban-cst1 and montalban-cst2 are author's drafts on the author's page (2019,
  2025), cited by draft line numbers; Part 2 is unpublished.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "0e52b9052b44f80aeb84a2e0039bcd91f2fc7d9e", "job": "REV-PKG-CountableStructureSpacesPartII~2", "model": "fable", "worker": "chris-x81"} -->
