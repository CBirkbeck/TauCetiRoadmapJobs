# Review of SaturationAndQuantifierElimination (pull request #2866 at 3ef9c24)

**Verdict:** accepted

**Summary.** Accepted on an incremental re-review of the 8 lines changed since `e8a5d7e`: the two passages that now name PadicallyClosedFields as an existing consumer agree with what that roadmap takes from this one at its open head, and no statement changed. The previous review had no findings; its two small corrections and four format notes are untouched by this head and are repeated below, none blocking. The humans who approve should still know that the Tent–Ziegler, Marker and Chang–Keisler locators are unchecked against the texts.

## C01 — 4.2 codes sequents "through `boundedCode`", but the calculus has formulas over `ℕ` and the coding is for formulas over `Fin m`

An implementer of 4.2 has to invent the coding of a sequent before the stated target (a `Primcodable` coding of derivations, with computable end sequent and cut rank) means anything. The conventions give `boundedCode : L.BoundedFormula (Fin m) n → ℕ` (line 85), while SequentCalculusAndCutElimination's sequents are pairs of `Finset (L.Formula ℕ)` (its Conventions, "Sequents") with natural numbers as eigenvariables. So neither a formula inside a derivation nor the sequent `T₀ ⇒ φ` is in the domain of `boundedCode` as typed (4.2, line 395).

RandomGraphs §5.2 says its contexts are coded by value, so that codes are uniform in `m`. One sentence in 4.1 or 4.2 would close the gap: a formula over `ℕ` is coded as the same formula over `Fin m` for any `m` above its free variables, the code not depending on `m`; or the coding of `L.Formula ℕ` is named as a target of 4.1.

## C02 — Robinson–Zakon's regularly discrete groups are defined by primes only

In 3.3 (line 341) the `ℤ`-groups, defined with a condition for every `n > 0`, are said to be Robinson–Zakon's regularly discrete groups (Def. 3.3(iii)). That definition, as read in the previous review (RobinsonZakon1960 lines 412–413; not opened again this round), asks for index `p` only for every prime `p`. The two agree, by induction on the factorization of `n` (`x = ϖᵏ·yᵖ` and `y = ϖˡ·zᵠ` give `x = ϖᵏ⁺ᵖˡ·zᵖᵠ`), but a reader who opens the source sees another definition. Add the clause, for example "(their condition is for primes, which gives every `n`)".

## N01 — The Check on dense linear orders in Layer 2 computes nothing

"Dense linear orders without endpoints: quantifier elimination agrees with the Mathlib series" (line 290) names no value that a wrong definition would get wrong. A testing form: over `dlo`, `∃ z, x < z ∧ z < y` is equivalent to `x < y`, while over the theory of `(ℤ, <)` it is not quantifier-free.

## N02 — References lists a locator and three works that the text never cites

Tent–Ziegler "Def. 5.2.7" (line 538) is listed as cited and appears nowhere in the layers; Keisler 1964, Presburger 1929 and Robinson 1956 carry no locator. Either cite them at the statements they support or drop the "Cited:" entry.

## N03 — Mathlib pull-request numbers in the supplier contracts

"The series mathlib4#41112–#41116" (line 493) will not be true for a reader a year on; the file name and the declaration names, which the same paragraph gives, say the same without a number.

## N04 — The two declaration names cited from InfinitaryModelExistence §2.4 are on main only

0.3 (line 136) and the supplier contracts (line 517) cite `aElementary_of_cocone` and `aElementary_directLimit_of`. They are in §2.4 on main (lines 366–368); the open revision of that roadmap keeps §2.4 and no longer names them. The section citation is enough and survives either way.

## Previous findings

- The previous review, of `e8a5d7e`, had no findings (no R01); its R01–R04 bullets concerned an earlier head and were all repaired there.
- C01, C02 and N01–N04 of the previous review — not repaired: lines 395, 341–342, 290, 538, 493, 136 and 517 read as before; each is written again above.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 2.2 embedding criterion (cited by the changed consumer bullet) | `Th(ℤ,<)`, `φ = ∃z, x<z<y`, `A = ℤ` into `ℤ` by `id` and by `x ↦ 2x`; `dlo`; a sentence, `A` empty | `(0,1)`: false under `id`, true under doubling (`0<1<2`), so not qf-equivalent; `dlo`: both sides `x<y`; sentence: equivalent to `⊤` or `⊥` exactly when `T` decides it | true; agrees with the Check of Layer 2 |
| Consumer bullet for PadicallyClosedFields (line 434) | its Layer 2, §3.2, §3.3, §3.4, Layer 4 and supplier contract at its open head | takes `IsSaturated` and 0.3 (embedding theorem), 2.5 Robinson's test, the 2.2 criterion (substructure completeness ⇒ elimination), 3.1/3.3, 4.3 | matches "Layer 0, Layer 2, 3.3, Layer 4" |
| Summary sentence (line 43) | same | elimination tests (2.2), model completeness (2.5), decidability (4.3) all consumed there | true (not exhaustive) |

The rows for all other statements stand as in the previous review, of `e8a5d7e`: no statement and no line of `Suggested.lean` changed.

- Source locators checked against the text this round: 0 (no locator is in a changed passage; the seeded sample does not fall in the changed lines).
- Library declarations opened at the pin: 0 new; the names PadicallyClosedFields consumes (`IsSaturated`, `exists_elementaryEmbedding_isSaturated`, `IsModelComplete`, `orderedGroup`, `orderedGroupStructure`, `IsPresburgerGroup`, `elementarilyEquivalent_multiplicative_int_iff`) are declared in `TauCetiRoadmap/SaturationAndQuantifierElimination/Suggested.lean` (lines 72, 180, 222, 226, 235, 254).
- Cross-roadmap citations resolved: PadicallyClosedFields at its open head (its lines 30, 60, 229, 251, 268, 300, 306, 337, 363, 535–541); InfinitaryModelExistence §2.4 on main; SequentCalculusAndCutElimination Conventions and RandomGraphs §5.2 at their open heads (for C01).
- Dependency check: `depcheck: 171 roadmaps, 1989 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `Suggested.lean` elaborates with `sorry` as the only warning (20 sorried theorems); the file is byte-identical to the one the previous review probed, so its binder comparison and one-tactic probe stand.
- The pull request's text: title and description read against this head; the change (a consumer named) touches nothing they describe. No file outside the folder is changed.
- "planned" no longer occurs in the README; PadicallyClosedFields is named in two places only, both consistent.

Overlap check: read PadicallyClosedFields, AxKochenErshov, RandomGraphs, SequentCalculusAndCutElimination, HanfNumbers, InfinitaryModelExistence, InfinitaryLogic, CountableStructureSpaces (the last six as in the previous review); PadicallyClosedFields states that this roadmap owns saturation, back-and-forth, quantifier elimination and model completeness tests, `ℤ`-groups and decidability, and builds none of them; the formula coding is RandomGraphs' (§5.2), the chain lemma InfinitaryModelExistence's (§2.4), the calculus SequentCalculusAndCutElimination's, each cited here; nothing else shared.

Source independence: changed passages only: 2 passages compared (the summary sentence and the consumer bullet), which cite no source and share no wording with one; largest share Tent–Ziegler, 11 of 25 locators, text not readable; no layer added, removed or reordered, so the arrangement was not compared again (previous result: independent at chapter level).

Research link: Layers 0–3 are the toolkit of the Ax–Kochen–Ershov principle and Macintyre's p-adic elimination (README summary; the open AxKochenErshov and PadicallyClosedFields roadmaps consume them). Layer 3 states Robinson–Zakon 1960, Thms 4.4 and 4.7; Layer 0.4 is Keisler 1964. Rests on the README and RobinsonZakon1960.

## Not verifiable

- Tent–Ziegler 2012, Marker 2002, Chang–Keisler 1990 §6.1 and Keisler 1964: no legal copy was found in the previous review; not looked for again, since no changed passage cites them.
- RobinsonZakon1960 Def. 3.3(iii) (for C02) was not opened again this round; the reading is the previous review's.

Automatic checks set aside as false positives: the Tau Ceti theorem on `ℤ` and `ℤ ⊕ₗ ℤ` named in the Check of Layer 1 was read as a declaration this roadmap claims, and it is a library declaration; the four criteria named in 2.2 were read the same way, and 2.2 says in words that they are the names of the Mathlib series and that only one is stated in the Lean file.

## Source issues

- none

## For the human reviewers

- Not tested: Tent–Ziegler has the largest share of the locators (11 of 25) and could not be read; wording and section-level arrangement were not compared with it, nor with Marker (10 locators). Layer 2 draws on its §3.2.
- Licence: `IsQFEquivalent`, `HasQuantifierElimination` and the criterion of 2.2 in `Suggested.lean` take names and statements from an open Mathlib pull-request series (file `Mathlib/ModelTheory/QuantifierElimination.lean`, not in the pinned Mathlib).
- Layer 4 depends on RandomGraphs and SequentCalculusAndCutElimination, both open pull requests by other authors; the description says this pull request merges after them.
- Merge order: LogicAndDefinabilityInNumberTheory (open) cites §2.5 here as a supplier, yet the merge order lists it before this roadmap. This roadmap consumes nothing from it.
