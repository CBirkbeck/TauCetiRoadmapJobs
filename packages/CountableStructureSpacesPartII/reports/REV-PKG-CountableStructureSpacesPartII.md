<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/16877#issuecomment-6898351674 -->
Review (claude) of a3acb52

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) `not_isSmooth_of_borelComplete` is padding

   - **Location.** `packages/CountableStructureSpacesPartII/Suggested.lean` lines 210–215;
     `packages/CountableStructureSpacesPartII/README.md` lines 32 and 1265–1267.
   - **Claim.** A headline theorem: "A Borel complete isomorphism relation is not smooth."
   - **Witness.** One-tactic probe on a scratch copy, elaborated at the pins, closes it with one library
     lemma: `exact not_isSmooth_of_borelReducible_eZero (borelReducible_eZero_of_borelComplete hK)`.
     It also closes as `exact fun h => not_measurableSet_classIso_of_borelComplete hK h.measurableSet_setOf`.
   - **Repair.** Delete `not_isSmooth_of_borelComplete` from `Suggested.lean` and drop "and is not
     smooth" from the Layer 6 bullet of its module docstring. In the README keep the statement as
     prose: remove the name from the list in the second paragraph of the Summary (line 32), and in
     6.3 replace "Prove `not_isSmooth_of_borelComplete`: `¬ Setoid.IsSmooth (classIso K)`
     (`not_isSmooth_of_borelReducible_eZero`)" by "Prove that `classIso K` is not smooth
     (`not_isSmooth_of_borelReducible_eZero` applied to the reduction of `eZero`)".

2. **F02** (P3) countability of `L` assumed where neither statement nor route uses it

   - **Location.** `Suggested.lean`: `borelComplete_iff_graphClass`,
     `borelComplete_iff_forall_structureSpace`, `borelComplete_iff_forall_measurableSet`,
     `borelComplete_iff_forall_permSpace`, `not_measurableSet_classIso_of_borelComplete`,
     `borelReducible_eZero_of_borelComplete` (and `not_isSmooth_of_borelComplete`, see R01);
     README line 1105 ("(countable relational `L`)") and line 1210.
   - **Claim.** Each carries `[∀ n, Countable (L.Relations n)]` for the target language `L`.
   - **Witness.** README line 517: "theorems assume `K` invariant Borel, or `L` countable, where they
     need it". The README routes use only reductions into `classIso K` and pull-back of
     measurability; a scratch copy with the binder deleted from the seven statements elaborates with
     `sorry` as the only warning.
   - **Repair.** Delete the binder from those six statements (keep it on
     `exists_lt_scottHeight_of_borelComplete`, which uses `measurableSet_setOf_bfEquivSetoid`, on
     `mk_quotient_classIso_of_borelComplete`, which uses `mk_le_continuum`, and on
     `not_borelComplete_of_rank_bounded`, which needs a Polish target). In the README write
     "For any `K : Set (RelationalConfiguration L ℕ)` (relational `L`; countability of `L` is not
     used)" at the head of Layer 5, and in 6.2 restrict "(countable relational `L`)" to the Scott
     height consequence and the third consequence (analyticity).

3. **F03** (P3) one `*Needs:*` line for the five characterisations of Layer 5

   - **Location.** README line 1126: "*Needs:* Layers 0.1, 1.2, 1.3, 2.3, 4.1, 4.2."
   - **Claim.** All four `borelComplete_iff_…` theorems need all six layers.
   - **Witness.** The proof at lines 1119–1125: (1)⇔(3)⇔(4) use Layers 0.1 and 1.2 only; (1)⇔(2)
     adds 2.3; only (5) uses 4.1 and 4.2 (hence NoncompactQuantumSymmetry); 1.3 serves only the
     closing remark. The line puts three theorems behind an external supplier.
   - **Repair.** Replace by: "*Needs:* for (1)⇔(3)⇔(4), Layers 0.1 and 1.2; for (1)⇔(2), also
     Layer 2.3; for (1)⇔(5), also Layers 4.1 and 4.2; for the form of (3) with function symbols,
     Layer 1.3."

4. **F04** (P3) two slips in `Suggested.lean` comments

   - **Location.** `Suggested.lean` lines 188–189 and line 39.
   - **Claim.** (a) Docstring of `exists_lt_scottHeight_of_borelComplete`: "below every countable
     ordinal some code of the class has a larger Scott height". (b) Section comment "Layer 0:
     Isomorphism relations of classes".
   - **Witness.** (a) The statement is `β < ω₁ → ∃ c ∈ K, β < scottHeight …`: the code lies above
     `β`, not below. (b) README line 339 titles the layer "Isomorphism relations of classes and two
     reducibilities".
   - **Repair.** (a) "for every countable ordinal `β` some code of the class has Scott height greater
     than `β`". (b) Use the README title in the section comment.

5. **F05** (P3) the reference to Paolini–Shelah does not say which numbering is cited

   - **Location.** README lines 1370–1371: "Ann. of Math. 199 (2024); arXiv:2102.12371."
   - **Claim.** Definition 1.2–1.6, Remark 1.5, Fact 1.7 and "Main Theorem" are locators into this
     reference.
   - **Witness.** `sources.toml`, entry `paolini-shelah-tfab`, `version_note`: the numbering was read
     from arXiv v6 and not compared with the Annals version (which I could not read either).
   - **Repair.** Write the reference as "arXiv:2102.12371v6, whose numbering is cited; published in
     Ann. of Math. 199 (2024)".

Five findings, all P3 (none blocking). No false, vacuous or unowned statement was found; the
elaboration passes with `sorry` as the only warning; every cited library name exists at the pins;
every cross-roadmap citation resolves. The findings are one padding declaration, one needless
hypothesis, one coarse `*Needs:*` line, two docstring slips and one reference note.

## Verified sound

**Elaboration.** `lake env lean` on `Suggested.lean` from the content checkout: 16 warnings, all
"declaration uses `sorry`", no error. No `set_option`, no sorry'd data (7 definitions, all with real
bodies), `theorem` only, one `import Mathlib` followed by five `TauCeti.*` modules, each used
(`isoSetoid`, `IsSimpleGraph`, `eZero`, `scottHeight`, the topology of `Equiv.Perm`).

**Binders.** The elaborated types of all 23 declarations (the worker's `#check` listing) compared
with the README statements: no lost binder; generality agrees (R02 aside, where both README and
Lean carry the needless hypothesis).

**Names at the pins.** A scratch file with `#check` for 158 Mathlib and Tau Ceti names (plus seven instance tests) cited in the
README (every name of the supplier contracts) elaborated; all resolve
(`eval_encodeVia`, `toStructure_encodeVia`, `encodeVia_trans` in
`TauCeti/ModelTheory/RelationalConfiguration/Structure.lean` lines 98, 106, 126; the five
`onConfiguration` lemmas in `…/LanguageMap.lean` lines 200–240; `sameAtomicType_order_iff` in
`TauCeti/ModelTheory/BackAndForth/DiscreteOrder.lean` line 86, built with the targeted
`lake build` of that module). Confirmed absent, as the README says:
`MeasurableSpace (Equiv.Perm ℕ)` and `ContinuousSMul (Equiv.Perm ℕ) (RelationalConfiguration L ℕ)`
both fail to synthesize at the pins. Signatures relied on: `restrict : (V → W) → RC L W → RC L V`;
`perm_smul_def : σ • c = restrict ⇑σ⁻¹ c`; `BFEquiv.add_one` (previous level kept, one-element
forth and back); `nonempty_equiv_of_bfEquiv_of_scottHeight_le` (`scottHeight M ≤ β`, both
countable); `measurableSet_setOf_bfEquivSetoid` (`α < Ordinal.omega 1`);
`AnalyticSet.preimage` (continuous `f`, Polish source: the README's refinement route in 0.2 is
needed); `model_graphAxioms_iff` (`Fin.snoc xs y`, matching the README's `Fin.init`/`Fin.last`).

**Padding probe.** All 16 sorried theorems tried with
`rfl | infer_instance | simp | simp [defs] | trivial | aesop`: none closes. Targeted `exact`
probes: only R01 closes. `borelComplete_linearOrderClass` from the continuous reduction and
`mk_quotient_classIso_of_borelComplete` need several steps and are not padding.

**Headlines.** Summary headlines: graphs, linear orders (with the continuous reduction), trees;
the universal embedding; the characterisations (five conditions, four `iff`s); ordinal multiples;
not Borel; unbounded Scott height; above E₀; continuum many classes; not smooth; the obstruction.
Each is stated; the docstring names none as not statable, correctly.

**Adversarial table** (sampled targets, headlines, targets of findings).

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 0.2 set reducibility, empty/full targets | `X = Unit, Y = Empty, A = ∅`; `X = Y = Empty` | no map `Unit → Empty`; empty map works | clause `IsEmpty X ∨ Nonempty Y` needed and present |
| 0.2 converse fails | `eZero` vs diagonal | two-valued map `(0,0)`/`(0,1)` has preimage of diagonal = graph; `not_isSmooth_eZero` | holds |
| 1.1 relabelling direction | `Fin 3`, `e = (0 1 2)`, `P = {0}` | `restrict e.symm`: true at `w` iff `e.symm w = 0` iff `w = 1`; `restrict e`: `w = 2` | `P = {1}`; Check correct; `α = β = ℕ` gives `σ • c` |
| 1.1 `Fin 0` | no nullary / one nullary symbol | 1 code / 2 codes, 1 / 2 classes | Check correct |
| 1.2 `BorelComplete` | `K = ∅`; one unary predicate; Cantor family of `P_i ∈ {∅, ℕ}` | no map into `∅`; `ℵ₀` classes vs `𝔠` | both fail, as stated |
| 1.3 graph-code map | constant symbol, value `n → ∞` | unary graph relation `{n} → ∅` pointwise | range not closed; `Fin.snoc` convention agrees with pin |
| 2.1 incidence graph | binary `R = {(0,1)}`; nullary symbol; two unary symbols uncoloured | tuple vertex degrees 3 and 2; colours `0, 1, 2+2j, 3+2ι(R)` disjoint (even ≥ 2 / odd ≥ 3); `P₁ = {0}` vs `P₂ = {0}` uncoloured-isomorphic | recovered `σ` satisfies `d = σ • c` under `eval_perm_smul` |
| 2.2 clique tags | single edge, `κ = (0, 1)`; a triangle | `2+3+4 = 9` vertices, `1+2+3+6 = 12` edges; tag 0 has `κ x + 2` triangle neighbours | holds; triangle-freeness needed |
| 2.3 graphs | `L'` empty; one-edge vs two-edge path | one code, edgeless graph; non-isomorphic | holds |
| 3.1 colouring | `3/4, 5, −1/6, 1/8008` | `2, 0, 1, 3` (`8008 = 2³·1001`) | holds; non-dense two-colouring refutes without density |
| 3.2 parent definability | `x = p ++ [r]`; `p' ≠ p`, `|p'| = |p|`, `p' < x` | `z` = prefix of `p` of length `i+1` lies in `(p', x)` with `|z| < |x|` | parent unique |
| 3.2 unravelling | edge `{0,1}`: `[1/2, 1]`, `[1, 2]`; `c` with only `adj 0 1`, `d = τ • c` | `a = (1,0)`, `(0,0)`; bits at `(1,0)`: both true | (i)⇒(ii) and BF system for (iii)⇒(i) check |
| 3.3 linear orders | blocks `ω + (χ + 2)`; root block | finite condensation classes = final parts, size `χ + 2 ≥ 2`; `ω`-parts infinite; distinct blocks at infinite distance | reduction correct on all codes |
| 3.4 trees | `χ = 0`, `χ = 1`; chains `c_n → (ℕ, ≥)` | height above `(x, some 0)`: 2, 3; limit has no least element | holds; `treeClass` not closed |
| 3.5 cover graph | star `T`, `T_n` with `0 < n < 1` | `T_n → T`; edge `0–1` in cover of `T`, in none of `T_n` | Borel, not continuous, as stated |
| 4.1 σ-algebra on `S∞` | uncountably many unary symbols | singletons not `pi`-measurable | not standard Borel; Check correct |
| 4.2 embedding | `X = ℕ`, `S_n = {n}`; one point | symbol `(1,0)` at `(a)`, `x`: `g a = 0 ∧ g x = 0` iff `x = a`; injective tuples | equivariance: `g' = g h` gives `h⁻¹ ∘ a`, matching Convention 4 |
| 4.2 packing | `m = 0, 1, 2` | `unpair 0 = (0,0)`, `unpair 1 = (0,1)`, `unpair 2 = (1,0)` (`pair 1 0 = 2`) | Checks correct; `k ≤ m` |
| Layer 5 | `K = graphClass`; `K = ∅`; one unary predicate | all hold; all fail (`X = ℕ` nonempty); `𝔠` vs `ℵ₀` classes | consistent |
| 6.1 `bfEquiv_omega0_opow_mul` | `γ = 0, 1`; `ω` vs `ω·2`, `ω + 1`; `ω²` vs `ω²·2`, `m' = ω²` | level 1: nonempty suffices; `ω ≡₂ ω·2` (`m' = ω` ↔ `m = 1`); `ω + 1`: empty upper interval; `m` with initial segment `ω` | induction step re-derived (remainder after `α + 1` is a nonzero multiple of `ω^(γ+1)`); `δ ≠ 0` needed |
| 6.2 not Borel | `β = 0` | `ω^(1+0) = ω`, `ω·2`: infinite, countable, distinct, `BFEquiv 1` | `1 + β` (not `β`) keeps the orders infinite |
| 6.2 Scott height | route | `scottHeight ≤ β` and `BFEquiv β` give iso; graph = preimage of Borel level | holds for arbitrary `K` |
| 6.3 `eZero` | `0^ω` vs `1 0^ω`; `0^ω` vs `1^ω` | `F ↦ F ∆ {0}`; finitely vs cofinitely many `P`-points | reduction correct |
| 6.4 obstruction | `ρ = 0`; `A = g '' B`, `B` non-measurable | hypothesis (a) = negation of 6.2; diagonal of `A` measurable in `A × A`, not in the square | holds; subtype reading is the right one |
| 6.5 | one unary predicate | countably many Borel classes, smooth; `eZero` not reducible (`𝔠 > ℵ₀`) | holds |

**Suppliers.** Dependency check output: `depcheck: 246 roadmaps, 2242 edges, 0 problem(s)` (no
UPWARD or CYCLE line). Resolved now: CountableStructureSpaces at its open head (a new roadmap of
another author): Layer 0 (closed range of the graph coding), Layer 1.2 (`ContinuousSMul`
instance), Layer 3 (`analytic_treeHeight_bounded`), Layer 4.1, 4.2, 4.4
(`exists_uniform_bfSeparation`, stated for an analytic set of non-isomorphic pairs, as used),
Layer 6.2 (`wellOrderClass`, strict; the three cited theorems), worked example 2 (Scott height
at most `ω`). NoncompactQuantumSymmetry at its open head: `## Layer 4: M1`, `### M1.BorelRealization`,
`exists_polishTopology_continuousSMul` with `[BorelSpace G]` and `MeasurableSMul₂`, as consumed.
On main: BorelEquivalenceRelations §5.1–§5.4; InfinitaryModelExistence 0.3 (small presentation)
and Layer 6; CountableModelCounting Layer 0 (`isoSetoidOn`, transport between presentations);
InfinitaryLogic Layer 1 (completed). The same sections exist at the open revisions of the three
roadmaps on main. No declared gaps. No forbidden supplier is cited.

**Duplication.** No roadmap on main or open states Borel completeness, the Friedman–Stanley
codings, a universal S∞-space, set reducibility, a σ-algebra on `Equiv.Perm ℕ` or back-and-forth
equivalence of ordinal multiples (searched by object). Tau Ceti's `isoSetoidOn V φ`
(`TauCeti/ModelTheory/Counting/Classes.lean`) is the restriction to the models of one sentence;
`classIso` differs as the README says. No fully qualified name of `Suggested.lean` occurs in
another roadmap. `scratch/overlaps.md` lists no shared pull request, dropped id or second copy.

Overlap check: read CountableStructureSpaces, BorelEquivalenceRelations, CountableModelCounting; restricted isomorphism: CountableModelCounting owns `isoSetoidOn` for model classes and this roadmap owns `classIso` for arbitrary sets; nothing else shared.

**Sources.** Verified at the cached texts: paolini-shelah-tfab lines 56–58, 60–68, 70–73, 83–91,
95–106, 125, 169–171; becker-kechris-bams lines 126–132, 159–164, 172–177, 247–268;
camerlo-gao-boolean lines 87–112, 257–263, 276–281, 405, 555; montalban-cst1 lines 4203–4288
and 4572–4659; montalban-cst2 lines 2322–2331, 2337–2425, 8946. Each supports the statement it is
cited for; the roadmap's own constructions (incidence graph, clique tags, `List ℚ` unravelling,
anchored embedding) are marked as such. All 11 cited works are in the manifest.

Source independence: 14 passages compared with 5 sources, none shared; largest share paolini-shelah-tfab, 13 of 51 locators; contents compared with paolini-shelah-tfab: independent (its introduction supplies definitions only; no layer follows its sections).

**Shape and style.** Seven layers, each ending with Examples and Dependencies; every definition
has at least three Checks; no LaTeX, no process words, no machine paths, no pull-request numbers
in the README or the Lean file.

**Remarks needing no change.** `universalLanguage` has no `IsRelational` or `Countable` instance
in `Suggested.lean` (instance search does not unfold the definition); no statement of the file
needs one, and the README records the property.

## Not verifiable

- friedman-stanley-1989 (Theorem 1, §2, §3, §4), gao-idst (§5.2, §13.1), becker-kechris-1996
  (§2.6–§2.7, §3.4), kechris-cdst (§16.C), hjorth-kechris-1996 (§4–§5), mekler-1981 (§2):
  recorded as uncertified; no text was read, so these locators are unchecked.
- The numbering of the Annals version of paolini-shelah-tfab (see R05).

## Source issues

- none

## For the human reviewers

- **Not tested.** `sources.toml` records the friedman-stanley-1989 and mekler-1981 locators as
  written from memory; the README attributes its three Friedman–Stanley headlines to "Theorem 1"
  and "§2" of that paper without a read text.
- **Licence.** montalban-cst1 and montalban-cst2 are author's drafts on the author's page (2019,
  2025), cited by draft line numbers; Part 2 is unpublished.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "a3acb523e2b636a8adc936a8fba60fc412458149", "job": "REV-PKG-CountableStructureSpacesPartII", "model": "fable", "worker": "chris-x82"} -->
