# Review of CombinatoricsOfWords (pull request #2949 at 8677be6)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every statement, Check and intermediate claim of the proof routes was recomputed by brute force (all words of length at most 7 on at most three letters; the Fredricksen–Maiorana word for `k = 2, n ≤ 10`, `k = 3, n ≤ 6`, `k = 4, n ≤ 4`) and every Grinberg–Reiner locator was read at its page; nothing failed. There are two small corrections and no format note, none blocking. The locators into Erickson's notes and into Sawada–Williams–Wong could not be read through a legal channel available to this review and are left to the human reviewers, together with a question of scope for Layer 1.

## C01 — The Möbius count of Lyndon words is listed among the headline theorems but the Lean file, which says it states every headline, does not state it

The opening overview lists `L(k, n) = (1/n) ∑_{d ∣ n} μ(d) k^(n/d)` among the headline theorems (README line 30), and the module docstring of `Suggested.lean` says "Every headline theorem of the README is statable at the pins and is stated here" (lines 8–9). The file states only the divisor-sum identity `sum_divisors_mul_card_lyndon`; 4.1 (README lines 262–268) explains that the Möbius form follows from it by `ArithmeticFunction.sum_eq_iff_sum_mul_moebius_eq` and is deliberately not a separate target. The same holds for the rotation bijection of the overview, which is the route of 4.1 and not a stated target. A reader who takes the docstring at its word looks for two statements that are not there.

The smallest repair is in the docstring: say that the count of Lyndon words is stated in its divisor-sum form, the Möbius form being its restatement by Mathlib's Möbius inversion. Alternatively the Möbius form would be stated as a second theorem, in `ℤ`, as `(n : ℤ) * L(k, n) = ∑ d ∈ n.divisors, μ d * k ^ (n / d)`; either is consistent with the README.

## C02 — The scope section does not name ArithmeticDynamics, which states the unique primitive root of a word and counts primitive binary necklaces

Step (b) of the route of 4.1 proves that every nonempty word is `tᵐ` with a unique primitive `t`, and 4.1 with Möbius inversion gives `n · L(2, n) = ∑_{d ∣ n} μ(d) 2^(n/d)`. The open roadmap ArithmeticDynamics, earlier in the merge order, states both facts in its own setting: its 3.34 "Primitive-word facts for kneading monodromy" has "Every nonempty finite word has a unique primitive root under concatenation" for words on `Fin d` (`TauCetiRoadmap/ArithmeticDynamics/README.md` line 4025 at its head), and its 3.15 "Primitive binary necklaces at infinity" counts the primitive binary words by Möbius inversion and their rotation classes as that number divided by `n` (line 3613), which is `L(2, n)`. Neither roadmap states the other's target (here the primitive root is a step of a route, and the count is of Lyndon words over `Fin k`, not of rotation classes of functions `Fin n → Fin 2`), so there is no double ownership; but the scope section, which already records the parallel with the Witt formula of AnabelianGeometryAndNonabelianChabauty, is silent on the closer neighbour, and an implementer of either would prove the primitive-root fact twice.

A sentence under "Left to other roadmaps" would do: name ArithmeticDynamics 3.34 and 3.15, say that 3.34 states the primitive root for words on `Fin d` and that step (b) of 4.1 is the same fact for lists over any alphabet, and say which of the two the other should cite once both are in the library.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Conventions: order, borders, periods | `[0] < [0,1] < [1]`, `[] < [0]`; `w = 0100101001` | Lean evaluation: true. Borders `0,2,5`; positive periods below 10: `5, 8` = `10−5, 10−2` | holds | none |
| `borderLength` (def) | `0100101001`; prefixes of `0010001`; `[]` | Lean `#eval`: `5`; `0,0,1,0,1,2,2,3` for lengths 0–7; `0` | holds | none |
| 1.1 `take_isSuffix_iff_exists_iterate` | all 3543 words, length ≤ 7, k ≤ 3; `w = []` | border lengths = iterates, 0 failures; iterates `5,2,0,0` and `3,0,0`. `[]`: left false, right true at `i = 0` | holds; `w ≠ []` needed | none |
| 1.2 `borderLength_append_singleton` | same range, every letter; `w = []`; Checks | 0 failures; `w0 → 6`, `w1 → 0`, letters after borders `0,0,0`; `00100·0 → 2`; `[] → 0 = sup ∅` | holds | none |
| 2.1 `IsLyndon`, two characterizations | all words length ≤ 7, k ≤ 3; `0101`, `00` | definition = rotation form = take/drop form, 0 disagreements; `0101 ≤` all rotations, `0 ≤ 0`, neither Lyndon; no Lyndon word bordered | holds, strictness needed | none |
| 2.2 `IsLyndon.append` | 32 Lyndon words of length ≤ 4 on 3 letters, all pairs | `uv` Lyndon ⇔ `u < v` on all 1024 pairs; `10`, `00` not Lyndon | holds; `u < v` needed | none |
| 2.3 `IsLyndon.standard_factorization` | 544 Lyndon words of length 2–7, k ≤ 3; `w = 0` | `u`, `v` Lyndon and `u < w < v`: 0 failures; suffixes of `01011` sorted `011,1,1011,11`; `w = 0`, `u = []`: not Lyndon | holds; nonemptiness needed | none |
| 3.1 `existsUnique_isCFLFactorization` | all words length ≤ 7, k ≤ 3 by enumeration; `[]`; nondecreasing variant on `01` | exactly one each; three README factorizations reproduced; `[]`: only `[]`; nondecreasing: `0·1` and `01` | holds | none |
| 4.1 `sum_divisors_mul_card_lyndon` | k = 0..3, n = 1..6; n = 0 | `∑ d·L(k,d) = kⁿ` all; `2+2+6+54 = 64`; `L(2,·) = 2,1,2,3,6,9,18,30`; `L(3,·) = 3,3,8,18,48,116`; n = 0: `0 ≠ 1` | holds; `n ≥ 1` needed | none |
| 4.1 Möbius form and rotation bijection (C01) | k = 0..3, n = 1..6 | `n·L = ∑ μ(d)k^(n/d)` all; image of `(ℓ,i)` has `kⁿ` distinct words, k ≤ 3, n ≤ 6 | holds | C01 |
| 4.1 route (b)–(d) (C02) | Fine–Wilf hypothesis | `a,b ≥ 2` gives length `≥ |t|+|s| ≥ |t|+|s|−gcd`, the hypothesis of `List.HasPeriod.gcd` at the pin | holds | C02 |
| 5.1 `fkmWord`, `IsDeBruijn` (defs) | k=2: n=3,4; k=3, n=2; k=0,1; n=0 | `00010111`, `0000100110101111`, `001021122`; `[0]`; `[]`; n=0: length `0 ≠ 1`. `IsDeBruijn` identical to DirectedMatrixTreeAndBEST 5.2 | holds | none |
| 5.1 `isDeBruijn_fkmWord` | k=0,1 (n ≤ 6); k=2, n ≤ 10; k=3, n ≤ 6; k=4, n ≤ 4 | length `kⁿ`, each word once cyclically: 0 failures. Orders `10110010`, `01001011`: `010`,`101` twice, `000`,`111` absent | holds | none |
| 5.1 route (a): order of powers | Lyndon `u, v`, lengths dividing n, k=2,3, n ∈ {1,2,3,4,6} | `u < v ⇔ u^(n/|u|) < v^(n/|v|)`: 0 failures; aperiodic prefixes of sorted necklaces = sorted Lyndon words, k ≤ 4 | holds | none |
| 5.1 route (b): extension lemma | Lyndon `u`, length ≤ 5, k=2,3, m=0,1,2, every `u'`, `z > c` | 1113 words `uᵐu'z`, all Lyndon; first letter minimal in all | holds | none |
| 5.1 route (c1)–(c5), (d) | every necklace, k=2 n ≤ 9; k=3 n ≤ 6; k=4 n ≤ 4 | `j < p`, prefix `P`, larger next letter; periodic ⇒ successor aperiodic; `W` reads `γ`, `α a₁⋯a_(p−j−1)`; ends `Kⁿ`: 0 failures | holds | none |

- Source locators read at the text: 13 (Grinberg–Reiner: the lexicographic order p. 164; 6.1.4; 6.1.13; 6.1.14; 6.1.16; 6.1.19; 6.1.20; 6.1.25; 6.1.27 with its proof; 6.1.28; 6.1.29; 6.1.30; 6.1.34), all with the printed pages the README gives (GrinbergReiner lines 10178, 10283, 10295, 10314, 10385, 10434, 10484, 10496, 10498, 10568, 10582, 10697–10732); bibliography entry [38] is Chen–Fox–Lyndon (line 17623).
- Library declarations opened at the pin: `List.HasPeriod` (`Mathlib/Data/List/PeriodicityLemma.lean:42`), `hasPeriod_iff_getElem?` (:45), `HasPeriod.drop_prefix` (:132), `HasPeriod.gcd` (:185); `LinearOrder (List α)` (`Mathlib/Data/List/Lex.lean:141`); `Finset.sort` (`Mathlib/Data/Finset/Sort.lean:34`); `Finset.sup` (`Mathlib/Data/Finset/Lattice/Fold.lean:43`); `Nat.card` (`Mathlib/SetTheory/Cardinal/Finite.lean:39`); `Nat.sum_divisorsAntidiagonal` (`Mathlib/NumberTheory/Divisors.lean:526`, the additive form generated there); `ArithmeticFunction.sum_eq_iff_sum_mul_moebius_eq` (`Mathlib/NumberTheory/ArithmeticFunction/Moebius.lean:257`); `List.rotate` (`Batteries/Data/List/Basic.lean:625`). No declaration on Lyndon words, borders, necklaces or de Bruijn sequences in the pinned Mathlib or Tau Ceti.
- Cross-roadmap citations resolved: 2 (DirectedMatrixTreeAndBEST 5.2 at its open head, definition identical and explicit constructions excluded from its scope; AnabelianGeometryAndNonabelianChabauty, "Witt character and the surface relation", on main).
- Dependency check: `depcheck: 118 roadmaps, 1420 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the roadmap folder.
- Elaboration of `TauCetiRoadmap/CombinatoricsOfWords/Suggested.lean`: exit 0, nine `sorry` warnings and nothing else; single `import Mathlib`, no `set_option`, no sorry'd data. Elaborated types of all 14 declarations compared with the README statements: equal generality, no binder lost, nothing changed.
- One-tactic probe (`rfl`, `simp`, `simp` with the five definitions unfolded, `infer_instance`, `decide`) on a copy: none of the nine theorems closes.
- The worker's automatic checks all passed at this head.
- Duplication: a search for Lyndon, failure function, de Bruijn, necklace, Fine–Wilf, period, Chen–Fox, border and primitive word over all open heads and main found only the two roadmaps above and ArithmeticDynamics (C02).

Overlap check: the three closest-roadmap lists are empty; read DirectedMatrixTreeAndBEST (owner of `IsDeBruijn` and the count of de Bruijn sequences; this roadmap cites it and owns the explicit construction), ArithmeticDynamics 3.15 and 3.34 (owner of primitive binary necklaces and of its statement of the primitive root; here only a route step, see C02), AnabelianGeometryAndNonabelianChabauty (owner of the Witt character formula; nothing shared).

Source independence: 13 passages compared with 1 source (Grinberg–Reiner), none shared; largest share GrinbergReiner, 14 of 25 locators; contents compared with GrinbergReiner §6.1 (one section of its Chapter 6): independent, since Layers 1 and 5 come from elsewhere and Layers 2–4 reorder its results (6.1.20 before 6.1.16, 6.1.30 before 6.1.25), the order 2.2 before 3.1 being forced by the route of 3.1. The texts of Erickson and of Sawada–Williams–Wong could not be read, so wording was not compared with them.

Research link: Lyndon words and the Chen–Fox–Lyndon factorization (Chen, Fox and Lyndon, Annals of Mathematics 68) are the bijection behind polynomial generators of shuffle algebras and QSym and bases of free Lie algebras in Grinberg–Reiner (2020), Chapter 6; the de Bruijn construction is the one Sawada, Williams and Wong (2016) generalise. Rests on GrinbergReiner lines 10075–10078, 10480–10483 and the README's references.

## Not verifiable

- Erickson, §7.6, pp. 8–10 (the definition of `fail`, and the iteration and recursion cited in 1.1 and 1.2): the address on the author's site was not accepted by the sources service as an author's page, and no other copy was sought. The mathematics of 1.1 and 1.2 was verified by computation independently of the source.
- Sawada, Williams and Wong, Theorem 4 (p. 14), Definition 3 (p. 8), Lemma 1 (p. 6), Lemma 5 (p. 13), the statement on pp. 2–3, and the two misprints the README reports on p. 15: the journal's site is on a host the sources service does not classify, so the text was not read. The theorem of 5.1 and every step of its route were verified by computation independently of the source; the README's description of the source, including the misprints, is unchecked.

## Source issues

- none

## For the human reviewers

- Scope: Layer 1 (borders and the failure function, README lines 75–142) cites only Erickson's lecture notes on string matching; its two targets are stated as theorems on words, with no procedure. Whether this layer is in scope is yours to decide.
- Scope: the source with most locators, Grinberg–Reiner (arXiv:1409.8356v7), is an arXiv monograph; it attributes the results of Layers 2–4 to Chen–Fox–Lyndon (Annals of Mathematics 68), Lothaire and Reutenauer (GrinbergReiner lines 10078, 17623).
- Licence: Erickson's notes are cited as CC BY-NC-SA 4.0 on the author's site (README lines 544–546); the text was not read here, so the wording of 1.1 and 1.2 was not compared with it.
- Not tested: Sawada–Williams–Wong (Electronic Journal of Combinatorics 23(1), #P1.24) was not read; the locators of 5.1 and the README's report of two misprints on its p. 15 (README lines 436–441) are unchecked.
