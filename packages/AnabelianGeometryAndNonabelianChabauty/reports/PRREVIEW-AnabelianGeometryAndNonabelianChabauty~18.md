# Review of AnabelianGeometryAndNonabelianChabauty (pull request #3027 at 7633b39)

**Verdict:** accepted

**Summary.** An incremental re-review of the 8 lines changed since `59b3c66`, and a check of the pull request's title and description against this head. The four changed sentences repair the two small corrections of the previous review: the three locators (§0.31, §6.3, §7.3) now point at the cited material, and the hypothesis line of §0.31 now says which standing hypotheses govern which statement. Each was checked against the source or the hypothesis list and is correct; the description's one statement about this roadmap is true of the head. Accepted: no finding, no small correction, one format note in untouched text; two facts about §2.0a are left to the human reviewers.

## N01 — Untouched text: code spans in §4.6 and the supplier contracts take in prose words

Line 6698 of `README.md` has the code spans "`subgroup H¹_g(G_F,V)`" and "`H¹_g at`", and line 9028 has "`subgroup H¹_g`". Moving "subgroup" and "at" outside the backticks fixes them.

## Previous findings

The previous report (of `59b3c66`) had no findings. Its small corrections and format note at this head:

- Earlier C01 (three locators) — repaired: line 7983 has "§§3.2–3.3, pp. 12–14"; line 8654 has "Lemma 59.97.9 (Tag 0F1P)"; line 2730 has "printed pp. 4–7 and 9". Each agrees with its source (table below).
- Earlier C02 (hypothesis line of §0.31) — repaired: line 2722 reads "The parent action and the orbit-fibre equivalence are taken under (H22), the named-kernel homeomorphism and its `H¹` comparison under (H20), and the embedded-kernel homeomorphism … under (H25) …".
- Earlier N01 (code spans) — not repaired: lines 6698 and 9028 are unchanged. N01 above.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| §0.31 hypothesis line (line 2722) against the standing hypotheses of the sections it transports | the six parent sections of its "Use" line | Twisted kernel invariant action and original-fibre orbits: (H22), lines 2380, 2529. Named-kernel `H¹` comparison: (H20), line 2099. Embedded-kernel `H¹`: (H25), line 2648 | Agree; (H25) has "A … given topology", "i … topological embedding", as the line says |
| §0.31 orbit-fibre equivalence and its Check (neutral kernel class maps to `[c]`, possibly nonneutral) | `G=C₂` acting trivially on `U=S₃`, `f=sign`, `V=C₂`; `c=1` and `c=`(a transposition) | `H¹(G,U)`: 2 classes; `H¹(G,V)`: 2. `c=1`: fibre 1, `H¹(G,A₃)=Hom(C₂,C₃)`: 1 class, 1 orbit. `c=t`: `K_c=C₃` with inversion, `Z¹=B¹=C₃`, 1 class, 1 orbit, fibre `{[c]}` ≠ neutral | Holds on both sides; f is surjective, as the line requires |
| §0.31 locator, kim2005 "printed pp. 4–7 and 9" | pages 4–7 and 9 of the source | Twisting and the twisted action run to p. 7 (kim2005 lines 290–300); the exact sequence of pointed sets for a subgroup is on p. 9 (lines 403–409) | Correct |
| §6.3 locator, bdii "§§3.2–3.3, pp. 12–14" | section heads and pages | §3.1 Mixed extensions (line 486); §3.2 Twisting and mixed extensions starts p. 12 (line 551); §3.3 starts p. 13 (line 601); twist `A(b)(P)` and the bimodule `A₂(b,z)` on p. 14 (lines 634–644) | Correct |
| §7.3 locator, Stacks "Lemma 59.97.9 (Tag 0F1P)", and the Künneth Check of §7.3 | the tag; `n=2`, `g=1` | stacks line 237893: Lemma 59.97.9 carries tag 0F1P (Künneth over a separably closed field). Check: `1+4g²+1=6=C(4,2)=dim H²` of an abelian surface | Correct |

The rows for untouched statements stand as in the previous review, of `59b3c66`.

- Changed passages: 4 sentences (lines 2722, 2730, 7983, 8654); no theorem, Check or Lean declaration changed; `Suggested.lean` has no diff since `59b3c66` or against the merge base. Of the seeded sample, none of the targets' statements lies in the changed passages (§7.3's locator line is the nearest, checked above).
- Source locators checked against the text: 3 (kim2005, bdii, stacks), all correct.
- Hypothesis labels resolved: (H20), (H22), (H25) at lines 87, 91, 97 and their uses at lines 2066–2681.
- Merge base against head: 35 insertions, 6 deletions, all in `README.md`; all 8 layers present with their titles; headings added: §2.0a and two references; nothing removed or renumbered.
- Cross-roadmap citations resolved: BaseChangeAndGaloisRepresentationsForUnitaryGroups 13.0a (line 736) and its supplier contract (line 1484) cite §2.0a, present at line 4484. The citation of AlgebraicVectorBundles "Layers 0A and 0B" (line 8966) resolves through that roadmap's table of labels (its lines 57–84).
- Automatic checks: all passed on this head. Dependency check: `depcheck: 122 roadmaps, 1411 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration: `lake env lean` on `Suggested.lean` gives only the `sorry` warning (61:8). The three elaborated types are those of the previous review: no binder lost, nothing changed.
- Pull request text: the title names the move of published theory to the general roadmaps, of which §2.0a is one case. The description says BaseChangeAndGaloisRepresentationsForUnitaryGroups gains this roadmap as a supplier through "§2.0a (Radford's theorem on the shuffle algebra, the general theorem of which its 13.0a is a corollary)", a section "added here", and that "The additions do not mention the family or the formal proof": true of the head. No section is removed or renumbered, no Lean declaration changes and no supplier of this roadmap changes; the four locator and wording repairs change no stated result, so the text leaves nothing a reader must know unstated. The quoted description is cut in its part 2; what follows the cut was not read. The counts "49 existing roadmaps" and "196 sections" concern the whole pull request and were not recounted here.
- No other open pull request changes this folder; no id it cites is dropped by an open pull request.

Overlap check: read InverseGaloisAndArithmeticFundamentalGroups, PadicDifferentialEquationsAndRigidCohomology, EffectiveDiophantineMethods (main, closest by vocabulary) and FunctionFieldArithmeticPartII, NeronModelsAndSemistableAbelianVarieties, GaloisSectionsPadicPeriodMaps (open, closest by vocabulary) as in the previous review; the list by results is empty; the changed passages name no new object; nothing shared.

Source independence: changed passages only: 4 sentences compared with 3 sources (kim2005 lines 290–300 and 403–409, bdii lines 551–659, stacks line 237893), none shared; three are locators and one is the roadmap's own bookkeeping of hypotheses. Largest share of locators in the whole README is kim2005 (136 of 522, as counted in the last full review); the arrangement was not compared because no layer is added, removed or reordered.

Research link: Layers 2 and 4–6 develop the unipotent path torsors, Selmer varieties and quadratic Chabauty equations of Kim (2005, 2009) and Balakrishnan–Dogra (2018, 2021); Layer 3 the Isom theorems of Tamagawa (1997) and Mochizuki (1996, 1999); §2.0a is Radford's 1979 theorem as stated by Hoffman (2000). Rests on the README and the sources read.

## Not verifiable

- Radford 1979 (Journal of Algebra 58): paywalled; the theorem was read in Hoffman's statement of it (Theorem 2.2) only, in the previous review.
- The part of the pull request's description after the cut of the quoted text: not read.

## Source issues

- none

## For the human reviewers

- §2.0a (Lyndon words, Radford's theorem) is used by no other section of this roadmap; it is the general statement that BaseChangeAndGaloisRepresentationsForUnitaryGroups 13.0a cites. The open roadmap CombinatoricsOfWords (Layer 2.1) also defines Lyndon words.
- Radford's 1979 paper, the primary source of §2.0a, is paywalled and was not read; the statement was checked against Hoffman, arXiv:math/9907173v1, Theorem 2.2.
- The decision that the family's published theorems live in the general roadmaps was applied: BaseChangeAndGaloisRepresentationsForUnitaryGroups 13.0a names §2.0a, and §2.0a states the theorem in full.
