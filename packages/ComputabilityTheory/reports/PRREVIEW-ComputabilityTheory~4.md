# Review of ComputabilityTheory (pull request #2554 at 0a577c0)

**Verdict:** accepted

**Summary.** Accepted, with no findings. The folder is unchanged since the previous review, which raised none; this round read the pull request's description against the head, and every sentence of it holds, including the sentence the previous review asked to correct, which is now right. Two format notes carried from the previous review remain, neither blocking. Left to the human reviewers: Soare's book, which carries every source locator, could not be read legally, and three external formalisations raise licence questions.

## N01 — The *Needs:* line of 2.3 (line 435) omits 1.1, although its statement is about predicates "computable in `Z`" in the sense of 1.1

"How to read the build" (line 57) and Layer 2's Dependencies say that Layer 2 uses Layers 0 and 1, but no *Needs:* line of Layer 2 names Layer 1. Adding 1.1 to the line of 2.3 would make the three agree.

## N02 — Layer 8 opens "This layer implements [S, VII.3.1–7]" (line 878)

The other layers say what they add and give the locator; this sentence describes the layer as a source's section. Wording such as "This layer proves Sacks's cone-avoidance and splitting theorems and their corollaries [S, VII.3.1–7]" would say the same in the roadmap's own terms.

## Previous findings

The previous review raised no finding (no R01). Its other remarks:

- its C01 — repaired: the description now reads "the targets it keeps are unchanged in content, and what Tau Ceti proves at the pin is cited instead of planned", which agrees with Scope and ownership.
- its N01 — not repaired: "*Needs:* Mathlib `Nat.rfind`, `Partrec.rfind`, `List.find?`; Tau Ceti `Primrec.list_find?`, `Nat.RecursiveIn.rfind'`"; it is N01 above.
- its N02 — not repaired: "This layer implements [S, VII.3.1–7]"; it is N02 above.

## Verified sound

| Statement | Instances tried | Values computed (roadmap side / check side) | Result |
| --- | --- | --- | --- |
| Description: "seventeen numbered conventions", "24 Checks", "eleven Tau Ceti modules" | counted at the head | conventions 1–17 (README lines 71–170); 24 bullets under 15 **Checks.** blocks; `Suggested.lean` lines 2–12 are 11 `TauCeti.*` imports | description true |
| Description: the 15 theorems and 13 definitions it names in `Suggested.lean` | the file's declarations | 15 `theorem` and 13 `def` at the head, the same names; 28 in all; three `stage…` names new against main | description true |
| Description: layers and kept targets | headings at the head | Layers 0–8; sections 0.1–0.3, 1.1–1.3, 2.1–2.3, 3.1–3.4, 4.1–4.4, 5.1, 6.1–6.3, 7.1–7.3, 8.1–8.4, each layer ending Examples, Dependencies | description true |
| Description: "references keep every source … with its locators" | [S] locators on main against the head | 26 distinct locator strings each side; the 11 of main not verbatim at the head reappear re-spaced or line-wrapped (`III.2; IV.1–4` at 465, I.3 at 634); 4 provenance rows both sides | description true |
| 6.1 Check cited by the description (`|S_e| ≤ |I_e|` needs monotone stages) | 0 in at stage 1, out, in at 3, restraint `some 0`; two entries at one stage | S_e = {1, 3}, I_e = {0}: 2 > 1; batch: I_e of size 2, S_e of size 1, consistent with ≤ | Check true |
| 3.2 Check cited by the description (collapse on `FIN`) and `SigmaIn` | variant Σₙ₊₁ = ∃ over Σₙ; the Lean recursion | variant: Σ₂ = ∃∃ computable = Σ₁, but Kᶜ ≤ₘ FIN so FIN is not Σ₁; Lean takes `¬ q` in Σₙ, so Σ₂ = ∃∀ | Check true; definition as intended |
| `limitLemma` (description: pin proves one direction) | Z = ∅, f = χ_K | entry approximation converges to χ_K, computable in ∅′, not computable; signature has `ComputableIn₂ {Z.oracle} a` and `Converges a f` | true, not a duplicate |

The rows of the previous review for the untouched statements stand as in that review, of `0a577c0`.

- Source locators checked against the text: 0 (all 36 are to [S], behind a paywall; see below).
- Library declarations opened at the pin: `TauCeti/Computability/Approximation/Modulus.lean:78` (`Converges`), `:120` (`IsModulus`); the imports of `Suggested.lean` all resolve (the file elaborates).
- Cross-roadmap citations: the README makes none. Dependency check output: `depcheck: 200 roadmaps, 2195 edges, 0 problem(s)`.
- Automatic checks: all passed; no change outside the folder.
- Elaboration: exit 0, 15 warnings, all `declaration uses 'sorry'`; no `set_option`, `variable` or `lemma`.
- Ownership against open work: unchanged since the previous review; the overlap list names no shared id, no second copy and no other pull request changing this roadmap.

Overlap check: read SatisfiabilityComplexity (the only roadmap the three lists name); nothing shared, it leaves computability to this roadmap.

Source independence: changed passages only, and no passage of the folder changed: 0 passages compared; largest share [S], 36 of 36 locators, text and table of contents not readable; the arrangement was not compared again, no layer having been added, removed or reordered.

Research link: Layers 7 and 8 state the Friedberg–Muchnik theorem and Sacks's cone-avoidance and splitting theorems as in Soare 1987, VII.2–3, the finite-injury basis of the structure theory of c.e. degrees whose continuations (infinite injury, density, jump inversion) the scope names. Rests on the README's summary and scope; no source text was read.

## Not verifiable

- The [S] locators of the sampled targets (4.2 III.3.2, 4.3 III.3.3, 4.4 III.3.4, 7.3 VII.2.1, 8.4 VII.3.3–7, and the layer-level locators covering the other sampled sections): Soare 1987 is behind the publisher's paywall and no legal open copy was found by the previous review; the folder has not changed since.
- The table of contents of [S]: not readable, same reason.

## Source issues

- none

## For the human reviewers

- Not tested: [S] (Soare 1987) carries all 36 source locators; neither its text nor its table of contents could be read legally, so wording and arrangement were not checked against it.
- Licence: `friedberg_muchnik` (`Suggested.lean` line 117) has the name and the statement shape of `friedberg_muchnik` in aaslyan/friedberg-muchnik-lean at `d5b3463`, `FriedbergMuchnik/Main.lean`, which has no licence header.
- Licence: `REPredIn` and `ComputablePredIn` (`Suggested.lean` lines 47, 52) have the names and, specialised to one set oracle, the bodies of those in cameronfreer/computable-model-theory at `a1fe761`, `ComputableModelTheory/Computability/OraclePred.lean` (Apache-2.0 header).
- Licence: README lines 1374–1386 allow integrating code from E. Park's CiL at `3f44ae2` and propose comparing its Kleene–Post pair with 5.1; that repository's licence was not read in this review.
