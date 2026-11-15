<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/16877#issuecomment-6901133248 -->
Review (claude) of 78b884a

Verdict: accepted

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

No finding. Both findings of round 4 are repaired, the elaboration passes with `sorry` as the only
warning, the one-tactic probe closes none of the 15 theorems, every supplier citation resolves at
the heads read today, every sampled locator that has a text holds the statement it is cited for,
and the mathematics of the sampled sections and of every headline was recomputed (table below).
Maintainer notes for this roadmap: none.

## Round 4 findings, one by one

- **F01 (P3, the contract line of the base's Layer 0) — repaired.**
  `packages/CountableStructureSpacesPartII/README.md` lines 311–312: "Layer 0: closedness of
  `{c | IsSimpleGraph c}`, the range of the graph coding (the API of 2.3 and its third Check)."
  The two uses are at lines 713–714 and 727–729; the four Checks of 1.2 (lines 552–563) use no
  closedness of `graphClass`; the Dependencies of Layer 2 (line 749) name the base's Layer 0 and
  those of Layer 1 (lines 636–638) do not.
- **F02 (P3, `locator_scheme` of montalban-cst2) — repaired.**
  `packages/CountableStructureSpacesPartII/sources.toml`, entry `montalban-cst2`:
  `locator_scheme = "theorem"`; its four locators (Lemma II.37, Lemma II.38, Corollary II.39,
  Lemma XI.2) are numbered statements.

Adversarial pass on the changed passages: the contract line was compared with every use of
closedness of `graphClass` in the README (two uses, both in 2.3; table, last rows). The repaired
pattern (a where-used clause of a contract line that names a section without the use) was looked
for on the other contract lines: Mathlib `ring`/`field`/`fieldOfChar` "only in the Checks of
Layer 1.3" (one use, line 627); `equiv_between_cg` "for the coloured Cantor theorem" (one use,
3.1); base Layer 6.2 "Checks of Layers 0.2, 3.3 and 6.4" (lines 447, 859, 1335–1346): all correct.
The manifest pattern (a scheme no locator of the entry matches) occurs in no other entry.

## Verified sound

**Elaboration.** `lake env lean` on `packages/CountableStructureSpacesPartII/Suggested.lean` from
the content checkout: no error, 15 warnings, all "declaration uses `sorry`" (lines 69, 95, 102,
107, 128, 138, 144, 151, 160, 173, 182, 190, 197, 204, 217). 22 declarations: 7 definitions with
real bodies (one an instance) and 15 theorems. No `set_option`, no sorry'd data, no `lemma`, no
`#eval`, no `variable` or `include` line; `import Mathlib` then five `TauCeti.*` modules, each
used; no module needed building.

**Binders.** `#check @name` for the 22 declarations in one scratch copy, compared with the README:
countability of `L` is carried by exactly `exists_lt_scottHeight_of_borelComplete`,
`mk_quotient_classIso_of_borelComplete` and `not_borelComplete_of_rank_bounded`, as Convention 1,
6.2, 6.3 and 6.4 say; the Layer 5 equivalences, `not_measurableSet_classIso_of_borelComplete` and
`borelReducible_eZero_of_borelComplete` carry `[L.IsRelational]` only, as stated; `X : Type u`
in 4.2 and `X : Type w` in Layer 5 (5); `γ δ ε` of one universe in 6.1. Nothing changed.

**Padding probe, all 15 theorems.** Each `sorry` replaced by
`first | rfl | infer_instance | simp | trivial | simp [BorelComplete, classIso, graphClass, linearOrderClass, treeClass, universalLanguage] | (intros; assumption) | exact? | tauto`
on a scratch copy, elaborated as above: 15 errors, one per theorem; none closes. Nothing is
padding.

**Headlines.** From the Summary: Borel completeness of graphs, linear orders (with the continuous
reduction of all graph codes) and trees; the universal embedding; the four reformulations; ordinal
multiples; non-Borelness; unbounded Scott height; `E₀` below; continuum many classes; the
obstruction. Each is stated in `Suggested.lean`, and the module docstring names none as not
statable, correctly. Non-smoothness is Tau Ceti's `not_isSmooth_of_borelReducible_eZero` applied
to `borelReducible_eZero_of_borelComplete` and is rightly prose only.

**Names at the pins.** The 281 single-token backticked identifiers of the README were extracted;
each one longer than three characters that is not one of the 22 declarations was resolved against
a declaration in the pinned Mathlib or Tau Ceti sources, except the seven that the README
attributes to the two supplier roadmaps (resolved below). Opened at the pin for what they say:
`TauCeti/ModelTheory/RelationalConfiguration/Basic.lean` line 211 (`restrict (f : V → W)` maps codes
on `W` to codes on `V`, so `restrict e.symm` goes from `α` to `β` as 1.1 says), lines 304–311
(`perm_smul_def`, `eval_perm_smul`: Convention 4); `TauCeti/SetTheory/Descriptive/BorelReducibility.lean`
line 229 (`IsSmooth` is reducibility to `⊥` on `ℕ → Bool`, as 0.2 uses);
`TauCeti/ModelTheory/Scott/Height.lean` line 186 (`nonempty_equiv_of_bfEquiv_of_scottHeight_le`,
both structures countable); `TauCeti/ModelTheory/RelationalConfiguration/BackAndForth.lean`
line 144 (`measurableSet_setOf_bfEquivSetoid` needs `[Countable V]`, countably many relation symbols
and `α < ω₁`, which is why the Scott-height theorem keeps the countability of `L`);
`TauCeti/ModelTheory/Infinitary/GraphTranslation/Language.lean` line 234 (the graph relation is
`funMap f (Fin.init xs) = xs (Fin.last _)`, the convention of 1.3);
`Mathlib/ModelTheory/PartialEquiv.lean` line 499 (`equiv_between_cg`);
`Mathlib/MeasureTheory/Constructions/BorelSpace/Basic.lean` line 614
(`ContinuousSMul.measurableSMul₂`); `Mathlib/Data/Nat/Pairing.lean` lines 37–44, 103, 108;
`Mathlib/SetTheory/Descriptive/Tree.lean` line 32. Neither pin has a `MeasurableSpace` instance on
`Equiv.Perm` (searched both source trees). Every backticked name the README attributes to this
roadmap is one of the 22 declarations.

**Adversarial table** (the sampled targets, the headlines, the repaired passage).

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 0.1 `classIso` | `K = ∅`; `Fin 2`, one unary predicate; `P` infinite and coinfinite into a nonempty `K` | no map from a nonempty type to `∅`; 4 codes, 3 classes (`\|P\| = 0, 1, 2`), `{0}` and `{1}` related by the transposition; one orbit, so a constant map is a reduction and is not injective | Checks correct | none |
| 0.2 set reducibility | `X = Unit`, `Y = Empty`, `A = ∅`; any measurable `A` against the diagonal of Cantor space; analytic pull-back | no map exists, so the clause `IsEmpty X ∨ Nonempty Y` is needed; the map with values `(0,0)` on `A` and `(0,1)` off `A` has preimage of the diagonal equal to `A`; the refined topology `t' ≤ t` makes the identity `t' → t` continuous, so analytic for `t'` is analytic for `t` | holds; the converse of Remark 1.5 fails by `not_isSmooth_eZero` | none |
| 1.3 graph-code map | one constant with value `n → ∞`; `(0,1)` and `(0,2)` both true; relational `L` | the unary relation `{n}` tends pointwise to `∅`, so totality is lost in the limit; functionality fails; empty table and range everything | Gδ, not closed with a function symbol, whole space when relational | none |
| 2.1 incidence graph | `R = {(0,1)}` binary; converse direction; two unary symbols without colours; a nullary symbol | degrees 3 and 2 at the two tuple vertices; the image of `t_q` is `t_{atom R (σ ∘ v)}` through the neighbours of colour `2 + 2j` and their point neighbours, and the truth edge gives `d.eval (R (σ ∘ v)) = c.eval (R v) = (σ • c).eval (R (σ ∘ v))`; swapping the two symbols is an uncoloured isomorphism of non-isomorphic codes; a tuple vertex with no positions | holds; the colours are needed | none |
| 2.2 clique tags | one edge with `κ = (0, 1)`; a vertex `x` with an `H`-neighbour; a triangle | `2 + 3 + 4 = 9` vertices, `1 + 2 + 3 + 6 = 12` edges; the neighbours of `x` are `H`-neighbours (pairwise non-adjacent) and tag 0 (adjacent to no `H`-neighbour), so `x` is in no triangle; tag 0 has `κ x + 2` triangle neighbours; in a tagged triangle the original vertices lie in a triangle | holds; triangle-freeness needed | none |
| 2.3 `borelComplete_graphClass` | `L'` with no symbols; dependence of the vertex set on `c` | points only, one code; `κ` and the vertex set do not depend on `c`, and each adjacency bit is constant or one coordinate of `c` | one continuous map for all `K'` | none |
| 3.1 colouring | `3/4`, `5`, `−1/6`, `1/8008`; `σ = (0 1)`; "negative or not" | `ν = 2, 0, 1, 3` (`8008 = 8 · 1001`, and `1/8008 < 1/1000`); an isomorphism of `(ℚ, ≤, ν⁻¹(m))` onto `(ℚ, ≤, ν⁻¹(σ m))` has `ν (π r) = σ (ν r)`, so `ν (π (1/2)) = 0`; an initial segment maps to an initial segment | holds; density needed | none |
| 3.2 order and parent | `x` a proper prefix of `y = x ++ r :: t`; `x`, `y` differing first at `i`; a competitor `p'` for the parent | `x < x ++ [r − 1] < y`; `x[0..i) ++ [(x_i + y_i)/2]` lies between; `z = x[0..i) ++ [t]` with `p'_i < t < x_i` has length `i + 1 < \|x\|` and lies in `(p', x)`, while every `z` in `(p, x)` extends `p` properly | dense, least `[]`, parent definable and unique | none |
| 3.2 unravelling | edge `{0,1}` at `[1/2, 1]`, `[1, 2]`, `[1, 1/2]`; `c` with only `adjAtom 0 1`, `d = τ • c`; a loop against the empty graph; back step of (iii) ⇒ (i) | `a = (1,0)`, `(0,0)`, `(0,1)`; `d` has only `adjAtom 1 0`, and at the index pair `(1,0)` both bits are true, at `(0,1)` both false; the colour of `[1]` with a true diagonal bit occurs nowhere for the empty graph; `Ψ⁻¹` of a child of `Ψ x` has length `\|x\| + 1` and its parent maps to `Ψ x`, so it is a child of `x` | holds for all codes of `Language.graph` | none |
| 3.3 reduction to linear orders | block `ω + (χ + 2)` with `χ = 0`; two points of one block; two blocks; the constant-true code | finite condensation classes are exactly the final parts, of size `χ + 2 ≥ 2`; `ω`-part against final part is an infinite interval; between two blocks lie infinitely many blocks; the size for a true diagonal bit at `[1]` occurs for no simple graph | a continuous reduction of all codes into `linearOrderClass` | none |
| 3.4 trees | `χ = 0`, `χ = 1`; `c_n → (ℕ, ≥)` | chain above `(x, some 0)` of 2 and of 3 nodes, the surplus tags leaves at height 2; for `i < j ≤ n`, `j` is below `i` in `c_n` | height `χ + 2` read from the tree; `treeClass` not closed | none |
| 4.1 Borel S∞-spaces | `ℕ` with evaluation; the trivial action; uncountably many unary symbols | one orbit; orbits are points; a set measurable for the product σ-algebra depends on countably many coordinates, so no singleton is measurable | definition and Checks correct | none |
| 4.2 embedding | `X = ℕ`, `S_n = {n}`; equivariance; injectivity; arities `m = 0, 1, 2` | symbol `(1,0)` at `(a)`, `x`: `g a = 0 = g x`, so `x = a`; `g' = g h` turns `(h • x, a)` into `(x, h⁻¹ ∘ a)`; `g_k` fixing `0..k−1` and their inverses tend to `1`, and `g_k • y ∈ S_n` puts `y` in the closure of `S_n`; `unpair 0 = (0,0)`, `unpair 1 = (0,1)`, `unpair 2 = (1,0)` from `sqrt` 0, 1, 1 | matches Convention 4; injective; packing Checks correct | none |
| Layer 5 | `K = graphClass`; `K = ∅`; one unary predicate | all five hold; all fail (a nonempty instance in each, `PUnit` in (5)); `𝔠` classes of `graphClass` against `ℵ₀` | consistent with 1.2 | none |
| 6.1 interval lemma | level 0; a successor; the retained level | `SameAtomicType`, no nullary symbols; a point of `I_j` is matched inside `I'_j` and splits both into halves equivalent one level down; the other intervals drop a level by `BFEquiv.mono` | holds for the one-step `BFEquiv` | none |
| 6.1 `bfEquiv_omega0_opow_mul` | `γ = 0`; the step `γ + 1`; `ω`, `ω · 2`, `ω + 1`; `δ = 0` | trivial; initial segment `ω^γ · μ + ρ` answered by `ω^γ · min(μ,1) + ρ < ω^γ · 2 ≤ ω^(γ+1)`, final segment `ω^(γ+1) · (δ − q)` with `δ − q ≥ 1` after absorbing `r < ω^(γ+1)`; `ω ≡₂ ω · 2` (least to least), `ω ≢₂ ω + 1` (the maximum has an empty upper interval); empty against nonempty fails at level 1 | induction re-derived; `δ, ε ≠ 0` needed | none |
| 6.2 not Borel | `β = 0`; `K = ∅`; a language with uncountably many symbols | `ω^(1+0) = ω` and `ω · 2`: countable, infinite, distinct, `BFEquiv 1`, hence `BFEquiv 0`; the hypothesis is false; the pull-back of a measurable graph along the reduction from `linearOrderClass` uses nothing of `L` | holds without countability of `L` | none |
| 6.2 Scott height | all heights `≤ β` | isomorphism on `K` is the preimage of the level-`β` graph, measurable for `β < ω₁` and countable `L` | contradiction with the theorem | none |
| 6.3 `eZero`, count | `0^ω`, `1 0^ω`, `1^ω`; the copy `F = ∅` alone | `F ↦ F ∆ {0}` matches the copies; finitely against cofinitely many `P`-points; one copy reduces equality, not `eZero` | reduction correct; upper bound `𝔠` needs countable `L` | none |
| 6.4 obstruction | `K = ∅`; `K` analytic; one unary predicate, `ρ = 0`; `K = wellOrderClass lt`; `A = g '' B` with `B` not measurable | (a), (b) hold and `¬ BorelComplete ∅`; (b) at `A = K` gives `K_α = K` and (a) is the negation of 6.2; `ℵ₀` Borel classes; types `ω ≤ β < ω₁`, `K_α` a countable union of Borel orbits, `ρ` unbounded, the base's bound `type < β` gives `ρ ≤ β`; the diagonal of `A` is measurable in `A × A` and not in the ambient square | true; has content off analytic classes | none |
| 6.5 | one unary predicate | classes `(\|P\|, \|¬P\|)`, countably many, each Borel: smooth; `eZero` has `𝔠` classes and does not reduce to it; it reduces to `eZero` through equality | holds | none |
| Contract, base Layer 0 (repaired) | every use of closedness of `graphClass`; the codes with the single true atom `adjAtom 0 n` | lines 713–714 and 727–729, none in 1.2; none of these codes is symmetric and their limit, the empty code, is, so the class is closed and not open | correct | none |

**Sources (the seeded sample and every locator that has a text).** Read at the cached texts:
paolini-shelah-tfab lines 56–58, 65–68 (0.1), 70–73, 88–91 (0.2), 83–87 (Convention 2), 95–101
(0.1, 1.2), 60–64 (1.3), 103–106 (6.2), 125 (2.3), 169–171 (Scope); becker-kechris-bams
lines 72–73, 126–128 (4.1), 132, 172–177, 247–268 (4.2), 159–164 (Convention 4, 1.1);
camerlo-gao-boolean lines 87–93 (1.3), 94–105 (Layer 5, 6.3), 106–110 (0.1, 1.2), 111–112 (2.3),
257–263, 276–281 (3.5), 405, 555 (Scope); montalban-cst1 lines 4203–4288 (3.1–3.4: dense preimages
at 4258–4260, dense labels at 4273–4275, the parent from order and lengths at 4279–4283, label plus
two elements at 4287–4288), 4572–4577 and 4623–4654 (2.1, 2.2); montalban-cst2 lines 2322–2331
(Lemma II.37, for `α > 0` and the one-sided relations), 2337–2425 (Lemma II.38, Corollary II.39),
8946–8980 (Lemma XI.2). Each supports the statement it is cited for; where the roadmap is more
general (measurable spaces in 0.2, all graph codes in 3.2–3.4, the symmetric one-step levels in
6.1, an `ω`-part before each finite block in 3.3) the README says "own construction" or names the
difference and gives its own proof, which the table recomputes. All 11 cited works are in the
manifest; none was added.

**Suppliers.** Dependency check:

    depcheck: 243 roadmaps, 2247 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. Resolved today. CountableStructureSpaces at its open head
(another author's new roadmap): Layer 0 ("closedness of the range of the graph coding" among its
targets), Layer 1.2 (the `ContinuousSMul` instance from `continuous_uncurry_restrict` and
`Equiv.Perm.continuous_inv_apply`), Layers 4.1, 4.2, Layer 4.4 (`exists_uniform_bfSeparation`, for
an analytic set of non-isomorphic pairs, some `β < ω₁`), Layer 6.2 (`wellOrderClass lt`, strict;
`exists_mem_wellOrderClass_type_eq` for `ω ≤ β < ω₁`; `analyticSet_compl_wellOrderClass`;
`analytic_type_bounded`; `not_measurableSet_wellOrderClass`), worked example 2 (one unary
predicate: countably many Borel orbits, Scott height at most `ω`), the Layer 1 acceptance check
with the 3-cycle, and its out-of-scope line for Borel completeness of graphs and linear orders.
NoncompactQuantumSymmetry at its open head, the line before this roadmap in the merge order:
`## Layer 4: M1`, `### M1.BorelRealization`, `exists_polishTopology_continuousSMul` with
`[PolishSpace G] [BorelSpace G] [StandardBorelSpace X] [MeasurableSMul₂ G X]`. On main:
BorelEquivalenceRelations §5.1–§5.4; InfinitaryModelExistence 0.3 and Layer 6; CountableModelCounting
Layer 0 (`isoSetoidOn`, transport between presentations); InfinitaryLogic Layer 1 (completed). No
declared gap; no forbidden supplier.

**Duplication.** Searched the pins, main and the open heads by object (Borel completeness, the
Friedman–Stanley codings, a universal S∞-space, a σ-algebra on `Equiv.Perm ℕ`, the seven
definitions of `Suggested.lean` by name): no other owner and no second declaration of any of the
names. The overlap report lists no shared pull request, dropped id, open-revision id or second
copy.

Overlap check: read CountableStructureSpaces, CountableModelCounting, BorelEquivalenceRelations, InfinitaryLogic, HanfNumbers, RandomGraphs; restricted isomorphism: CountableModelCounting owns `isoSetoidOn` for the models of one sentence and this roadmap owns `classIso` for arbitrary sets of codes, as its Scope says; nothing else shared.

**Shape and style.** Seven layers, each with Examples and Dependencies; every definition has its
API and at least three Checks (`classIso` 5, set reducibility 4, relabelling 4, `BorelComplete` 4,
functional coding space 4, `graphClass` 3, `linearOrderClass` 3, `treeClass` 3,
`instMeasurableSpacePerm` and Borel S∞-spaces 3, `universalLanguage` with the embedding 7); every
theorem has a locator or the mark "own construction"; the layers are what the end theorems need
and none is named after a source. A search of the README and the Lean file for process words,
pull-request numbers, anchors, LaTeX delimiters and machine paths returned nothing.

Source independence: 16 passages compared with 5 sources, none shared; largest share paolini-shelah-tfab, 13 of 52 locators; contents compared with paolini-shelah-tfab (introduction, preliminaries, a combinatorial frame, sections on torsion-free abelian groups): independent.

## Not verifiable

- friedman-stanley-1989 (Theorem 1, §2, §3, §4), gao-idst (§5.2, §13.1), becker-kechris-1996
  (§2.6–§2.7, §3.4), kechris-cdst (§16.C), hjorth-kechris-1996 (§4–§5), mekler-1981 (§2): recorded
  as uncertified; no text was read. Of the sample, the locators of 6.4 and 6.5 are all of this
  kind, as are the Friedman–Stanley locators of 2.3, 3.3 and 3.4; the mathematics of those
  sections was checked by computation instead (table).
- The numbering of the published versions of paolini-shelah-tfab and montalban-cst1; the README
  cites the versions read.

## Source issues

- **Error** in montalban-cst1 at the proof of Lemma VI.18, printed page 91: the source says the finite sequences of rationals in the lexicographic order form a copy of the rationals; it should be a dense order with a least element, the empty sequence; affects the proof.

## For the human reviewers

- **Not tested.** `sources.toml` records the friedman-stanley-1989 and mekler-1981 locators as written from memory; the three Friedman–Stanley headlines and 6.4 cite that paper's "Theorem 1", "§2" and "§4" without a read text.
- **Licence.** montalban-cst1 and montalban-cst2 are author's drafts from the author's page (2019, 2025), cited by draft line numbers; Part 2 is unpublished.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "78b884ab52c7ffbaf7b3f895926dca87015f26eb", "job": "REV-PKG-CountableStructureSpacesPartII~5", "model": "fable", "worker": "chris-x29"} -->
