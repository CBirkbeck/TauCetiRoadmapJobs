# Review of AnabelianGeometryAndNonabelianChabauty (pull request #3027 at e7914b5)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 29 changed lines since `aecb53a`. The change is one new section, §2.0a (Lyndon words and Radford's theorem on the shuffle algebra), with two references; its definition, theorem, reduction to finite alphabets and both Checks were recomputed and read against Hoffman's paper, and they hold. Accepted: no finding. There are three small corrections (one about the change, two in untouched text for a separate pull request) and one format note, none blocking; one fact about §2.0a is left to the human reviewers.

## C01 — The scope and Layer 2 dependency paragraphs do not record §2.0a

A reader of "Scope and ownership" cannot tell that this roadmap owns Radford's theorem, although BaseChangeAndGaloisRepresentationsForUnitaryGroups cites §2.0a as its owner (its README, lines 728 and 1469). The scope paragraph (line 8960) names neither the shuffle algebra, Lyndon words nor Radford's theorem, and the Layer 2 `### Dependencies` paragraph (line 5387) does not name Mathlib's `FreeMonoid`, `MvPolynomial` or `Algebra.TensorProduct`, which the *Needs:* line of §2.0a (line 4503) lists. One clause in each paragraph would record them.

## C02 — Untouched text: three locators in `README.md` (§0.31, §6.3, §7.3) point beside the cited material

- §6.3, line 7983, cites "[Balakrishnan and Dogra] §3.1, pp. 12–14" for the twisting construction. In that paper §3.1 is mixed extensions (bdii line 486); twisting is §3.2, which starts on p. 12 (bdii line 551).
- §7.3, line 8654, has "Lemma 59.97.9 (Tag 0F13)". Tag 0F13 is Section 59.97 (stacks line 237490); the lemma is Tag 0F1P (stacks line 237893).
- §0.31, line 2730, has "printed pp. 4–6" for twisting and nonabelian exactness; the exact sequence of pointed sets for a subgroup is on p. 9 (kim2005 lines 403–409).

The fixes would be "§3.2, pp. 12–13", "Lemma 59.97.9 (Tag 0F1P)" and "printed pp. 4–6 and 9". This text is not part of the change; it is for a separate pull request.

## C03 — Untouched text: the hypothesis line of §0.31 in `README.md` (line 2722) cannot be parsed

It reads "Parent action, orbit-fibre equivalence and kernel homeomorphisms embedded i retains its given topology f surjective.", so a reader cannot tell which hypotheses apply to which statement. A sentence with its verbs and punctuation restored (which statements, that an embedded kernel i keeps its given topology, that f is surjective) would fix it. For a separate pull request.

## N01 — Untouched text: code spans in §4.6 and the supplier contracts take in prose words

Line 6698 has the code spans "`subgroup H¹_g(G_F,V)`" and "`H¹_g at`", and line 9028 has "`subgroup H¹_g`". Moving "subgroup" and "at" outside the backticks fixes them.

## Previous findings

The previous report had no findings. Its small corrections and format note at this head:

- Earlier C01 (three locators) — not repaired: line 7983 still has "§3.1, pp. 12–14", line 8654 "Lemma 59.97.9 (Tag 0F13)", line 2730 "printed pp. 4–6". Untouched text: C02 above.
- Earlier C02 (hypothesis line of §0.31) — not repaired: line 2722 still reads "kernel homeomorphisms embedded i retains its given topology f surjective." Untouched text: C03 above.
- Earlier C03 (scope and dependencies omit §2.0a) — not repaired: C01 above.
- Earlier N01 (code spans) — not repaired: N01 above.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| §2.0a lexicographic order and Lyndon words | letters; `ab`, `ba`, `aab`, `abb`, `aba`; empty alphabet | letters: no factorization, Lyndon. `ab<b`, `aab<ab<b`, `abb<bb<b`: Lyndon. `ba>a`, `aba>a`: not. Empty word excluded | Agrees with hoffman-quasi-shuffle lines 114–117 |
| §2.0a Radford's theorem, char 0 | `𝔄=∅`; `{a}`; `{a<b}` degrees 1–3 | `∅`: `Sh=k=k[∅]`. `{a}`: `a^{⧢n}=n!·aⁿ`. `{a<b}`: monomials 2, 4, 8 against `2¹, 2², 2³` words | Holds |
| §2.0a, Check 1 (characteristic p) | p=2, 3 | `a⧢a=2aa=0` in char 2; `a⧢a⧢a=6aaa=0` in char 3; a nonzero nilpotent, so not a polynomial ring | Holds; hypothesis needed |
| §2.0a, Check 2 | degree 2 and 3 on `{a<b}` | `a⧢a=2aa`, `a⧢b=ab+ba`, `b⧢b=2bb`; degree 3: `a³,a²b,ab²,b³`, `a·ab`, `b·ab`, `aab`, `abb` = 8; Lyndon count by length 2,1,2 | Holds |
| §2.0a reduction to finite alphabets | `𝔅⊆𝔄` finite, induced order; `k⊇ℚ` | Lyndon test compares only words in the letters of w, so `Lyn(𝔅)=Lyn(𝔄)∩𝔅*`; a relation has finitely many letters; `Sh_k=k⊗_ℚ Sh_ℚ` on the word basis | Holds |
| §2.0a against Hoffman Theorem 2.2 | hypotheses of the source | source: `k⊂ℂ`, locally finite graded letters (lines 82–84), Theorem 2.2 at lines 119–120, credit to Radford and Reutenauer ch. 6 (lines 117–118, 921); finite alphabet in degree 1 qualifies, `ℚ⊂ℂ` | README's account of the source is accurate |
| §2.0a against §2.0 word algebra | W with basis a finite `𝔄` | restricted dual of `∏ W^⊗n` has the dual words as basis, shuffle product: `a⧢a=2aa` matches the Check of §2.0 (line 4479) | Consistent |
| Headline `anabelian_isom` (`Suggested.lean`, unchanged) | genus 0 control; e = identity in genus 2 | `P¹`: `PGL₂(K)` infinite, uniqueness would fail; excluded by `2 ≤ genus`. Genus 2, e=id: f=id satisfies the conclusion | Holds; elaborated type keeps `hfg`, both genus bounds, both finiteness instances |
| C02 locators | bdii, stacks, kim2005 | bdii lines 486 (§3.1 mixed extensions), 551 (§3.2 twisting, p. 12); stacks lines 237490 (0F13 = section), 237893 (0F1P = Lemma 59.97.9); kim2005 lines 403–409 on p. 9 | Three locators off |

- Source locators checked against the text: 7 (hoffman-quasi-shuffle §2 definition and Theorem 2.2, its credit line; bdii §3.1 and §3.2; stacks 0F13 and 0F1P; kim2005 p. 9). None of the seeded sample targets lies in the changed passage.
- Merge base against head: 29 insertions, 0 deletions; all 8 layers present with their titles; headings added: §2.0a and two references; nothing removed or renumbered. `Suggested.lean` has no diff.
- Library declarations: no Lyndon word, shuffle algebra or Radford statement in the pinned Mathlib or Tau Ceti (the only "Lyndon" hits are Lyndon's exact sequence, e.g. `TauCeti/Algebra/MonoidAlgebra/RelationModule/Basic.lean` line 113), so §2.0a restates nothing.
- Cross-roadmap citations resolved: BaseChangeAndGaloisRepresentationsForUnitaryGroups cites §2.0a (lines 728, 1360, 1362, 1469) and the section exists with that statement.
- Automatic checks: all passed on this head. Dependency check: `depcheck: 132 roadmaps, 1490 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line.
- Elaboration: `lake env lean` on `Suggested.lean` gives only the `sorry` warning (61:8). The elaborated types of the three declarations were compared with the README statement: no binder lost, nothing changed.
- Pull request text: the description says the additions to general roadmaps do not mention the family or the formal proof, and that this `Suggested.lean` is unchanged; §2.0a mentions neither, and the file has no diff. No other open pull request changes this folder.

Overlap check: searched InverseGaloisAndArithmeticFundamentalGroups, FunctionFieldArithmeticPartII, GaloisSectionsPadicPeriodMaps (open, closest by vocabulary), EffectiveDiophantineMethods, PadicDifferentialEquationsAndRigidCohomology, EtaleHomotopyTypes (main, closest by vocabulary) for the objects the change adds (Lyndon words, the shuffle algebra, Radford's theorem); the list by results is empty; nothing shared with them. Outside the lists, the open CombinatoricsOfWords (Layer 2.1) defines Lyndon words with the same order and definition and states no shuffle-algebra theorem; a roadmap on main cannot cite an open one, so §2.0a keeps its one-sentence definition (see the human reviewers' section).

Source independence: changed passages only: 5 passages of §2.0a compared with 1 source (hoffman-quasi-shuffle lines 112–120), none shared beyond the two order formulas the mathematics forces; Radford 1979 could not be read. Largest share of locators in the whole README is kim2005 (136 of 522, as counted in the last full review); the arrangement was not compared because no layer is added, removed or reordered.

Research link: Layers 2 and 4–6 develop the unipotent path torsors, Selmer varieties and quadratic Chabauty equations of Kim (2005, 2009) and Balakrishnan–Dogra (2018, 2021); Layer 3 the Isom theorems of Tamagawa (1997) and Mochizuki (1996, 1999); §2.0a is Radford's 1979 theorem as stated by Hoffman (2000). Rests on the README and the sources read.

## Not verifiable

- Radford 1979 (Journal of Algebra 58): paywalled; the theorem was read in Hoffman's statement of it (Theorem 2.2) only.
- Reutenauer, *Free Lie algebras*, chapter 6: not in the sources cache; the README does not give it a locator of its own.

## Source issues

- none

## For the human reviewers

- §2.0a (Lyndon words, Radford's theorem) is used by no other section of this roadmap; it is the general statement that BaseChangeAndGaloisRepresentationsForUnitaryGroups cites. The open roadmap CombinatoricsOfWords (Layer 2.1) also defines Lyndon words.
- Radford's 1979 paper, the primary source of §2.0a, is paywalled and was not read; the statement was checked against Hoffman, arXiv:math/9907173v1, Theorem 2.2.
