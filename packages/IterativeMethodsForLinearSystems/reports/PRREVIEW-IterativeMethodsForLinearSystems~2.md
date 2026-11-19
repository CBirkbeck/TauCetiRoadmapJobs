# Review of IterativeMethodsForLinearSystems (pull request #2561 at 8d74536)

**Verdict:** accepted

**Summary.** Accepted: this was an incremental re-review of the 11 lines changed since `ad5c14a`, and both points of the previous review are repaired. The spectral radius criterion of 1.2 now has one owner (this roadmap), and LinearSystemsAndControl at its open head keeps only the definition of Schur stability and cites 1.2 for the equivalence with `A ^ k → 0`; the sentence of 2.4 on Saad's Theorem 4.10 now says what the source states. There is no finding and no small correction, and one format note, not blocking; the scope and licence questions for a human are unchanged.

## N01 — "(an open roadmap, not on main)" in the scope section dates the text

In "Scope and ownership" (README line 599) the parenthesis "an open roadmap, not on main" describes the state of another pull request and becomes untrue the day LinearSystemsAndControl merges. The paragraph reads the same without it: "LinearSystemsAndControl defines Schur stable real matrices in its 5.1, …"; the closing sentence "This roadmap does not depend on that one" already carries the direction of supply.

## Previous findings

- R01 — repaired: "This roadmap owns the equivalence of 1.2 between `G^k → 0` and the complex spectral radius being less than one, for complex and for real matrices … that roadmap cites 1.2 for it." (README lines 598–603).
- C01 — repaired: "stated there, without proof, for real symmetric matrices with positive diagonal as an equivalence with positive definiteness at a fixed `ω` in `(0, 2)` … the route below proves the Hermitian case directly" (README lines 244–247).

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.2, real case, read as the Schur stability criterion (the new scope paragraph) | `[[0,2],[0,0]]`; rotation `[[0,−1],[1,0]]`; `n = 0` | spectrum `{0}`, `A² = 0`, `ρ = 0 < 1`; eigenvalues `±i`, powers of period 4, `ρ = 1`; empty spectrum, sup `0`, "every eigenvalue" vacuous | finite spectrum: sup `< 1` iff each modulus `< 1`; both sides agree | none |
| 2.4 against Saad, Theorem 4.10 (the reworded sentence) | `[[2,1],[1,2]]`, `ω = 1`; `[[1,2],[2,1]]`, `ω = 1` | positive definite: Gauss–Seidel `[[0,−1/2],[0,1/4]]`, `ρ = 1/4`; indefinite, positive diagonal: `[[0,−2],[0,4]]`, `ρ = 4` | source's equivalence and the README's direction agree | none |

The rows for the untouched statements stand as in the previous review, of `ad5c14a`; `Suggested.lean` is unchanged since that head.

- Source locators checked against the text: 1 (Saad2003, Theorem 4.10, p. 122, at Saad2003 lines 5843–5847: symmetric, positive diagonal, `0 < ω < 2`, convergence for every `x₀` if and only if positive definite; no proof follows).
- Cross-roadmap citations resolved: 1 (LinearSystemsAndControl 5.1 at the head of pull request #2568: its README lines 469–480 define Schur stability through the complex eigenvalues and say the equivalence with `A ^ k → 0` "is not a target here", citing 1.2 of this roadmap; lines 759–762 list this roadmap as its supplier; its `Suggested.lean` line 200 keeps `IsSchurStable` and no longer states the equivalence). The citation runs from the later roadmap to this one only.
- Dependency check output: `depcheck: 200 roadmaps, 2195 edges, 0 problem(s)`.
- Automatic checks: all passed at this head. Elaboration of `Suggested.lean`: 22 `sorry` warnings and nothing else; single `import Mathlib`, no `set_option`.
- Pull request text against this head: the title and description agree with it (22 theorems, 13 definitions, the paragraph on the shared statement with LinearSystemsAndControl is present); nothing changed outside the folder.
- Seeded sample: of the sampled targets only 1.2 and 2.4 fall in changed or cited passages; both rows above.

Overlap check: read LinearSystemsAndControl, NewtonAndQuasiNewtonMethods, PolynomialInterpolationAndBestApproximation (open) and SpecialFunctionsOrthogonalPolynomialsGeneral (main); shared: the criterion "powers tend to zero iff complex spectral radius below one", owner this roadmap (1.2), cited by LinearSystemsAndControl 5.1; nothing else shared.

Source independence: changed passages only: 2 passages compared with 1 source (Saad2003), none shared; largest share Saad2003, about 30 of 34 locators; no layer added, removed or reordered, so the contents comparison stands as in the previous review: independent.

Research link: the headline targets are the classical convergence theorems of numerical linear algebra that the README attributes to Ostrowski (1954), Kahan (1958), Hestenes and Stiefel (1952) and Saad and Schultz (1986), as presented in Saad's SIAM monograph (2003); this rests on the README's references and Saad2003. The README names no current line of research.

## Not verifiable

- Shewchuk1994, equations (44) and (52) and the sentence of §9.1 on the number of distinct eigenvalues: as in the previous review, the extraction of the displayed formulas is garbled; the passages are untouched by this change and were not read again.

## Source issues

- none

## For the human reviewers

- Scope: the subject is textbook numerical linear algebra; 30 of about 34 locators are to one SIAM textbook (Saad2003) and the rest to a technical report (Shewchuk1994); the README's references name original papers without locators and no current research.
- Licence: Saad2003 was read from the PDF of the second edition on the author's university page and Shewchuk1994 from the author's page; neither file states a licence, and the roadmap reuses no text, table or figure from them.
