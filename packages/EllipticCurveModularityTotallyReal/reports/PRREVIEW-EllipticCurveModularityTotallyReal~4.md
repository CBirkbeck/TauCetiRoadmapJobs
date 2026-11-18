# Review of EllipticCurveModularityTotallyReal (pull request #2185 at b6dc827)

**Verdict:** accepted

**Summary.** Accepted: the one finding of the previous review is repaired. The four passages that made EllipticCurveModularity a consumer of the case `K = ℚ` of §4.4 now say that this case is a second proof of the existence of the newform, that EllipticCurveModularity obtains it from classical Serre modularity without this roadmap, and that the parametrisation, the equivalence of formulations and the functional equation stay in its Layers R29.5–R29.6; each of these sentences agrees with that roadmap's head, and the pull request's description was brought into line. There are no small corrections and no format notes. The acceptance is conditional on the three declared supplier gaps, and the status of the two unrefereed main sources is left to the human reviewers.

## Previous findings

- R01 — repaired: "Over ℚ the main theorem gives a second proof, by a different route, of the existence of the newform that EllipticCurveModularity obtains from classical Serre modularity; that roadmap does not use this case" (Summary, lines 38–41); the Check of §4.4 and Downstream consumers no longer name EllipticCurveModularity; Scope and ownership (lines 1221–1227) assigns R29.3–R29.6 to it.
- C01 (small correction of the previous report) — repaired: the description now says "Over ℚ it is a second proof of modularity; EllipticCurveModularity proves that through classical Serre modularity, never uses this one".

## Verified sound

Incremental re-review of 24 changed lines of the README since `a433195`; `Suggested.lean` and `metadata.toml` are unchanged, and nothing outside the folder changed.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §4.4 endpoint, case K = ℚ (cited by the changed Summary and scope text) | d = 1, p = 101, n = 3p; CM curve over ℚ | max{100, 2d+1} = 100 < 101; n = 303, φ(303) = 2·100 = 200, [L:ℚ] = 100; T imaginary quadratic, so T ⊄ ℚ and §4.3 applies | holds with no hypothesis on E | none |
| "Second proof … that roadmap does not use this case" (Summary, Scope and ownership) | EllipticCurveModularity at its open head: Summary, the guide to its layers, a search for this roadmap's name | existence from ClassicalSerreModularity §R27.6 via R29.2 and R29.3; 0 mentions of this roadmap or of a totally real base; it stands earlier in the merge order | sentence true; one owner for the rational existence theorem | none |
| "Layers R29.5–R29.6" and "R29.3 … R29.4" (Scope and ownership) | headings of EllipticCurveModularity at its head | R29.3 one newform with exact coefficients; R29.4 every Euler factor; R29.5 parametrisations; R29.6 three equivalent formulations, continuation and functional equation | each layer holds what is attributed to it | none |
| Check of §4.4, "This case is BCDT01, Theorem A … which the route here does not use" | BCDT01 line 15; the README's supplier citations | Theorem A is modularity of every E/ℚ; BCDT01 is cited at lines 1108 and 1224 only, never under a *Needs:* line; no ClassicalSerreModularity citation in the README | holds | none |

The rows of the previous review, of `a433195`, for the untouched statements (§§1.1–4.3 and the Conventions) stand as they are there.

- Source locators checked against the text: 2 in the changed passages and the sampled §4.4 (BCDT01 line 15; LeHung26 lines 86–88). Both agree with the README.
- Library declarations opened at the pins: none new; no Lean statement changed.
- Cross-roadmap citations resolved: EllipticCurveModularity Layers R29.3, R29.4, R29.5, R29.6 at the head of its open pull request; every one exists with the stated content. No citation found nowhere.
- Dependency check: `depcheck: 212 roadmaps, 2281 edges, 0 problem(s)`; no UPWARD or CYCLE line. EllipticCurveModularity is named only as the owner of statements not used here and is not a supplier.
- Automatic checks, run again on this head: all pass. Targeted build of the `Suggested` module: `Build completed successfully`, the two `sorry` warnings (lines 58 and 80) and nothing else; direct elaboration gives the same two warnings.
- Elaborated signatures of the two declarations compared with the README statements of §1.1 and §2.3: unchanged from the previous review, no binder lost. Headlines and padding: as in the previous review (two statable headlines stated, the others named in the module docstring, no padding).
- The pull request's title and description against this head: a new folder with README, `Suggested.lean` and `metadata.toml`, two declarations, the case ℚ described as a second proof; no sentence contradicted.
- Source issues of the previous report (one misprint in LeHung26, one in BLGG13II) stand; none found in this round.

Overlap check: read EllipticCurveModularityImaginaryQuadraticPartII, EllipticCurveModularityImaginaryQuadratic, EllipticCurveModularityPartIIGL2TypeAbelianVarieties, SmallRamificationAndAbelianVarietyBaseCases, ArithmeticGaloisRepresentations, AutomorphicGaloisRepresentationsPartII (as in the previous review) and EllipticCurveModularity again at its head; the covers, character systems, lattices and `SymplecticTorsionEquiv` are owned by EllipticCurveModularityImaginaryQuadratic and imported by name; the newform, parametrisation and analytic statements over ℚ are owned by EllipticCurveModularity R29.3–R29.6 and this README now says so; nothing else shared.

Source independence: changed passages only: 4 passages compared with 2 sources (the Summary sentence and the scope paragraph against LeHung26 lines 84–90 and BCDT01 lines 13–18), none shared; largest share LeHung26, 35 of 87 citations; no layer added, removed or reordered, so the contents stand as compared in the previous review: independent.

Research link: §4.4 is Theorem 1.1 of Le Hung (2026), the totally real case of the geometric prime switch of OpenAI (2026), built on Freitas–Le Hung–Siksek (2015), Breuil–Diamond (2014) and Breuil–Conrad–Diamond–Taylor (2001) for K = ℚ; rests on the README's References and on the texts of LeHung26 and FLHS15.

## Not verifiable

- The published numbering of BD14, BLGG12 and BLGG13II was not compared with the arXiv versions read; the README cites the arXiv versions.
- The sentence of Downstream consumers that §4.4 "removes degree restrictions on the base field" in ModularityAndLanglandsExtensions: no statement there over a totally real base was located to compare (untouched text).

Automatic checks set aside as false positives: the worker's targeted build was reported as terminated by a signal before it finished; run again on the same head it completes successfully with `sorry` as the only warning, so the stop was the run's, not the file's.

## Source issues

- none

## For the human reviewers

- **Scope.** LeHung26, the source with the largest share (35 of 87 citations), is a discussion draft of 7 October 2026, not refereed; its Theorem 1.1 (LeHung26 line 86) assumes inputs of OpenAI26, an unrefereed preprint (README, References).
- **Scope.** LeHung26 lines 147–149 state that its first draft, apart from the introduction, was generated by an AI system and then proofread and edited.
- **Licence.** LeHung26 is read from `hexagonmath.org` and OpenAI26 from a GitHub repository at a fixed revision (README, References); no licence statement was found in the LeHung26 text, and the status of neither host was settled here.
- **Conditional acceptance.** Three declared supplier gaps remain open contracts: weight-two lifting (GL2ModularityLifting Layer 5), solvable residual modularity (GL2AutomorphicRepresentationsAndTransfer R17.5) and the CM endomorphism field (ComplexMultiplicationAndExplicitReciprocity Layer 1); README, Exact supplier contracts.
