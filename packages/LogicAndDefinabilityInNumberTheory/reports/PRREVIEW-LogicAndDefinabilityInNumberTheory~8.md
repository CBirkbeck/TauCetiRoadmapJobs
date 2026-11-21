# Review of LogicAndDefinabilityInNumberTheory (pull request #2276 at 260ffb1)

**Verdict:** accepted

**Summary.** Accepted: no finding remains. The one finding of the previous review is repaired: the existential preservation criterion of §4.31 is now stated for embeddings of nonempty models, its forward direction is argued correctly, and the empty-structure counterexample stands as a negative-control Check; the locator now says that Koenigsmann states only the instance for ℤ in ℚ. There are no small corrections and no format notes. The acceptance is conditional on the four declared supplier gaps and on the open supplier SaturationAndQuantifierElimination, which the human reviewers are told of.

## Previous findings

- R01 — repaired: §4.31 reads "for every embedding f:M↪N of nonempty models of T", states that models are nonempty "as are the carriers of Mathlib `FirstOrder.Language.Theory.ModelType`", and adds the empty-structure instance as a Check. No new problem.
- C01 — repaired: the locator reads "§4, p.91, before Proposition 23: the instance of the criterion for ℤ in ℚ, which the source derives from a general lemma of a textbook it cites"; `koenigsmann_defining_z` lines 906–912 say so.

## Verified sound

| Statement | Instances tried | Left side / constructed value | Right side / required value | Result; change |
| --- | --- | --- | --- | --- |
| §4.31 preservation criterion, nonempty models | empty language, T=∅, φ=∀x ⊥, M and N nonempty | φ false in every nonempty structure; ≡ ⊥ modulo T; ⊥ existential: true | preservation vacuous (M⊭φ): true | Holds; the instance of the earlier finding is now excluded |
| §4.31 criterion, further instances | T inconsistent; φ quantifier-free; φ=∀x(x=c), T=∅ | true; true; not existential mod T | vacuous; `IsQF.realize_embedding`; true at one point, false after embedding into two | Holds both directions |
| §4.31 criterion, converse route | sentence (no free variable), language without constants | diagram argument gives T⊨∀x(∃y δ→φ); empty disjunction is ⊥ | generalising the new constants and prenexing a disjunction both need nonempty models | Holds with the stated clause |
| §4.31 forward direction as rewritten | ψ existential with φ ⇔[T] ψ, f:M↪N | M⊨φ(a) ⇒ M⊨ψ(a) ⇒ N⊨ψ(fa) ⇒ N⊨φ(fa) | `IsExistential.realize_embedding`, `Mathlib/ModelTheory/Complexity.lean` line 399; first and last step need M, N nonempty models | Correct as written |
| §4.31 new Check (empty structure) | empty language, T=∅, φ=∀x ⊥ | equivalent mod T to ⊥ (existential): left side true | empty ⊨ φ, one point ⊭ φ, empty map is an embedding: right side false | Check true; it separates the two conventions |
| §4.31 sentence on `Theory.Iff` | definition at the pin | `T.Iff φ ψ := T ⊨ᵇ φ.iff ψ`, `Mathlib/ModelTheory/Equivalence.lean` line 109 | `ModelsBoundedFormula` quantifies over `ModelType T`, `Satisfiability.lean` line 279; `nonempty'`, `Bundled.lean` line 78 | True as stated |
| Contract with SaturationAndQuantifierElimination §2.5 | "that roadmap's equivalence modulo T quantifies" over `ModelType` | supplier Conventions: equivalence modulo T is `φ ⇔[T] ψ`; models "as in … `Theory.ModelType`" | supplier §2.5: the three forms recited here, plus the universal form | Agrees |
| Robinson's test under the nonempty convention | T={∀x∀y x=y}, empty language | nonempty models: one point only, model complete, every formula existential mod T | with the empty model admitted: ∅↪point not elementary (∃x ⊤) | The clause "models nonempty" is needed and is stated |

The rows of the previous review for the statements this change does not touch stand as in that review, of `bc597bd`.

- Source locators checked against the text: 1 (`koenigsmann_defining_z` lines 906–912, on the page of the extraction that is printed p.91; the instance for ℤ in ℚ and the reference to a lemma of another book). Of the seeded sample only §4.31 lies in the changed passages.
- Library declarations opened at the pin: 5 (`Theory.Iff`, `Mathlib/ModelTheory/Equivalence.lean` line 109; `Theory.ModelsBoundedFormula`, `Mathlib/ModelTheory/Satisfiability.lean` line 279; `Theory.ModelType` with `nonempty'`, `Mathlib/ModelTheory/Bundled.lean` line 78; `BoundedFormula.IsExistential`, `Mathlib/ModelTheory/Complexity.lean` line 343; `IsExistential.realize_embedding`, line 399).
- Cross-roadmap citations resolved: SaturationAndQuantifierElimination §2.5 and its Conventions at its open head; that roadmap names §4.31 here as a consumer of §2.5 and nothing of this roadmap as a supplier.
- Declared gaps: the four slugs stand at README lines 1889, 1919, 1921, 1931, text unchanged.
- Automatic checks: all passed on this head. Dependency check, my run: `depcheck: 171 roadmaps, 1999 edges, 0 problem(s)`; no UPWARD or CYCLE line. No file outside the folder is changed; the change since `bc597bd` is nine lines of the README.
- Elaboration of `TauCetiRoadmap/LogicAndDefinabilityInNumberTheory/Suggested.lean`: eleven `sorry` warnings, nothing else; the file is unchanged since the previous review, so the signatures and the one-tactic probe stand.
- The pull request's text was read against this head: eighteen `From TauCetiRoadmap.` contracts (fifteen suppliers on main, three open); its sentence on §4.31 ("existential closure of one embedding and the existential preservation criterion for one formula") still describes the section; no sentence contradicted, no change left unstated.
- Overlap check: read SaturationAndQuantifierElimination, AxKochenErshov, LogicAndDefinabilityInNumberTheoryPartII, ShimuraVarieties (the last three as in the previous review; the change touches none of their objects); model completeness with Robinson's test is owned by SaturationAndQuantifierElimination §2.5 and cited here; existential closure of an embedding and the one-formula preservation criterion are owned here; nothing shared.

Source independence: changed passages only; 4 passages compared with 1 source (the two rewritten paragraphs of §4.31, the new Check and the locator sentence against `koenigsmann_defining_z` lines 906–912), none shared; largest share `cluckers_loeser_2008`, about 36 of 130 locators; arrangement not compared again (no layer added, removed or reordered).

Research link: Layers 1–3 state Ax–Kochen transfer and the motivic integration and transfer of Cluckers–Loeser (2008, 2005) used by Cluckers–Gordon–Halupczok (2014); Layer 4 states Koenigsmann (2016) and Colliot-Thélène–Van Geel (2014); Layers 6–7 give the Pila–Wilkie (2006) and Pila (2009) counting behind Tsimerman (2018) and Gao (2013). Rests on the README's sources and the texts read.

## Not verifiable

- The general preservation criterion in the book Koenigsmann cites at p.91 (its reference [PD11]): not in the manifest, not read; the README's locator now claims only the instance and the reference, both read.
- Denef 1984, Davis 1973, Pila–Wilkie 2006, Bosch–Lütkebohmert–Raynaud, Schneider, Hodges and the waived texts: cited by locator only, as in the previous review.

## Source issues

- none

## For the human reviewers

- Supplier: SaturationAndQuantifierElimination (pull request #2866, another author) is a supplier, for §§4.31–4.32 (README lines 1269, 1281, 1957); it is open and not yet in the merge order.
- Conditional acceptance: acceptance rests on four declared gaps not yet stated by their suppliers: NeronModelsAndSemistableAbelianVarieties §4.6, ShimuraVarieties §§3.5a and 3.5d, AbelianSchemesAndArithmeticModuliPartII B2.6 (README lines 1889, 1919, 1921, 1931).
- Licence: §§4.1–4.9 follow the statements of Cameron Freer's public formalisation `Hilbert10/PolyBridge.lean` and `NormalForm.lean` (README lines 1971–1972; the previous review read the licence there as Apache-2.0); `Suggested.lean` declares none of them.
- Wording: the proof plan of §4.30 has the five steps and the notation N_v, D₁, D₂, E, D₃ of the proof of Colliot-Thélène–Van Geel Théorème 4.3 (p.16), condensed from about twenty lines of French to five sentences.
- Not tested: Denef 1984, Davis 1973, Pila–Wilkie 2006, Bosch–Lütkebohmert–Raynaud, Schneider and Hodges are cited by locator without the text (uncertified or waived).
- Scope: the four end theorems of Layer 7 are stated under input data (§§7.1, 7.5–7.7) whose clauses are published theorems that no roadmap plans; the README says so in its scope section and under "Input hypotheses of Layer 7".
