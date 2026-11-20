# Review of FormalLanguagesAndAutomata (pull request #2712 at defb2e4)

**Verdict:** accepted

**Summary.** Accepted: the one finding of the previous review (the strict inclusion of the regular in the context-free languages, claimed over every finite alphabet) is repaired, and the repair is correct, as is the repaired route of the pumping lemma; no finding remains. This was an incremental re-review of the 11 lines changed since `05c0d0e`, all in `TauCetiRoadmap/FormalLanguagesAndAutomata/README.md`; `Suggested.lean` is unchanged and elaborates with `sorry` as its only warning. Two format notes are carried over, none blocking; the eleven locators into Gallier–Quaintance remain unchecked, and the same four questions are left for the human reviewers.

## N01 — `IsReduced` shares its last component with Mathlib's root-level `IsReduced`

Unchanged at this head: `TauCetiRoadmap.FormalLanguagesAndAutomata.IsReduced` and Mathlib's `IsReduced` (`Mathlib/Algebra/GroupWithZero/Basic.lean`) are ambiguous once the namespace is opened. A name under `DFA` (for example `DFA.IsReduced`, with `DFA.IsAccessible` and `DFA.IsMinimal` beside it) would avoid it; the choice is the author's.

## N02 — Two Checks report a random experiment that a reader cannot recompute

Unchanged at this head: the second Check of 1.2 ("300 random regular expressions … of depth at most 4") and the second Check of 1.3 give no way to reproduce the sample. A deterministic family (all expressions of depth at most 2 over `{a, b}`, say) would be a Check a reader can redo.

## Previous findings

- R01 — repaired: "So over a finite alphabet with at least two letters, where every regular language is context-free (4.2), the regular languages are a proper part of the context-free ones. Two letters are needed: …" (3.3, lines 376–381). The added one-letter and empty-alphabet sentences are true (table below).
- C01 — repaired: "has depth more than `m`: a longest path from the root to a leaf has at least `m + 1` nonterminal nodes, so some nonterminal `X` repeats among the last `m + 1` of them" (3.2, lines 339–341); agrees with Watrous2020 lines 3457–3477.
- N01 — not repaired: `IsReduced` is still declared in the roadmap's namespace under that name; written again above as a format note.
- N02 — not repaired: the Checks of 1.2 and 1.3 still report the random sample; written again above as a format note.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 3.2 route of `exists_pumping` (changed sentence) | Chomsky-normal-form tree with all root-to-leaf paths ≤ `m` nonterminal nodes; upper occurrence of `X` among last `m + 1` nodes of a longest path | ≤ `2^(m−1)` leaves `< 2ᵐ`, so a longest path has ≥ `m + 1`; subtree at upper `X` has paths ≤ `m + 1` nodes, so ≤ `2ᵐ` leaves | sound; Watrous2020 lines 3453–3459, 3471–3477 (pp. 98–99) | none |
| 3.3 Check, strict inclusion with ≥ 2 letters | `0ᵖ 1ᵖ`, `p = 1..6`, every split `x y z` with `y` nonempty in the first `p` letters | 0 splits keep `x y² z` balanced; grammar `S → 0 S 1 ∣ ε` needs two distinct letters only | sound | none |
| 3.3 Check, one-letter alphabet: finite set plus progressions of difference `p!` | all subsets of `[0, N)` with the pumping property truncated at `N`: `(p, N) = (1, 12), (2, 14), (3, 20)`; evens with `p = 2` | 3, 31, 794 languages; 0 violate `n ∈ L, n ≥ p ⇒ n + p! ∈ L`; evens: `{0}` plus `2 + 2ℕ` | sound: `k ≤ p` divides `p!`, each residue class is a tail, so regular | none |
| 3.3 Check, empty alphabet | `List (Fin 0)` | one word `[]`, so languages `∅` and `{[]}`, both regular and context-free | sound | none |

The rows for the untouched statements stand as in the previous review, of `05c0d0e`.

- Source locators checked against the text: 1 (Watrous2020, proof of Lemma 10.1, lines 3444–3477, printed pp. 98–99: longest path, the last `m + 1` variable nodes, the bound `2ᵐ`); statement of Lemma 10.1 at line 3422, p. 97.
- Library declarations opened: none new; the diff names `DFA.pumping_lemma` only in untouched text, resolved in the previous review.
- Cross-roadmap citations: none in the changed passages; the changed text cites 3.2 and 4.2 of this roadmap, both present with the statements used.
- Dependency check output: `depcheck: 182 roadmaps, 2068 edges, 0 problem(s)`. No file changed outside the roadmap folder.
- Elaboration: `Suggested.lean` (unchanged since `05c0d0e`) elaborates with 19 `sorry` warnings and nothing else.
- Automatic checks: all passed at this head; none set aside.
- Pull request text: the title and description do not describe the two changed sentences and nothing in them is contradicted by this head.

Overlap check: no closest roadmap is listed, open or on main; no open pull request changes this roadmap and no cited id is dropped; nothing shared, as in the previous review.

Source independence: changed passages only: 2 passages compared with 1 source (Watrous2020, proof of Lemma 10.1), none shared; largest share Gallier–Quaintance, about 14 of 26 locators, text and contents not readable; the diff adds, removes or reorders no layer, so the arrangement was not compared again.

Research link: the headline targets are the classical theorems the README attributes to Kleene (1956), Myhill (1957) and Nerode (1958), Chomsky (1959) and Bar-Hillel, Perles and Shamir (1961); the README names no current line of research that uses them. Rests on the README's References.

## Not verifiable

- Gallier–Quaintance, all eleven locators (including Theorem 7.15, Proposition 7.16 and Example 7.26 in the sections the change touches): no legal copy could be read in the previous review, and the change bears on none of them.
- The Checks of 1.2 and 1.3 on 300 random expressions: the sample is not specified (N02).

## Source issues

- **Gap** in Watrous2020 at Theorem 8.2, printed pp. 83–85: the source says that its five-step summary of the conversion is not a formal proof of the theorem; it should be a proof that each step keeps the generated language; affects the proof.

## For the human reviewers

- **Scope.** Both located sources are course lecture notes (Watrous, CS 360, 2020; Gallier–Quaintance, CIS5110, 2026), neither published; the original papers are named without locators (`README.md`, References). The README names no later theory or current research that uses the targets.
- **Scope.** `metadata.toml` sets `topic = "math.LO"`; the content is the classical theory of regular and context-free languages (Kleene, Myhill–Nerode, Chomsky normal form, pumping lemma), standard in undergraduate theory-of-computation courses.
- **Licence.** The Gallier–Quaintance text is cited from a course page (`www.cis.upenn.edu/~cis5110/notes/tcbook-lang.pdf`, `README.md`, References). The sources service did not accept that page as an author's own page, so the text was not read.
- **Not tested.** Gallier–Quaintance has the largest share of the locators (about 14 of 26). Neither its wording nor its table of contents could be compared with the roadmap; all of Layer 2 is located only in it.
