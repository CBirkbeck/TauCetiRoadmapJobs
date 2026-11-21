# Review of LogicAndDefinabilityInNumberTheory (pull request #2276 at bc597bd)

**Verdict:** needs changes

**Summary.** Changes are needed for one point, in the text the last repair wrote: the existential preservation criterion that §4.31 now states as its own target is false for the empty structure, which the native notions it names admit, and it needs the one clause "nonempty" (§0.1 of the same README already writes it). The previous finding is repaired: model completeness and Robinson's test are now imported from SaturationAndQuantifierElimination §2.5, and that roadmap's text agrees; the four earlier small corrections and the format note are repaired too. There is one small correction, no format note; the acceptance that would follow stays conditional on the four declared supplier gaps, which the human reviewers are told of.

## R01 (P2) — The preservation criterion of §4.31 fails when the smaller model is empty

An implementer who writes the criterion with the notions the section names (native embeddings, `FirstOrder.Language.BoundedFormula.IsExistential`, equivalence modulo T) obtains a false statement, in the direction the text says "is Mathlib `…IsExistential.realize_embedding`". The target (README line 1248) reads: "φ is equivalent modulo T to an existential formula iff, for every embedding f:M↪N of models of T and every tuple a from M, M⊨φ(a) implies N⊨φ(f(a))", with "finitely many free variables", so none is allowed. Take the empty language, T empty and φ the sentence ∀x ⊥. Mathlib's `T ⊨ᵇ ψ` quantifies over `Theory.ModelType`, whose carriers are nonempty (`Mathlib/ModelTheory/Bundled.lean` line 78, `Mathlib/ModelTheory/Satisfiability.lean` line 279), so φ is equivalent modulo T to ⊥, which is quantifier-free and hence existential; but φ holds in the empty structure, fails in a one-point structure, and the empty map is an embedding between these two models of T. Left side true, right side false. I elaborated the five facts at the pin (equivalence, `IsExistential ⊥`, the two truth values, the embedding). Reading "equivalent modulo T" over all structures, empty ones included, does not help: with one proposition letter P and no other symbol, P ∨ ∃x ⊤ is preserved by embeddings, but a prenex existential sentence with a quantifier is false in the empty structure and the quantifier-free sentences are Boolean combinations of P, so none agrees with it on the three structures (empty, P true), (empty, P false), (one point, P false).

With M nonempty the criterion is the standard one and both directions go through (prenex forms of finite conjunctions and disjunctions exist over nonempty structures). The smallest change: "for every embedding f:M↪N of nonempty models of T" in line 1248, as §0.1 (line 45) says "nonempty native structures"; the empty-model instance above would then serve as a negative-control Check.

## C01 — The locator of §4.31 gives the criterion for ℤ in ℚ only

The section now proves the criterion for an arbitrary theory and formula, and its locator is "Koenigsmann, §4, preservation criterion before Proposition 23, p.91" (line 1266). At that place (`koenigsmann_defining_z` lines 906–912) the source states the instance for ℤ in models of Th(ℚ) and refers for the general criterion to a lemma of another book, its reference [PD11]. A reader who opens p.91 for the statement of line 1248 finds a special case. Say so in the locator ("the instance for ℤ in ℚ; the general criterion is the one Koenigsmann cites there"), or add a locator for the general statement.

## Previous findings

- R01 — repaired: §4.31 says "by Robinson’s test (TauCetiRoadmap.SaturationAndQuantifierElimination §2.5)", Scope says that roadmap "owns model completeness and Robinson’s test", a `### From` contract is added; the supplier's §2.5 and its lines 410 and 437–439 agree. The rewritten target introduced R01 above.
- C01 — repaired: the ReductiveGroupsPartII contract reads "Section 2.10(b) applies this to the connected Néron special fibres."
- C02 — repaired: Scope reads "B2.7, B2.14, B2.15 and B2.18 are not used here"; the contract keeps B2.6 alone.
- C03 — repaired: the description counts "fifteen on main" and "three still open"; the fifteen folders are on main and the three are not.
- C04 — repaired: the StratifiedSpacesAndTameTopology bullet is gone from Scope and the name from the description.
- N01 — repaired: the sentence on α and β stands once, in the opening paragraph of Layer 4, and §4.15 names `Diophantine.mrdp` once.

## Verified sound

| Statement | Instances tried | Left side / constructed value | Right side / required value | Result; change |
| --- | --- | --- | --- | --- |
| §4.31 preservation criterion (R01) | empty language, T=∅, φ=∀x ⊥, M empty, N one point | φ ≡ ⊥ modulo T over nonempty models; ⊥ existential: true | M⊨φ, N⊭φ, embedding exists: preservation false | Fails; add "nonempty" |
| §4.31 criterion, other reading (R01) | language {P}, φ=P∨∃x ⊤, all structures | preserved by embeddings: true | no prenex existential sentence matches on (∅,P), (∅,¬P), (pt,¬P) | Fails; same repair |
| §4.31 criterion, nonempty models | T inconsistent; φ quantifier-free; φ=∀x(x=c), T=∅ | both sides true; both true; not existential mod T | vacuous; `IsQF.realize_embedding`; fails from one point to two | Holds |
| §4.31 recital of Robinson's test | the three forms against the supplier | elementary; existentially closed; every formula existential mod T | SaturationAndQuantifierElimination §2.5, lines 246–252: same, plus the universal form | Agrees; none |
| §4.31 Checks | ℚ⊂ℚ(√2); ACF with 𝔽₂-bar and ℂ; ℚ⊂ℝ | ∃x x²=2: F/T; 1+1=0: T/F; F/T | not existentially closed; model complete, not complete; not closed | Hold; none |
| §4.32 non-model-completeness | B=ℤ∖A, A r.e. undecidable | B definable in ℚ; existential would make B r.e. | Koenigsmann Remark 24, p.92; uses the "every formula existential" form of §2.5 | Agrees; none |
| Forward direction via Mathlib | `IsExistential.realize_embedding` | `φ.Realize v xs → φ.Realize (f∘v) (f∘xs)` | `Mathlib/ModelTheory/Complexity.lean` line 399 | Exists as cited; needs φ≡ψ in M, hence M nonempty |
| ReductiveGroupsPartII contract (old C01) | where Lang's theorem enters | §2.10(b), *Needs* line 474 | contract now says §2.10(b) | Agrees; none |

The rows of the previous review for the statements this change does not touch stand as in that review, of `f1d1e63`.

- Source locators checked against the text: 2, in 1 source (`koenigsmann_defining_z` lines 906–912 for the criterion, lines 950–964 for model completeness and Remark 24). No sampled section lies in the changed passages.
- Library declarations opened at the pins: 4 (`BoundedFormula.IsExistential`, `Mathlib/ModelTheory/Complexity.lean` line 343, prenex only; `IsExistential.realize_embedding`, line 399; `Theory.ModelType`, `Mathlib/ModelTheory/Bundled.lean` line 73, with `nonempty'` at line 78; `Theory.ModelsBoundedFormula`, `Mathlib/ModelTheory/Satisfiability.lean` line 279). Neither library has a model-completeness or existential-closedness declaration.
- Cross-roadmap citations resolved: SaturationAndQuantifierElimination §2.5 at its open head (four places in the README); B2.6 and RG2.3.7 unchanged.
- Declared gaps: the four slugs stand at README lines 1888, 1918, 1920, 1930, unchanged.
- Automatic checks: all passed on this head. Dependency check, my run: `depcheck: 171 roadmaps, 1999 edges, 0 problem(s)`; no UPWARD or CYCLE line. No file outside the folder is changed.
- Elaboration of `TauCetiRoadmap/LogicAndDefinabilityInNumberTheory/Suggested.lean`: eleven `sorry` warnings, nothing else; the file is unchanged since the previous review, so signatures and the one-tactic probe stand.
- The pull request's text was read against this head: eighteen `From TauCetiRoadmap.` contracts, fifteen suppliers on main, three open; no sentence contradicted.
- Overlap check: read SaturationAndQuantifierElimination, AxKochenErshov, LogicAndDefinabilityInNumberTheoryPartII, ShimuraVarieties; model completeness with Robinson's test is owned by SaturationAndQuantifierElimination §2.5 and cited here; existential closure of an embedding is owned here (that roadmap says so); AxKochenErshov states its theorems in another language and names §§1.3–1.5 and 2.2 here as this roadmap's; nothing shared.

Source independence: changed passages only; 3 passages compared with 1 source (the two new paragraphs of §4.31 and the new contract against `koenigsmann_defining_z` lines 906–912 and 950–964), none shared; largest share `cluckers_loeser_2008`, about 36 of 130 locators; arrangement not compared again (no layer added, removed or reordered).

Research link: Layers 1–3 state Ax–Kochen transfer and the motivic integration and transfer of Cluckers–Loeser (2008, 2005) used by Cluckers–Gordon–Halupczok (2014); Layer 4 states Koenigsmann (2016) and Colliot-Thélène–Van Geel (2014); Layers 6–7 give the Pila–Wilkie (2006) and Pila (2009) counting behind Tsimerman (2018) and Gao (2013). Rests on the README's sources and the texts read.

## Not verifiable

- The general preservation criterion in the book Koenigsmann cites at p.91 (its reference [PD11]): not in the manifest, not read (C01).
- Denef 1984, Davis 1973, Pila–Wilkie 2006, Bosch–Lütkebohmert–Raynaud, Schneider, Hodges and the waived texts: cited by locator only, as in the previous review.

## Source issues

- none

## For the human reviewers

- Supplier: SaturationAndQuantifierElimination (pull request #2866, another author) is now a supplier, for §§4.31–4.32 (README lines 1268, 1280, 1956); it is open and not yet in the merge order.
- Conditional acceptance: once R01 is settled, acceptance rests on four declared gaps not yet stated by their suppliers: NeronModelsAndSemistableAbelianVarieties §4.6, ShimuraVarieties §§3.5a and 3.5d, AbelianSchemesAndArithmeticModuliPartII B2.6 (README lines 1888, 1918, 1920, 1930).
- Licence: §§4.1–4.9 follow the statements of Cameron Freer's public formalisation `Hilbert10/PolyBridge.lean` and `NormalForm.lean` (README lines 1970–1971 give Apache-2.0); `Suggested.lean` declares none of them.
- Wording: the proof plan of §4.30 (line 1230) has the five steps and the notation N_v, D₁, D₂, E, D₃ of the proof of Colliot-Thélène–Van Geel Théorème 4.3 (p.16), condensed from about twenty lines of French to five sentences.
- Not tested: Denef 1984, Davis 1973, Pila–Wilkie 2006, Bosch–Lütkebohmert–Raynaud, Schneider and Hodges are cited by locator without the text (uncertified or waived).
- Scope: the four end theorems of Layer 7 are stated under input data (§§7.1, 7.5–7.7) whose clauses are published theorems that no roadmap plans; the README says so at lines 1854 and 1962.
