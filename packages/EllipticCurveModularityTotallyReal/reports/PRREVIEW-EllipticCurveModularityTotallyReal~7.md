# Review of EllipticCurveModularityTotallyReal (pull request #2185 at 4588f93)

**Verdict:** accepted

**Summary.** Accepted: this is an incremental re-review of the 12 lines changed since `77d2100` and of the pull request's title and description. The three small corrections of the previous review are repaired, in the README and in the description, and the repairs say nothing false about JacobianChallenge, ModularityAndLanglandsExtensions or EllipticCurveModularity as they stand now. There is no finding and no small correction; one format note is carried over, not blocking. The acceptance remains conditional on the three supplier contracts the README declares, and the humans who approve have the same four points to decide, chiefly that the two main sources are unrefereed 2026 preprints.

## N01 — The determinant sentence of the Conventions attaches "transported by duality" to the wrong side

In the second bullet of the Conventions (README lines 71–73), `TauCeti.det_tateModuleGaloisRepresentation` (`TauCeti/AlgebraicGeometry/EllipticCurve/TateModule/Determinant.lean`, line 52) is the statement that the Tate module has determinant the cyclotomic character, that is `det V_ℓ(E) = ε_ℓ` itself; it is `det H¹(E) = ε_ℓ⁻¹` that is obtained from it by duality. Moving the clause to the `H¹` statement would say that.

## Previous findings

The previous report had no finding (no R-numbered point); its small corrections and format note are accounted for here.

- C01 — repaired: "the Jacobian `Pic⁰` of a smooth proper geometrically connected curve over a field, as an abelian variety, constructed without a rational point; the Abel–Jacobi map needs one, and the curves `C^δ_m` have one".
- C02 — repaired: "ModularityAndLanglandsExtensions and its Part II take elliptic modularity over ℚ from EllipticCurveModularity; §4.4 makes the same input available over every totally real field"; the description says the same.
- C03 — repaired: the description now has "Three statements are required of suppliers and are specified under Exact supplier contracts in the README … The endpoint §4.4 is conditional on all three".
- N01 — not repaired: "`V_ℓ(E) = H¹(E)^∨` has determinant `ε_ℓ`, which is Tau Ceti's `TauCeti.det_tateModuleGaloisRepresentation` transported by duality"; written again above as N01.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| JacobianChallenge contract (changed) | JacobianChallenge on main: Summary line 5, Conventions lines 99–101, Layers D, E, F at lines 834, 1148, 1329 | "constructed without a rational point"; point `x₀` a hypothesis only of Abel–Jacobi, its universal property, rigidified comparisons | contract now agrees with the supplier | none |
| §1.2(6), the point the contract cites | m = 3 fibre over O; `e(g)` odd | fibre `{(O,1),(O,ζ₃),(O,ζ₃²)}`; `w(O,ζ) = (O,ζ⁻¹)` fixes `(O,1)`, swaps the other two; `w^{e(g)}(O,1) = (O,1)` | `φ⁻¹(O,1) ∈ C^δ_m(L)`; true | none |
| Downstream consumers, second bullet (changed) | ModularityAndLanglandsExtensions lines 2151, 3008, 3048; Part II lines 2131, 2146, 2493 | both cite EllipticCurveModularity Layer R29.6 for `π_E` over ℚ; neither names this roadmap or a degree restriction | sentence true | none |
| §4.4 at K = ℚ, cited by the third bullet and the description | d = 1; EllipticCurveModularity lines 513, 531, 630, 1195 | `p > 100`; R29.3 takes existence from §4.4 with K = ℚ, R29.5–R29.6 hold the parametrisation, formulations, functional equation | true; consumer is later in the merge order (208 after 207) | none |
| Description: conditional chain "§§2.5, 3.2, 3.3, 4.1 … §4.3" | *Needs:* lines 625, 734, 764, 850, 879, 918, 1042, 1101 | 2.2 and 2.4 carry the first two contracts; 2.5 ← 2.1–2.4; 3.2 ← 2.5; 3.3 ← 2.2, 3.2; 4.1 ← 3.3; 4.3 carries the third; 4.4 ← 4.1–4.3 | description agrees with the README | none |
| HilbertModularForms §11.3 (first bullet, description) | its open head, lines 2442–2460 | §11.3 is the elliptic-curve interface; existence stated "for every real quadratic F" | bullet true | none |

The rows of the previous review, of `77d2100`, stand for every untouched statement.

- Changed passages: 2 (README lines 1139–1140 and 1327–1329), both read in full with what they cite.
- Cross-roadmap citations resolved this round: 9 (JacobianChallenge Layers D–F and Conventions on main; ModularityAndLanglandsExtensions and Part II; EllipticCurveModularity R29.3, R29.5, R29.6; HilbertModularForms §11.3).
- Library declarations opened at the pin: 1, `TauCeti.det_tateModuleGaloisRepresentation` (`TauCeti/AlgebraicGeometry/EllipticCurve/TateModule/Determinant.lean:52`).
- Source locators: none fall in the changed passages; the 51 of the previous review stand.
- Pull request text: title and every prose paragraph of the description read against the head (folder contents, the two Lean names and their sections, the three contracts and their sections, the consumers, the chain of dependence); no sentence contradicted, no change left unstated; the sentence on earlier review rounds that the previous report could not verify is no longer there.
- Dependency check: `depcheck: 203 roadmaps, 2213 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all passed at this head, rerun with the same result; nothing changed outside the folder. Elaboration of `Suggested.lean`: two `declaration uses sorry` warnings and nothing else; the file is unchanged since `77d2100`.
- Overlap check: read EllipticCurveModularity this round (owner of the classical statements over ℚ, R29.3–R29.6; it cites §4.4 here for the newform, which this roadmap owns); EllipticCurveModularityImaginaryQuadratic, its Part II, ArithmeticGaloisRepresentations, AutomorphicGaloisRepresentationsPartII and SmallRamificationAndAbelianVarietyBaseCases as in the review of `77d2100` (cyclic covers, character systems and `SymplecticTorsionEquiv`: EllipticCurveModularityImaginaryQuadratic; raw compatible-system carrier: SmallRamificationAndAbelianVarietyBaseCases §5.0d); the change moves no ownership.

Source independence: changed passages only; 2 passages compared, neither cites or paraphrases a source (they describe other roadmaps), none shared; largest share LeHung26, 35 of 87 source references, and the arrangement was not compared again since no layer was added, removed or reordered (independent in the review of `77d2100`).

Research link: The endpoint extends Freitas–Le Hung–Siksek 2015 (real quadratic fields) to all totally real fields by the prime switch of Le Hung 2026 and OpenAI 2026, using the Breuil–Diamond 2014 lifting theorem; over ℚ it gives Breuil–Conrad–Diamond–Taylor 2001, Theorem A. Rests on the README and on LeHung26, FLHS15 and BD14 as read.

## Not verifiable

- The licence class of the copy of LeHung26: its host is recorded in the manifest as an open repository; the text is readable but the host was not classified in this review.
- The description's sentence on which AI system ported the package: nothing in the folder records it.

## Source issues

- none

## For the human reviewers

- Scope: the largest source, LeHung26 (35 of 87 references), is a "discussion draft" of 7 October 2026 whose Theorem 1.1 (line 86) is conditional on inputs of OpenAI26, itself an unrefereed preprint; LeHung26 lines 147–149 say its first draft was machine-generated. The refereed sources (FLHS15, BD14) cover real quadratic fields and the lifting theorem.
- Licence: LeHung26 is read from `hexagonmath.org` and OpenAI26 from a file in a public code repository; neither copy states a licence that I could find.
- Reuse: the three-row table of §3.3 has the same first three columns (modular system, prime, target) as the table at LeHung26 lines 266–269; the entries are the congruence chain and the other two columns are the roadmap's own.
- Conditional acceptance: §4.4 depends on three statements that GL2ModularityLifting, GL2AutomorphicRepresentationsAndTransfer (on main) and ComplexMultiplicationAndExplicitReciprocity do not yet contain; the README specifies each under its supplier contracts.
