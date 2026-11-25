# Review of AnabelianGeometryAndNonabelianChabauty (pull request #3027 at 59b3c66)

**Verdict:** accepted

**Summary.** An incremental re-review of the 4 lines changed since `e7914b5`, and a check of the pull request's title and description against this head. The two changed sentences record §2.0a in the Layer 2 dependencies and in "Scope and ownership", as the previous review asked; both agree with §2.0a, and the description's one statement about this roadmap is true of the head. Accepted: no finding. Two small corrections and one format note remain, all in untouched text and none blocking; two facts about §2.0a are left to the human reviewers.

## C01 — Untouched text: three locators in `README.md` (§0.31, §6.3, §7.3) point beside the cited material

- §6.3, line 7983, cites "§3.1, pp. 12–14" of Balakrishnan and Dogra for the twisting construction. In that paper §3.1 is mixed extensions (bdii line 486); twisting is §3.2, which starts on p. 12 (bdii line 551).
- §7.3, line 8654, has "Lemma 59.97.9 (Tag 0F13)". Tag 0F13 is Section 59.97 (stacks line 237490); the lemma is Tag 0F1P (stacks line 237893).
- §0.31, line 2730, has "printed pp. 4–6" for twisting and nonabelian exactness; the exact sequence of pointed sets for a subgroup is on p. 9 (kim2005 lines 403–409).

The fixes would be "§3.2, pp. 12–13", "Lemma 59.97.9 (Tag 0F1P)" and "printed pp. 4–6 and 9". This text is not part of the change; it can go in a separate pull request.

## C02 — Untouched text: the hypothesis line of §0.31 in `README.md` (line 2722) cannot be parsed

It reads "Parent action, orbit-fibre equivalence and kernel homeomorphisms embedded i retains its given topology f surjective.", so a reader cannot tell which hypotheses apply to which statement. A sentence with its verbs and punctuation restored (which statements, that an embedded kernel i keeps its given topology, that f is surjective) would fix it. For a separate pull request.

## N01 — Untouched text: code spans in §4.6 and the supplier contracts take in prose words

Line 6698 has the code spans "`subgroup H¹_g(G_F,V)`" and "`H¹_g at`", and line 9028 has "`subgroup H¹_g`". Moving "subgroup" and "at" outside the backticks fixes them.

## Previous findings

The previous report (of `e7914b5`) had no findings. Its small corrections and format note at this head:

- Earlier C01 (scope and Layer 2 dependencies omit §2.0a) — repaired: line 5387 ends "`FreeMonoid`, `MvPolynomial` and `Algebra.TensorProduct` (Lyndon words and Radford's theorem, §2.0a)"; line 8960 has "Section 2.0a owns Lyndon words on a linearly ordered alphabet and Radford's theorem …".
- Earlier C02 (three locators) — not repaired: lines 7983, 8654 and 2730 are unchanged. Untouched text: C01 above.
- Earlier C03 (hypothesis line of §0.31) — not repaired: line 2722 is unchanged. Untouched text: C02 above.
- Earlier N01 (code spans) — not repaired: lines 6698 and 9028 are unchanged. N01 above.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| Scope sentence on §2.0a (line 8960) against Radford's theorem in §2.0a (line 4488) | `𝔄={a<b}`, degree 4; `𝔄={a}` in characteristic p | Lyndon words by length: 2, 1, 2, 3 (`aaab`, `aabb`, `abbb`). Degree-4 monomials: 3+4+1+3+5 = 16 = 2⁴ words. Char p: `a^{⧢p}=p!·a^p=0` | Holds; both hypotheses of the sentence (linear order, characteristic zero) are those of §2.0a |
| Layer 2 dependency clause (line 5387) against the *Needs:* line of §2.0a (line 4503) | the three Mathlib names | *Needs:* lists `FreeMonoid`, `MvPolynomial`, `Algebra.TensorProduct`; the clause lists the same three, with the section number | Agree |

The rows for untouched statements stand as in the previous review, of `e7914b5`.

- Changed passages: 2 sentences (lines 5387 and 8960); no statement, Check, locator or Lean declaration changed; `Suggested.lean` has no diff since `e7914b5` or against the merge base. None of the seeded sample targets lies in the changed passages.
- Library declarations opened at the pin: `FreeMonoid` (`Mathlib/Algebra/FreeMonoid/Basic.lean` line 51), `MvPolynomial` (`Mathlib/Algebra/MvPolynomial/Basic.lean` line 80), the algebra structure on a tensor product (`Mathlib/RingTheory/TensorProduct/Basic.lean` lines 231 and 248). No Lyndon word or shuffle algebra in the pinned Mathlib or Tau Ceti.
- Merge base against head: 31 insertions, 2 deletions, all in `README.md`; all 8 layers present with their titles; headings added: §2.0a and two references; nothing removed or renumbered.
- Cross-roadmap citations resolved: BaseChangeAndGaloisRepresentationsForUnitaryGroups 13.0a (its `*Corollary of:*` line, line 734, and its supplier contract, line 1475) cites §2.0a, which states the theorem in full; on main that roadmap stated it itself (its line 555), so the general statement now has one owner, as the human reviewers' decision on the family requires.
- Automatic checks: all passed on this head. Dependency check: `depcheck: 122 roadmaps, 1411 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration: `lake env lean` on `Suggested.lean` gives only the `sorry` warning (61:8). The three elaborated types are those of the previous review: no binder lost, nothing changed.
- Pull request text: the title names the move of published theory to the general roadmaps, of which §2.0a is one case. The description says BaseChangeAndGaloisRepresentationsForUnitaryGroups gains this roadmap as a supplier through "§2.0a (Radford's theorem on the shuffle algebra, the general theorem of which its 13.0a is a corollary)", a section "added here", and that "The additions do not mention the family or the formal proof": §2.0a is added by this pull request, states that theorem and mentions neither. No section is removed or renumbered, no Lean declaration changes and no supplier of this roadmap changes, so the text leaves nothing about this folder unstated. The quoted description is cut in its part 3; what follows the cut was not read. The counts "49 existing roadmaps" and "196 sections" concern the whole pull request and were not recounted here.
- No other open pull request changes this folder; no id it cites is dropped by an open pull request.

Overlap check: read InverseGaloisAndArithmeticFundamentalGroups, PadicDifferentialEquationsAndRigidCohomology, EffectiveDiophantineMethods (main, closest by vocabulary) and FunctionFieldArithmeticPartII, GaloisSectionsPadicPeriodMaps, NeronModelsAndSemistableAbelianVarieties (open, closest by vocabulary) for the object the changed sentences name (Lyndon words, the shuffle algebra, Radford's theorem); the list by results is empty; nothing shared. Outside the lists, the open CombinatoricsOfWords defines Lyndon words and states no shuffle-algebra theorem; a roadmap on main does not cite an open one, so §2.0a keeps its one-sentence definition (see the human reviewers' section).

Source independence: changed passages only: 2 sentences compared with 1 source (hoffman-quasi-shuffle lines 112–120), none shared; they are the roadmap's own bookkeeping. Largest share of locators in the whole README is kim2005 (136 of 522, as counted in the last full review); the arrangement was not compared because no layer is added, removed or reordered.

Research link: Layers 2 and 4–6 develop the unipotent path torsors, Selmer varieties and quadratic Chabauty equations of Kim (2005, 2009) and Balakrishnan–Dogra (2018, 2021); Layer 3 the Isom theorems of Tamagawa (1997) and Mochizuki (1996, 1999); §2.0a is Radford's 1979 theorem as stated by Hoffman (2000). Rests on the README and the sources read.

## Not verifiable

- Radford 1979 (Journal of Algebra 58): paywalled; the theorem was read in Hoffman's statement of it (Theorem 2.2) only.
- Reutenauer, *Free Lie algebras*, chapter 6: not in the sources cache; the README gives it no locator of its own.
- The part of the pull request's description after the cut of the quoted text (the end of its part 3 onwards): not read.

## Source issues

- none

## For the human reviewers

- §2.0a (Lyndon words, Radford's theorem) is used by no other section of this roadmap; it is the general statement that BaseChangeAndGaloisRepresentationsForUnitaryGroups 13.0a cites. The open roadmap CombinatoricsOfWords (Layer 2.1) also defines Lyndon words.
- Radford's 1979 paper, the primary source of §2.0a, is paywalled and was not read; the statement was checked against Hoffman, arXiv:math/9907173v1, Theorem 2.2.
- The decision that the family's published theorems live in the general roadmaps was applied: BaseChangeAndGaloisRepresentationsForUnitaryGroups 13.0a names §2.0a, and §2.0a states the theorem in full.
