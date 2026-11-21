# Review of PolynomialMethodInCombinatorics (pull request #2848 at cbda202)

**Verdict:** accepted

**Summary.** Accepted, on an incremental re-review of the 62 lines changed since `194d963`: the joints theorem of 5.1 is now stated over every field, in the README and in `Suggested.lean`, and the new end of its route (a nonzero polynomial of least degree, then the `p`-th root over an algebraic closure and the rank argument) is correct and agrees with Carbery–Iliopoulou at the locators given. No finding remains; there are two small corrections and one format note, none blocking. One question for the author is carried over, and one point on the copy of a source is left for the human reviewers.

## C01 — The last Check of 5.1 states the least-degree step "for every set `S`", but the step fails for the empty set

A reader who takes the Check as the statement of the step (5.1, Checks, the bullet "Positive characteristic", lines 494–496: "no nonzero polynomial of degree below `m` vanishes on a set `S` whose points are joints of lines each carrying at least `m` points of `S`, for every set `S`") gets a false lemma: for `S = ∅`, the empty family of lines and `m = 1`, the hypotheses hold vacuously and the constant `1`, of degree `0 < 1`, vanishes on `S`. The route itself is right, since it uses "the nonempty set of remaining points". For nonempty `S` I recomputed the step over `𝔽₂²`, `𝔽₃²` and `𝔽₂³` (every nonempty `S`, every `m ≥ 1`, with all lines carrying at least `m` points of `S`): 20, 1011 and 404 admissible cases, no violation. Writing "for every nonempty set `S`" (and `m ≥ 1`) makes the sentence true.

## C02 — In the route of 5.1, two consecutive sentences say "the source" for two different papers

In lines 472–473, "(The source instead passes to an algebraic closure at the start, p. 5, …)" is Carbery–Iliopoulou (the reduction is at the start of the proof of their Proposition 3.1, p. 5), and the next sentence, "The source (p. 3) writes the condition `m/(2n) > 2(d! m)^(1/d)` as …", is Kaplan–Sharir–Shustin. A reader who looks for the rearranged inequality on p. 3 of Carbery–Iliopoulou finds nothing. Naming the authors in both sentences repairs it.

## N01 — Wording of the rank criterion in the route of 5.1

Line 468, "A nonzero polynomial of degree at most `c` vanishes on a finite set of `Kᵈ` exactly when the matrix … has rank below its number of columns", is meant as an existence statement: "Some nonzero polynomial of degree at most `c` vanishes on …" says it.

## Questions for the author

- Carried over: 4.1 cites Theorem 3 of the arXiv version of Dvir's paper, whose proof is written with `(q + n − 2 choose n)`; the README says so. Does the published version (J. Amer. Math. Soc. 22) state `(q + n − 1 choose n)` outright? If it does, its theorem number would be the better locator. I could not read the published text.

## Previous findings

- R01 — repaired: 5.1 reads "Let `K` be a field and `d ≥ 2`"; `card_pow_le_of_isJoint` has `[Field K]` only; scope reads "the joints theorem over every field"; the route takes `P` of least degree and cites Carbery–Iliopoulou.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 5.1 `card_pow_le_of_isJoint` (no characteristic hypothesis) | every set of lines of `𝔽₂²` and `𝔽₃²`; all 28 lines of `𝔽₂³`; `d = 1`, `L = ∅` | 64 and 4096 sets, 0 violations of `#J ≤ 32·#L²`; 8 joints, `64 ≤ 8429568`; `1 ≤ 0` fails, so `d ≥ 2` needed | holds; CarberyIliopoulou14 lines 35–43 |
| 5.1 route, least-degree step | nonempty `S ⊆ 𝔽₂², 𝔽₃², 𝔽₂³`, `m ≥ 1`; `S = ∅`, `m = 1`; `P = x₁^p` over `𝔽_p` | 20, 1011, 404 cases, least degree always `≥ m`; least degree `0 < 1`; all `∂ᵢP = 0`, `P = (x₁)^p`, root of degree 1 | holds for nonempty `S` (C01); CarberyIliopoulou14 lines 221–259 |
| 5.1 route, descent `P = Q^p` | coefficient of `x^(a−eᵢ)` in `∂ᵢP`; degrees; rank over `K` and over `E` | `aᵢ·c_a`, so `p ∣ aᵢ` when `c_a ≠ 0`; `deg P ≤ deg Q = deg P / p` forces `deg P = 0`; rank of a `K`-matrix unchanged over `E` | holds; CarberyIliopoulou14 lines 160–168, 253–259 |

The rows for the statements the change does not touch stand as in the previous review, of `194d963`.

- Source locators checked against the text: 4 new, all agree (CarberyIliopoulou14: Theorem 1.1, pp. 1–2, line 35, stated for `n ≥ 3` with a constant `C_n`; Lemma 2.4, pp. 4–5, line 160; Proposition 3.1, pp. 5–6, line 221; the passage to an algebraic closure, p. 5, line 227).
- Library declarations opened at the pins: none new; the *Needs:* line of 5.1 is unchanged.
- Cross-roadmap citations: the change adds none; the citation and overlap listings for this head are empty.
- Dependency check output: `depcheck: 172 roadmaps, 1998 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks at this head: all passed. Elaboration of `TauCetiRoadmap/PolynomialMethodInCombinatorics/Suggested.lean`: 12 `sorry` warnings, nothing else; the elaborated type of `card_pow_le_of_isJoint` has `[Field K]`, `2 ≤ d`, lines by `finrank = 1`, and agrees with 5.1.
- No file outside the folder is changed.
- Pull request's title and description against this head: they state the joints theorem over every field, name Carbery–Iliopoulou with the three locators, and list the added checks; nothing contradicted or left out.
- Headline theorems: unchanged list (1.1, 1.3, 1.4, 2.1, 2.2, 4.1, 4.2, 5.1), all stated; a one-tactic closer cannot prove 5.1 (it needs the route above).

Overlap check: read FourierAnalyticAdditiveCombinatorics, LinearAlgebraMethodInCombinatorics, SidonSetsAndLinearEquations, DecisionTreeComplexity (no roadmap on main is close); nothing shared.

Source independence: changed passages only; 4 passages compared with 1 source (CarberyIliopoulou14), none shared beyond formulas and phrases of under six words — the route reaches the contradiction by a rank argument over the ground field where the source passes to an algebraic closure first; largest share Alon99, 8 of 20 locators; no layer added, removed or reordered, so the contents comparison stands: independent.

Research link: The targets are published theorems that current work builds on: Alon–Nathanson–Ruzsa (1996) and Dias da Silva–Hamidoune (1994) on restricted sums, Alon–Füredi (1993), Alon–Friedland–Kalai (1984), Dvir (2009) on finite-field Kakeya sets, Kaplan–Sharir–Shustin (2010) and Carbery–Iliopoulou (2014) on joints; rests on the README's references and on Alon99, Dvir09, KSS10, CarberyIliopoulou14 as read.

## Not verifiable

- The exhaustive searches the new Check of 5.1 reports over `𝔽₄²`, `𝔽₂⁴`, `𝔽₅²` and for sets of at most 8 lines of `𝔽₂³` were not rerun; those over `𝔽₂²`, `𝔽₃²` and (for the least-degree step and the full family of lines) `𝔽₂³` were.
- A published version of the Carbery–Iliopoulou paper was not read; the locators were checked in arXiv version 2, which is the version the README cites.

## Source issues

- none

## For the human reviewers

- **Licence.** The README cites Alon's paper in the version on his Tel Aviv page; the text read for review is the author's version on his Princeton page (Alon99). Theorem and page numbers agree; that the two copies are the same file was not checked.
- **Scope.** The general-field case of 5.1 rests on Carbery–Iliopoulou, which the README cites by its arXiv identifier only (README, References); whether a refereed version exists was not checked.
