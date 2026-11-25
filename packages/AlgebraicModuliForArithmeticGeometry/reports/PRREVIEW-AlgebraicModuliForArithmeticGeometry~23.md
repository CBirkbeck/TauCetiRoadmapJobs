# Review of AlgebraicModuliForArithmeticGeometry (pull request #3027 at 7633b39)

**Verdict:** accepted

**Summary.** Accepted: an incremental re-review of 0 changed lines since `59b3c66`, whose subject is the pull request's title and description as they stand now. Every sentence of the description that speaks of this roadmap holds at this head (the projection formula repointed to SchemeAndStackFoundations §2.18 in §9.10, the three corrected glosses, the new sentence defining nefness), and the folder's change against `main` contains nothing the text contradicts. There is no finding and no small correction; one format note is carried over and does not block, and nothing is left for a human to decide.

## N01 — `AlgebraicGeometry.Scheme.Pullback` is a namespace, not a declaration

The `*Needs:*` line of §7.6a (line 9333) cites Mathlib `AlgebraicGeometry.Scheme.Pullback`; at the pin this is the namespace opened in `Mathlib/AlgebraicGeometry/PullbackCarrier.lean:37`. "Mathlib's fibre products of schemes (`Mathlib/AlgebraicGeometry/Pullbacks.lean`)" would say what is used.

## Previous findings

The previous review (of `59b3c66`) had no finding and no small correction; its format note is accounted for here.

- N01 — not repaired: line 9333 is unchanged ("Mathlib `AlgebraicGeometry.Scheme.Pullback`"); written again above as a format note.

## Verified sound

| Statement | Instances tried | Values computed | Result; change |
| --- | --- | --- | --- |
| Description: "§9.10 (the projection formula is SchemeAndStackFoundations §2.18)" | Lines 10102 and 10139 of the README; supplier §§2.6 and 2.18 on `main` | Both lines lie in §9.10 (10057–10161) and cite §2.18 for the projection formula; §2.18 lists `projectionFormula` (supplier line 5058); §2.6 has no such item | Text agrees with head; none |
| The projection formula as §9.12 uses it: `f_*(O_Y(K_(Y/X) − ℓF) ⊗ f^*M) = I_ℓ ⊗ M` | `f = id`, `J = (g)` principal, `M = O_X(K_X + A)` | `F = div(g)`, `K_(Y/X) = 0`: left side `(g^ℓ)·M`, and `I_ℓ = (g^ℓ)` by the principal formula of §9.10 | Consistent; none |
| §9.12 `globalDivisionByGenerators`, first Check (cited by the description's "new sentence of §9.10 defines nefness") | `ℙ¹`, `J = O_X`, `m = 2`, `n = 1`, `k = 1`, `ℓ = 2`; `a = 3` and `a = 2` | `min(m + k − 1, n + k) = min(2, 2) = 2 ≤ ℓ`; `a = 3`: linear forms `= x·k + y·k`, onto; `a = 2`: `A − 2D` of degree `0`, nef, not big, `H⁰(O) = k` against `H⁰(O(−1))² = 0`, not onto | Hypothesis "big" needed, as stated; none |
| Description: the two §9.10 glosses of §5.3 and the §5.1 gloss of §1.14 | Lines 10135, 10150, 8357; supplier headings | "the degree of `c_1(L)` on curves, by which nefness is stated" twice; "groupoids and their stabilizers"; supplier §5.3 "The first Chern class", §1.14 "Groupoids in algebraic spaces and stabilizers" | Text agrees with head; none |
| Description: "The additions do not mention the family or the formal proof" | Search of the README for the family's name and "formal proof" | 0 occurrences of either | Holds for this roadmap; none |

The rows for the untouched statements stand as in the previous review, of `59b3c66`: the folder has not changed since.

- **Changed passages.** None: the folder's diff since `59b3c66` is empty, and the pins did not move.
- **Seeded sample.** None of the fifteen targets lies in a changed passage, so none was re-read. The README flags no locator as unverified.
- **Source locators checked against the text:** 0 this round (no passage changed).
- **Library declarations opened at the pin:** 2 (`Mathlib/AlgebraicGeometry/PullbackCarrier.lean:37`, a namespace; `TauCeti/RingTheory/KoszulComplex/Basic.lean:346`, `smul_homology_eq_zero`).
- **Cross-roadmap citations resolved:** SchemeAndStackFoundations §§1.14, 2.6, 2.18 and 5.3, on `main` (the pull request does not change that roadmap).
- **Record.** Against the merge base: 0 headings removed, 1 added (§9.12); 9 layers kept under their ids; no Lean declaration added, removed or restated.
- **Automatic checks and elaboration.** The worker's run passed every check. Dependency check: `depcheck: 120 roadmaps, 1364 edges, 0 problem(s)`; no UPWARD or CYCLE line. `Suggested.lean` elaborates with five `sorry` warnings (lines 50, 75, 89, 121, 133) and nothing else.
- **Pull request text.** The title and the quoted part of the description were read against the folder's change against `main` (75 insertions, 15 deletions: §9.12 and its mentions, the `*Needs:*` corrections, the nefness sentence, three references, the module docstring). No sentence is contradicted. The quoted part is cut before the passage that the previous review read as naming §9.12 and the docstring change; that passage is outside this check. Every folder the pull request changes is one of its own; nothing changes outside `TauCetiRoadmap/`.

Overlap check: read FunctionFieldArithmeticPartII, SchemeAndStackFoundations, FunctorOfPoints, ResolutionOfSingularitiesCharacteristicZero, StableReductionPartII (scopes as in the previous review); nothing shared. No open pull request changes this roadmap, drops an id it cites, or cites an id it drops.

Source independence: changed passages only; 0 passages compared (the folder did not change since `59b3c66`), none shared. Arrangement not compared: no layer added, removed or reordered.

Research link: §9.12 is Ein and Lazarsfeld's global division theorem (1999, Proposition 1.2), the algebraic form of Skoda's theorem behind their geometric effective Nullstellensatz; Ein–Lazarsfeld–Smith (2001) use the same multiplier ideals for symbolic powers. Rests on the README and the two sources read.

## Not verifiable

- Lazarsfeld 2004, *Positivity in Algebraic Geometry II*, §9.6 (secondary locator of §9.12): a paywalled book, recorded as uncertified; not read.
- The numbering of the published Inventiones version of Ein–Lazarsfeld 1999: the arXiv v3 is the version the reference line names.
- The part of the description after the cut of the quoted text: not read this round.

## Source issues

- none

## For the human reviewers

- none
