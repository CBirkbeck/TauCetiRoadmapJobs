# Review of CountableModelCounting (pull request #2012 at 8584c5d)

**Verdict:** needs changes

Scope: the whole folder `TauCetiRoadmap/CountableModelCounting/` at `8584c5d`, against Mathlib (`1b1ccf4`) and Tau Ceti (`2fd255d99`) at this repository's pins. The pull request changes nothing outside the folder. No finding is blocking: all six are P3, and four of them are the unrepaired remainders of the previous review.

## Status of the previous review's findings (head `e2b3953`)

| Previous | Now | Evidence at this head |
| --- | --- | --- |
| R01 countability for scattered ⇒ no Cantor antichain | repaired | `Suggested.lean:263` carries `[Countable (Σ l, L.Relations l)]`; `README.md:577` "with countably many relation symbols"; `README.md:674` "In a countable relational language" |
| R02 rank form and minimally unbounded form | repaired | `Suggested.lean:507` `vaughtConjecture_iff_forall_isIsolatingRank_bounded`, `:552` `MinimallyUnboundedOn`, `:572` the equivalence; `README.md:720`, `:762` |
| R03 invariance of the internal Scott rank | repaired | `README.md:894` and `Suggested.lean:635` `Language.Equiv.internalScottRank_eq`, used at `README.md:899` |
| R04 `set_option` | repaired | none in the file |
| R05 `letI` in signatures | repaired | `Suggested.lean:212`, `:406`, `:682` use explicit instance application |
| R06 "checkpoint" | repaired | no occurrence |
| R07 unqualified Tau Ceti names | repaired for the five names; one new hit of the same kind | R01 below |
| R08 padding | partly | R02 below |
| R09 primed duplicates | repaired | no primed target; the (E2) route is a remark at `README.md:516`, `:548` |
| R10 module docstring | partly | the Layer 4f sentence and the docstring of `ConcentratedAtBFLevels.bfScattered` are there; the form is not: R03 below |
| R11 (S4) hypothesis | repaired | `README.md:281–282` |
| R12 attributions | (a), (b) repaired; (c) partly | R05 below. The README's date for the Baldwin–Friedman–Koerwien–Laskowski preprint, 17 September 2014, is the one printed on it (BFKL-red-herrings line 14); the previous review's "28 August" was wrong |
| R13 pull-request numbers, LaTeX block | partly | R04 below |

## R01 (P3) — Gate `readme-ids-missing`: a Tau Ceti name written without its namespace

**Location.** `README.md:269`: "which follows from Tau Ceti's `Language.Equiv.mem_modelsOf_iff` (invariance across carriers)".

**Claim.** The gate reads a backticked `Language.Equiv.…` name as this roadmap's own (the file declares `Language.Equiv.internalScottRank_eq`), and `Suggested.lean` does not mention it.

**Witness.** The declaration is `FirstOrder.Language.Equiv.mem_modelsOf_iff`, `TauCeti/ModelTheory/RelationalConfiguration/ModelsOf.lean:186` at the pin.

**Repair.** Write `FirstOrder.Language.Equiv.mem_modelsOf_iff`. Tested: with that one edit the gate's `readme_identifiers_missing` returns nothing against the file at this head.

## R02 (P3) — Padding left in `Suggested.lean`

**Location and witness.** Each of these is proved in the file, from the pinned library alone:

- **Restatements of pinned theorems.**
  - `encodeVia_mem_modelsOf` (line 69) and `measurableSet_isoSetoid_fin` (line 76): one term each. `README.md:210–213` itself says they are `Equiv.realize_encodeVia` with `RelationalConfiguration.mem_modelsOf`, and `RelationalConfiguration.measurableSet_setOf_isoSetoid`.
  - `mk_isoClasses_le_aleph_one_of_countable_levels` (line 169), `IsIsolatingRank.countable_isoClasses_iff_bounded` (line 278), `IsIsolatingRank.mk_isoClasses_eq_aleph_one` (line 287): the Tau Ceti theorems of the same names (`Counting/Stratification.lean:258`, `Counting/Scattered/Basic.lean:155`, `:146`) composed with `Setoid.comapQuotientEquiv`.
- **One step from the library.**
  - `countable_quotient_isoSetoidOn_iff` (line 603) is `Setoid.countable_quotient_comap_val_iff` (`TauCeti/Data/Setoid/Countable.lean:34`).
  - `VaughtConjecture.cardinal` (line 449) is `imp_right` of `HasPerfectlyManyCountableModels.countableModelCount_eq`.
- **The Layer 0 acceptance check mirrored.** The `UnaryPredicates` block, lines 102–139, three admitted statements about one example (the last without a docstring).
- **Unfolding lemmas of `morleyCode`.** `morleyCode_inl`, `morleyCode_inr_eq_true_iff`, `morleyBase_morleyCode`, `morleyCode_injective`, `toStructure_morleyCode` (lines 351–384) and `isoSetoid_morleyCode_iff` (line 394), which is `nonempty_morleyEquiv_iff` after decoding.

**Repair.** Delete them from `Suggested.lean`; the README keeps every statement. With them go:

- the private helpers `countable_relations` and `quotientComapEquivImage`;
- the Layer 1 section, which states nothing else;
- the import `TauCeti.ModelTheory.Counting.LanguageEquiv`, which no declaration uses.

In the README:

- state in prose the names the file no longer declares: `hasPerfectSetOfNonisoModelsOn_fin_one_unaryPredicates` (line 921), `morleyBase_morleyCode` (line 653), and, once the remaining docstrings stop citing them, `morleyCode_injective`, `morleyCode_inl` and `morleyCode_inr_eq_true_iff` (lines 650–653);
- replace "The targets, all stated in `Suggested.lean`" (line 646) and "restating a few of them in the form used here" (line 194).

Tested on a copy with exactly these deletions: it elaborates with 33 `sorry` warnings and nothing else, and the gate's identifier scanner then reports exactly the names listed above. A one-tactic probe (`rfl`, `simp`, `infer_instance`, `simp` with the roadmap's definitions unfolded) on the 33 remaining admitted theorems closes none of them.

## R03 (P3) — The module docstring is not in the "target signatures" form

**Location.** `Suggested.lean:17–30`: the title ends "suggested signatures"; the text says the file "is **not exhaustive**: it records suggested Lean `sorry`-forms (allowed in this human-owned roadmap library) for *particular* milestones" and "Names and namespaces are provisional".

**Claim.** The file is the roadmap's acceptance test: its docstring says that it states the headline theorems against the pinned APIs, and which are not statable.

**Witness.** The previous review's R10 asked for the retitle and that sentence; only the Layer 4f sentence was added.

**Repair.** Title "…: target signatures". Replace lines 19–30 by: "`README.md` is the roadmap; this file is not. It states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`. Layer 1's headlines and most of Layer 0's are implemented in Tau Ceti and cited in the README." Keep lines 32–33. Tested: the retitled copy elaborates.

## R04 (P3) — Pull-request numbers as roadmap citations, and a LaTeX display block

**Location.** `README.md:29`, `:253` (`[#1316](…/pull/1316)`), `:78` (`[#1319](…/pull/1319)`); `README.md:14–18`, a `math` fence containing `\#\{\text{…}\}`, `\le`, `\aleph_1`, `\quad`.

**Witness.** The previous review's R13. The merged suppliers are now cited by name; the two open ones and the display are unchanged. The pull request description already names #1316 in its `depends-on` block, which is where the number belongs.

**Repair.** Cite CountableStructureSpaces and HanfNumbers by name only. Replace the display by an indented line: `#{countable models of φ}/≅ ≤ ℵ₁   or   φ has a perfect set of pairwise non-isomorphic countable models`.

## R05 (P3) — The Harnik–Makkai reduction has no locator into Harnik–Makkai

**Location.** `README.md:819–821`: "some `Θ ⊓ θ` has minimally uncountable models (the minimal counterexamples of Harnik and Makkai; Montalbán's Theorem XII.7 is the minimally unbounded form)".

**Claim.** The target is the minimally *uncountable* form; its only locators are into Montalbán, who proves the minimally *unbounded* form.

**Witness.** HarnikMakkai1977 line 14–21 (p. 309): "large" is more than ℵ₀ countable models, "minimal" is large with a non-large side at every cut, and Theorem 1 strengthens every counterexample to a minimal one. That is `MinimallyUncountableOn`.

**Repair.** Write "(Harnik–Makkai, Theorem 1, p. 309; Montalbán's Theorem XII.7 is the minimally unbounded form)".

## R06 (P3) — `hasVaughtDichotomy_and_infiniteSentence_iff` carries a countability hypothesis it does not use

**Location.** `Suggested.lean:481–485`: `[L.IsRelational] [Countable (Σ l, L.Relations l)] (φ : L.Sentenceω)`.

**Claim.** Convention 1 (`README.md:82–83`) carries the countability instance "only where used"; the README states this reduction "with no hypothesis" (line 713).

**Witness.** For any relational `L`: by `realize_infiniteSentence_iff` (no hypothesis, `Infinitary/Infinite.lean:44`) the models of `φ ⊓ L.infiniteSentence` on `ℕ` are those of `φ`, and on `Fin n` there are none. So `countableModelCount = #(Quotient (isoSetoidOn ℕ φ)) + 0`, and a perfect antichain (nonempty by definition, `Antichain.lean:112`) cannot lie in an empty model class.

**Repair.** Drop the instance from this one theorem. Tested: the statement elaborates without it.

## Verified sound

**Gate.** Re-run on this head: every check passes, the build included, except `readme-ids-missing=1` (R01). `lake env lean` on `Suggested.lean`: 36 warnings, all `declaration uses 'sorry'`, no error, no other message. The description's "36 `sorry`s remain" agrees.

**Dependency check.** Output: `depcheck: 229 roadmaps, 2122 edges, 0 problem(s)`. No UPWARD or CYCLE line. The roadmap is on main. Its one supplier that is not on main, CountableStructureSpaces, is a new-folder pull request that main's README already cites and the description names; HanfNumbers is named only as a deferral.

**Signatures.** The elaborated types of all 72 declarations were compared with the README. The two "looks dropped" leads are deliberate (`IsThinOnNatModels` and `morleyBase` do not need the binder). Every admitted theorem of Layers 2–5 keeps `[Countable ((l : ℕ) × L.Relations l)]` in its elaborated type, including `…_of_internalScottRank_le`, whose statement mentions the instance nowhere. The only mismatch with the README is R06.

**Library declarations opened at the Tau Ceti pin (36).**
- Counting: `CountableModelClasses`, `countableModelCount` (`Counting/Classes.lean:129, 133`); `HasPerfectlyManyCountableModels` (`:340`, the tier `ℕ` or some `Fin n`) and its `countableModelCount_eq` (`:367`); `classOf_eq_classOf_iff`, `classOf_surjective` (`:292, 309`); `bfEquivSetoidOn` and its Borel graph (`Counting/Levels.lean:80, 110`); `lift_countableModelCount_onBoundedFormulaInf`, `exists_language_zero_countableModelCount` (`Counting/LanguageEquiv.lean:116, 145`).
- Ranks: `IsIsolatingRank` with exactly the three fields the README lists (`Counting/Stratification.lean:79`), `isolates_of_le`, `of_le`, `exists_unbounded_of_not_countable`, `exists_rank_bound_of_countable_isoClasses`, `IsIsolatingRank.exists_comap_isoSetoid_eq_bfEquivSetoid`, `isIsolatingRank_scottHeight`, `exists_isIsolatingRank` (`:112, 118, 126, 211, 224, 238, 250`); `BFScattered`, `BFScattered.mono`, `bfScattered_of_observation`, `exists_rank_bound_iff` (`Counting/Scattered/Basic.lean:79, 99, 115, 164`).
- Scott analysis: `internalScottRank`, the supremum of `orbitRank + 1` over all tuples, the empty one included (`Scott/Rank.lean:159`); `scottHeight_le_internalScottRank_add_omega0`, `scottHeight_lt_omega_one`, `nonempty_equiv_of_bfEquiv_of_scottHeight_le`, `scottHeight_eq` (`Scott/Height.lean:169, 176, 186, 241`). No `internalScottRank` invariance lemma exists at the pin, so the Layer 6 target is not a duplicate.
- Configurations: `scottSentenceAtLevel`, of type `L.Sentenceω` under countably many relation symbols, and `modelsOf_scottSentenceAtLevel` (`RelationalConfiguration/LevelSentence.lean:68, 102`); `measurableSet_setOf_bfEquivSetoid`, `exists_limit_of_bfEquiv_chain` (`BackAndForth.lean:144, 153`); `analyticSet_iUnion_smul`, `isomorphismInvariant_iff_isInvariantBlock` (`Isomorphism.lean:323, 244`); `reductConfiguration`, `onConfiguration` (`LanguageMap.lean:79, 186`).
- Descriptive set theory: `HasCantorAntichainOn`, `HasPerfectAntichainOn` (with `P.Nonempty`), `IsThinOn` (`SetTheory/Descriptive/Antichain.lean:107, 112, 116`); `hasCantorAntichainOn_iff_hasPerfectAntichainOn`, `hasCantorAntichainOn_image_iff` (`:260, 304`); the two Silver forms (`Silver.lean:153, 163`); `exists_invariant_measurableSet_separating` (`InvariantSeparation.lean:117`); `exists_countable_exceptions_of_splits` (`Data/Set/Countable.lean:53`).
- Language maps: `nonempty_morleyEquiv_iff` (`ModelExistence/Morleyization.lean:462`); `smallPresentationEquiv`, `realize_smallPresentation` (`Infinitary/SmallPresentation.lean:72, 127`); `realize_infiniteSentence_iff` (`Infinitary/Infinite.lean:44`); `Fragment.generated_countable`, `Theoryω.realize_conjunction_iff` (`Infinitary/Fragment.lean:373`, `Theory.lean:148`).

A search of the pinned Tau Ceti for Vaught's conjecture, Morley's theorem, thin sentences, sentence spectra, concentration, minimal uncountability and row assemblies finds no declaration: none of the 33 statements that stay is already proved at the pin.

**Cross-roadmap citations resolved (14).**
- CountableStructureSpaces, at the head of its pull request: `isomorphismInvariant_modelsOf` (its Layer 2), `exists_uniform_bfSeparation` (§4.4, for an analytic set of non-isomorphic pairs), `exists_sentence_separating` (§6.1), and its own list of what this roadmap consumes, which names exactly these three. (S1)–(S5) are Tau Ceti declarations, checked above.
- BorelEquivalenceRelations on main: the antichain vocabulary (its Convention 6 and Layer 0.5), `hasCantorAntichainOn_image_iff`, `exists_countable_exceptions_of_splits`, the two Silver forms (its §4.2).
- InfinitaryModelExistence on main: Layer 0.1 (language maps), Layer 0.3 (`smallPresentation`), §4.1 (`fragmentType`, `Fragment.slice`), Layer 5 (Morleyization), Layer 6 (the graph translation named under "Out of scope here").
- Overlaps: none. No open pull request changes this roadmap or drops an id it cites; this pull request drops no id that another roadmap cites.
- Ownership by object, over main and the open heads: `VaughtConjecture`, `MinimallyUncountable`, `morleyCode`, `sentenceTheory`, `ConcentratedAtBFLevels`, `RowAssembly`, `HasPerfectSetOfNonisoModelsOn` and `internalScottRank_eq` occur only in this roadmap (RandomGraphs mentions Vaught's conjecture once, as a citation).

**Sources sample.**
- Montalban-CSTpart2 (author page, compiled 22 April 2025, line 8): §XII.1 (line 9282), Morley's theorem via Silver (9286–9302), scattered (9303), Definition XII.1 (9312); §XII.2 (9352), Definition XII.4 (9359), the attribution to Harnik–Makkai and Steel (9362–9364), Lemma XII.5 (9367), Lemma XII.6 with `≡_{α_i+3}` (9376–9379), Theorem XII.7 (9426), Lemma XII.8 (9472, printed p. 220; proof on p. 221, 9480–9485). All as the README says.
- BFKL-red-herrings (Laskowski's page, dated 17 September 2014, line 14): the absolute form (lines 46–54); Theorem 3.3 on p. 12 (468–471); Lemma 3.4 on p. 13 (491–492). As the README says.
- AGHKM-scattered (Keisler's page): the three forms, trivial under CH and equivalent without it (lines 27–37, 119–127); Fact 2.2 (117–118). As the README says.
- HarnikMakkai1977 (AMS open archive): Theorem 1, p. 309 (lines 14–21).

**Adversarial pass.** Values are computed on each side.

| # | Statement | Instance(s) | Values computed | Result | Change |
| --- | --- | --- | --- | --- | --- |
| 1 | Layer 0 acceptance (`∃x∀y y=x`, unary `P_i`) | `Fin 1`, `ℕ`, `Fin 0` | codes on `Fin 1` = `ℕ → Bool`, `#Perm (Fin 1) = 1`, so 𝔠 classes; `ℕ`: 0 models; `Fin 0`: `∃x` fails, 0; count = 𝔠 | holds | Lean mirror is padding (R02) |
| 2 | `countable_or_hasPerfectSetOfNonisoModelsOn_fin` | row 1 at n = 1; `⊥` | 𝔠 classes and a perfect set; empty quotient, countable | holds | none |
| 3 | Layer 1 acceptance | K in one class | 1 class per level; bound ℵ₁ against 1 | holds | none |
| 4 | Layer 2 acceptance (E, all classes infinite) | empty model; k = 1,…,ℵ₀ classes on `ℕ` | count = 1 + ℵ₀ = ℵ₀; empty model has rank sup over the empty tuple = 1 | holds | none |
| 5 | bounded-rank dichotomy, witnessed | row 1 sentence | models on `ℕ` = ∅, bound holds with β = 0; count 𝔠 > ℵ₀; perfect set at `Fin 1` only | holds, and fails without the finite tiers | none |
| 6 | cardinal form; internal form | rank ≤ β | perfect ⇒ count = 𝔠 by Tau Ceti; height ≤ β + ω < ω₁ | holds | none |
| 7 | Layer 3 acceptance | z = (1,0,…), (0,1,0,…) | class sizes ≥ 2: {2} against {3}; one input bit per code bit | holds | none |
| 8 | `countable_bfClasses_or_hasPerfectSet` | equivalence relations, β = 0 | 1 level-0 class (no nullary symbols); both sides true | holds | none |
| 9 | Morley, both forms | pure sets; E | ℵ₀ ≤ ℵ₁; 𝔠 with the row 7 witness | holds | none |
| 10 | `not_hasCantorAntichainOn_of_bfScattered` | K one class | 1 class per level against 𝔠 needed | holds | none |
| 11 | `bfScattered_modelsOf_iff_isThinOnNatModels` | pure sets; E | 1 code class, both true; row 7 family distinct at level ω, 𝔠 classes, both false | holds | none |
| 12 | `ConcentratedAtBFLevels.bfScattered` | centre k, level β | classes ≤ 1 + ℵ₀; no countability of L used | holds | none |
| 13 | `isThin_iff_countable_sentenceSpectra` | C = ∅; E with θ n = "a class of size n + 2" | both true; `sentenceTheory θ ∘ f = id`, image 𝔠, both false | holds | none |
| 14 | 4d, one side small | centre k at the saturation level | members equivalent to k lie on one side; the other side meets ≤ ℵ₀ classes | holds | none |
| 15 | `range_morleyCode` | Φ = ∅; Φ = {⊤, arity 1} | all codes; codes with the new bit constantly true | holds | unfolding lemmas are padding (R02) |
| 16 | `not_hasVaughtDichotomy_iff` | count ℵ₀; 𝔠 with witness; ℵ₁ without | F↔F; F↔F; T↔T | holds | none |
| 17 | `not_hasVaughtCount_iff` | count = ℵ₁ = 𝔠; ℵ₁ < 𝔠 = count | F↔F (ℵ₁ < 𝔠 fails); F↔F (count ≠ ℵ₁) | holds | none |
| 18 | CH ⇒ cardinal form; ¬CH ⇒ equivalence | count ∈ (ℵ₀, ℵ₁] = {𝔠}; count = 𝔠 > ℵ₁ | cardinal Morley gives the count; witnessed Morley gives the perfect set | holds | none |
| 19 | `hasVaughtDichotomy_and_infiniteSentence_iff` | row 1 sentence; uncountable L | count(φ ⊓ inf) = 0 and no models on `ℕ`: T↔T; no step uses countability | holds for every relational L | R06 |
| 20 | `vaughtConjecture_iff_bfScattered` | both directions | →: apply to φ ⊓ inf, scattered excludes the perfect side. ←: finite tiers by row 2, then thin ⇒ scattered ⇒ countable; total ≤ ℵ₀ + ℵ₀·ℵ₀ | holds | none |
| 21 | rank form | ρ = Scott height | →: countable ⇒ bounded, strict bound β + 1 < ω₁. ←: thin ⇒ bounded ⇒ row 5 | holds | none |
| 22 | `vaughtConjecture_iff_forall_universe` | `Language.{u, v}` | ≤ ℵ₀ is stable under `Cardinal.lift`; perfect sets move along the homeomorphism | holds | none |
| 23 | `VaughtConjecture.firstOrder` | infinite sets; a theory with only a finite model | 1 class; `modelsOfTheory` empty on `ℕ`, countable | holds; completeness unused, as the README says | none |
| 24 | `minimallyUncountableOn_modelsOf_iff` | `⊤` in pure sets; E | 1 class, both false; "a class of size 2" splits row 7's family into two uncountable halves, and no centre at level ω, both false | holds | none |
| 25 | the minimally unbounded form | scattered K | countable ⇔ bounded on K, K ∩ θ, K ∖ θ by `mono` | holds | none |
| 26 | `exists_bfLevel_saturated_modelsOf` | θ = ⊤; θ = ∃x∃y x ≠ y | β₀ = 0; β₀ = 2 | holds | none |
| 27 | splitting tree and reduction | X, Y first differing at i | chain `A_{X↾(i+1)}` with levels α_i, links at α_{i+1} ≥ α_i + ω; `A_X ~ A_{X↾(i+2)} ~ A_{X↾(i+1)}` at α_{i+1}; siblings inequivalent there; 𝔠 classes at sup α_i < ω₁ | holds | locator (R05) |
| 28 | `vaughtConjecture_iff_forall_not_minimallyUncountableOn` | both directions | →: φ ⊓ inf has uncountably many, thin, no finite models. ←: rows 20 and 27 | holds | none |
| 29 | Layer 6 path `π_z` | z = (1,0,…); z = 0 | 0,1,1,1,2,2,…; 0,0,1,1,2,2,…; π(i) ≤ i, nondecreasing, differ at index 1 | holds | none |
| 30 | `internalScottRank M = ω` | rows [0..k], [0..k,k]; an arbitrary row q against p | fibres at [0..k,k]: `ℕ` against `Fin (k+1)`, equivalent at level k, not in bijection, so orbit rank ≥ k + 1 and the supremum is ≥ ω; first label separating q from p has last entry ≤ length of p, so fibre ≤ length + 1 against `ℕ`: finite orbit ranks | holds | none |
| 31 | `N_z ≡_ω M`; non-isomorphism | level m | path fibres from position 2m on have ≥ m + 1 elements, `≡_m ℕ`; the shift moves `π_z↾j` to `π_z↾(j+1)`, differing in one such fibre; the path row has infinitely many finite fibres, a finite row finitely many | holds | none |
| 32 | `ω < scottHeight M ≤ ω + ω`; not isolating | code of M, one `N_z` | height ≤ ω would give `N_z ≅ M`; ρ(code of M) = ω needs `internalScottRank_eq` | holds | none |

## Not verifiable

None of these texts could be read legally here, so their locators were not checked:
- Steel 1978 (Lecture Notes in Mathematics 689, Springer, paywalled). Montalban-CSTpart2 line 9364 cites its Theorem 1.5.11 for the same reduction.
- Morley 1970 and Vaught 1961: paywalled; cited without a theorem number.
- Marker 2016 (pp. 29–38, 83–96), Becker–Kechris 1996 (pp. 82–97), Gao 2009, Kechris 1995 (§31), Silver 1980, López-Escobar 1965: not in the sample, not fetched.

## Source issues

- **Gap** in Montalban-CSTpart2 at Lemma XII.8, printed pp. 220–221: the source says minimal unboundedness suffices, but the proof takes an unbounded class from countably many ≡β-classes; it should assume Θ scattered, as in Theorem XII.7's setting; affects the proof.
- **Error** in AGHKM-scattered at Fact 2.2, footnote 2, p. 3: the source says BFKL's Lemma 3.4 passes from Morley-scattered to having no perfect set; it should say the converse (no perfect set gives countably many fragment types); affects nothing.
- **Gap** in BFKL-red-herrings at the introduction, p. 2: the source infers "no perfect set of models" from "at most ℵ₁ models"; under CH that inference fails, and it needs their Theorem 3.3; affects nothing.
