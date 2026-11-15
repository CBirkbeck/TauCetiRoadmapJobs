<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/16877#issuecomment-6900409296 -->
Review (claude) of 0275b4f

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) the contract for the base's Layer 0 names 1.2, which does not use it

   - **Location.** `packages/CountableStructureSpacesPartII/README.md` lines 311–312: "Layer 0:
     closedness of `{c | IsSimpleGraph c}`, the range of the graph coding (Checks of 1.2 and 2.3)."
   - **Claim.** Closedness of the simple-graph codes is used in Checks of 1.2 and of 2.3.
   - **Witness.** The four Checks of 1.2 (lines 552–563) use no closedness of `graphClass`; the only
     "closed" there (line 555) is the class of the `P_i`. The uses are the first API bullet of 2.3
     (lines 713–714) and its third Check (lines 727–729). Dependencies of Layer 1 (lines 636–638) list
     no base Layer 0.
   - **Repair.** Lines 311–312: "Layer 0: closedness of `{c | IsSimpleGraph c}`, the range of the
     graph coding (the API of 2.3 and its third Check)." Tested against the README: this agrees with
     line 713, with line 729 and with the Dependencies of Layer 2 (line 749, "CountableStructureSpaces
     Layer 0 (closedness of `graphClass`)"), and Layer 1 then needs no change.

2. **F02** (P3) `locator_scheme` of montalban-cst2 does not match its locators

   - **Location.** `packages/CountableStructureSpacesPartII/sources.toml`, entry `montalban-cst2`:
     `locator_scheme = "section"`, `locator = "Lemma II.37 (lines 2322-2331), Lemma II.38 and
     Corollary II.39 (lines 2337-2425), Lemma XI.2 (lines 8946-8980)"`.
   - **Claim.** The work is cited by section.
   - **Witness.** Every locator of the entry, and every citation of it in the README (lines 102,
     1170, 1191), is a numbered lemma or corollary. The sibling entry `montalban-cst1`, cited the same
     way (Lemma VI.18, Theorem VI.27), has `locator_scheme = "theorem"`.
   - **Repair.** In the `montalban-cst2` entry: `locator_scheme = "theorem"`. Nothing else in the
     entry changes.

Two findings, both P3, neither blocking. Both findings of round 3 are repaired. The elaboration
passes with `sorry` as the only warning, the one-tactic probe closes none of the 15 theorems, every
supplier citation resolves at the heads read today, and the mathematics recomputed below is sound.
What remains is one supplier-contract clause that names a section which does not use the cited
result (the pattern of round 3's F02, on the neighbouring line), and one manifest field.

## Round 3 findings, one by one

- **F01 (P3, the locator of 4.1) — repaired.** README line 1012–1013: "its orbit equivalence
  relation is `MulAction.orbitRel` (becker-kechris-bams lines 72–73)"; lines 1022–1024: "has an
  invariant Borel image (Lusin–Souslin, `MeasurableSet.image_of_measurable_injOn`;
  becker-kechris-bams lines 126–128)"; manifest: "§1: Borel G-spaces (lines 72-78), §2: Borel
  embeddings and universal spaces (lines 126-131)". Read in the text: line 72 opens the definition
  of a Borel G-space (standard Borel space, Polish group, Borel action on the product); line 126
  defines a Borel embedding and line 127 notes that its image is invariant Borel.
- **F02 (P3, the contract line of the base's Layer 6.2) — repaired.** README line 322: "used in
  Checks of Layers 0.2, 3.3 and 6.4." The three uses are at lines 447, 859 and 1336.

Adversarial pass on the changed passages: the three locators were read against the text (above);
the contract line was compared with every use. The repaired pattern of F02 (a where-used clause of a
contract line) was then looked for on every other contract line: it recurs once, R01. The pattern of
F01 (a locator at lines that do not hold the statement) was looked for in every locator with a
cached text (list under Sources): none.

## Verified sound

**Elaboration.** `lake env lean` on `packages/CountableStructureSpacesPartII/Suggested.lean` from
the content checkout: no error, 15 warnings, all "declaration uses `sorry`" (lines 69, 95, 102, 107,
128, 138, 144, 151, 160, 173, 182, 190, 197, 204, 217). 22 declarations: 7 definitions with real
bodies (one an instance), 15 theorems. No `set_option`, no sorry'd data, no `lemma`, no `#eval`;
`import Mathlib` then five `TauCeti.*` modules, each used. No module needed building.
`Suggested.lean` is byte-identical to the file reviewed in round 3 (the last repair changed three
README lines and one manifest line).

**Binders.** The file has no `variable` or `include` line: every binder is in the declaration's own
signature, so none can be dropped. `#check @name` on the declarations in a scratch copy and the
worker's elaborated signatures were compared with the README statements: countability of `L` is
carried exactly by `exists_lt_scottHeight_of_borelComplete`, `mk_quotient_classIso_of_borelComplete`
and `not_borelComplete_of_rank_bounded`, as Convention 1 and the sections say; nothing changed.

**Padding probe, all 15 theorems.** Each `sorry` replaced by
`first | rfl | infer_instance | simp | trivial | simp [BorelComplete, classIso, graphClass, linearOrderClass, treeClass, universalLanguage] | (intros; assumption) | exact?`
on a scratch copy, elaborated as above: 15 errors, one per theorem, none closes. Nothing is padding.

**Headlines.** From the Summary: graphs, linear orders (with the continuous reduction of all graph
codes), trees; the universal embedding; the four reformulations; ordinal multiples; non-Borelness;
unbounded Scott height; `E₀` below; continuum many classes; the obstruction. All are stated; the
module docstring names none as not statable, correctly. Non-smoothness is one library lemma
(`not_isSmooth_of_borelReducible_eZero`) applied to a stated theorem and is rightly prose only.

**Names at the pins.** One scratch file with `#check` for 158 cited library names (50 Mathlib, 108
Tau Ceti) after a copy of `Suggested.lean`. All Mathlib names resolve. The Tau Ceti names resolve
there or, for modules `Suggested.lean` does not import, were opened at the pin:
`ModelTheory/RelationalConfiguration/Structure.lean` lines 98, 106, 126 (`Equiv.eval_encodeVia`,
`toStructure_encodeVia`, `encodeVia_trans`); `.../LanguageMap.lean` lines 186–240
(`LEquiv.onConfiguration`, a `≃ₜ`, with `eval_`, `_symm`, `_trans`, `measurable_`,
`isoSetoid_onConfiguration_iff`); `.../BackAndForth.lean` lines 105, 115, 144 (`bfEquivSetoid`,
`measurableSet_setOf_bfEquivSetoid` with `[Countable V] [∀ n, Countable (L.Relations n)]`);
`ModelTheory/BackAndForth/DiscreteOrder.lean` line 86 (`sameAtomicType_order_iff`);
`ModelTheory/BackAndForth/Equivalence.lean` lines 49–96 (`BFEquiv`: level 0 is `SameAtomicType`, a
successor keeps the previous level and adds forth and back, a limit is all lower levels);
`ModelTheory/Infinitary/SmallPresentation.lean` lines 56, 72, 111, 120;
`ModelTheory/Infinitary/GraphTranslation/Language.lean` lines 72, 230 and `Reconstruct.lean`
lines 161, 248, 315 (`reconstructStructure_graphExpansion` needs `[Nonempty M]`);
`Topology/Algebra/Group/Perm.lean` line 58 (`continuous_inv_apply`). Mathlib
`MeasureTheory/Constructions/Polish/Basic.lean`: line 331 (`Measurable.exists_continuous`: a finer
Polish topology, range second countable), line 353 (`MeasurableSet.analyticSet_image`: standard
Borel domain, range second countable, which is why 6.4 keeps the countability of `L`), line 883
(`Measurable.measurableEmbedding`: standard Borel domain, countably separated codomain). Every
backticked name the README attributes to this roadmap is one of the 22 declarations.

**Adversarial table** (sampled targets, headlines, the repaired passages, the targets of findings).

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 0.1 `classIso` | `Fin 2`, one unary predicate; `K = ∅`; `P` infinite and coinfinite | 4 codes, 3 classes `\|P\| = 0, 1, 2`; no map from a nonempty type into `∅`; one orbit, so a constant map is a reduction and is not injective | Checks correct |
| 0.2 set reducibility | `X = Unit`, `Y = Empty`; graph of `eZero` against the diagonal; pull-back of analyticity | no map exists, so the clause `IsEmpty X ∨ Nonempty Y` is needed; the two-valued map `(0,0)` / `(0,1)` pulls the diagonal back to any measurable set; `Measurable.exists_continuous` gives `t' ≤ t`, and the identity from `t'` to `t` is continuous, so analytic for `t'` is analytic for `t` | holds; converse fails as stated |
| 1.1 relabelling | `Fin 3`, `e = (0 1 2)`, `P = {0}`; `Fin 0` | `restrict e.symm` is true at `w` iff `e.symm w = 0` iff `w = 1`; `restrict e` gives `w = 2`; twice gives `P = {2} ≠ P`; on `Fin 0`: 1 code without nullary symbols, 2 with one | direction agrees with Convention 4 |
| 1.2 `BorelComplete` | `K = ∅`; one unary predicate; `graphClass ∩` the empty graph's orbit | no map into `∅`; `ℵ₀` classes against `𝔠` for the family `P_i ∈ {∅, ℕ}`; one point | fails in all three, as the Checks say |
| 1.3 graph-code map | one constant with value `n → ∞`; relational `L`; `fieldOfChar 2` | the unary graph relation `{n}` tends pointwise to `∅`, totality lost; empty table, range everything; `𝔽₂(t)` countably infinite of characteristic 2, `ℚ` not | Gδ, not closed; closed when relational |
| 2.1 incidence graph | `R = {(0,1)}`; the converse direction; two unary symbols, colours forgotten | degrees 3 and 2; colours `0`, `1`, even `≥ 2`, odd `≥ 3` separate the four sorts; `t_q ↦ t_{atom R (σ ∘ v)}` and the truth edge give `d.eval (R (σ ∘ v)) = c.eval (R v) = (σ • c).eval (R (σ ∘ v))`; swapping the symbols is an uncoloured isomorphism | holds; colours needed |
| 2.2 clique tags | edge with `κ = (0, 1)`; a triangle | `2 + 3 + 4 = 9` vertices, `1 + 2 + 3 + 6 = 12` edges; tag 0 has `κ x + 2` triangle neighbours and one other; in a triangle the original vertices lie in a triangle | holds; triangle-freeness needed |
| 2.3 `borelComplete_graphClass` | `L'` empty; a nullary symbol | points only, one code; a tuple vertex with no positions, decided by its truth edge; the vertex set does not depend on `c` and each output coordinate is constant or one coordinate of `c` | continuous, one map for all `K'` |
| 3.1 colouring | `3/4`, `5`, `−1/6`, `1/8008`; `σ = (0 1)`; "negative or not" | `ν = 2, 0, 1, 3`; an isomorphism of `(ℚ, ≤, ν⁻¹(m))` onto `(ℚ, ≤, ν⁻¹(σ m))` has `ν (π r) = σ (ν r)`, so `ν (π (1/2)) = 0`; an initial segment maps to an initial segment | holds; density needed |
| 3.2 parent, density | `x = p ++ [r]`; a competitor `p'` differing from `x` at `i`; `x` a prefix of `y = x ++ r :: t` | every `z` in `(p, x)` extends `p` properly, length `≥ \|x\|`; `z = x[0..i) ++ [t]`, `p'_i < t < x_i`, has length `i + 1 < \|x\|` and lies in `(p', x)`; `x < x ++ [r − 1] < y` | parent definable and unique; dense, least `[]` |
| 3.2 unravelling | edge `{0,1}` at `[1/2, 1]`, `[1, 2]`, `[1, 1/2]`; `c`, `d = τ • c` off `graphClass`; loop against empty graph | `a = (1, 0)`, `(0, 0)`, `(0, 1)`; bits at `(1,0)`: `c.eval (adjAtom 0 1) = d.eval (adjAtom 1 0)`, both true; the colour of `[1]` with a true diagonal bit occurs nowhere for the empty graph; (iii) ⇒ (i): `Ψ` fixes `[]`, preserves depth, and maps the children of `x` onto those of `Ψ x` | holds for all codes |
| 3.3 reduction to linear orders | blocks `ω + (χ + 2)`; `χ = 0`; two blocks; two points of one block | finite condensation classes are exactly the final parts, of size `χ + 2 ≥ 2`; between two blocks lie infinitely many; a comparison inside the block of `x` reads `χ_c(x)` only | reduction on all codes, continuous, into `linearOrderClass` |
| 3.4 trees (touches 3.3) | `χ = 0, 1`; `c_n → (ℕ, ≥)` | chain above `(x, some 0)` of 2 and 3 nodes, surplus tags are leaves at height 2; for `i < j ≤ n`, `j` is below `i` in `c_n` | height `χ + 2`; `treeClass` not closed |
| 4.1 Borel S∞-spaces | `ℕ` with evaluation; trivial action; uncountably many unary symbols; equivariant injection `f` | Tau Ceti `instContinuousSMul` (`Perm.lean` line 80), one orbit; orbits are points; a `pi`-measurable set depends on countably many coordinates, so no singleton is measurable; `f x = g • f y = f (g • y)` gives `x = g • y` | definition and Checks correct |
| 4.2 embedding | `X = ℕ`, `S_n = {n}`; equivariance; injectivity; `m = 0, 1, 2` | symbol `(1,0)` at `(a)`, `x`: `g a = 0 = g x`, so `x = a`; `g' = g h` turns `(h • x, a)` into `(x, h⁻¹ ∘ a)`; `g_k` fixing `0..k−1` tend to `1` (so do the inverses) and `g_k • y ∈ S_n` puts `y` in the closure; `Nat.pair 0 1 = 1`, `Nat.pair 1 0 = 2`, so `unpair 1 = (0,1)`, `unpair 2 = (1,0)` | matches Convention 4; injective; packing Checks correct |
| Layer 5 | `K = graphClass`; `K = ∅`; one unary predicate; `X : Type w` in (5) | all hold; all fail (each quantifies over a nonempty instance, `PUnit` in (5)); `𝔠` against `ℵ₀` classes; (5) ⇒ (3) through `ULift` of a coding space | consistent |
| 6.1 interval lemma, sum form | level 0; successor; `A + B` with a new point in `A` | level 0 is `SameAtomicType`, no nullary symbols; a point of interval `I_j` splits it, and the two halves at level `γ` are `I_j` at level `γ + 1`; `A_{>m} + B` against `A'_{>m'} + B'` by the lower level | holds for TauCeti's `BFEquiv` |
| 6.1 `bfEquiv_omega0_opow_mul` | `γ = 0, 1, 2`; `ω`, `ω·2`, `ω + 1`; the step `γ + 1`; `δ = 0` | level 1: any two nonempty orders; `ω ≡₂ ω·2` (least to least, others to others), `ω ≢₂ ω + 1` (the maximum has an empty upper interval); initial segment `ω^γ·μ + ρ` answered by `ω^γ·min(μ,1) + ρ < ω^(γ+1)`; after `ω^(γ+1)·q + r` the rest is `ω^(γ+1)·(δ − q)`, `δ − q ≥ 1`; empty against nonempty fails at level 1 | induction re-derived; `δ, ε ≠ 0` needed |
| 6.2 not Borel | `β = 0`; `K = ∅`; uncountable `L` | `ω`, `ω·2`: countable, infinite, distinct, `BFEquiv 1`; hypothesis false; the reduction from `linearOrderClass` pulls a measurable graph back whatever `L` is | holds without countability of `L` |
| 6.3 `eZero`, count | `0^ω`, `1 0^ω`, `1^ω`; `F = ∅` only; `L` with `2^𝔠` unary symbols | copies `x ∆ F` list the class once each, `F ↦ F ∆ {0}` matches them; finitely against cofinitely many `P`-points; one copy reduces equality only; more than `𝔠` classes possible | reduction correct; countability needed for the count only |
| 6.4 obstruction | `K = ∅`; `K` analytic; one unary predicate, `ρ = 0`; `K = wellOrderClass lt`; `A = g '' B`, `B` not measurable | (a), (b) hold and `¬BorelComplete ∅`; (b) at `A = K` gives `K_α = K` and (a) negates 6.2; `ℵ₀` classes; types `ω ≤ β < ω₁`, `K_α` a countable union of orbits, each a section of a Borel level graph, `ρ` unbounded; the diagonal of `A` is measurable in `A × A`, not in the ambient square | true; has content off analytic classes |
| 6.4, proof for arbitrary `K` | a reduction `f` of `classIso graphClass` | image analytic (standard Borel domain, second-countable range), inside `K`, so inside some `K_α`; graph of `classIso graphClass` is the preimage under `f' × f'` | contradiction with 6.2 and 2.3 |
| 6.5 | one unary predicate | classes `(\|P\|, \|¬P\|)`, countably many, each Borel: smooth; `eZero` has `𝔠` classes and does not reduce to it; it reduces to `eZero` through equality | holds |
| Contract, base Layer 6.2 (repaired) | each use | lines 447, 859, 1336: three uses, three layers listed | correct |
| Contract, base Layer 0 | each use of closedness of `graphClass` | lines 713 (API of 2.3), 729 (third Check of 2.3); none in 1.2 | R01 |

**Sources (the seeded sample and every locator that has a text).** Read at the cached texts:
paolini-shelah-tfab lines 56–58 and 65–68 (0.1), 70–73 and 88–91 (0.2), 83–87 (Convention 2),
95–101 (0.1, 1.2), 60–64 (1.3), 103–106 (6.2), 125 (2.3), 169–171 (Scope); becker-kechris-bams
lines 72–78 and 126–131 (4.1), 132 and 172–177 (4.2), 159–164 (Convention 4, 1.1), 247–268 (4.2);
camerlo-gao-boolean lines 87–93 (1.3), 94–105 (Layer 5, 6.3), 106–110 (0.1, 1.2), 111–114 (2.3),
257–263 and 276–281 (3.5), 405 and 555 (Scope); montalban-cst1 lines 4203–4288 (3.1–3.4: dense
preimages at 4258–4260, labelled dense orders at 4273–4275, the parent from order and lengths at
4279–4283, label plus two elements at 4287–4288) and 4572–4659 (2.1, 2.2; cycle lengths at
4651–4654); montalban-cst2 lines 2322–2331 (Lemma II.37, for `α > 0`, one-sided relations),
2337–2425 (Lemma II.38, Corollary II.39), 8946–8980 (Lemma XI.2). Each supports the statement it is
cited for at the generality stated; where the roadmap is more general (measurable spaces in 0.2,
all graph codes in 3.2–3.4, symmetric levels in 6.1) the README says so and gives its own proof.
All 11 cited works are in the manifest, each `cited_for` list agrees with the sections that cite
the work; none was added.

**Suppliers.** Dependency check:

    depcheck: 246 roadmaps, 2242 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. Resolved today: CountableStructureSpaces at its open head
(another author's new roadmap): Layer 0 (closedness of the range of the graph coding), Layer 1.2
(the `ContinuousSMul` instance from `continuous_uncurry_restrict` and
`Equiv.Perm.continuous_inv_apply`), Layers 4.1, 4.2, Layer 4.4 (`exists_uniform_bfSeparation`),
Layer 6.2 (`wellOrderClass lt`, strict; `exists_mem_wellOrderClass_type_eq` for `ω ≤ β < ω₁`;
`analytic_type_bounded`; `analyticSet_compl_wellOrderClass`; `not_measurableSet_wellOrderClass`),
worked example 2, the Layer 1 acceptance check with the 3-cycle, and its statement that Borel
completeness of graphs and linear orders is outside its scope. None of these is at the pin (searched
by object: no `ContinuousSMul` instance on the coding space, no closedness of the simple-graph
codes, no well-order class). NoncompactQuantumSymmetry at its open head, earlier in the merge order:
`## Layer 4: M1`, `### M1.BorelRealization`, `exists_polishTopology_continuousSMul (G X : Type*)`
with `[PolishSpace G] [BorelSpace G] [StandardBorelSpace X] [MeasurableSMul₂ G X]`. On main, and
unchanged at the heads of their open revisions: BorelEquivalenceRelations §5.1–§5.4;
InfinitaryModelExistence 0.3 and Layer 6; CountableModelCounting Layer 0 (`isoSetoidOn`, transport
between presentations); InfinitaryLogic Layer 1 (completed). No declared gaps; no forbidden
supplier.

**Duplication.** Searched the pins, main and the open heads by object (Borel completeness, the
Friedman–Stanley codings, a universal S∞-space, set reducibility, a σ-algebra on `Equiv.Perm ℕ`,
back-and-forth equivalence of ordinal multiples): no other owner. The pins have no
`MeasurableSpace (Equiv.Perm _)` instance (only instance arguments in
`TauCeti/Probability/Distributions/Uniform/Permutation.lean` lines 38, 85); Tau Ceti's
`ModelTheory/BackAndForth/DiscreteOrder.lean` treats discrete orders without endpoints at level `ω`
and no ordinal multiples. `graphClass` also names a declaration of `TauCeti.ContCohomology`, in
another namespace. The overlap report lists no shared pull request, dropped id or second copy;
confirmed with `roadmaps grep` over the open heads.

Overlap check: read CountableStructureSpaces, CountableModelCounting, BorelEquivalenceRelations, InfinitaryLogic, HanfNumbers, RandomGraphs; restricted isomorphism: CountableModelCounting owns `isoSetoidOn` for the models of one sentence and this roadmap owns `classIso` for arbitrary sets of codes, as its Scope says; nothing else shared.

**Shape and style.** Seven layers, each with Examples and Dependencies; every definition has at
least three Checks; every theorem a locator or the mark "own construction"; the layers are what the
end theorems need and none is named after a source. No LaTeX, process words, pull-request numbers,
anchors or machine paths in the README or the Lean file. The *Needs:* line of 4.2 lists
`MeasurableSet.image_of_measurable_injOn`, which is the whole proof of the
`Measurable.measurableEmbedding` named in the statement, so the route is covered.

Source independence: 16 passages compared with 5 sources, none shared; largest share paolini-shelah-tfab, 13 of 52 locators; contents compared with paolini-shelah-tfab (five sections: introduction, preliminaries, a combinatorial frame, two on torsion-free abelian groups): independent.

## Not verifiable

- friedman-stanley-1989 (Theorem 1, §2, §3, §4), gao-idst (§5.2, §13.1), becker-kechris-1996
  (§2.6–§2.7, §3.4), kechris-cdst (§16.C), hjorth-kechris-1996 (§4–§5), mekler-1981 (§2): recorded
  as uncertified; no text was read. Of the sample, the locators of 6.4 and 6.5 are all of this
  kind, as are the Friedman–Stanley locators of 2.3 and 3.3; the mathematics of those sections was
  checked by computation instead (table).
- The numbering of the published versions of paolini-shelah-tfab and montalban-cst1; the README
  cites the versions read.

## Source issues

- **Error** in montalban-cst1 at the proof of Lemma VI.18, printed page 91: the source says the finite sequences of rationals in the lexicographic order form a copy of the rationals; it should be a dense order with a least element, the empty sequence; affects the proof.

## For the human reviewers

- **Not tested.** `sources.toml` records the friedman-stanley-1989 and mekler-1981 locators as written from memory; the three Friedman–Stanley headlines and 6.4 cite that paper's "Theorem 1", "§2" and "§4" without a read text.
- **Licence.** montalban-cst1 and montalban-cst2 are author's drafts from the author's page (2019, 2025), cited by draft line numbers; Part 2 is unpublished.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "0275b4f952897224a17a666a5800297bf116bf01", "job": "REV-PKG-CountableStructureSpacesPartII~4", "model": "fable", "worker": "chris-x83"} -->
