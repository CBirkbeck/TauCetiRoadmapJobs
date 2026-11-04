# Review of InfinitaryModelExistence (pull request #1615 at f696fb3)

**Verdict:** needs changes

🤖 Independent AI review. Nine findings, including two P2 blockers. This is a full-folder review, including unchanged statements. The revision develops the existing roadmap rather than replacing its scope; rejection is not warranted. The supplied gate fails, although direct Lean elaboration succeeds.

## R01 (P2) — State acceptance targets against the pinned libraries

**Location:** `TauCetiRoadmap/InfinitaryModelExistence/Suggested.lean:2`, “import TauCetiRoadmap.InfinitaryLogic.Suggested”; also lines 17–23 and `TauCetiRoadmap/InfinitaryModelExistence/README.md:113`.

**Claim:** The file tests the infinitary headline theorems against an imported roadmap prototype, described as mirroring an available Tau Ceti implementation.

**Witness:** At Tau Ceti `a91d3aa`, `TauCeti/ModelTheory/` contains only `Algebra/OrderedRing/MvPolynomial.lean`. Neither pinned library declares `BoundedFormulaInf`. The printed signatures instead use `TauCetiRoadmap.InfinitaryLogic.BoundedFormulaInf`.

**Repair:** Remove the roadmap import and declarations depending on its prototype carriers from the acceptance file. Keep their mathematical specifications in the README. Name each unavailable infinitary headline and its missing carrier in the module docstring, using the required “target signatures” form. Cite `Completed/InfinitaryLogic/README.md`, Layer 0, as the owner of the future syntax, rather than asserting it exists at these pins. Do not duplicate the syntax or change pins. Retain native, statable headlines, including R02. This directly removes the offending import; the independently elaborated native signature described in R02 demonstrates that a meaningful acceptance test remains possible.

The gate's `imports=1` failure is included here. This is more than import style: the headline statements currently depend on a prohibited substitute for a missing native carrier.

## R02 (P2) — Include the native first-order omitting-types theorem

**Location:** `TauCetiRoadmap/InfinitaryModelExistence/README.md:532`, “the **first-order omitting types theorem**”; `TauCetiRoadmap/InfinitaryModelExistence/Suggested.lean:513` and 581.

**Claim:** The finished roadmap proves first-order omitting types, but the acceptance file states only the infinitary version; `OmitsFOType` is used for the presentation theorem.

**Witness:** Pinned `Mathlib/ModelTheory/Syntax.lean:471` supplies `BoundedFormula.exs`; `Satisfiability.lean:65` and 278 supply satisfiability and entailment. A native first-order omitting-types signature elaborated with only `import Mathlib` and one `sorry` warning.

**Repair:** State the first-order theorem explicitly for a countable language, satisfiable theory, and countable family of finite-arity partial types, none isolated by a consistent first-order formula. Isolation requires only a short predicate on native bounded formulas: some φ has `insert φ.exs T` satisfiable and `T ⊨ᵇ φ.imp ψ` for every ψ in the type. Conclude a countable nonempty model of T omitting every type, in an arbitrary model universe. Keep all hypotheses in the signature. The probe included this exact statement. As a negative control, the empty type over a satisfiable theory is isolated by truth and must be excluded: every tuple realizes it.

## R03 (P3) — Remove the option override

**Location:** `TauCetiRoadmap/InfinitaryModelExistence/Suggested.lean:26`, “set_option autoImplicit false”.

**Claim:** The acceptance file sets an option.

**Witness:** The gate reports `set_option=1` at line 26. This rule forbids every option override, including this one.

**Repair:** Delete the command. Keep explicit binders in every retained signature. The native first-order probe uses no option override and elaborates successfully.

## R04 (P3) — Remove unsupported declaration-name claims

**Location:** `TauCetiRoadmap/InfinitaryModelExistence/README.md:190`, “functionsIn_countable”; also §§2.2, 2.4–2.5, 5.1, 6, 7.3 and Layer 8.

**Claim:** Backticked identifiers are presented as this file's declarations despite not being declared there.

**Witness:** The gate reports `readme-ids-missing=15`; for example, `functionsIn_countable` is absent while `relationsIn_countable` is declared at `Suggested.lean:90`.

**Repair:** Express API items and Checks in prose, retaining names only for declarations actually kept in the acceptance file. Do not add API padding to satisfy the scanner. Apply this to all 15 reported names: `OmitsType.of_aElementary`, `RelChain.injective_of_irreflexive`, `aElementary_directLimit_of`, `aElementary_inclusion_iSup`, `aElementary_of_cocone`, `aElementary_of_tarskiVaught`, `entails_graphTranslation`, `entails_iff_graphTranslation`, `functionsIn_countable`, `realize_conjunction_iff`, `realize_mono_of_signed`, `realize_relationalize`, `realize_relationalize_reconstruct`, `realize_toInf`, and `realize_unMorleyize`. For imported facts such as the finitary translation law, put the exact supplier citation in the supplier contracts instead. The function-occurrence assertion remains mathematically meaningful after removing its purported Lean identifier.

## R05 (P3) — Supply the required local Checks and dependencies

**Location:** `TauCetiRoadmap/InfinitaryModelExistence/README.md:184`, “### 0.2 Occurrences and symbol locality”; the issue recurs through Layers 0–8.

**Claim:** Definitions have API lists, but the document substitutes occasional layer-level acceptance examples for three discriminating Checks per definition and target-specific dependencies.

**Witness:** The README has no `**Checks.**` block and no `*Needs:*` line. Section 0.2 defines three occurrence operations and constant support without three tests for any of them.

**Repair:** Preserve the API while adding at least three discriminating Checks to each definition and explicit statement/proof-route dependencies to each target. For occurrences, test a variable equality (no symbols), `R(f(x))` (one function and one relation), and a conjunction of distinct predicates indexed by ℕ (infinitely many symbols). These give respectively `(∅,∅)`, `({f},{R})`, and `(∅,{Rₙ : n∈ℕ})`, excluding both a Finset implementation and counting equality as a relation. Use the mandated Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, and layer-ending Examples/Dependencies headings. Resolve the parent's moved link to `Completed/InfinitaryLogic/README.md`.

## R06 (P3) — Give exact, version-specific source locators

**Location:** `TauCetiRoadmap/InfinitaryModelExistence/README.md:437`, “### 3.2 Model existence”; also §§0.2, 0.4, 1.1, 2.1–2.5, 4.1–4.2, 5.1–5.2 and 7.2.

**Claim:** Most sampled statements have no local source locator, or only a whole-chapter reference. The folder has no `sources.toml`.

**Witness:** Published Marker Theorem 1.1.9 is on pp. 11–12 (`marker2016` publisher-excerpt line 242); the author notes number it 1.23, p. 10 (`marker2016` draft line 303). Those versions cannot share unqualified theorem numbers.

**Repair:** Record each cited work once in `sources.toml`, with legal retrieval metadata and version notes, and attach precise theorem/section and printed-page locators to the targets. For derived extensions, distinguish the source theorem from the adaptation: directed cocones versus chains, component fragments versus Marker's formation-closed fragments, arbitrary base languages versus his countable-vocabulary presentation. The source table below supplies verified locators and explicitly marks what remains uncertified. Do not invent locators for the signature-calculus API or certify published Chapter 4 from differently numbered draft notes.

## R07 (P3) — Replace the TeX display

**Location:** `TauCetiRoadmap/InfinitaryModelExistence/README.md:346`, the cardinality-bound display.

**Claim:** A `math` fence contains TeX control sequences.

**Witness:** The gate reports `tex=1` on the display's `\le`, `\max`, `\aleph_0` and related commands.

**Repair:** Write the same bound in Unicode or an ordinary code span: `|N| ≤ max(ℵ₀, |X|, |A|, |Σ n, L.Functions n|)`. Preserve the following universe-lift explanation. For a singleton seed in an empty language this gives `1 ≤ ℵ₀`, unchanged from the intended bound.

## R08 (P3) — Remove process narrative and pull-request references

**Location:** `TauCetiRoadmap/InfinitaryModelExistence/README.md:988` and 1032, “checkpoint”; also lines 153–160 and 953–982.

**Claim:** The roadmap describes revision synchronization and open pull requests as part of its timeless specification.

**Witness:** The gate reports both `residue` failures. Lines 153–160 discuss prototype copies and propagating revisions; line 953 names a sibling by pull-request number.

**Repair:** Remove the process narrative and pull-request numbers. Keep provenance as an immutable source revision, and cite supplier roadmaps by name and section. Keep mathematical ownership explicit. Both reported “checkpoint” occurrences disappear; the source revision and mathematical contracts remain identifiable without workflow history.

## R09 (P3) — Delete definitional API padding from the acceptance file

**Location:** `TauCetiRoadmap/InfinitaryModelExistence/Suggested.lean:493`, `AElementary.fragmentType_comp`, and line 646, `relSym_inter`.

**Claim:** These are acceptance milestones, although they simply unpack the definitions of truth preservation and membership in the tagged union of symbols.

**Witness:** The first closes with `exact Set.ext (fun φ => and_congr_right (fun h => hf ⟨n, φ⟩ h a))`. The second reduces to membership conjunction in each of its two constructors. Both replacements elaborated successfully.

**Repair:** Delete them from `Suggested.lean`; retain the facts as README API targets. For a singleton fragment `{R(x)}`, both sides of type preservation contain R exactly when R(a) is true. For a graph symbol f in both function sets, both sides of the intersection identity are true; removing f from one side makes both false. Neither statement tests a deep theorem.

## Verified sound

The checks below are finite-instance and definition audits, not substitutes for proofs of the admitted theorems. No mathematical counterexample to a headline was found. Source uncertainty is separated below. The passing elaboration does not remove R01 or establish truth.

The head is `f696fb373ef1fd156b5fb3e7b9648625d8ed1000`. Only the two reviewed files differ in this PR: README +82/−17 lines and Suggested +11/−5. The outside-folder diff is empty; the worktree stayed unchanged. The gate's build result is passing, and direct `lake env lean` also returned exit 0 with precisely 34 `sorry` warnings. No sorry'd data, admitted examples, free placeholder predicates, algorithmic deliverables or route-specific mathematical restrictions were found. The Malitz relational restriction is supported by the cited formulation rather than an arbitrary shortcut.

The dependency check returned exactly:

```text
depcheck: 205 roadmaps, 1498 edges, 0 problem(s)
```

There is no UPWARD or CYCLE result. This roadmap is already on content main; this PR revises its route rather than re-planning its mathematical area. No declared gaps were supplied. There are zero `*Needs:*` lines to inspect; the table and prose specify Layer 0 → 1, independent 2 and 3, then 4, 5, 6, and independent 7/8. In particular, Layers 7 and 8 do use Layer 2 for universe transport, as line 71 explains. No upward supplier was inferred from a downstream-consumer citation.

### Headline coverage and elaborated types

The README's deep targets are model existence; model existence with omission requests; fragment and first-order omitting types; fragment and sentence Löwenheim–Skolem; first-order presentation by omitted types; Craig interpolation and PC separation; Lyndon and Malitz interpolation; the rational-chain theorem; well-founded/order-type boundedness; and undefinability of well-ordering. With the present pins, the first-order omitting-types endpoint is natively statable and missing (R02). The others use missing infinitary carriers and must be identified as unavailable in the docstring, rather than importing the parent prototype (R01). The README's well-founded boundedness corollary is also absent from the file/docstring's inventory.

A scratch copy appended `#check @name` for all **86 declarations** (definitions, structures, inductives, instances and theorems); it elaborated successfully. The printed types retain the hypotheses on countability, formation closure, satisfiability, isolation, relationality and expansion used by their statements. No hypothesis-loss defect was found. `model_existence` has no explicit `Nonempty M` conjunct, but its `L[[ℕ]].Structure M` already interprets constant 0, so this is not an empty-model loophole. The universe parameter in `HasWellOrderedChains` survives. No reviewed source file was changed.

All **34 admissions** received a one-tactic `simp_all` probe; none closed by that tactic alone. Three targeted follow-ups tested the small-presentation realization law, fragment-type transport and the graph-symbol intersection. The direct `exact` attempt for small-presentation transport lacked an expansion instance and was not counted as successful. A final scratch copy proved the two R09 declarations (32 admissions remaining) and elaborated successfully. The intersection proof is a definitional case split, rather than a one-tactic proof. R09 rests on the explicit rule against restating definitions as well as the successful probe.

### Pinned library and ownership audit

Pins checked from the manifest and the package checkouts: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

Opened the following native definitions/results at those pins:

- `Mathlib/ModelTheory/Bundled.lean:73`: `Theory.ModelType` includes `Nonempty`; `Satisfiability.lean:65`, 278, 289 and 296: `Theory.IsSatisfiable`, `ModelsBoundedFormula`, `models_sentence_iff`, and `models_iff_not_satisfiable`. ModelsBoundedFormula includes the free-variable universe; its sentence specialization is the universe claimed by this roadmap.
- `Mathlib/ModelTheory/Syntax.lean:116`, 246, 466, 471, 597, 602, 607, 620 and 628: term relabel/substitution, `alls`/`exs`, bounded-formula substitution, constants/variables equivalence, conversion to a formula, and the **finite-indexed** `iSup`/`iInf`. The latter do not provide countable infinitary syntax.
- `Mathlib/ModelTheory/LanguageMap.lean:84`, 89, 140, 180, 187 and 201: sum inclusions/elimination, injectivity, `defaultExpansion`, and `IsExpansionOn`; lines 330, 382 and 404: `constantsOn`, `withConstants`, `con`. `defaultExpansion` needs an inhabited carrier and classical range decisions; nonemptiness in the roadmap allows choosing the inhabitant. `IsExpansionOn` itself does not assert nonemptiness or injectivity.
- `Mathlib/ModelTheory/Substructures.lean:231`, 284, 288 and 293: closure, representation by terms and lifted cardinal bounds. An empty relational substructure is permitted. `Skolem.lean:126` supplies the first-order cardinal-equality theorem with an infinite cardinal and both lower and upper size bounds; the roadmap's fragment theorem is a genuinely different target.
- `Mathlib/ModelTheory/DirectLimit.lean:154`, 250 and 268: the quotient carrier, finite tuples coming from a common component, and component embeddings. These provide the finitary tuple step needed by the proposed directed-cocone induction.
- `Mathlib/SetTheory/Cardinal/Regular.lean:90`: `Cardinal.isRegular_aleph_one`, supporting the countable-choice-of-disjunct argument.

Object searches covered both pinned ModelTheory trees, the content tree, board package READMEs/plans, and the open-roadmap index via `roadmaps grep` (syntax, bound substitution, occurrences, consistency properties, fragment elementarity, Morleyization, PC membership, chains and model existence). The package search returned no additional owner. No pinned infinitary carrier or duplicate infinitary development was found. The inherited parent syntax remains owned by InfinitaryLogic, not this roadmap.

Read three main roadmaps for shape/context: `Completed/InfinitaryLogic/README.md`, `TauCetiRoadmap/CountableModelCounting/README.md`, and `TauCetiRoadmap/BorelEquivalenceRelations/README.md`. Resolved the parent supply against its completed main location: Layer 0 owns syntax, operations and semantics; Layers 1–3 own back-and-forth and Scott analysis; line 686 explicitly leaves model existence and fragment Löwenheim–Skolem to other roadmaps. The CountableModelCounting main roadmap's dependency section and scope (lines 27–35 and 66–75) assign fragments and Morleyization to this roadmap; its prototype declarations are under `TauCetiRoadmap.CountableModelCounting`, not the reviewed namespace. BorelEquivalenceRelations explicitly has no model-theoretic supplier dependency (lines 48–50). Thus this folder remains the owner of its model-existence, presentation and interpolation developments.

The search index also returned CountableStructureSpaces and HanfNumbers as consumers of these objects. Their full open heads were not among the sibling file paths supplied in this brief, so those heads were not independently opened; their index hits are not certification of their full contracts. No new owner was found among the supplied open-work paths/index search. Claims about propagating prototype changes to those consumers were not verified.

### Seeded source sample

Legal texts read: [marker2016 author draft](https://homepages.math.uic.edu/~marker/math512-F13/inf.pdf), [marker2016 publisher excerpt](https://assets.cambridge.org/97811071/81939/excerpt/9781107181939_excerpt.pdf), [lopez1965 institutional scan](https://matwbn.icm.edu.pl/ksiazki/fm/fm57/fm57119.pdf), and [htk2024 author version](https://homepages.math.uic.edu/~mht/papers/expressive-efficiency.pdf).

All **15 requested sections** were examined. None is explicitly labelled unverified in the README. Three works were read in legal full texts, with an additional published excerpt for Marker. Source line numbers below refer to the service extractions. `marker2016 (draft)` is the author-hosted course text, whose numbering differs from the book; `marker2016 (publisher excerpt)` is the actual published text. These are two versions of one work, not two proposed manifest keys.

| Sample | Exact text examined | Support and limits |
| --- | --- | --- |
| 0.2 Occurrences and symbol locality | No local locator exists. Syntax/semantics and the explicit recursive bodies were examined. | The induction is mathematically sound on the tested cases; no source theorem/page can be certified for this API as written. R06. |
| 0.4 Bound substitution/constants as variables | No local locator exists; pinned `Syntax.lean:246`, 602, 607. | Native finite-formula analogues support the design, not a claim that the infinitary operations already exist. R06. |
| 1.1 Theories and entailment | Pinned `Satisfiability.lean:65`, 278, 296; draft Marker pp. 5–7 discusses the semantics and noncompactness. | Native analogy and nonempty convention confirmed; no precise book locator supplied. |
| 2.1 A-elementarity | `marker2016` publisher-excerpt line 240, p. 11; draft line 298, p. 9. | Relative truth agreement is the intended notion. The roadmap deliberately weakens the closure requirements on A. |
| 2.2 Tarski–Vaught/witness hull | `marker2016` publisher-excerpt lines 242–265: Theorem 1.1.9, pp. 11–12, Exercise 1.1.10, p. 12. | Skolem witnesses yield elementarity. Counterexample selection for universal formulas and the separate function-symbol bound are adaptations, not verbatim source statements. |
| 2.4 Unions/limits | `marker2016` publisher-excerpt lines 295–297: Exercise 1.1.14, p. 13. | Source states linearly ordered elementary chains. Directed systems and arbitrary covering cocones require the finite-tuple induction supplied by the roadmap and native DirectLimit API. |
| 2.5 Sentence consequences | `marker2016` publisher-excerpt lines 242–255: Theorem 1.1.9, pp. 11–12. | Gives the countable model over the relevant countable vocabulary. Universe transport and expansion back to an arbitrary language are additional arguments; choice of a seed element is necessary. |
| 3.1 Consistency property | `marker2016` draft lines 1284–1319: Definition 4.1 and Exercise 4.4, pp. 39–40. | Countable vocabulary, infinitely many constants, decomposition and equality clauses confirmed. Downward closure can be added; chain closure and a global decision clause are not required. Implication syntax/atomic equality substitution are adaptations. Published Chapter 4 not certified. |
| 3.2 Model existence | `marker2016` draft lines 1320–1422: Theorem 4.6, pp. 40–43. | Countable named quotient, fair enumeration and term evaluation verified. The simultaneous positive/negative induction is an appropriate adaptation. Omission requests are an added scheduling argument. |
| 4.1 Types | Definition bodies; draft Marker §4.2, pp. 44–47, discusses fragment types and isolation. | The particular complete-realized-type separator theorem has no local locator. Independently checked by choosing a distinguishing formula for each other realized type; this is isolation among realized types, not isolation over an arbitrary theory. |
| 4.2 Omitting types | `marker2016` draft lines 1436–1492: Theorem 4.9 and Exercise 4.11, pp. 44–45. | Countable fragment, satisfiable T, finite tuples and the non-isolation/refutation condition agree. The roadmap's repeated-constant equality constraints are necessary. Its weaker formation closure is justified by the explicit renaming argument, not automatically by citing Marker. |
| 5.1 Definitional expansion | `marker2016` publisher-excerpt lines 316–328, Theorem 1.2.1 proof, p. 13, and lines 341–347, Exercise 1.2.2, p. 14. | Symbols Rφ and the canonical interpretation are present. Uniqueness, arbitrary Φ, embedding transport and back-substitution are API extensions. |
| 5.2 First-order presentation | Same published theorem, pp. 13–14; draft Theorem 1.31, pp. 11–12, lines 356–393. | Both omitted-type polarities agree exactly. The roadmap correctly avoids the source's extra universal quantifier noted below. Its uncountable-base-language variant keeps A countable in the Lean theorem. |
| 7.2 Craig/PC separation | `lopez1965` lines 418–429: Theorem 4.1, printed p. 267 (OCR of facing pages); `marker2016` draft lines 1602–1674: Theorem 4.21/Corollary 4.23, pp. 48–50. | Shared vocabulary, entailment directions and disjoint reduct-class separation confirmed. Countable-disjointness suffices by downward LS. Equality's source restriction is explicitly excluded from the roadmap's Lyndon variant. |
| 7.4 Malitz | `htk2024` lines 136–165 and 698–701: §2.2, p. 4, Theorem 4.5, preprint p. 16. | Function-free signature, universal consequent, shared-symbol universal interpolant all match. Number 4.5 agrees with the README; published p. 1831 was not independently checked. The 1969 primary text remains unread. |

Additional source checks: `lopez1965` Theorem 6.3, lines 519–556, pp. 271–272, supports the failure of separation for arbitrary theories; the OCR is interleaved and was not used for exact quotation. The signed occurrence clauses of Theorem 4.1 support Lyndon. `htk2024` lines 713–718 distinguish sentence interpolation from theory-level preservation. Marker draft Theorem 4.27 and Corollary 4.28, pp. 51–53, lines 1734–1778, support the well-ordering endpoints, with the defective consistency-family proof repaired in this PR.

### Adversarial values

Here T/F denote actual truth values, not verdict labels. All models used in satisfiability/entailment rows are nonempty unless explicitly noted. Empty structures are tested for the raw operations that allow them. Tags distinguish graph symbols from base relations. The **197 rows** record separate declarations, theorems, API assertions or conventions; closely related constructor equations are evaluated together. “Retain” means no mathematical change indicated by this instance, not source certification. “README” means keep the mathematics there under R01; it does not endorse the current Lean carrier.

| Statement | Instances tried | Computed values on the two sides | Result / change |
| --- | --- | --- | --- |
| Convention: nonempty models | Empty language, T={∃x x=x}; empty carrier versus singleton | Realization F versus T; satisfiability T via singleton; empty carrier excluded from entailment | Retain |
| Convention: bound positions/new binder last | Two coordinates a=0,b=1, then append c=2 | Old positions read 0,1; new last position reads 2 | Retain |
| Convention: countable means at most countable | Carriers ∅, Fin 1, ℕ | Countable T,T,T; Nonempty F,T,T | Retain; distinguish these predicates |
| Convention: ω₁ bound | α=0,1,ω,ω₁ | α<ω₁ is T,T,T,F | Retain |
| Convention: logical equality | x=x and relation R(x) | Equality relation-occurrence set ∅; R atom set {R} | Retain |
| `onBoundedFormulaInf` | g maps unary R to S; R(x), x=x | Outputs S(x), x=x; no added symbol in equality | README |
| Language-map identity | g=id, R(x)→Q(x) | Both formulas R(x)→Q(x) | Retain |
| Language-map composition | R↦S↦U | Sequential and composite images both U(x) | Retain |
| Injectivity under injective g | Distinct atoms R(x),Q(x) | Distinct images when gR≠gQ; identical images under collapse R,Q↦S | Hypothesis discriminates |
| Language equivalence on formulas | Swap R,Q twice | R(x)↦Q(x)↦R(x) | Retain |
| `realize_onBoundedFormulaInf` | Singleton, R=T; expansion S=T versus S=F | Under expansion T↔T; without it F↔T fails | Expansion hypothesis necessary |
| `termFunctionsIn` | x; f(x); g(f(x),c) | ∅; {f}; {g,f,c}; recursive union gives same sets | Retain |
| `functionsIn` | x=x; f(x)=c; R(f(x)) | ∅; {f,c}; {f} | Retain |
| `relationsIn` | f(x)=c; R(x)→Q(x); conjunction Rₙ(x) | ∅; {R,Q}; {Rₙ:n∈ℕ} | Retain; third is not finite |
| `relationsIn_countable` | Conjunction of distinct Rₙ | Cardinal ℵ₀≤ℵ₀; with uncountable index family cardinal exceeds ℵ₀ | Countable-index hypothesis necessary |
| Function-occurrence countability | Conjunction fₙ(x)=x | Occurrence set {fₙ}; cardinal ℵ₀ | Retain API in prose |
| Occurrences under substitution | φ=R(x), σ(x)=f(c); φ=R(y) with x unused | First {f,c}; second ∅ for substituted x | State occurrence law using actually occurring positions, not every supplied term |
| Occurrences under symbol map | Collapse R,Q↦S in R(x)∧Q(x) | Image {S}; mapped formula occurrences {S} | Sets handle collisions |
| Constant support | c₀=c₁; conjunction cₙ=cₙ | {0,1}; ℕ | Finite sentence set need not have finite support |
| `realize_congr_of_agreeOn` | M={0,1}, R={0}; change unused Q | R(0): T/T; R(1): F/F; changing R to ∅ gives T/F | Occurrence agreement necessary |
| Coded connective padding | Encode one atom R with truth padding in conjunction | ∧(R,T,T,…) has value R and occurrences {R} | Retain |
| Sublanguage carrier/inclusion | F={f},R={P}; extra Q outside | Exactly f,P retained; inclusion images {f},{P}; Q absent | Retain |
| Restriction round trip | Formula P(f(x)) supported in {f},{P} | Restrict then include returns P(f(x)); requesting P with R=∅ impossible | Retain |
| `exists_eq_onBoundedFormulaInf_of_subset_range` | R,Q↦S; target S(x) versus unseen U(x) | S(x) has preimage R(x); U not in range and no preimage | Injectivity unnecessary; range hypothesis necessary |
| Expansion of sublanguage | Singleton: omitted f constant-valued, omitted R false | Reduct unchanged; f()=⋆, R=F; Empty with added constant has no expansion | Nonempty restriction correct |
| Sentence symbol sublanguage | ∧ₙRₙ amid symbols indexed by ℝ | Used symbols ℕ, cardinal ℵ₀; unused real-indexed symbols absent | Retain |
| `liftSubst` | m=k=1, σ(0)=x₀ | Lift sends old 0 to var 0, new last 1 to var 1 | Retain; no capture |
| `substBounds` | φ=x₀=x₁, σ=(c₁,c₀) | Output c₁=c₀; values at (0,1) F/F | Retain |
| `realize_substBounds` | φ=R(x), σ=f(x), f swaps 0/1, R={1}, x=0 | Left R(f(0))=T; right R(1)=T | Retain |
| Bound-substitution identity | σ(i)=var i, x₀=x₁ | Both x₀=x₁ | Retain |
| Bound-substitution composition | σ swaps two coordinates, τ swaps again | Twice-substituted x₀=x₁ equals original | Retain |
| `mapBound` as variable substitution | Duplicate coordinate 0 into both arguments of equality | Both yield x₀=x₀, value T | Retain |
| Substitution/components | ∀y R(x,y), x↦f(z) | Body R(f(z),y) is the lifted substitution of R(x,y) | Retain |
| `onBoundedFormulaInf_substBounds` | f↦g, R↦S, x↦f(c) | Fix c; both sides S(g(c)) | Retain using arity-preserving symbol maps; fixed-c instance is the test |
| `countable_functions_of_sigma` | Language with one nullary function | Σ count=1; arity-0 count=1, arity-1 count=0 | Retain API only |
| `countable_relations_of_sigma` | Countably many unary predicates | Σ count=ℵ₀; unary count=ℵ₀; binary count=0 | Retain API only |
| `smallPresentation` | Singleton symbol at arity 0; empty at arity 1 | Shrunk cardinalities 1 and 0, same as originals | Retain |
| `smallPresentationEquiv` | Symbol f | Inverse(image f)=f; image(inverse f′)=f′ | Retain |
| `smallPresentation_isRelational` | No function symbols | Every shrunk function carrier empty; relational T | Retain |
| `countable_relations_smallPresentation` | Relations Rₙ, unary | Both sigma cardinalities ℵ₀ | Retain |
| `countable_functions_smallPresentation` | Functions fₙ, unary | Both sigma cardinalities ℵ₀ | Retain |
| `realize_smallPresentation` | R={0} on {0,1}; renamed R′ | R(0)=R′(0)=T; R(1)=R′(1)=F | Retain; direct exact probe did not close |
| `inst` | x=c₀, instantiate c₁; c₀=0,c₁=1 | c₁=c₀ is F; original at x=1 is F | Retain |
| `IsAtomic` | Equality, R(x), ⊥, ¬R(x) | T,T,F,F | Retain |
| Bound positions to free variables | x₀=x₁ at tuple (0,1) | Before F; after free assignment inr0↦0,inr1↦1 also F | Retain |
| Constants/variables equivalence | c₀=x₀, c₀ interpreted 1, x₀=1 | Before T; after free constant-variable assigned 1 also T; inverse restores c₀ | Retain |
| `Theoryω` | ∅, {⊤}, {⊥} | Sets of 0-arity formulas; sizes 0,1,1 | Retain |
| `Theoryω.Model` | Singleton M and the three theories | T,T,F | Retain |
| `Theoryω.IsSatisfiable` | Same theories | T,T,F; witnesses singleton,singleton,none | Retain |
| `Theoryω.Entails` | ∅⊨⊤, ∅⊨⊥, {⊥}⊨⊥ | T,F,T | Both satisfiable and inconsistent inputs tested |
| `Sentenceω.Entails` | ⊥⊨⊤; ⊤⊨⊥ | T;F, matching singleton-theory entailment | Retain |
| `OmitsType` | Singleton, n=1, p=∅/{x=x}/{⊥} | F/F/T; empty carrier and n=1 gives T, n=0 with p=∅ gives F | Correct empty-tuple behavior |
| `entails_iff_not_isSatisfiable` | T=∅, φ=⊤ then φ=⊥ | T↔¬F=T; F↔¬T=F | Retain |
| Entailment reflexivity/transitivity/cut | P→Q, Q→R and valuation P=T,Q=T,R=T; countervaluation P=T,Q=F | Composed implication T; missing first premise gives F | Retain |
| Model/entailment monotonicity | ∅⊆{⊥} | Model sets shrink from all to ∅; entailment set grows to all sentences | Direction correct |
| Theory conjunction | T=∅ and T={P,¬P} | Conjunction T and F respectively; “all members hold” T and F | Empty conjunction must be truth |
| First-order entailment compatibility | x=x universally closed; ⊥ | Native and infinitary validity T/T and F/F | Retain |
| Noncompactness/chain union | First k inequalities c≠Sⁱ0 plus disjunction | Finite stage modeled by ℕ,c=k; union requires c∈ℕ and c≠n for all n, hence F | Correct negative control |
| `Fragment` | Empty set; components of P→Q | Empty satisfies all closure implications; {P→Q} alone fails; {P→Q,P,Q} passes | Different from Marker's fragment |
| `GeneratedFrom` | S={P→Q} | Reachable nodes exactly P→Q,P,Q | Retain |
| `Fragment.generated` | S=∅ and {P→Q} | Result ∅ and three-node closure respectively | Retain |
| `Fragment.generated_countable` | One conjunction of Rₙ | Generated cardinal ℵ₀; input cardinal 1 | Retain |
| Fragment lattice | A=generated P, B=generated Q, P≠Q | Intersection ∅, join generated {P,Q}; top contains both | Retain |
| `Fragment.FormationClosed` | Empty fragment; first-order image | Empty fails falsum/atomic closure; first-order image passes all finite formation operations | Retain |
| Formation closure cardinality | Countable seed/countable L; ℝ many unary predicates | First closure ≤ℵ₀; second contains all Rᵣ(x), cardinal ≥|ℝ| | Countability hypotheses necessary |
| Negation closure | Seed {P} | Contains P,¬P,¬¬P,… and ⊥; countably many nodes | Retain |
| `AElementary` | A=∅; A includes ∀y y=x, singleton into two-element equality structure | Vacuously T; latter ambient F versus source T, hence F | Nontrivial formula distinguishes |
| A-elementary identity | Arbitrary tuple a, identity | Truth φ(a) iff φ(a), T | Retain API only |
| A-elementary composition | Two identity embeddings | Both truth comparisons and composite comparison T | Retain |
| A-elementary two-out-of-three | Truth values at g(a),f(g(a)),a all equal | First two equalities force third equality; T,T→T | Correct direction |
| A-elementary monotonicity | A=∅⊆B containing a failed formula | B-elementarity F, A-elementarity T | Only larger-to-smaller implication valid |
| First-order-image agreement | Elementary embedding Q→Q identity | Native truth preservation T, A-elementarity T | Retain |
| Tarski–Vaught | N={0}⊂M={0,1}, ∀y y=0 in A | Ambient counterexample 1 exists; none in N; elementarity F | Witness condition necessary |
| Witness hull | Same M,N, X={0} | Add witness 1 at first stage; hull={0,1}, truth agreement T | Retain |
| `exists_aElementary_substructure` | Empty relational M,X,A; singleton seed; uncountably many named distinct constants | Sizes 0≤ℵ₀;1≤ℵ₀; any substructure has ≥κ elements, bound includes κ | Function-symbol term essential |
| `exists_countable_aElementary_substructure` | Empty relational L,A, X=ℕ in M=ℝ | Choose N=ℕ, inclusion T, count=ℵ₀ | Retain |
| Same-universe LS form | Singleton test, no universe lift | Left 1, right ℵ₀; lifts leave both values unchanged | Retain |
| `aElementary_iSup` | A=∅, increasing finite subsets of ℕ | Each agreement T; supremum ℕ, agreement T; sizes n increase to ℵ₀ | Retain |
| Supremum inclusion/two-out-of-three | Constant directed diagram M | Component→supremum=id; both agreements T | Retain |
| Covering cocone/direct limit | Increasing finite subsets, A=∅; tuple (2,5) | Tuple lies in stage 6; limit carrier ℕ; atomic equality 2=5 is F at both stage and limit | Finite tuple step verified |
| Omission downward | Type {x≠0,x≠1} on M={0,1}, N={0} | Omission T in both; tuples 0 and 1 refuted by their respective equalities | Retain with A containing type |
| Omission through directed union | Finite subsets of ℕ; p={x<0}, natural order | Every stage and union omit p: x<0=F for every tuple | Retain with component elementarity |
| `Theoryω.exists_countable_model` | T={⊤}, empty relational language | Singleton model: count1, nonempty T, satisfaction T; unseeded empty hull would have nonempty F | Chosen seed necessary |
| `Theoryω.entails_iff_countable` | T=∅; conclusion ⊥ | Entailment F; singleton countable countermodel makes RHS F | Retain |
| `Theoryω.Entails.realize` | T={⊤}, φ=⊤, carrier ℝ | Entailment T; realization T despite uncountable carrier | Retain |
| Language-map entailment preservation/reflection | Collapse unary R,Q; φ=∀xR(x), ψ=∀xQ(x) | Original entailment F; collapsed entailment T | Reflection needs injectivity |
| `hc` | Constants 0 and 1 in singleton expansion | Both denote ⋆; syntactically distinct symbols | Naming is surjective, not injective |
| `ConsistencyProperty` | Empty family; family of subsets true in fixed named singleton | Empty family satisfies axioms vacuously but has no member; satisfaction family has member ∅ | `hs` excludes vacuity |
| no_falsum/no_contradiction clauses | s={⊥}; s={P,¬P}; s=∅ | First and second forbidden; third allowed | Retain |
| implication clause | P=T,Q=T; P=F,Q=F | P→Q=T both times; chosen addition Q=T or ¬P=T | Retain |
| negated-implication clause | P=T,Q=F | ¬(P→Q)=T; required P=T and ¬Q=T | Retain |
| conjunction/disjunction clauses | Sequence T,F,T,… | ∧=F, ∨=T; negated conjunction chooses index1; disjunction chooses index0 | Both signs correct |
| all/not_all clauses | φ(x)=(x=0), M={0,1}, names surjective | ∀φ=F; ¬φ(c₁)=T; for constant-true body every instance T | Surjective naming essential |
| eq_refl/eq_subst/eq_name clauses | c₀=c₁ both name 0; R(0)=T | t=t=T; R(c₀)=R(c₁)=T; a name exists for each closed-term value | Retain |
| Equality quotient laws/evaluation | c₀,c₂ name0; c₁ names1; f swaps | [c₀]=[c₂]≠[c₁]; f([c₀])=[c₁] | Atomic substitution suffices |
| `model_existence` | Satisfaction family on singleton, s=∅ | Model size1, all constants name⋆, naming range={⋆} | Retain; nonempty forced by constants |
| `model_existence_omitting` | Same family; P=∅ or P={{⊥}} | Empty omission requests vacuous; ⊥-type refuted everywhere; resulting omission T | Empty type would fail hreq |
| Fair enumeration/truth halves | Request at index2 activated after stage5 | Sweeping prefixes activates it again at every stage ≥5 with prefix≥2; positive/negative membership cannot coexist | Countable schedule sufficient |
| Satisfaction instance ofModel | Fixed singleton with all names⋆ | Every true finite extension remains true; c=t and reflexivity T | Retain |
| Satisfaction instance ofSatisfiable | Two-element model, σ={c₀≠c₁}; fresh c₂ | c₂ can name either element; every closed term can be named; σ stays T | Finite support supplies freshness |
| `infinitaryType` | Pure equality, tuples (0,0),(0,1) in two-element model | x=y belongs to first type, absent from second | Type distinguishes tuples |
| `realizedTypes` | Empty language, singleton; n=0,1,2 | One realized type at each arity; two-element model n=2 has two types | Retain |
| `exists_isolatingFormula` | Two equality types at arity2 | χ=x=y selects exactly diagonal; χ=x≠y selects off-diagonal | Relative-to-M conclusion correct |
| `fragmentType` | A={R(x)}, R={0}; a=0 or1 | {R(x)} or∅ respectively | Retain |
| `AElementary.fragmentType_comp` | Identity on previous structure | Both sides {R(x)} at0, both ∅ at1 | Definitional padding; R09 |
| Fragment slice/truth assignment | Same A | Slice has one element; assignment at0=T, at1=F | Retain |
| Complete 0-type/InfEquivAt | Singleton and two-element pure sets | Sentence “exactly one” belongs only to first; 0-type sets unequal and equivalence F | Retain |
| Countable isolator seed | Pure infinite set, each n | Finitely many equality-pattern types for each n; union over n countable | Retain |
| `exs` | n=0, φ=⊥; n=1, φ=x=x on singleton/empty | n=0 returns ⊥=F; n=1 gives T/F respectively | Binder convention correct; parent-owned operation |
| `Theoryω.IsolatesIn` | T=∅ satisfiable; p=∅; p={⊥} | Empty type isolated by truth (T); inconsistent type cannot have consistent isolator (F) | Consistency conjunct essential |
| `exists_countable_model_omitting` | T=∅, P={{⊥}}; P={∅} | First: singleton omits, hnonisolated T; second: omission F and hnonisolated F | Correct exclusion |
| Repeated-constant isolation route | Tuple (c,c), proposed values (0,1) | Added equality x₀=x₁ has value F, excluding incompatible assignment; tuple(0,0) gives T | Equality constraints necessary |
| Realized-in-every-model corollary | Empty type versus {⊥} over satisfiable T | Empty type universally realized T and isolated T; {⊥} universally realized F | Retain |
| First-order omitting types | Native pure equality T, type {⊥} | Non-isolation T; singleton omission T | Missing acceptance target; R02 |
| `morleyize` | L empty, Φ={x=x at arity1} | Added unary relation count1, function count0 | Retain |
| `lhomMorleyize` | Base R in R⊕formula symbols | R maps to inl R; no new predicate identified with R | Retain |
| `morleyExpansion` | Added Rφ for φ=x=y, M={0,1} | Rφ(0,0)=T, Rφ(0,1)=F, same as φ | Retain |
| `morleyize_isRelational` | L relational; alternatively L has one constant | Function count0 yields T; count1 yields F | Restriction exact |
| `countable_relations_morleyize` | ℵ₀ base predicates plus one added formula | Sum cardinal ℵ₀+1=ℵ₀ | Retain API |
| `isExpansionOn_morleyExpansion` | Base R,f interpreted in canonical expansion | Base relation and function values identical; both structure fields rfl | API, not a deep endpoint |
| Defining theory/uniqueness | Φ={x=x}, singleton; interpret added predicate false | Canonical axiom T; wrong expansion axiom F | Excludes arbitrary expansion |
| UnMorleyization | Rφ(c₀,c₁) with φ=x=y | Back-translation c₀=c₁; at names0,1 both F | Retain |
| `nonempty_morleyEquiv_iff` | Two singleton structures; singleton versus two-element | Isomorphism T/T; cardinal mismatch F/F | Both directions tested |
| Morley embedding iff A-elementary | N={0}→{0,1}, A contains ∀y y=x | Added unary predicate T in N,F in M; embedding reflection fails and A-elementarity fails | Retain |
| `OmitsFOType` | p=∅ or {⊥}, singleton, arity1 | F or T, same as semantic omission | Retain |
| Morley falsum/atomic axioms | φ=⊥ and φ=x=y at(0,1) | Required Rφ=F in both cases | Retain |
| Morley implication/universal axioms | P=T,Q=F; ∀y(y=0) on{0,1} | R(P→Q)=F; R(∀y y=0)=F | Retain; no extra quantification of parameters |
| Morley conjunction type | All components T but R∧=F | One-way axioms T, omitted type realized T, hence omission F | Omission removes wrong expansion |
| Morley disjunction type | All components F but R∨=T | One-way axioms T, omitted type realized T, hence omission F | Omission removes wrong expansion |
| Countability of Morley theory/types | Countable A; each conjunction countably many components | ℵ₀·ℵ₀=ℵ₀ axioms; ≤ℵ₀ types | Requires countable A |
| `exists_firstOrder_presentation` | A=∅ | T=Γ=∅; no added relations; every expansion is canonical, both sides T | Nonvacuous alternatives above |
| Model-class presentation corollary | A contains φ=⊥ | Added nullary Rφ required T by theory extension and F by presentation; no models on either side | Retain |
| Finiteness example | Pure finite sets size1,2 and infinite ℕ | φfin=T,T,F; FO finite approximations allow larger finite models; infinite FO model realizes disjunction type | Compactness claim correct |
| `GraphRelation` | Base binary R, unary f, constant c | Tags base R at2, graph f at2, graph c at1; base R≠graph f | Tagged disjointness necessary |
| `graphLanguage` | L has one constant and one unary function | Function count0; graph relation arities1 and2 | Relational carrier correct |
| `graphLanguage_isRelational` | Same L | Each function type PEmpty, IsEmpty T | Definition-level instance |
| `graphExpansion` | f swaps0/1 | Gf(0,1)=T, Gf(0,0)=F | Output is last coordinate |
| `RelSymMem` | F={f},R={R}, tag graph f/base R/base Q | T,T,F | Retain |
| `relSym` | Same F,R | Set exactly {graph f,base R} | Retain |
| `relSym_inter` | F₁={f},F₂=∅; R₁=R₂={R} | Both sides {base R}; with F₂={f}, both also contain graph f | Definitional padding; R09 |
| relSym union/indexed unions | F₁={f},F₂={g}, R empty | Both unions {graph f,graph g} | Retain |
| `exists_relationalize`/truth | φ=R(f(x)), f swaps, R={1},x=0 | Original T; ∃y(Gf(0,y)∧R(y))=T via y=1 | Retain |
| Exact translation occurrences | Same φ | Original sets {f},{R}; translated set {graph f,base R} | Exact occurrence identity passes |
| Translation of nested terms/equality | f(f(x))=x on two-element swap | Original T; witnesses1 then0 satisfy graph equations, translation T | No term-value shortcut |
| Graph axioms | Empty binary graph versus graph of swap | Empty graph totality F, functionality T; swap graph both T; universal graph functionality F | Both axioms needed |
| Reconstruction | Swap graph and F={f} | Reconstructed f(0)=1,f(1)=0; relations unchanged | Retain nonempty for unmentioned constants |
| `ungraphTerm` | Graph-language var x | Output native var x; function-term case has empty constructor argument | Retain |
| `backTranslate` | Gf(x,y); base R(x) | f(x)=y; R(x) | Retain |
| `realize_backTranslate` | Swap f, (x,y)=(0,1),(0,0) | Equality and graph truth T/T then F/F | Both values tested |
| Back-translation polarity | ¬Gf(x,y) and ¬R(x) | First yields inequality, relation signs ∅; second negative set {R} | Retain |
| Graph entailment transfer | φ=ψ=⊤, F₁=F₂=∅; φ=⊤,ψ=⊥ | Both entailments T in first case, F in second | Directions correct |
| Graph round-trip semantics | φ=R(f(x)), same swap model | Original T; translated/back-translated existential formula T | Semantic, not syntactic equality |
| `PCMem` | g=id, Θ=⊤/⊥; empty carrier in relational L | Membership T/F; empty allowed for ⊤ | Distinct from nonempty entailment |
| PC union/intersection | Singleton, new nullary P,Q; classes P=T and Q=T | Both expansions exist, intersection T; union T; impossible Θ=⊥ gives empty class | Retain |
| PC union relational qualification | Empty base structure; one auxiliary language has a constant | Expansion to that language impossible, even if other class contains empty structure | Relational auxiliary restriction prevents failure |
| PC composition/isomorphism invariance | Singleton renamed along its unique bijection | Expansion exists before/after (T/T); composing identity reducts changes nothing | Retain |
| `craig_interpolation_relational` | φ=P∧Q, ψ=P, predicates nullary | Shared set{P}; θ=P; entailments T,T | Retain |
| `craig_interpolation` | φ=(c=d)∧P, ψ=(c=d) | θ=(c=d); function symbols {c,d} on both sides; relation set∅; entailments T,T | Function vocabulary preserved |
| Degenerate Craig | φ=⊥,ψ=P; φ=P,ψ=⊤ | θ=⊥ or⊤; occurrence sets∅; both entailments T | Checks stay in README |
| Craig PC shared-sublanguage separation | ψ₁=P,ψ₂=¬P | θ=P: realization T in first class,F in second | Retain |
| `pcSeparation` | Pure equality classes size1 and size2, given by sentences | Intersection∅; θ=“size1”: values T,F | Countable hypothesis discriminates |
| Renaming auxiliary symbols apart | Θ₁ says auxiliary P, Θ₂ says ¬P in same auxiliary language | Each PC class is all carriers; combined renamed P₁∧¬P₂ satisfiable, intersection nonempty | Sharing P incorrectly would give false disjointness |
| Uniform universe transfer | Singleton/two-element example lifted to another universe | Cardinal sizes remain1/2; same separator values T/F | Retain |
| `relationsInSigned` | R→S; ¬R; x=y | Positive {S},negative {R}; positive∅,negative{R}; both∅ | Sign convention correct |
| Signed union/swap/countability | ¬(R→S); ∧ₙRₙ | Signs swap to positive{R},negative{S}; countable positive set{Rₙ} | Retain |
| Signed semantic monotonicity | R=∅→{0}, formula R(0); formula ¬R(0) with reverse inclusion | Positive R(0): F→T; negative ¬R(0) under shrinking: F→T; enlarging instead gives T→F | Polarity restriction necessary |
| `lyndon_interpolation` | φ=P∧¬Q,ψ=P | θ=P; positive shared set{P},negative shared set∅; entailments T,T | Retain |
| Craig from Lyndon | Previous θ | Union signed sets={P}=ordinary relation set; inclusion T | API corollary |
| `universalSigned` | Atom; ∀xR(x); ∃xR(x); ∧ᵢ∃xRᵢ(x) | (universal,existential)=(T,T),(T,F),(F,T),(F,T) | Matches ∀₁/∃₁, not Π₁/Σ₁ |
| Universal/existential preservation | N={0}⊂{0,1}, R={0} | ∀R in M F but N T (only downward implication); ∃R in N/M T/T | Correct directions |
| `malitz_interpolation` | φ=(∀xR(x))∧P,ψ=∀xR(x) | θ=ψ, universal T, shared symbols{R}, entailments T,T | Function-free source matches |
| Universal graph obstruction | Function totality ∀x∃yGf(x,y) | universalSigned true=F because existential occurs positively | Explains relational scope |
| `RelChain` | f=id on{0,1}, lt=<; constant map to reflexive singleton | First chain T; second chain T but injectivity F | Definition correctly does not assert injectivity |
| Chain injectivity with irreflexive lt | Constant map from two ordered points, lt strict | Required lt(a,a)=F, so chain F; identity chain injective T | Irreflexivity needed |
| `HasWellOrderedChains` | φ=“exactly one, lt empty”; φ=⊤ allowing orders | First fails α=2; second witnessed by each α (use singleton for α=0) | Nonempty at α=0 handled |
| `exists_model_relChain_rat` | φ=⊤ with strict orders; reflexive singleton allowed | Q with identity gives q<r⇒lt(q,r)=T; singleton constant chain also T in reflexive case | No unjustified injectivity |
| Well-founded boundedness | φ says singleton strict order | No chain from ordinal2: would require lt(a,a)=T; bound2<ω₁ | Retain |
| `wellOrder_type_boundedness` | φ says exact size1; φ unsatisfiable; empty-only raw sentence | Types1<2; no models so bound1 vacuous; empty order type0<1 | Strict inequality/successor correct |
| `wellOrdering_undefinable` | Proposed sentence “strict linear order” | ω and Q both satisfy; well-order T forω,F forQ | Illustrates obstruction, not full proof |
| Gap family initial member | α=0,1,ω; γ=α+1, σ=∅ | α<γ gives 0<1,1<2,ω<ω+1 | Terminal reserve valid |
| Gap family negative control | Old family: d₀ greatest in α+1 | ∀x(x<d₀∨x=d₀)=T, but adding d₁>d₀ makes its instance F | New reserve excludes old witness |
| Gap placement, empty/left | α=0, β=2,γ=3; α=1,β=4, first b=4 | p=0 with0<3; p=1 with1+1=2≤4 and p<4 | Initial gap works |
| Gap placement, middle | α=1,β=4,bᵢ=4,bᵢ₊₁=8 | p=6; 4+1≤6 and6+1≤8;4<6<8 | Retain |
| Gap placement, right | α=1,β=4,bₙ=4,γ=9 | p=6; p+α=7<9 | Terminal reserve works |
| Gap placement, zero/nonfinite | α=0,p=b+1; α=ω,β=ω·2+1,b=β,γ=b+β+1 | p>b even at0; atω, p=ω·3+1, p+ω=ω·4<b+β=ω·4+1<γ | Ordinal addition direction verified |
| Gap downward closure | α′≤α, fixed b,γ | b+α′≤b+α<γ; weakening preserves inequalities | Retain |
| Gap disjunct selection | α↦k(α)∈ℕ on unbounded subsetω₁ | If every fiber bounded, countable supremum of bounds<ω₁; union then bounded, contradiction | One unbounded fiber exists |
| Gap all/new rational | Universal sentence plus new q at computed p | Instance remains T in same model; reserve inequalities above remain T | Retain |
| Gap not_all/fresh constant | σ uses k Henkin constants | ℕ minus finite k is infinite; choose unused constant, assign counterexample, negated instance T | Finite support essential |
| Gap equality clauses | t=t′ true, R(t,u) true, u new rational from D | Place u; substitution gives R(t′,u)=T; t=t reflexivity T | Chain need not be injective |
| Gap finite support/countability | σ finite, each sentence finite support; D countable | New support size≤old+1; total member size≤ℵ₀ | Retain |
| Rational chain ill-foundedness | f:Q→M, qₙ=−(n+1) | qₙ₊₁<qₙ, hence lt(f(qₙ₊₁),f(qₙ))=T for every n | Direction correct |
| Dense-order worked example | Countable seed X in a DLO; witness hull | New between/end witnesses exist, resulting countable hull satisfies density and no endpoints | Nonempty seed needed as stated |
| Q complete-type example | Arity1 and arity2, pairs(0,1),(0,0),(1,0) | 1 orbit at arity1; three pair types distinguished by <,=,> with truth patterns100,010,001 | Correct |
| Finite parity PC example | Fin1,Fin2,Fin3 | Fixed-point-free involution F,T,F; exactly-one-fixed-point involution T,F,T | Separates odd/even finite sizes |
| Scott disjunction example | α=0,1,2; nonempty model convention | No nonempty models at0 or1; singleton allowed at2 | β=0 Scott sentence has no nonempty model, consistent with convention |
| Arbitrary-theory interpolation exclusion | Noncompact theory from §1.1 | Every finite stage satisfiable T, whole theory F | Sentence reduction requires countable conjunction, not arbitrary conjunction |

## Not verifiable

- **Published Marker Chapter 4:** the DOI resolver did not find an accessible full book. The author's legal course notes and the publisher's Chapter 1 excerpt were read. The draft has Theorems 4.6, 4.9, 4.21 and 4.27 rather than the book's subsection numbering. The precise published Chapter 4 numbers/pages and whether its proof defects were corrected are not certified. The `marker2016` request retains this narrower need; the source is not treated as wholly unread.
- **Keisler (1971):** the source service's title search found no legal full text; the author's Wisconsin books/publications pages list the work but did not supply the needed text. The roadmap gives no theorem/page locator. Its specific formulations of consistency properties and omission are not certified.
- **Malitz (1969):** the DOI resolved to Project Euclid, but the service found no available PDF. Theorem 4.5 in the legal Harrison–Trainor–Kretschmer author version verifies the stated function-free result; the primary paper's proof and exact theorem locator remain uncertified.
- **Gao (2009):** the service reached the Taylor & Francis book page without an accessible full text. The claimed fragment convention cannot be certified from the publisher description or bibliographic search. A precise section/page is still needed.
- **Published Harrison–Trainor–Kretschmer pagination:** the November 21, 2023 author version has Theorem 4.5 on p. 16 and matches the theorem's hypotheses and number. The reported journal page 1831 was not independently read.
- **External formalization at `518a366`:** the service did not retrieve the immutable source tree; it tried the author's blueprint endpoint and failed. The assertion of sorry-freeness, the axiom inventory, and all file-by-file porting claims at that revision remain unverified. They were not used as evidence that the signatures are true. No fetched code was run.
- **Open consumers without supplied checkouts:** full-head ownership/contract verification for CountableStructureSpaces and HanfNumbers was not performed. Their indexed hits identify them as consumers, and main's CountableModelCounting contract was checked directly. The review does not certify synchronization of consumer prototypes.

The missing-source list records the attempts in one place. The review is finished; none of these missing texts was silently treated as read or used to turn a gate failure into acceptance.

## Source issues

These entries distinguish published text from the author draft; they do not allege that a draft defect persists in an unread published chapter.

- **Misprint** in marker2016 at Theorem 1.2.1, proof clause (vi), printed p. 13 (publisher-excerpt line 327; also draft Theorem 1.31, p. 12): the source says the right-hand side universally quantifies the existing parameter tuple again; it should be quantified only over the new variable, preserving the parameters; affects the proof.
- **Error** in marker2016 at Exercise 1.1.12, printed p. 12 (publisher-excerpt lines 270–273; draft Exercise 1.26, p. 10): the source says the elementary submodel has cardinality exactly the maximum of seed and fragment sizes; it should be at most that maximum unless an ambient lower-size hypothesis is added; affects a stated result.
- **Misprint** in marker2016 at draft Theorem 4.6, negative-existential case, printed p. 43 (draft lines 1416–1418): the source says induction gives the positive matrix at every named constant; it should be the negated matrix at every named constant; affects the proof.
- **Error** in marker2016 at draft Theorem 4.8, printed p. 43 (draft lines 1425–1428): the source says its extension condition alone gives a model of T; it should be supplemented by a member of the consistency property; affects a stated result.
- **Gap** in marker2016 at draft Theorem 4.21, final constant abstraction, printed p. 49 (draft lines 1653–1659): the source says the interpolant's new constants can be replaced by a finite universally quantified tuple; it should be preceded by a finite-support construction or elimination argument; affects the proof.
- **Error** in marker2016 at draft Theorem 4.27/Corollary 4.28 proof, condition (*), printed p. 52 (draft lines 1744–1758): the source says initial and intermediate gaps define the required consistency family; it should be strengthened by terminal reserve, with an empty-support case; affects the proof.

For the published presentation misprint, take θ(x,y)=R(x) on a two-element structure with R={0}. At x=0 the intended ∀yθ is true, while the printed ∀x∀yθ is false. The roadmap's §5.2 uses the correct parameter-preserving axiom. For Exercise 1.1.12, a singleton structure, empty seed and countably infinite fragment would demand a countably infinite substructure; replacing equality by ≤ makes 1≤ℵ₀ true. For draft Theorem 4.8, the empty consistency family and T={⊥} satisfy the extension condition vacuously but T has no model. The well-ordering source defect is precisely refuted by the greatest-element instance in the roadmap and the table above; its strengthened reserve excludes that instance.
