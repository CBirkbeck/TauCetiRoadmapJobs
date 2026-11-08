# Review of InfinitaryModelExistence (pull request #1615 at bf6203d)

**Verdict:** needs changes

🤖 Independent AI review, incremental: 109 changed lines since f696fb3 (the folder diff since the previous review), checked in full; the untouched statements carry the previous report's rows. The pull request's own diff against main touches only `TauCetiRoadmap/InfinitaryModelExistence/README.md` and `TauCetiRoadmap/InfinitaryModelExistence/Suggested.lean`; the outside-folder files in the change list arrived with the merge of main and are not the pull request's. The new first-order omitting types theorem is correct and well stated. Two new findings are locator and name-agreement slips (P3). Eight findings of the previous review are not repaired, one of them blocking; seven of those eight are inherited verbatim from the merged roadmap on main (the gate fails on main's copy of this folder in the same way), so they are the state of the roadmap rather than of this revision. The gate fails: `set_option=1 tex=1 residue=2 imports=1 readme-ids-missing=15 build=2`.

## R01 (P2) — The acceptance file still imports a roadmap module instead of the pins

**Location:** `TauCetiRoadmap/InfinitaryModelExistence/Suggested.lean:2`, "import Completed.InfinitaryLogic.Suggested"; the module docstring at lines 17–19.

**Claim:** The infinitary headlines are stated on `BoundedFormulaInf`, `Sentenceω`, `IndexCoding` taken from the completed InfinitaryLogic roadmap's prototype, described as mirroring Tau Ceti's `TauCeti.ModelTheory.Infinitary.*`.

**Witness:** At the pins now in force (Tau Ceti `358314d`, Mathlib `f6090c7`, identical in the branch and content manifests) `TauCeti/ModelTheory/` contains only `Algebra/OrderedRing/MvPolynomial.lean`; no `BoundedFormulaInf` anywhere in either library. The worker's signature elaboration aborted with "unknown module prefix 'Completed'", and the gate reports `imports=1`.

**Repair:** As in the previous review's R01: drop the roadmap import and the declarations that depend on its carriers (their statements stay in the README as targets), name each infinitary headline and its missing carrier in the module docstring, and keep the native statements (`exists_countable_model_omitting_fo` and its two definitions elaborate with `import Mathlib` alone). While changing the header, use the form the gate accepts at this Mathlib pin, `module` then a blank line then `public import Mathlib` (precedent: `TauCetiRoadmap/CoboundaryExpansion/Suggested.lean` on main); the gate's two `build` warnings are the module-system advisories on this file and the imported parent. This finding is inherited from main's copy of the folder; the revision did not introduce it. Previous review: R01, not repaired.

## R02 (P3) — The new isolation predicate is not named in the README

**Location:** `TauCetiRoadmap/InfinitaryModelExistence/Suggested.lean:528`, "def IsolatesFO"; `TauCetiRoadmap/InfinitaryModelExistence/README.md:530–532`.

**Claim:** README and Lean agree, every Lean name appearing in the README.

**Witness:** `grep -n 'IsolatesFO\|OmitsFOType' README.md` returns nothing; the README names only `exists_countable_model_omitting_fo`. `OmitsFOType`, moved into Layer 4 by this revision, is equally unnamed (it was unnamed before too).

**Repair:** In §4.2, after "none isolated by a first-order formula modulo the theory", say in one clause what the Lean predicate is: `IsolatesFO T p` holds when some `φ` with `T ∪ {∃x̄ φ}` satisfiable has `T ⊨ ∀x̄ (φ → ψ)` for every `ψ ∈ p`; and that omission is `OmitsFOType`, every tuple refuting some formula of `p`. Twelve other Lean names are likewise absent from the README (`RelSymMem`, `countable_functions_of_sigma`, `countable_functions_smallPresentation`, `countable_relations_of_sigma`, `countable_relations_smallPresentation`, `exists_relationalize`, `graphLanguage_isRelational`, `hc`, `isExpansionOn_morleyExpansion`, `relSym_inter`, `smallPresentation_isRelational`, `ungraphTerm`); they predate this revision and fall under R01's trimming, so they are recorded here rather than as a finding of their own.

## R03 (P3) — Page locators for Corollary 4.28 and the proof of Theorem 4.27

**Location:** `TauCetiRoadmap/InfinitaryModelExistence/README.md:1020–1021`, "Theorem 4.27 (p. 51), Corollary 4.28 (pp. 51–52), and the proof of Theorem 4.27 printed after the corollary (pp. 51–52)".

**Claim:** The corollary spans pp. 51–52 and the proof pp. 51–52.

**Witness:** In the author's copy (`marker2013` = sources cache `05dcf4be…`, PDF page = printed page, footers at lines 1739, 1775, 1781): §4.4 opens on p. 51 (line 1732), Theorem 4.27 is on p. 51 (line 1734), Corollary 4.28 opens p. 52 (line 1741), the proof runs from p. 52 (line 1744) to p. 53 (line 1777), followed by Exercise 4.29 on p. 53.

**Repair:** Write "Theorem 4.27 (p. 51), Corollary 4.28 (p. 52), and the proof of Theorem 4.27 printed after the corollary (pp. 52–53)". The Layer 8 citation at line 823, "(§4.4, pp. 51–52, printed after Corollary 4.28)", is for the gap conditions (*), which are on p. 52 (line 1758), so it may stay or become "p. 52". The theorem numbers, the section title and the content of (*) (`α ≤ b₁`, `bᵢ + α ≤ bᵢ₊₁`, no terminal reserve) are correct as cited.

## R04 (P3) — `set_option` in the acceptance file

**Location:** `TauCetiRoadmap/InfinitaryModelExistence/Suggested.lean:26`, "set_option autoImplicit false".

**Claim:** No option override. **Witness:** gate `set_option=1`. **Repair:** delete the line; every retained signature already carries explicit binders. Inherited from main. Previous review: R03, not repaired.

## R05 (P3) — Fifteen backticked names the README presents as its own are not declared

**Location:** `TauCetiRoadmap/InfinitaryModelExistence/README.md:190`, "functionsIn_countable"; also §§2.2, 2.4–2.5, 5.1, 6, 7.3 and Layer 8.

**Claim:** A backticked name of this roadmap's own is declared in `Suggested.lean`. **Witness:** gate `readme-ids-missing=15`; the list is unchanged from the previous review (`OmitsType.of_aElementary`, `RelChain.injective_of_irreflexive`, `aElementary_directLimit_of`, `aElementary_inclusion_iSup`, `aElementary_of_cocone`, `aElementary_of_tarskiVaught`, `entails_graphTranslation`, `entails_iff_graphTranslation`, `functionsIn_countable`, `realize_conjunction_iff`, `realize_mono_of_signed`, `realize_relationalize`, `realize_relationalize_reconstruct`, `realize_toInf`, `realize_unMorleyize`). **Repair:** state each fact in prose without the name; put imported facts (`realize_toInf`, `realize_conjunction_iff`) in the supplier contracts. Inherited from main. Previous review: R04, not repaired.

## R06 (P3) — No `**Checks.**` blocks, no `*Needs:*` lines, no upstream section shape

**Location:** `TauCetiRoadmap/InfinitaryModelExistence/README.md:184`, "### 0.2 Occurrences and symbol locality"; throughout Layers 0–8.

**Claim:** Every definition has three discriminating Checks and every target its dependencies. **Witness:** `grep -c '\*\*Checks\.\*\*\|\*Needs:\*' README.md` is 0 at this head. **Repair:** as in the previous review's R05 (the occurrence tests `(∅,∅)`, `({f},{R})`, `(∅,{Rₙ})` are a ready first block). The parent links are now resolved to `Completed/InfinitaryLogic/README.md`, which was the one item of that finding this revision did. Inherited from main. Previous review: R05, partly repaired (links only).

## R07 (P3) — Locators remain whole-chapter for Chapters 1 and 4 of the book, and no `sources.toml`

**Location:** `TauCetiRoadmap/InfinitaryModelExistence/README.md:351`, "(Marker 2016, Chapter 1)"; lines 422, 585; the folder has no `sources.toml`.

**Claim:** Exact locators into a legal text. **Witness:** Layer 8 now cites the 2013 notes precisely (Theorem 4.27, Corollary 4.28, (*), verified above), but §§2.2, 3.1, 5.1–5.2 still cite "Marker 2016, Chapter 1" or "Chapter 4" with no theorem or page, and the folder lists no `sources.toml`. **Repair:** attach theorem and page locators (the previous review's table gives the verified ones: Theorem 1.1.9, pp. 11–12; Theorem 1.2.1, p. 13; notes Definition 4.1 and Theorem 4.6, pp. 39–43; Theorem 4.9, p. 44) and record each work once in `sources.toml`, the 2013 notes under one key distinct from the book. Previous review: R06, partly repaired.

## R08 (P3) — TeX display

**Location:** `TauCetiRoadmap/InfinitaryModelExistence/README.md:346`, the `math` fence with `\le`, `\max`, `\aleph_0`.

**Witness:** gate `tex=1`. **Repair:** `|N| ≤ max(ℵ₀, |X|, |A|, |Σ n, L.Functions n|)` in a code span. Inherited from main. Previous review: R07, not repaired.

## R09 (P3) — Process residue and pull-request links

**Location:** `TauCetiRoadmap/InfinitaryModelExistence/README.md:990` and 1039, "checkpoint"; lines 965–967, Tau Ceti pull-request links.

**Witness:** gate `residue=2`. **Repair:** keep the external formalization as an immutable revision without the word "checkpoint", and cite the parent by roadmap name and section rather than by pull request. Inherited from main. Previous review: R08, not repaired.

## R10 (P3) — Definitional padding in the acceptance file

**Location:** `TauCetiRoadmap/InfinitaryModelExistence/Suggested.lean:493`, `AElementary.fragmentType_comp`; line 663, `relSym_inter`.

**Witness:** both were proved in the previous review by unfolding their definitions. **Repair:** delete them from `Suggested.lean`; the README keeps the facts. Inherited from main. Previous review: R09, not repaired.

## Previous findings

- R01 — not repaired: `import Completed.InfinitaryLogic.Suggested` at line 2 (main moved the path; the module is still a roadmap prototype, absent at the pins). Re-raised as R01.
- R02 — repaired: `exists_countable_model_omitting_fo` with `IsolatesFO` at `Suggested.lean:527–543` states the first-order theorem with countable language, satisfiable theory, countable family, non-isolation, countable nonempty model in any universe; the README names it at line 532 with the empty-type negative control. The repair left the predicate unnamed in the README: new R02.
- R03 — not repaired: `set_option autoImplicit false` at line 26. Re-raised as R04.
- R04 — not repaired: the same 15 names missing. Re-raised as R05.
- R05 — partly repaired: parent links now `../../Completed/InfinitaryLogic/README.md`; no Checks or Needs lines. Re-raised as R06.
- R06 — partly repaired: Layer 8 cites the 2013 notes by theorem and page (two page spans off: new R03); other layers and `sources.toml` unchanged. Re-raised as R07.
- R07 — not repaired: the TeX fence at line 346. Re-raised as R08.
- R08 — not repaired: "checkpoint" at lines 990 and 1039. Re-raised as R09.
- R09 — not repaired: both declarations present at lines 493 and 663. Re-raised as R10.

## Verified sound

**Scope of this pass.** The folder diff since f696fb3 is 109 lines: the README's parent links, the Layer 8 citations (summits, layer table, bullets, route paragraph, deferrals, references), the §4.2 sentence naming the new theorem, and in `Suggested.lean` the move of `OmitsFOType` into Layer 4 with `IsolatesFO` and `exists_countable_model_omitting_fo`. `PROGRESS.md` and `STATUS.md` are main's generated files, identical on main (gate `stray-files=0`). The pull request's diff against main outside the folder is empty (`git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/InfinitaryModelExistence'` prints nothing).

**Elaboration.** `lake env lean TauCetiRoadmap/InfinitaryModelExistence/Suggested.lean` from the worktree: exit 0, 35 `declaration uses sorry` warnings (34 before plus the new theorem), nothing else. A scratch copy with `#check @OmitsFOType`, `#check @IsolatesFO`, `#check @exists_countable_model_omitting_fo` printed the three types; the theorem's elaborated type keeps both countability instances, `T.IsSatisfiable`, `P.Countable` and the non-isolation hypothesis, and concludes `∃ M, ∃ (_ : L.Structure M), Nonempty M ∧ Countable M ∧ M ⊨ T ∧ ∀ p ∈ P, OmitsFOType M p.2` with `M : Type w` free. No section variable was lost (the section declares only `L`). The one-tactic probe `simp_all` on a restatement of the theorem leaves the goal open: it is not padding. The 34 earlier admissions were probed in the previous review and are unchanged.

**Pinned declarations opened** (Mathlib `f6090c7`): `Theory.IsSatisfiable`, `Mathlib/ModelTheory/Satisfiability.lean:65` (`Nonempty (ModelType.{u,v,max u v} T)`); `Theory.ModelsBoundedFormula`, line 278, with the notation `⊨ᵇ` at 282 (quantifies over models in universe `max u v w`, here `w = 0` since the free-variable type is `Empty`); `BoundedFormula.exs`, `Syntax.lean:471` (`exs φ = φ` at `n = 0`, so for a type of sentences `insert φ.exs T` is `insert φ T`); `ModelType`, `Bundled.lean:73`, carries `Nonempty`. No `omit`/`Omits`/`omitting` declaration in `Mathlib/ModelTheory/` or in Tau Ceti `358314d` (`TauCeti/ModelTheory/` holds one file, on ordered-ring polynomials): the first-order omitting types theorem is absent from both pins and is owned here.

**Ownership.** `roadmaps grep --fixed -i 'omitting types'` over main and the 448 open heads: hits only in this roadmap and its consumers CountableStructureSpaces (README line 703, listing it as supplied by this roadmap) and HanfNumbers (README lines 172, 866, 880). `OmitsFOType` and `IsolatesFO` occur nowhere else. `pcSeparation` is consumed by CountableStructureSpaces (README lines 130–144, 669–678; `Suggested.lean:651–673`), whose README line 130–133 states the same countable-relational-language qualification as the revised docstring. Ownership against open pull requests not carried by the brief's index was not checked beyond that index.

**Dependency check** (exact output): `depcheck: 233 roadmaps, 2133 edges, 0 problem(s)`. No UPWARD or CYCLE line. The roadmap is on main and is not listed in `ORDER.txt`; its suppliers are the completed InfinitaryLogic roadmap (`Completed/InfinitaryLogic/README.md`, whose line 686 leaves model existence and downward Löwenheim–Skolem to other roadmaps) and the pins.

**Seeded sample where it falls in the changed passages.** Of the 15 sampled sections only §4.2 and the Layer 8 citations changed; the other thirteen were read in the previous review and are untouched.

| Sample | Text examined | Support |
| --- | --- | --- |
| 4.2 Omitting types, first-order corollary | `marker2013` lines 1436–1445 (Theorem 4.9, p. 44) and 1491–1492 (Exercise 4.11: 4.9 generalizes the classical first-order theorem). | The Lean statement is the classical theorem (countable language, consistent theory, countably many non-isolated types, countable model omitting all). Hypotheses match; the README's route "take `A` the first-order image fragment" is Exercise 4.11. |
| Layer 8, Theorem 4.27 | `marker2013` lines 1732–1736, p. 51. | Hypothesis "for all α < ω₁ some model embeds (α,<)", conclusion a model embedding (ℚ,<). The roadmap's raw positive form (chains not required injective, injectivity a separate corollary for irreflexive `lt`) is weaker in hypothesis and conclusion in the same way: consistent. |
| Layer 8, Corollary 4.28 | lines 1741–1743, p. 52. | "Order type at most α for some α < ω₁"; the README's "some α < ω₁ strictly exceeds every order type" is the same with α + 1. |
| Layer 8, condition (*) | lines 1744–1758, p. 52: finite σ₀ over finitely many constants, `α ≤ b₁`, `bᵢ + α ≤ bᵢ₊₁`, chain inside a well-ordered subset. | Matches the README's gap conditions; the notes have no terminal reserve and no empty-support clause, as the README says it adds. C4) and C7c) checked in the notes, rest Exercise 4.29 (p. 53). Page spans: R03. |
| Layer 7, PC classes versus analytic and Borel sets | lines 1676–1680 (Exercise 3.5 and Lemma 4.24, p. 50), 1721–1731 (Corollary 4.25, Theorem 4.26, p. 51). | Countable models of a PC class form an invariant Σ¹₁ set and conversely; invariant Borel = Mod(φ); Corollary 4.25 is the Lusin-type separation. The docstrings' "countable relational language, carrier ℕ" qualification is what these need. |

**Adversarial values** (new and changed statements; T/F are truth values):

| Statement | Instances tried | Values on each side | Result |
| --- | --- | --- | --- |
| `OmitsFOType M p` (moved) | singleton M, n=1, p=∅; p={⊥}; p={x₀=x₀}; n=0, p=∅ | ∃ψ∈∅ refuted: F; ⊥ refuted by the one tuple: T; x=x never refuted: F; n=0 one empty tuple, p=∅: F | definition unchanged by the move |
| `IsolatesFO T p`, empty type | T=∅ in the empty language, n=1, p=∅ | φ=⊤: `insert ⊤.exs ∅` satisfiable (singleton), ∀ψ∈∅ vacuous: isolated T | negative control in the docstring is right |
| `IsolatesFO T p`, inconsistent type | same T, p={⊥} | any φ with `insert φ.exs T` satisfiable has a model of T and a tuple with φ true, so `T ⊨ᵇ φ.imp ⊥` is F; isolated F | theorem then gives a model omitting {⊥}: every tuple refutes ⊥, T |
| `IsolatesFO`, n = 0 | T=∅, p={ψ} with ψ a sentence false in some model | φ=⊤ consistent, `∅ ⊨ᵇ ⊤ → ψ` F; isolated iff some consistent sentence φ entails ψ modulo T | `exs` at 0 is the identity, so "consistent" is `insert φ T` satisfiable |
| `exists_countable_model_omitting_fo`, n = 0 | p = {ψ}, ψ not valid, T = ∅ | non-isolated (above); conclusion: some countable nonempty model of ∅ fails ψ, T by Löwenheim–Skolem on a countermodel | |
| same, nontrivial type | L = unary predicates Pₙ (n ∈ ℕ), T = ∅, p = {Pₙ(x₀)} | any φ mentions finitely many Pᵢ; a model with a ⊨ φ, Pₘ(a) flipped for unmentioned m, keeps φ and refutes Pₘ: non-isolated T; model ℕ with Pₙ = {k ≠ n}: every k refutes P_k, omission T, countable T | |
| same, `hsat` necessary | T = {⊥} | no φ isolates (nothing satisfiable), so `hiso` holds; conclusion asks for a model of {⊥}: F | hypothesis present in the signature |
| same, universes | model found in `Type 0` | `ULift` to `Type w` keeps countable, nonempty, `M ⊨ T` and omission (realization is isomorphism-invariant) | `M : Type w` free is right |
| README §4.2 sentence | "countably many … none isolated … countable model omitting them all" | matches the signature term by term; "in the sense of `Theory.IsSatisfiable`" is the consistency of `insert φ.exs T` | R02 only: predicate unnamed |
| Citation, Theorem 4.27 ↔ `exists_model_relChain_rat` | hypothesis per α < ω₁ and conclusion chain from ℚ | notes p. 51 line 1734 | matches (raw positive form) |
| Citation, Corollary 4.28 ↔ `wellOrder_type_boundedness` | α with "at most α" versus "strictly exceeds" | α ↦ α+1 < ω₁ | matches; page: R03 |
| Citation, (*) | `α ≤ b₁`, `bᵢ + α ≤ bᵢ₊₁` | notes line 1758 | matches; terminal reserve is the roadmap's addition as stated |
| Parent links | `../../Completed/InfinitaryLogic/README.md` from `TauCetiRoadmap/InfinitaryModelExistence/` | resolves to `Completed/InfinitaryLogic/README.md`, present in the tree | |
| Marker 2013 versus 2016 | theorem numbers | notes: 4.9, 4.27, 4.28; book Chapter 4 not read | README no longer cites "4.4.1/4.4.2"; consistent |

Rows 1–197 of the previous report (`PRREVIEW-InfinitaryModelExistence~1.md`, "Adversarial values") cover every untouched statement from the Layer 0 signature calculus through the Layer 8 gap family, including the gap-family clause checks that this revision only re-cites; they are carried forward unchanged, since none of those statements changed.

## Not verifiable

- **Marker's 2016 book, Chapters 1 and 4** (published numbering and pages): not legally available beyond the publisher's Chapter 1 excerpt; the README's claim that the notes number results differently is consistent with that excerpt (book Theorem 1.1.9 is notes Theorem 1.23) but Chapter 4 of the book was not read.
- **Keisler 1971, Malitz 1969, Gao 2009, the published Harrison–Trainor–Kretschmer pagination, the external formalization at `518a366`**: unchanged from the previous review; none is cited by a passage this revision changed.

## Source issues

- **Error** in marker2013 at Theorem 4.27 proof, condition (*), printed p. 52: the source says the initial and intermediate gaps alone make Σ a consistency property; it should add a terminal reserve after the last named rational (and an empty-support clause); affects the proof. (Recorded in the previous review from the same text; the greatest-element instance in the README's Layer 8 refutes the family as printed.)
