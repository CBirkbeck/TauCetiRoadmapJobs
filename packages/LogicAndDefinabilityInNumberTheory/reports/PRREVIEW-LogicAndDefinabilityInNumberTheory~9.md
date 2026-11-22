# Review of LogicAndDefinabilityInNumberTheory (pull request #2276 at 30f01ec)

**Verdict:** accepted

**Summary.** Accepted: no finding. The change removes the open roadmap SaturationAndQuantifierElimination as a supplier; §4.31 now states only existential closure and the one-formula preservation criterion, and §4.32 derives "not every embedding between models of Th(ℚ) is elementary" from that criterion directly, which is a correct argument and is what Koenigsmann's Remark 24 states. There are no small corrections and no format notes. The acceptance is conditional on the four declared supplier gaps, which the human reviewers are told of.

## Previous findings

- none: the previous report, of `260ffb1`, had no finding, small correction or format note of its own (its R01 and C01 bullets recorded repairs of an earlier report; both passages are untouched at this head).

## Verified sound

| Statement | Instances tried | Left side / constructed value | Right side / required value | Result; change |
| --- | --- | --- | --- | --- |
| §4.32, not every embedding of models of Th(ℚ) is elementary | A⊂ℤ RE, not recursive; B=ℤ∖A | all embeddings elementary ⇒ every formula preserved ⇒ (§4.31, models are fields, nonempty) B existential in ℚ ⇒ B RE | A and B both RE ⇒ A recursive: contradiction | Holds; agrees with `koenigsmann_defining_z` lines 956–964 |
| §4.32, step "every formula preserved" | f:K↪L elementary, φ any formula, a from K | K⊨φ(a) ⇔ L⊨φ(f a) by definition of elementary | hypothesis of the §4.31 criterion needs only ⇒, for nonempty models of T | Step valid; no appeal to Robinson's test remains |
| §4.32, inline gloss of model completeness | T={∀x∀y x=y}, empty language; ACF | every embedding between (nonempty) models elementary: model complete | Koenigsmann lines 950–953: same definition; open roadmap SaturationAndQuantifierElimination §2.5: same, nonempty models | Gloss agrees with both; models of Th(ℚ) are never empty |
| §4.32 new Check (complete, not model complete) | Th(ℚ); Th of algebraically closed fields | Th(ℚ)={σ : ℚ⊨σ}: for each σ, σ or ¬σ belongs: complete | not model complete by the statement above; ACF is the reverse (model complete, 1+1=0 undecided) | Check true; it separates the two notions |
| §4.31 as shortened | criterion with T=∅, φ=∀x ⊥, empty language | nonempty models: φ ≡ ⊥, existential; preservation vacuous | with the empty structure: φ true in ∅, false in a point | Statement and Check unchanged by the deletion; still hold |
| §4.31 and §4.32 *Needs:* lines | each input of the new route | criterion (§4.31), ℤ definable in ℚ (§4.24), RE sets Diophantine (§4.15), nonpowers (§4.30) | all four are sections of this roadmap; `IsExistential.realize_embedding` at `Mathlib/ModelTheory/Complexity.lean` line 399 | No external supplier is needed for either section |

The rows of the previous review for the statements this change does not touch stand as in that review, of `260ffb1`.

- Source locators checked against the text: 2 (`koenigsmann_defining_z` lines 950–955, the definition of model completeness, and lines 956–964, Remark 24 with its proof, on the page of the extraction printed as p.92; the README's locator "Remark 24, p.92" is right). No target of the seeded sample lies in the changed passages.
- Library declarations opened at the pin: 2 (`FirstOrder.Language.BoundedFormula.IsExistential`, `Mathlib/ModelTheory/Complexity.lean` line 343; `IsExistential.realize_embedding`, line 399), the two the shortened *Needs:* line of §4.31 keeps.
- Cross-roadmap citations resolved: the change removes every citation of SaturationAndQuantifierElimination (the scope bullet, the contract, three *Needs:*/Dependencies entries); no mention of it remains in the README or in `Suggested.lean`. The seventeen `From TauCetiRoadmap.` contracts that remain name roadmaps that are all on main (fifteen under `TauCetiRoadmap/`, Chebotarev and RealAlgebraicGeometry under `Completed/`).
- Heading anchor: §4.31 is renamed "Existential closure"; the one internal link (the *Needs:* line of §4.32) uses the new anchor; no roadmap on main or at an open head links to the old one.
- Declared gaps: the four slugs stand in the supplier contracts (README lines 1890, 1920, 1922, 1932), text unchanged.
- Automatic checks: all passed on this head. Dependency check, my run: `depcheck: 150 roadmaps, 1726 edges, 0 problem(s)`; no UPWARD or CYCLE line. No file outside the folder is changed; the change since `260ffb1` is 25 lines of the README.
- Elaboration of `TauCetiRoadmap/LogicAndDefinabilityInNumberTheory/Suggested.lean`: eleven `sorry` warnings, nothing else; the file is unchanged since the previous review, so the signatures and the one-tactic probe stand.
- The pull request's text was read against this head: "seventeen roadmaps, all on main" and "No supplier is in an open pull request" are now exact; "§4.32 applies the criterion to Th(ℚ), including the statement that Th(ℚ) is not model complete" describes the head. No sentence contradicted, no change left unstated.
- Overlap check: read SaturationAndQuantifierElimination, LogicAndDefinabilityInNumberTheoryPartII, AxKochenErshov, ShimuraVarieties; the predicate of model completeness and Robinson's test are owned by SaturationAndQuantifierElimination §2.5 and are neither targets nor inputs here (§4.32 states its result as a statement about embeddings and glosses the term in one clause); existential closure of an embedding and the one-formula preservation criterion are owned here; nothing shared.

Source independence: changed passages only; 3 passages compared with 1 source (the rewritten final sentences of the statement of §4.32, its rewritten proof-plan sentence and the new Check against `koenigsmann_defining_z` lines 950–964), none shared; largest share `cluckers_loeser_2008`, about 36 of 130 locators; arrangement not compared again (no layer added, removed or reordered).

Research link: Layers 1–3 state Ax–Kochen transfer and the motivic integration and transfer of Cluckers–Loeser (2008, 2005) used by Cluckers–Gordon–Halupczok (2014); Layer 4 states Koenigsmann (2016) and Colliot-Thélène–Van Geel (2014); Layers 6–7 give the Pila–Wilkie (2006) and Pila (2009) counting behind Tsimerman (2018) and Gao (2013). Rests on the README's sources and the texts read.

## Not verifiable

- The general preservation criterion in the book Koenigsmann cites at p.91 (its reference [PD11]): not in the manifest, not read; the README's locator claims only the instance and the reference, both read in the previous review.
- Denef 1984, Davis 1973, Pila–Wilkie 2006, Bosch–Lütkebohmert–Raynaud, Schneider, Hodges and the waived texts: cited by locator only, as in the previous review.

## Source issues

- none

## For the human reviewers

- Neighbouring open roadmap: SaturationAndQuantifierElimination (pull request #2866, another author) still lists this roadmap's §4.31 as a consumer of its §2.5 (its README line 437); at this head §4.31 and §4.32 no longer use it.
- Conditional acceptance: acceptance rests on four declared gaps not yet stated by their suppliers: NeronModelsAndSemistableAbelianVarieties §4.6, ShimuraVarieties §§3.5a and 3.5d, AbelianSchemesAndArithmeticModuliPartII B2.6 (README lines 1890, 1920, 1922, 1932).
- Licence: §§4.1–4.9 follow the statements of Cameron Freer's public formalisation `Hilbert10/PolyBridge.lean` and `NormalForm.lean` (README, References; an earlier review read the licence there as Apache-2.0); `Suggested.lean` declares none of them.
- Wording: the proof plan of §4.30 has the five steps and the notation N_v, D₁, D₂, E, D₃ of the proof of Colliot-Thélène–Van Geel Théorème 4.3 (p.16), condensed from about twenty lines of French to five sentences.
- Not tested: Denef 1984, Davis 1973, Pila–Wilkie 2006, Bosch–Lütkebohmert–Raynaud, Schneider and Hodges are cited by locator without the text (uncertified or waived).
- Scope: the four end theorems of Layer 7 are stated under input data (§§7.1, 7.5–7.7) whose clauses are published theorems that no roadmap plans; the README says so in its scope section and under "Input hypotheses of Layer 7".
