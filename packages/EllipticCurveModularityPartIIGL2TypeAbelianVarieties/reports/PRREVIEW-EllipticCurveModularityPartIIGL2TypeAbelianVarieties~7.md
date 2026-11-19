# Review of EllipticCurveModularityPartIIGL2TypeAbelianVarieties (pull request #1036 at db80937)

**Verdict:** accepted

**Summary.** Accepted: the roadmap folder has not changed since the previous review of this head, and this round read the pull request's title and description against it. Both small corrections of the previous review are repaired: the description now restricts the coefficient-field, conductor and least-level statements to ℚ-simple varieties, and it attributes the coefficient identification and Tate-module comparison to the roadmap's own route. No finding and no small correction remain; five format notes are carried over, none blocking. The two points for the human reviewers are unchanged.

## N01 — Four pointers still have the wrong direction since the scope and the contracts moved to the end

“the contracts above” (lines 82 and 1088) should read “below”; “imported at the layers specified below” (line 1473) and “The `J₀(23)` worked checks below” (line 1495) should read “above”.

## N02 — Two supplier names stand in code font although no pinned library declares them

`TateModule.lambdaTateModule` and `TateModule.residualRep` (lines 47, 337, 357, 1490) are intended signatures of ArithmeticGaloisRepresentations §§6.4 and 6.1; “the supplier's intended `…`” once would tell a reader so.

## N03 — §1.1 still says the division algebra acts “on `End⁰_ℚ(A)`”

Line 123: D acts on A up to isogeny, through the unital map `D → End⁰_ℚ(A)`; it does not act on the endomorphism algebra.

## N04 — §6.3 could say, as §§3.4–3.5 do, which part of its statement is the roadmap's own deduction

Its locators give the definition of modularity and the modularity of ℚ-curves; the statement over an arbitrary solvable Galois field with every finite local factor is the consequence of its steps 1–4.

## N05 — In step 4 of §1.3, “an integer multiple of it” has two possible antecedents

Line 219: what is meant is an integer multiple of the conjugating element of `GL_n(F)`; “with an integer multiple of this element” would say so.

## Previous findings

The previous review, of the same head `db80937`, had no finding; its small corrections and format notes are accounted for here.

- C01 — repaired: the description now reads “When the variety is ℚ-simple of dimension n, the attached weight-two newform has coefficient field the endomorphism algebra, its level N_f is the least such N and the variety's conductor is N_fⁿ”, as §§3.6, 4.1 and 4.2 state.
- C02 — repaired: the summary block now reads “The reduction to Serre's conjecture and the pigeonhole are Ribet's and Khare–Wintenberger's … Exact coefficient identification and Tate-module comparison feeding Faltings' isogeny criterion are the roadmap's own route”, as §§3.4–3.5 say.
- N01 — not repaired: written again as N01.
- N02 — not repaired: written again as N02.
- N03 — not repaired: written again as N03.
- N04 — not repaired: written again as N04.
- N05 — not repaired: written again as N05.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Description, ℚ-simple clause, against §§3.6, 4.1, 4.2 | n = 1, `X₀(11)`; n = 2, `J₀(23)`; `B × B` with `E = ℚ(i)` | n = 1: cond 11 = 11¹, least level 11. n = 2: cond 23², `N(A) = 23`; Khare–Wintenberger level `cond² = 23⁴ = 279841 > 23`. `B × B`: algebra `M₂(ℚ)`, outside the clause | Agrees; the non-simple case is now only claimed to be a quotient of some `J₁(N)` (two oldform copies at level Np, `d(p) = 2`) | none |
| Description, “totally real … quotient of J₀(N_f)”, against §3.9 | `J₀(23)`; `J₁(13)` | `x² + x − 1` has discriminant 5: `E = ℚ(√5)` real, ε = 1, quotient of `J₀(23)`. `J₁(13)`: `E = ℚ(√−3)`, ε of order 6, `J₀(13) = 0` | Agrees with the equivalence of §3.9 for ℚ-simple A | none |
| Description, supplier sentences, against the supplier contracts | every roadmap name of the README | not on main: FaltingsFinitenessAndIsogenyTheorems (172), AutomorphicGaloisRepresentations (179), EllipticCurveModularity (208), SerreModularityByCompatibleSystems (266), all before this roadmap (267); ClassicalSerreModularity named 0 times; AbelianSurfacesModularity (431) and SatoTateGroups named once each, as consumers | Agrees with “the open suppliers are in the task list” and its four open entries | none |
| Description, “three headline theorems”, against `Suggested.lean` | elaboration at this head | three `declaration uses sorry` warnings, at lines 77, 92, 101 (`ribetTheorem21`, `totallyRealOrCm`, `ribetTheorem61`); six definitions, each with a body | Agrees | none |

The rows for the untouched statements stand as in the previous review, of `db80937`.

- Source locators checked against the text: 0 in this round; the folder changed by no line, so no sampled target falls in a changed passage.
- Library declarations opened at the pin: 0 new; the four `TauCeti.*` imports resolve and the file elaborates.
- Cross-roadmap citations resolved: SerreModularityByCompatibleSystems Layer S6 (its target “Serre's modularity conjecture, strong form”) and EllipticCurveModularity R29.3–R29.6 at their open heads; GlobalNumberFields and Chebotarev are completed roadmaps on main.
- Automatic checks: all passed at this head. Dependency check: `depcheck: 200 roadmaps, 2204 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the folder.
- Elaboration: `sorry` the only warning, three times; no declaration changed, so the signatures and the one-tactic probe stand as in the previous review.
- Headlines unchanged: §§1.3, 1.5 and 5.6 stated; the others named in the module docstring as not statable.
- Title and description: every sentence of the prose and of the summary block read against the head; none contradicted. The description names the folder and its three files, all added by this pull request.
- Overlap check: read EllipticCurveModularity, EllipticCurveModularityTotallyReal, ClassicalSerreModularity, AutomorphicGaloisRepresentations, EllipticCurveModularityImaginaryQuadratic, AlgebraicModularFormsAndSerreWeights, SerreWeightAndLevelOptimisation, SmallRamificationAndAbelianVarietyBaseCases in the earlier reviews; no object added or moved since, no open pull request changes this roadmap or drops an id it cites; nothing shared.

Source independence: changed passages only; the folder changed by no line, so 0 passages compared with 0 sources in this round; largest share Ribet92, as in the previous review; no layer added, removed or reordered, so the contents were not compared again: independent.

Research link: the headline targets are Ribet's 1992 theorems on GL₂-type varieties and ℚ-curves, made unconditional by Khare–Wintenberger 2009 (Corollary 10.2); modularity of ℚ-curves over quadratic fields is used by Freitas–Le Hung–Siksek 2015 (§12) and Caraiani–Newton 2023 (Corollaries 7.2.5, 7.3.4). Rests on Ribet92, KW-I, FLHS15 and CN23 as read.

## Not verifiable

- Shimura71, Theorem 1, p. 206 (§5.7), FW84, Theorem 1, p. 204 (§2.9) and DS05, §5.10 (§4.4): not read, as in the previous reviews; nothing changed touches them.
- The authorship statement of the description (which tools assisted) cannot be checked against the files.

## Source issues

- none

## For the human reviewers

- **Arrangement.** Targets 2.3–2.11 of the README follow Ribet92's results (3.1)–(3.7), (4.1), (4.2) one for one and in that order; the dependency lines force it except for the place of 2.5. The layers themselves do not follow the source's sections.
- **Not tested.** Shimura71, FW84 and DS05 (one locator each) could not be read; no statement of the roadmap rests on them alone.
