# Review of ComplexCurveModuli (pull request #2548 at a105758)

**Verdict:** accepted

**Summary.** Accepted: the folder is unchanged since the previous review, and this round read the pull request's description against the head. The description now says that ConformalMappingPartII's link still resolves through the anchor before the Layer 0 heading, which repairs the previous small correction, and its other sentences agree with the head. There is no finding and no small correction; there is one format note and one carried question about the cited version of Wendl's notes, neither blocking. Nothing is left for the human reviewers to decide.

## N01 — The description says the node-chart prototype "is kept unchanged", and its docstrings were reworded

The declarations and statements of the prototype are the same as on main, but the docstrings of `nodeProjection`, `isClosed_nodeEquation`, `NodeFiber`, `NodePullback`, `nodePullbackHomeomorph`, the two branches and `centralNodeBranches_cover` were rewritten, not only added (for example "Projection of the hypersurface to its base" is now "Projection of the node chart to its base"). The sentence would be exact as "…is kept, with its statements unchanged and its docstrings reworded".

## Questions for the author

- The References cite Wendl's notes as "version 3.3", and §3.5 cites its §§4.2–4.3. The copy that can be read openly is arXiv:1011.1690v2, which is version 3.2; there the offset map `Diff^(k+1,p) × T → J^(k,p)` is in the proof of Theorem 4.30 (Wendl lines 5743–5761). Does version 3.3 keep this numbering? Version 3.3 could not be read; if it cannot be checked, citing version 3.2 (arXiv v2) would make the locator verifiable. (Carried from the earlier reviews; the passage is unchanged.)

## Previous findings

- The previous review raised no finding. Its small correction C01 is repaired: the description now reads "No link breaks: ConformalMappingPartII (README line 25) links to the old heading anchor […], and an anchor with that id stands directly before the Layer 0 heading".

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| `finite_ordered_iff_forall_eulerChar_lt` as the description words it ("every component satisfies `χ < n_v`") | sphere, torus, genus 2; n_v = 0…3 | sphere χ = 2: `2 < n` iff n ≥ 3, Aut finite iff ≥ 3 points; torus χ = 0: n ≥ 1; genus 2: −2 < 0 always | agrees with `2g − 2 + n > 0` and with Lean lines 186–192 | none |
| Punctured existence as the description words it (`χ(M) < |P|`) | sphere with 2, 3 punctures; torus with 0, 1; P = ∅ in genus 2 | 2 < 2 false (cylinder, no hyperbolic metric of finite area); 2 < 3 true; 0 < 0 false; 0 < 1 true; −2 < 0 true (closed case) | agrees with `χ(M ∖ P) = χ(M) − |P| < 0` and Lean line 100 | none |
| §6.2 disjointness "with lengths at most `2 arsinh(1)`, equality allowed" (description) | ℓ = 2 arsinh 1 | `sinh(ℓ/2) = 1`, collar product `sinh(ℓ₁/2) sinh(ℓ₂/2) ≤ 1`; README lines 1316, 1346 state the bound with ≤ | description matches the head | none |
| Description: "About 55 Checks" | bullets under every `**Checks.**` block | 55 bullets in 32 blocks | matches | none |
| Description: the anchor paragraph | README line 127; ConformalMappingPartII line 25 on main | anchor id `d0-smooth-curves-finite-type-and-the-classification-floor` = the link's fragment; it stands two lines before "## Layer 0" (line 129) | true | none |
| Description: the node-chart prototype "is kept unchanged" | diff of the Layer 2 part of the Lean file against main | no declaration or statement line differs; eight docstrings reworded, eight `#print axioms` lines removed | statements unchanged; wording note | N01 |

The rows for the untouched statements stand as in the previous review, of `a105758`.

- Changed passages in the folder: none (0 lines); `Suggested.lean` unchanged. No source locator was added or changed, so the seeded sample has no target in a changed passage and no source text was opened this round.
- Description against the head, sentence by sentence: section order (overview, guide, Conventions, Layers 0–8, Downstream consumers, Scope and ownership, Exact supplier contracts, References); §§0.1a–0.1f, 1.1–1.4, 5.1–5.6, 8.1–8.3, 7.0 all present; every numbered section has a *Needs:* line (0 without); Downstream consumers names D0.1, D0.3, D0.4, D0.5, D3.4, D6.2 (README lines 1721–1724); the 17 supplier subsections are exactly the 17 the description lists; the arXiv version note is in References; locators 3.7–3.8, 5.3–5.6, 6.5–6.6, 8.1, 9.2, 17.3, 17.5 each occur in the layers; the table under Scope and ownership is at lines 1814 onward.
- Description against the Lean file: namespace `TauCetiRoadmap.ComplexCurveModuli` (line 60); no `#print axioms`, no `set_option`; `CircleSobolevCoefficients` absent; the seven added theorems and `HasGeodesicBoundary` are declared under the names the description gives (lines 70, 81, 100, 118, 139, 152, 166, 186); the import of `…RiemannSurface.Degree` is gone and eight Tau Ceti modules are imported; no other Lean file in the repository imports the module.
- Library declarations opened at the Tau Ceti pin (named by the description): `CircleSobolev.exists_analyticAt_hardyGraph` (Analysis/Sobolev/Circle/HardyGraph.lean:190), `analyticAt_neckEvaluation_mul` (Analysis/Sobolev/Circle/Plumbing.lean:122), `Manifold.IsGeodesicCurve` (Geometry/Manifold/Riemannian/Geodesic/Basic.lean:115), `NodalGluing.AuxiliaryAut.finite_ordered_iff` (AlgebraicGeometry/Curves/NodalGluing/FiniteAutomorphisms.lean:126), `HyperbolicMetric.eq_of_metric_eq_rescale` (Geometry/Manifold/Riemannian/Hyperbolic/ClosedSurface.lean:105), the Riemann–Hurwitz formula `FiniteHolomorphicMap.eulerChar_eq_degree_mul_eulerChar_sub_ramificationDegree` (Analysis/Complex/RiemannSurface/Branch/EulerCharacteristic.lean:49, 117).
- Cross-roadmap claims of the description resolved on main: GeometricTopology §1.7 "Compact smooth surfaces" (line 1049), §3.3 "Isotopy extension" (line 1504), the handle calculus listed as not a target (line 156); ModularForms §10B (line 1173); ComplexComparisonPartII §C-1.1 (line 31); ConformalMappingPartII line 25.
- Dependency check output: `depcheck: 182 roadmaps, 2073 edges, 0 problem(s)`. No UPWARD or CYCLE line. The pull request changes nothing outside `TauCetiRoadmap/ComplexCurveModuli/`.
- Elaboration of `TauCetiRoadmap/ComplexCurveModuli/Suggested.lean`: seven `sorry` warnings (lines 70, 81, 100, 118, 152, 166, 186) and nothing else.
- Automatic checks: all passed; none set aside.

Overlap check: read AnalyticStableMaps, GromovWittenTheory and HeegaardFloer (main and open heads) and TeichmullerGeometry (main), as in the previous review; nothing shared, and the folder did not change. The overlap listing shows no open pull request changing this roadmap, no cited id dropped and no id dropped here that others cite.

Source independence: changed passages only; 0 passages compared, since the folder has no changed passage; largest share RobbinSalamon2006, 21 of 24 body locators, unchanged; no layer was added, removed or reordered, so the comparison of contents stands as in the previous review: independent. The corrigendum was not read.

Research link: Layers 3–6 are the analytic construction of the Deligne–Mumford orbifold of Robbin and Salamon (2006, corrigendum 2007), extended in §4.5 to all restricted families; AnalyticStableMaps and GromovWittenTheory build stable-map moduli and Gromov–Witten operations on it. Rests on the README's Downstream consumers and References and on RobbinSalamon2006 §§5–6, 17.

## Not verifiable

- Robbin–Salamon corrigendum (J. Eur. Math. Soc. 9 (2007), 901–905): behind a subscription, recorded as uncertified; not read. The description's remark that its abstract confirms the numbering of Lemma 8.2 was not checked against the abstract.
- Wendl, version 3.3: not read; version 3.2 (arXiv v2) was read in an earlier review (see the question above).
- That the hosting site scrolls to an `<a id>` anchor of a rendered README was not tested on the site; the id was compared with the link's fragment.
- The part of the description after the generated dependency and merge-order blocks, if any, was not in the quoted text.

## Source issues

- none

## For the human reviewers

- none
