<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/16877#issuecomment-6899676756 -->
Review (claude) of a422bd7

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) the locator of 4.1 does not contain the definition of a Borel G-space

   - **Location.** `packages/CountableStructureSpacesPartII/README.md` lines 1010–1013: "A Borel
     S∞-space is a type `X` with … `[MeasurableSMul₂ (Equiv.Perm ℕ) X]`; its orbit equivalence relation
     is `MulAction.orbitRel` (becker-kechris-bams lines 126–131)". `sources.toml`, entry
     becker-kechris-bams, locator item "§2: Borel G-spaces and Borel embeddings (lines 126-131)".
   - **Claim.** The cited lines define a Borel G-space.
   - **Witness.** becker-kechris-bams lines 72–73 (§1, printed page 2) define a Borel G-space: a
     standard Borel space, a Polish group and a Borel action map on the product. Lines 126–131 (§2)
     define Borel embeddings and universal spaces and note that the image of an embedding is invariant
     Borel.
   - **Repair.** In 4.1 replace the locator after the definition by "(becker-kechris-bams
     lines 72–73)", and attach the present one to the third API bullet, which is what those lines
     state: "… has an invariant Borel image (Lusin–Souslin, `MeasurableSet.image_of_measurable_injOn`;
     becker-kechris-bams lines 126–128) and is a Borel reduction of the orbit relations." In
     `sources.toml` change the first locator item of becker-kechris-bams to "§1: Borel G-spaces
     (lines 72-78), §2: Borel embeddings and universal spaces (lines 126-131)". Checked on the text:
     line 72 opens the definition, line 127 states the invariance of the image.

2. **F02** (P3) the contract for the base's Layer 6.2 omits the Check of 0.2

   - **Location.** `packages/CountableStructureSpacesPartII/README.md` lines 319–322: "Layer 6.2:
     `wellOrderClass`, … `analytic_type_bounded` (an analytic class of coded well-orders has order
     types bounded below `ω₁`), used in Checks of Layers 3.3 and 6.4."
   - **Claim.** The base's well-order class is used in Checks of 3.3 and 6.4 only.
   - **Witness.** README lines 447–448, third Check of 0.2: "The complement of the base's well-order
     class is analytic and not Borel, so it is not set reducible to the diagonal"; and line 459,
     Dependencies of Layer 0: "CountableStructureSpaces Layer 6.2 (Checks only)". Before the last
     repair the line read "used in Checks", which covered it.
   - **Repair.** Line 322: "used in Checks of Layers 0.2, 3.3 and 6.4." The three uses are then
     0.2 (`analyticSet_compl_wellOrderClass`, `not_measurableSet_wellOrderClass`), 3.3
     (`exists_mem_wellOrderClass_type_eq`) and 6.4 (all five names), which is what the README has.

Two findings, both P3 and neither blocking: a locator in 4.1 that points at lines which do not
contain the definition it is cited for, and a supplier-contract line, rewritten by the last repair,
that no longer lists every section using the base's well-order class. Both findings of round 2 are
repaired. The elaboration passes with `sorry` as the only warning, the statement of 6.4 in its new
form is true and no longer a restatement of 6.2, every supplier citation resolves, and the
one-tactic probe closes none of the 15 theorems.

## Round 2 findings, one by one

- **F01 (P2, the obstruction of 6.4 was the contrapositive of 6.2) — repaired.**
  `Suggested.lean` lines 217–223: the binder `(hK : MeasurableSet K)` is gone; the elaborated type
  is `∀ {L} [L.IsRelational] [∀ n, Countable (L.Relations n)] {K} (ρ), (∀ α < ω₁, MeasurableSet
  {p | classIso (K ∩ {c | ρ c ≤ α}) p.1 p.2}) → (∀ A ⊆ K, AnalyticSet A → ∃ α < ω₁, ∀ c ∈ A,
  ρ c ≤ α) → ¬BorelComplete K`. README 6.4 (line 1298): "let `K ⊆ RelationalConfiguration L ℕ` be
  any set of codes, not assumed Borel or invariant". First Check (line 1319): "For an analytic `K`,
  in particular a Borel one, … the lemma is the contrapositive of 6.2 whatever `ρ` is"; new Check
  (line 1335) on `wellOrderClass lt`. Summary (lines 19–22), Scope (lines 102–110), contract
  (lines 319–322), Dependencies of Layer 6 and Downstream consumers agree. I re-derived the proof for
  arbitrary `K` (table below): it uses the analytic image of the reduction, (b), the corestriction
  and 6.2 for `graphClass`, and nowhere that `K` is Borel.
- **F02 (P3, "five" and "four" characterisations) — repaired.** Line 15: "the equivalence of Borel
  completeness with four standard reformulations"; line 29 and the Lean docstring: "four
  characterisations"; Layer 5 Examples: "all five conditions hold". Layer 5 lists five conditions,
  the first the definition, and four `iff` theorems are stated.

The adversarial pass on the passages the repair changed found R02 (a line the repair narrowed too
far). The pattern of F01 (a hypothesis that degenerates a statement) was looked for in the other 14
theorems: none has a hypothesis that yields its conclusion from another stated theorem in one step.

## Verified sound

**Elaboration.** `lake env lean` on `packages/CountableStructureSpacesPartII/Suggested.lean` from
the content checkout: 15 warnings, all "declaration uses `sorry`" (lines 69, 95, 102, 107, 128, 138,
144, 151, 160, 173, 182, 190, 197, 204, 217), no error. 22 declarations: 7 definitions with real
bodies, 15 theorems. No `set_option`, no sorry'd data, no `lemma`, no `#eval`; `import Mathlib` then
five `TauCeti.*` modules, each used (`isoSetoid`; `IsSimpleGraph`; `eZero`; `scottHeight`; the
topology of `Equiv.Perm ℕ`). No module needed building.

**Binders.** `#check @name` for all 22 declarations in one scratch file, each compared with its
README statement: no lost binder, and the generality agrees everywhere. Countability of `L` is
carried exactly by `exists_lt_scottHeight_of_borelComplete`, `mk_quotient_classIso_of_borelComplete`
and `not_borelComplete_of_rank_bounded`, as the README says.

**Padding probe, all 15 theorems.** Each `sorry` replaced by
`first | rfl | infer_instance | simp | trivial | simp [BorelComplete, classIso, graphClass, linearOrderClass, treeClass, universalLanguage] | (intros; assumption) | exact?`:
15 errors, none closes. By reading: `borelComplete_linearOrderClass` needs the corestriction, its
measurability and `borelComplete_graphClass`; only (4) ⇒ (1) of
`borelComplete_iff_forall_measurableSet` is a one-term proof; `not_borelComplete_of_rank_bounded`
needs the analytic image and the corestriction before 6.2 applies. Nothing is padding.

**Headlines.** From the Summary: graphs, linear orders (with the continuous reduction), trees; the
universal embedding; the four `iff`s; ordinal multiples; not Borel; unbounded Scott height; above
E₀; continuum many classes; the obstruction. All eleven groups are stated (15 theorems); the module
docstring names none as not statable, correctly. Non-smoothness is prose in 6.3 and 6.5: it is
`not_isSmooth_of_borelReducible_eZero` applied to a stated theorem.

**Names.** Every backticked identifier of the README (281 tokens) was classified: 22 are this
roadmap's and are declared in `Suggested.lean`; 7 are the base's or NoncompactQuantumSymmetry's
targets and resolve at those heads; the library names were elaborated with `#check` against the
pins in one scratch file (182 lines), with no unknown constant. Opened in particular:
`MeasurableSet.analyticSet_image` and `Measurable.exists_continuous` (both need a second-countable
range, which is why 6.4 keeps the countability of `L`), `BFEquiv.add_one` (previous level retained),
`measurableSet_setOf_bfEquivSetoid` (countable carrier, countable relations, `α < ω₁`),
`nonempty_equiv_of_bfEquiv_of_scottHeight_le`, `scottHeight_lt_omega_one`, `Nat.right_le_pair`,
`Nat.unpair_right_le`, `IsSimpleGraph.restrict`, `LEquiv.onConfiguration` (a homeomorphism),
`reconstructStructure` (needs `Nonempty M`), `isRelational_smallPresentation`.

**Adversarial table** (sampled targets, headlines, the repaired passages, the targets of findings).

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 0.1 `classIso` | `Fin 2`, one unary predicate; `K = ∅`; two-code class `P = ∅`, `P = ℕ` | 4 codes, classes `\|P\| = 0, 1, 2`; no map from a nonempty type into `∅`; the two codes are fixed points, so equality | Checks correct |
| 0.2 set reducibility | `X = Unit`, `Y = Empty`; `eZero` against the diagonal; `{0} ⊆ ℕ` | no map exists, so the clause `IsEmpty X ∨ Nonempty Y` is needed; the map with values `(0,0)` on the graph and `(0,1)` off it pulls the diagonal back to the graph; preimage `{0}` | holds; converse fails as stated |
| 1.1 relabelling | `Fin 3`, `e = (0 1 2)`, `P = {0}`; `Fin 0` | `restrict e.symm` is true at `w` iff `e.symm w = 0` iff `w = 1`; `restrict e` gives `w = 2`; no atoms on `Fin 0` without nullary symbols (1 code), 2 codes with one | direction as stated, agrees with Convention 4 |
| 1.2 `BorelComplete` | `K = ∅`; one unary predicate; `graphClass ∩` the empty graph | no map into `∅`; `ℵ₀` classes against the `𝔠` classes of the family `P_i ∈ {∅, ℕ}`; one point | fails in all three, as the Checks say |
| 1.3 graph-code map | one constant with value `n → ∞`; relational `L` | the unary graph relation `{n}` tends pointwise to `∅`, totality lost; empty table, range everything | Gδ, not closed; closed when relational |
| 2.1 incidence graph | `R = {(0,1)}`; converse direction; two unary symbols uncoloured | degrees 3 and 2; a colour-preserving map sends `t_q` to `t_{atom R (σ ∘ v)}` (position colour `2 + 2j`, unique point neighbour), truth edge gives `d.eval (R (σ ∘ v)) = c.eval (R v)`, that is `d = σ • c`; swapping the symbols is an uncoloured isomorphism | holds; colours needed |
| 2.2 clique tags | edge with `κ = (0,1)`; a triangle | `2 + 3 + 4 = 9` vertices, `1 + 2 + 3 + 6 = 12` edges; tag 0 has `κ x + 2` triangle neighbours; the triangle's own vertices lie in a triangle | holds; triangle-freeness needed |
| 2.3 `borelComplete_graphClass` | `L'` empty; a nullary symbol | points only, countably infinite vertex set, one code; tuple vertex with no positions, truth edge decides | vertex set independent of `c`, each coordinate constant or one coordinate of `c` |
| 3.2 parent in `List ℚ` | `x = p ++ [r]`; a competitor `p'` differing from `x` at `i` | any `z` in `(p, x)` extends `p`, length `≥ \|x\|`; `z = x[0..i) ++ [t]` with `p'_i < t < x_i` has length `i + 1 < \|x\|` and lies in `(p', x)` | parent definable and unique |
| 3.2 density, colours | `x` a prefix of `y = x ++ r :: t`; `x`, `y` differing at `i`; `[1/2, 1]` for the edge `{0,1}` | `x < x ++ [r − 1] < y`; `x < x ++ [0] < y`; `ν(1/2) = 1`, `ν(1) = 0`, `a = (1, 0)` | dense, least element `[]` |
| 3.3 reduction to linear orders | blocks `ω + (χ + 2)`; `χ = 0`; two blocks | finite condensation classes are the final parts, of size `χ + 2 ≥ 2`; the `ω`-part is one infinite class; between two blocks lie infinitely many blocks | reduction on all codes; lands in `linearOrderClass` |
| 3.4 trees | `χ = 0, 1`; `c_n → (ℕ, ≥)` | chain above `(x, some 0)`: 2 and 3 nodes, the leaves give 2; for `i < j ≤ n`, `j` is below `i` in `c_n` | height `χ + 2`; `treeClass` not closed |
| 4.1 Borel S∞-spaces | equivariant measurable injection `f`; uncountably many unary symbols | `f x = g • f y = f (g • y)` gives `x = g • y`; a `pi`-measurable set depends on countably many coordinates | reduction of orbit relations; third Check correct |
| 4.2 embedding | `X = ℕ`, `S_n = {n}`; equivariance; injectivity; `m = 0, 1, 2` | symbol `(1,0)` at `(a)`, `x`: `g a = 0 = g x`, so `x = a`; `g' = g h` turns `(h • x, a)` into `(x, h⁻¹ ∘ a)`; `g_k → 1` with `g_k • y ∈ S_n` puts `y` in the closure; `Nat.pair 0 1 = 1`, `Nat.pair 1 0 = 2` | matches Convention 4; injective; packing Checks correct |
| Layer 5 | `K = graphClass`; `K = ∅`; one unary predicate; universe `w` in (5) | all hold; all fail (each quantifies over a nonempty instance); `𝔠` against `ℵ₀` classes; `ULift` of a coding space for (5) ⇒ (3) | consistent |
| 6.1 `bfEquiv_omega0_opow_mul` | `γ = 0, 1, 2`; `ω`, `ω·2`, `ω + 1`; the step `γ + 1` | level 0 trivial; level 1 any answer; at `γ = 2` answer `ω·μ + ρ` by `ω·min(μ,1) + ρ`; `ω ≡₂ ω·2` (answer `ω` by `1`), `ω ≢₂ ω + 1` (maximum, then `n + 1`); after `α + 1 = ω^(γ+1)·q + r` the rest is `ω^(γ+1)·(δ − q)`, nonzero | induction re-derived; `δ, ε ≠ 0` needed |
| 6.2 not Borel | `β = 0`; `K = ∅`; arbitrary `K` in the Scott-height consequence | `ω`, `ω·2`: infinite, countable, distinct, `BFEquiv 1`; hypothesis false; graph of `classIso K` = preimage of the Borel level `β` | holds without countability of `L`; Scott height needs it |
| 6.3 `eZero` | `0^ω`, `1 0^ω`, `1^ω`; `L` with `2^𝔠` unary symbols | copies `x ∆ F` list the class once each; `F ↦ F ∆ {0}`; finitely against cofinitely many `P`-points; more than `𝔠` classes possible | reduction correct; binder needed for the count |
| 6.4, new form | `K = ∅`; `K` analytic; one unary predicate, `ρ = 0`; `K = wellOrderClass lt`, `ρ` the order type; `ρ c ≥ ω₁` | (a), (b) hold and `¬BorelComplete ∅`; (b) at `A = K` gives `K_α = K` and (a) negates 6.2; `ℵ₀` classes; types `ω ≤ β < ω₁`, `K_α` a countable union of orbits, each the section of the level-`SH(c)` graph, `ρ` unbounded so `K_α ≠ K`; `{c}` analytic forces `ρ c < ω₁` | true; not reduced to 6.2 off analytic classes |
| 6.4, proof for arbitrary `K` | reduction `f` of `classIso graphClass` | `f '' graphClass` analytic (standard Borel domain, second-countable range), inside `K`, so inside some `K_α`; graph of `classIso graphClass` = preimage under `f' × f'` | contradiction with 6.2 and Layer 2.3 |
| Scope, reduced `p`-groups | Ulm length `≤ α`; all torsion groups | isomorphism on `K_α` = equality of the Ulm invariants below `α`, each a Borel function of the code; a Borel class with unbounded length fails (b) at `A = K` | Scope sentence correct |
| 6.5 | one unary predicate | classes `(\|P\|, \|¬P\|)`, countably many, each Borel; smooth; `eZero` does not reduce to it | holds |
| Contract, base Layer 6.2 | uses of the well-order class | 0.2 (line 447), 3.3 (line 860), 6.4 (line 1336) | line 322 lists two of three: R02 |

**Sources (the seeded sample and every flagged locator that has a text).** Read at the cached
texts: paolini-shelah-tfab lines 56–58 and 65–68 (0.1), 70–73 and 88–91 (0.2), 83–87
(Convention 2), 95–101 (0.1, 1.2; the source quantifies over all Borel classes, which Layer 5 (4)
recovers), 60–64 (1.3), 103–106 (6.2), 125 (2.3), 169–171; becker-kechris-bams lines 72–78,
126–133, 143–177 (4.1, 4.2, Convention 4, 1.1) and 247–268; camerlo-gao-boolean lines 87–93 (1.3),
94–105 (Layer 5, 6.3), 106–110 (0.1, 1.2), 111–114 (2.3), 257–263 and 276–281 (3.5), 405, 555;
montalban-cst1 lines 4203–4288 (3.1–3.4: labelled trees, dense labelled orders on finite sequences
of rationals, the parent from order and lengths, label plus two elements) and 4572–4659 (2.1, 2.2);
montalban-cst2 lines 2322–2331 (Lemma II.37, for `α > 0`), 2337–2425 (Lemma II.38,
Corollary II.39), 8946–8958 (Lemma XI.2). Each supports the statement it is cited for, except the
locator of R01. All 11 cited works are in the manifest; none was added.

**Suppliers.** Dependency check: `depcheck: 246 roadmaps, 2242 edges, 0 problem(s)`; no UPWARD or
CYCLE line. Resolved now: CountableStructureSpaces at its open head (another author's new roadmap):
Layer 0 (the range of the graph coding is closed), Layer 1.2 (the `ContinuousSMul` instance from
`continuous_uncurry_restrict` and `Equiv.Perm.continuous_inv_apply`), Layer 4.2, Layer 4.4
(`exists_uniform_bfSeparation`), Layer 6.2 (`wellOrderClass lt`, strict, for a relational `L` with
a distinguished binary symbol; `exists_mem_wellOrderClass_type_eq` for `ω ≤ β < ω₁`;
`analytic_type_bounded` for every relational `L`; `analyticSet_compl_wellOrderClass` and
`not_measurableSet_wellOrderClass` with countably many symbols), worked example 2, and its
statement that Borel completeness of graphs and linear orders is outside its scope.
NoncompactQuantumSymmetry at its open head, earlier in the merge order: `## Layer 4: M1`,
`### M1.BorelRealization`, `exists_polishTopology_continuousSMul (G X : Type*)` with
`[PolishSpace G] [BorelSpace G] [StandardBorelSpace X] [MeasurableSMul₂ G X]`, giving a Polish
topology with the same Borel sets. On main: BorelEquivalenceRelations §5.1–§5.4;
InfinitaryModelExistence 0.3 and Layer 6; CountableModelCounting Layer 0 (`isoSetoidOn`, transport
between presentations); InfinitaryLogic Layer 1 (completed). No declared gaps
(`design/plan.json` has `gaps = []`); no forbidden supplier. `design/plan.json` still records the
round-1 form of the obstruction; that file is fixed after the design and is not a finding.

**Duplication.** Searched the pins, main and the open heads by object: Borel completeness, the
Friedman–Stanley codings, a universal S∞-space, set reducibility, a σ-algebra on `Equiv.Perm ℕ`:
no other owner. The pins have no `MeasurableSpace (Equiv.Perm _)` instance (only instance
arguments in `TauCeti/Probability/Distributions/Uniform/Permutation.lean` lines 38, 85).
`scratch/overlaps.md`: no shared pull request, dropped id or second copy; checked with
`roadmaps grep` over the open heads.

Overlap check: read CountableStructureSpaces, CountableModelCounting, BorelEquivalenceRelations, InfinitaryLogic, HanfNumbers, RandomGraphs; restricted isomorphism: CountableModelCounting owns `isoSetoidOn` for the models of a sentence and this roadmap owns `classIso` for arbitrary sets of codes, as its Scope says; nothing else shared.

**Shape and style.** Seven layers, each with Examples and Dependencies; every definition has at
least three Checks (between 3 and 7); every theorem a locator or the mark "own construction"; the
layers are what the end theorems need and none is named after a source. No LaTeX, process words,
pull-request numbers, anchors or machine paths in the README or the Lean file.

Source independence: 20 passages compared with 5 sources, none shared; largest share paolini-shelah-tfab, 13 of 51 locators; contents compared with paolini-shelah-tfab (five sections: introduction, preliminaries, a combinatorial frame, two on torsion-free abelian groups): independent.

## Not verifiable

- friedman-stanley-1989 (Theorem 1, §2, §3, §4), gao-idst (§5.2, §13.1), becker-kechris-1996
  (§2.6–§2.7, §3.4), kechris-cdst (§16.C), hjorth-kechris-1996 (§4–§5), mekler-1981 (§2): recorded
  as uncertified; no text was read. The manifest flags the friedman-stanley-1989 and mekler-1981
  numbers as written from memory, and I could not check them, nor which form of the obstruction
  friedman-stanley-1989 §4 and hjorth-kechris-1996 §4–§5 state.
- Whether `classIso (wellOrderClass lt)` has a measurable graph for the product of the subtype
  σ-algebras; the Check of 6.4 claims nothing about it.
- The numbering of the published versions of paolini-shelah-tfab and montalban-cst1; the README
  cites the versions read.

## Source issues

- **Error** in montalban-cst1 at the proof of Lemma VI.18, printed page 91: the source says the finite sequences of rationals in the lexicographic order form a copy of the rationals; it should be a dense order with a least element, the empty sequence; affects the proof.

## For the human reviewers

- **Not tested.** `sources.toml` records the friedman-stanley-1989 and mekler-1981 locators as written from memory; the three Friedman–Stanley headlines and 6.4 cite that paper's "Theorem 1", "§2" and "§4" without a read text.
- **Licence.** montalban-cst1 and montalban-cst2 are author's drafts from the author's page (2019, 2025), cited by draft line numbers; Part 2 is unpublished.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "a422bd73f125ffec95ad1d925c759bad88823920", "job": "REV-PKG-CountableStructureSpacesPartII~3", "model": "fable", "worker": "chris-x89"} -->
