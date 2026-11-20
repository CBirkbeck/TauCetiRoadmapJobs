# Review of FormalLanguagesAndAutomata (pull request #2712 at 05c0d0e)

**Verdict:** needs changes

**Summary.** Changes are needed for one false sentence: a Check in 3.3 says that over a finite alphabet the regular languages are a proper part of the context-free ones, which fails for alphabets with at most one letter. No stated theorem, definition or `Suggested.lean` declaration was found wrong; the file elaborates with `sorry` as its only warning, and no theorem closes with one tactic. There are one small correction and two format notes, none blocking. The eleven locators into Gallier–Quaintance could not be checked, because no legal copy of that text could be read, and three questions are left for the human reviewers (scope, the status of that copy, and the untested comparison with it).

## R01 (P2) — The Check of 3.3 claims a strict inclusion over every finite alphabet, and it fails for alphabets with at most one letter

In the second Check of 3.3 (`TauCetiRoadmap/FormalLanguagesAndAutomata/README.md`, lines 375–376): "So over a finite alphabet, where every regular language is context-free (4.2), the regular languages are a proper part of the context-free ones." A reader takes this as a statement about every finite alphabet, and an implementer who turns it into a test over `Fin 1` or `Fin 0` is asked to prove something false.

Over a one-letter alphabet every context-free language is regular, and this follows from 3.2 of this roadmap. Let `L ⊆ {a}∗` have the pumping constant `p`. If `aⁿ ∈ L` with `n ≥ p`, then `v y = aᵏ` with `1 ≤ k ≤ p`, so `a^(n + i·k) ∈ L` for all `i`, hence `a^(n + i·p!) ∈ L` for all `i`. For each residue `r` modulo `p!`, let `n_r` be the least `n ≥ p` with `n ≡ r` and `aⁿ ∈ L`, when there is one; then the words of `L` of length at least `p` in that class are exactly the `aⁿ` with `n ≥ n_r`, `n ≡ r`. So `L` is a finite set together with finitely many arithmetic progressions, which is regular. Over the empty alphabet the only languages are `∅` and `{[]}`, both regular. The witness `{0ⁿ 1ⁿ}` of the Check needs two letters.

The smallest change: "So over a finite alphabet with at least two letters, where every regular language is context-free (4.2), the regular languages are a proper part of the context-free ones." The one-letter case would also make a good negative control in the same Check, if wanted.

## C01 — The route of 3.2 takes any path with `m + 1` nonterminal nodes, but the bound `|v x y| ≤ 2ᵐ` needs a longest path

In the route of 3.2 (lines 339–341): "has a path from the root with at least `m + 1` nonterminal nodes, so some nonterminal `X` repeats among the last `m + 1` of them; the subtrees at the two lowest occurrences give … the bound `|v x y| ≤ 2ᵐ`". For a path that is not of maximal length the bound can fail: the subtree at the upper occurrence of `X` may contain a deeper branch off the chosen path, and then has more than `2ᵐ` leaves. An implementer following the sentence as written is stuck at the bound.

The cited proof chooses a path of maximal length from the root to a leaf (Watrous2020 line 3457), which is what makes every path inside the upper subtree have at most `m + 1` nonterminal nodes (Watrous2020 lines 3475–3477). Writing "a longest path from the root to a leaf has at least `m + 1` nonterminal nodes" repairs it.

## N01 — `IsReduced` shares its last component with Mathlib's root-level `IsReduced`

`TauCetiRoadmap.FormalLanguagesAndAutomata.IsReduced` and Mathlib's `IsReduced` (`Mathlib/Algebra/GroupWithZero/Basic.lean`, rings without nilpotents) are ambiguous as soon as the namespace is opened: `#check @IsReduced` under `open TauCetiRoadmap.FormalLanguagesAndAutomata` reports "Ambiguous term". A name under `DFA` (for example `DFA.IsReduced`, with `DFA.IsAccessible` and `DFA.IsMinimal` beside it) would avoid it; the choice is the author's.

## N02 — Two Checks report a random experiment that a reader cannot recompute

The second Check of 1.2 ("300 random regular expressions … of depth at most 4") and the second Check of 1.3, which refers to the automata of that experiment, give no way to reproduce the sample. A deterministic family (all expressions of depth at most 2 over `{a, b}`, say) would be a Check a reader can redo.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 `isRegular_mul`, `isRegular_kstar` | even-`b` language times `{[a]}`; `{aⁿb}` with start made accepting; `{[0]}∗` over `ℕ` | 3 left quotients (`L`, `L ∪ {ε}`, odd-`b`-ending-`a`); wrong variant accepts `a ∉ L∗`; 2 quotients over `ℕ` | sound; Watrous2020 line 1209, p. 32 | none |
| 1.2 `isRegular_matches'` | `star (char a + char b)` vs `star (char a) * star (char b + char a)`; `char a` over infinite alphabet | both all words, 1 left quotient; 3-state automaton with dead state works over `ℕ` | sound; Watrous2020 line 1514, p. 41 | N02 |
| 1.3 `exists_matches'_eq_of_isRegular` | `α` empty; `α = ℕ` one-letter words; no accepting state | `L ⊆ {[]}` matched by `0` or `1`; over `ℕ` regular (3 states) but any expression uses finitely many letters; empty union is `0` | sound with `[Finite α]`; Watrous2020 line 1526, p. 42 | none |
| 2.1 `IsAccessible`, `IsReduced`, `exists_reindex_eq_toDFA` | `toDFA L`; two-state `a∗`; even-`a` plus unreachable dead state | `toDFA`: `eval x = L.leftQuotient x`, `acceptsFrom K = K`; `a∗`: accessible, both states accept all; third: languages even/odd/∅ distinct, state 3 unreachable | sound; `e s = acceptsFrom s` matches start, step, accept of `Language.toDFA` (`MyhillNerode.lean` 68–76) | N01 |
| 2.2 `IsMinimal`, `exists_isMinimal`, `isMinimal_iff`, `IsMinimal.card_eq` | all automata with ≤ 3 states, start 0, over 0, 1, 2 letters; `k`-th letter from end, `k ≤ 4` | 2, 18, 1054 languages; minimal ⇔ accessible ∧ reduced in every case; quotients 2, 4, 8, 16 | sound, both directions | none |
| 2.3 `IsMinimal.exists_reindex_eq` | same enumeration; one-state vs two-state `a∗` | 2082 minimal automata over two letters, 1028 unordered pairs of distinct ones with equal language; non-minimal pair has 1 ≠ 2 states | sound | none |
| 3.1 `IsChomskyNormalForm`, `exists_isChomskyNormalForm` | `L = ∅`, `L = {[]}`, balanced parentheses, `{aⁿbⁿ}` | `L - 1 = ∅` in both degenerate cases (no rules); parentheses grammar covers prime `(w)` and products; `S → A X ∣ A B, X → S B` gives `aⁿbⁿ`, `n ≥ 1` | sound; Watrous2020 line 2941, p. 83, allows `S → ε` (line 2914) as the README says | none |
| 3.2 `exists_pumping` | `{aⁿbⁿ}` with `p = 1, 2`; `L = {[]}`; `p = 0`; tree bound | `p = 2` works, `p = 1` fails on `a b`; vacuous for `{[]}`; `p = 0` impossible; all paths ≤ `m` nodes ⇒ ≤ `2^(m−1)` leaves `< 2ᵐ` | sound; Watrous2020 line 3422, p. 97; proof pp. 98–101 | C01 |
| 3.3 `equalBlocks`, `not_isContextFree_equalBlocks` | all splits of `0ᵖ1ᵖ2ᵖ`, `p ≤ 6`; one-letter alphabet | 0 splits keep `u x z` or `u v² x y² z` in the language; unary context-free ⇒ regular by period `p!` | theorem sound (Watrous2020 line 3532, p. 101); Check sentence false for ≤ 1 letter | R01 |
| 4.1 `isContextFree_add`, `_mul`, `_kstar` | star rules `none → S none ∣ ε` vs `none → S S ∣ S` on `{a}` | correct rules give all `aⁿ`; variant gives only `a`, `a a` | sound; Watrous2020 line 3061, p. 87 | none |
| 4.2 `isContextFree_of_isRegular` | all words over `ℕ`; even-`b` automaton | one-state regular, not context-free (finitely many terminals in rules); 4 transition rules + `p → ε` | sound with `[Finite T]`; Watrous2020 line 3149, p. 90 | none |
| 4.3 `isContextFree_inf` | infinite alphabet; `[] ∈ L ⊓ R`; `{aⁿbⁿ}` ∩ length ≡ 2 mod 4 | rules `(p,X,q) → a` only for the finitely many `a` in the grammar; empty word added by union with `{[]}`; `2n ≡ 2 (4)` ⇔ `n` odd | sound over any alphabet; Watrous2020 line 3222, p. 92 | none |
| 4.4 `exists_not_isContextFree_inf`, `_compl` | `{0ⁿ1ⁿ2ᵐ} ⊓ {0ⁿ1ᵐ2ᵐ}`; case split on `L₁ᶜ`, `L₂ᶜ` | intersection is `0ⁿ1ⁿ2ⁿ`; if both complements context-free, `(L₁ᶜ + L₂ᶜ)ᶜ = L₁ ⊓ L₂` contradicts 3.3 | sound; Watrous2020 line 3664, p. 105 | none |

- Source locators checked against the text: 12 of 12 into Watrous2020 (statement, printed page, hypotheses; alphabets finite and nonempty there, Watrous2020 line 351); 0 of 11 into Gallier–Quaintance.
- Library declarations opened at the pin: every name of the supplier contracts (about 50), all present in `Mathlib/Computability/{Language,DFA,NFA,EpsilonNFA,MyhillNerode,RegularExpressions,ContextFreeGrammar}.lean` and `Mathlib/Data/Fintype/EquivFin.lean`; no closure of regular languages under `*` or `∗`, no Kleene theorem (TODO at `RegularExpressions.lean` 19–23), no context-free closure beyond reversal, no Chomsky normal form or pumping lemma for grammars at the pin.
- Tau Ceti at the pin: `TauCeti/Computability/DFAO.lean` and `AutomaticSequence` only (automata with output); no object of this roadmap.
- Cross-roadmap mentions resolved: ClassicalArithmeticCompletion §2.8 (heading present on main) and ComputabilityTheory (on main); neither is a supplier. No `*Needs:*` line names a roadmap.
- Dependency check output: `depcheck: 182 roadmaps, 2068 edges, 0 problem(s)`. No change outside the roadmap folder.
- Elaboration: `Suggested.lean` elaborates, 19 `sorry` warnings and nothing else; `#check @name` on all 24 declarations agrees with the README statements, no binder lost.
- One-tactic probe (`rfl`, `simp`, `simp_all`, `infer_instance`, `trivial`, `decide`, `tauto`, `exact?`, `aesop`): 0 of 19 theorems close. All README headline theorems are stated; none is padding.
- Automatic checks: all passed at this head; none set aside.

Overlap check: no closest roadmap is listed, open or on main; searched all open heads and main by object (`IsContextFree`, `ContextFreeGrammar`, regular languages, Kleene, Myhill, Chomsky normal form, pumping lemma, `DFA`/`NFA`): only ClassicalArithmeticCompletion §2.8 uses Mathlib's `Language.IsRegular`, as a consumer; nothing shared. This roadmap is the owner of its targets.

Source independence: 9 passages compared with 1 source (Watrous2020: proofs of Theorems 4.2, 4.9, 9.1, 9.2, 9.3, Lemma 10.1, Proposition 10.2, the conversion after Theorem 8.2, §10.3), none shared; largest share Gallier–Quaintance, about 14 of 26 locators, text and contents not readable; contents compared with Watrous2020: independent (Layer 1 ↔ Lecture 4, Layer 2 ↔ nothing, Layer 3 ↔ Lectures 8 and 10, Layer 4 ↔ Lecture 9 and §10.3).

Research link: the headline targets are the classical theorems the README attributes to Kleene (1956), Myhill (1957) and Nerode (1958), Chomsky (1959) and Bar-Hillel, Perles and Shamir (1961); the README names no current line of research that uses them. Rests on the README's References.

## Not verifiable

- Gallier–Quaintance, all eleven locators (Proposition 5.6; Propositions 6.9, 6.10; Theorems 6.13, 6.14; Propositions 7.4, 7.6 and its proof; Theorem 7.15; Proposition 7.16; Example 7.26; §7.16): the sources service refused the course-page URL and the author's own directory on the same host as not shown to be an author's page; no other place was tried.
- The remark in 2.1 that Gallier–Quaintance use "reduced" for what is called accessible here: same reason.
- The Checks of 1.2 and 1.3 on 300 random expressions: the sample is not specified (N02).
- The Catalan counts of 3.1 and the length-9 triple-grammar Check of 4.3 were not recomputed; the grammars were checked by hand.

## Source issues

- **Gap** in Watrous2020 at Theorem 8.2, printed pp. 83–85: the source says that its five-step summary of the conversion is not a formal proof of the theorem; it should be a proof that each step keeps the generated language; affects the proof.

## For the human reviewers

- **Scope.** Both located sources are course lecture notes (Watrous, CS 360, 2020; Gallier–Quaintance, CIS5110, 2026), neither published; the original papers are named without locators (`README.md` lines 591–593). The README names no later theory or current research that uses the targets.
- **Scope.** `metadata.toml` sets `topic = "math.LO"`; the content is the classical theory of regular and context-free languages (Kleene, Myhill–Nerode, Chomsky normal form, pumping lemma), standard in undergraduate theory-of-computation courses.
- **Licence.** The Gallier–Quaintance text is cited from a course page (`www.cis.upenn.edu/~cis5110/notes/tcbook-lang.pdf`, `README.md` line 581). The sources service did not accept that page as an author's own page, so the text was not read.
- **Not tested.** Gallier–Quaintance has the largest share of the locators (about 14 of 26). Neither its wording nor its table of contents could be compared with the roadmap; all of Layer 2 is located only in it.
