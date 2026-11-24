# Review of NeronModelsAndSemistableAbelianVarieties (pull request #2708 at 6fa0bae)

**Verdict:** accepted

**Summary.** Accepted: this is an incremental re-review of the one sentence added to 3.9a since the last reviewed head, and of the pull request's title and description. The added sentence (no step of the route for the converse uses that `k` is perfect) is true of every input the route names, and it repairs the previous small correction; the title and description agree with the head. There are no findings and no small corrections; four format notes are carried over unchanged, none blocking. Two questions for the author and four facts for the human reviewers stand as before.

## N01 — One Fontaine range starts a page early

In 5.3 (README line 2769) "Exposé VIII, … §§2.3.2–2.3.7, pp. 335–339": §2.3.2 begins on p. 336, and p. 335 carries §2.3.1. The References entry already gives 336.

## N02 — The Serre locator in 5.3a gives the page of the file, not the printed page

In 5.3a (README line 3020) "Serre 1970, n° 2.4, cases b), c), p. 10": the cases are on the printed page 19-09, which is the tenth page of the Numdam file.

## N03 — `HasNodalReduction` is also a declaration of the pinned Tau Ceti

3.9a and 6.14 cite `HasNodalReduction` only as StableReduction Layer 7's predicate. `TauCeti.HasNodalReduction` exists at the pin (`TauCeti/AlgebraicGeometry/Curves/StableReduction/NodalReduction.lean`); it would help to list it under "From Tau Ceti".

## N04 — Two sentences that are unclear or ungrammatical

In 5.1a (README lines 2665–2666) "over the fixed field of the kernel of `I_K` on `A[m]`": that field is a finite extension of the maximal unramified extension of `K`, not a local field in the sense of the sentence; naming it would say which base is meant. In the Examples of Layer 6 (README line 4051) "The worked comparisons of this roadmap combines" should read "combine".

## Questions for the author

- In 5.3e Saito's formula is stated for a *complete* discrete valuation ring with perfect residue field, while Liu's introduction sets it up for any discrete valuation ring with perfect residue field. Is completeness in Saito's Theorem 1, or added here? Saito 1988 is behind a paywall and I could not read it.
- In 1.6 the weak Néron model is cited to "Bosch–Lütkebohmert–Raynaud, §1.2, Definition 1, p. 12", the same locator 1.1 gives for the Néron mapping property. Is the weak model defined there, or in §1.1? The book is behind a paywall and I could not read it.

## Previous findings

The previous review (of `9cfa998`) had no findings. Its other remarks:

- C01 — repaired: 3.9a now reads "No step of the route below uses that `k` is perfect; the hypothesis is kept only because the sources state the converse under it." (README lines 1332–1333).
- N01 — not repaired: README line 2769 still reads "pp. 335–339"; written again above.
- N02 — not repaired: README line 3020 still reads "p. 10"; written again above.
- N03 — not repaired: "From Tau Ceti" does not list `TauCeti.HasNodalReduction`; written again above.
- N04 — not repaired: both sentences are unchanged; written again above.
- N05 — repaired: the generated blocks now mark #2578 as done and say that no open pull request must merge before this one.

The repair introduced no new problem.

## Verified sound

| Statement | Instances tried | Values, one side | Values, other side | Result |
|---|---|---|---|---|
| 3.9a, added sentence: the converse route does not use `k` perfect | each input of the route, read at this head and on main | StableReduction end goals: "no completeness, Henselian, algebraic-closure, or perfect-residue-field hypothesis"; Layer 7 simultaneous at every maximal ideal of `R̃`; 3.8 "no henselian or residue-field hypothesis"; 3.9 "no residue-field hypothesis enters"; 3.3 open-immersion theorem "over an arbitrary discrete valuation ring" | `StablePicardFaithful` is applied at geometric points; `R̃ ⊗_R R̃` flat over `R` since `R̃` is finite torsion-free; Stacks 41.7.2 and SchemeAndStackFoundations §4.15 (`isom_stable_curves`, `Mbar.isStack`, lines 7060–7073) carry no residue-field hypothesis | True of the route as written; the statement itself keeps `k` perfect, as the sources do |
| 3.9a converse, statement unchanged | genus-one torsor under good `E/ℚ_p`; genus 2 `y² = (x²−p)(x−1)(x−2)(x−3)`, `p ≥ 5` | `Jac = E` semistable, `t = 0`; a nodal model would contract to a smooth one, Lang plus Hensel give a rational point: contradiction | genus 2: one node, `t = 1`, `a = 1`, `t + a = 2 = g` | `g ≥ 2` needed; consistent with the added sentence, which concerns `k` only |
| Pull request title and description against the head | every bullet of the description | diff against main: 1 heading added (3.9a), 0 removed; `Suggested.lean` changes only the docstring of `GoodIsogeny`; 6 layers; no file outside the folder | description: the same; StableReduction on main, Layer 7 note and Downstream consumers ("consumes Layers 0–7", "in a Part II of this one") as quoted | Agree; no sentence contradicted, no removal or supplier change unstated |

The rows for all other statements stand as in the previous review, of `9cfa998`.

- Source locators checked against the text this round: 0 new; the added sentence cites none. The two it follows (Deligne–Mumford §2, p. 87; Stacks Remark 55.18.2) were read by the previous review.
- Library declarations opened at the pin: 1 (`TauCeti.HasNodalReduction`, NodalReduction.lean, module docstring line 31).
- Cross-roadmap citations resolved: StableReduction on main (end goals lines 31–37; Layer 7 note lines 643–656; Layer 8 heading line 658; Downstream consumers lines 951–953); SchemeAndStackFoundations §4.15 (lines 7054–7073); 3.3, 3.8, 3.9 of this README.
- Seeded sample: none of the sampled sections lies in the changed passage.
- Automatic checks: all passed at this head, rerun; none set aside.
- Elaboration: `sorry` warnings at lines 68, 83, 112, 124 and nothing else. `Suggested.lean` is unchanged since `9cfa998`, so the one-tactic probe and the signature comparison of the previous review stand.
- Changes outside the folder: none.
- The other open pull request that changes this folder merges cleanly with this one, and the description's merge-order block states the order (this one first).

Dependency check output:

```text
depcheck: 132 roadmaps, 1476 edges, 0 problem(s)
```

No UPWARD or CYCLE line.

Overlap check: read AbelianSchemesAndArithmeticModuli, RelativeJacobiansAndIntegralCurveModels, FaltingsFinitenessAndIsogenyTheorems (as in the previous review; the change adds no object), and StableReduction on main for the criterion, which it says is not its target; nothing shared.

Source independence: changed passages only: 1 passage (the added sentence of 3.9a), a remark on the roadmap's own route with no counterpart in a source, compared with 0 sources this round, none shared; largest share conrad-semistable, about 38 of about 270 locators, as in the previous review; contents not compared again (no layer added, removed or reordered). Bosch–Lütkebohmert–Raynaud and SGA 7 I could not be read.

Research link: 3.9a is Deligne–Mumford (1969), Theorem 2.4; 3.10–3.12 are Grothendieck's semistable reduction theorem and criterion (SGA 7 I, 1972); 4.6 is Werner (1997); 5.3 rests on Coleman–Iovita (1999) and Fontaine (1994); 6.10–6.13 feed Boxer–Calegari–Gee–Pilloni (2021, 2025). Rests on the README and the sources read.

## Not verifiable

- Nothing new in the changed passage. As before: Bosch–Lütkebohmert–Raynaud, SGA 7 I Exposé IX, Serre–Tate 1968, Tate's *Algorithm*, Saito 1988, Faltings–Chai, Darmon–Diamond–Taylor, Noot 2013, Illusie 2021, Silverman and the Yuan–Zhang erratum were not read (paywalled, uncertified, or no legal copy found).

## Source issues

- none

## For the human reviewers

- Licence: the References link Tate's *Algorithm* (Lecture Notes in Mathematics 476) to a scan on a site that is not the author's (README, the Tate entry of References).
- Licence: the supplier contract for RigidAnalyticGeometry links Huber's article to a copy in the reference folder of another person's seminar page (README, "From `TauCetiRoadmap.RigidAnalyticGeometry`").
- Licence: the Provenance section names two Apache-2.0 Lean repositories as prior art for 1.8, 1.9, 5.0a, 2.8, 6.5 and 6.6 and says `HasGoodModel` differs from their good-reduction predicate. I did not open those repositories.
- Not tested: Bosch–Lütkebohmert–Raynaud and SGA 7 I, the sources with the second and third largest shares of the locators, could not be read; wording and arrangement were compared with the largest (Conrad's notes) only, by the previous review.
