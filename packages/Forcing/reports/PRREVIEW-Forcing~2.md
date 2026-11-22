# Review of Forcing (pull request #2998 at 855a650)

**Verdict:** accepted

**Summary.** Accepted: the one finding of the previous review is repaired, since Layer 8 now consumes the measure algebra of a finite measure from VonNeumannAlgebras Layer 2 and owns only the descended measure, completeness by essential suprema and ccc. The four small corrections are repaired as well, and the new statement `DenseOrderEmbedding.pullTest_isCoinitial` is true and uses the density of the range. One format note remains, not blocking, and the two points for the human reviewers stand (the Apache-2.0 repository the Lean prototypes draw on, and the unpublished lecture notes among the main sources).

## N01 — Layer items are numbered list items

The targets of each layer are still list items (`1.`, `2.`, …) and not `### k.n` subsections. They are now cited one way throughout ("Layer 6 item 2", in the README and in the Lean docstrings), so the remaining point is only that a heading per target would give each one a linkable id.

## Previous findings

- R01 — repaired: "For a finite measure space, consume the measure algebra of VonNeumannAlgebras Layer 2: the measurable sets modulo null sets, with metric `d(A, B) = μ(A △ B)`"; contract "From VonNeumannAlgebras" and the Layer 8 Dependencies line added.
- C01 — repaired: "The start of Hamkins–Seabold §8 (p. 19) asserts the correspondence of generic filters on `P` and on its completion, not the formula comparison"; agrees with HamkinsSeabold line 935–937.
- C02 — repaired: `genericFor_map_iff` is marked "Sanity check that `pullTest` is the right pullback, not a headline target", and `pullTest_isCoinitial` states the transport of dense tests, which uses `dense_range`.
- C03 — repaired: `regularCondition p` is `Heyting.Regular.toRegular (LowerSet.Iic p)`; `principalLower` is gone and the file elaborates.
- C04 — repaired: "(as `ForcesFormula` of `cameronfreer/forcing` does)".
- N01 — repaired: the file opens with `module` and the single line `public import Mathlib`, the form the roadmaps on main use.
- N02 — partly repaired: one citation form, "README Layer 6 item 2", is used throughout; the items remain numbered list items (N01 of this report).
- N03 — repaired: the module docstring says the file "does not state the material forcing theorem, ZFC preservation, the formula comparison of Layer 6, the worked forcing notions or two-step factorization" and names the missing carriers.

## Verified sound

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| `DenseOrderEmbedding.pullTest_isCoinitial` (new) | general `p`; `P = ∅`; `P = {0}`, `Q = {0 < 1}`, `e 0 = 1`, `D = {0}` (range not dense) | `q ∈ D`, `q ≤ e p`; `e p' ≤ q` by density; `p' ≤ p` by embedding. Control: `pullTest D = ∅`, not coinitial | true; density of range needed; proved on a copy in four lines |
| same, one-tactic probe | `simp` and `simp_all` with the definitions, `aesop` | all three leave the goal `∀ x, ∃ y, (∃ q ∈ D, e y ≤ q) ∧ y ≤ x` | not padding |
| `regularCondition` (body changed) | `LowerSet.Iic p` against the removed helper | carrier `Set.Iic p` on both sides; `regularCondition_le_iff`, `regularCondition_ne_bot` elaborate unchanged | same object |
| `genericFor_map_iff` (docstring changed) | unfold both sides | `∃ q ∈ D, ∃ p ∈ G, e p ≤ q` on each side | true by unfolding, and now marked so |
| Layer 8 item 1, `μ̄(a) = d(a, 0)` | counting measure on two points; Dirac mass at `0` on `{0, 1}` | `d(A, ∅) = μ(A)`; four classes, `μ̄{0} = 1 > 0`; two classes, class of `{1}` is `0` with `μ̄ = 0` | strictly positive exactly on nonzero classes |
| Layer 8 item 1, completeness and ccc | finite `μ`; antichain of positive classes | sup of measures of finite joins is attained by a countable subfamily; at most `n·μ(X)` disjoint classes of measure `> 1/n` | true for finite measures |
| References row, Karagila Theorem 4.16 | the statement at Karagila line 904; Definition 1.2 at line 130; `ℕ` with larger stronger | "iff" stated for every notion of forcing (a preorder with a greatest element); tails dense open with empty intersection, no new sets | README sentence true |
| References row, Hamkins–Seabold §8 | HamkinsSeabold line 935–937, p. 19 | generic filters on `P` and on `B` generate each other; no forcing-relation formula there | README sentence true |
| VonNeumannAlgebras Layer 2 citation | README on main, line 647–649, after V2.RectangularL2 (line 628) | "For finite measures develop the measure algebra modulo null sets with metric `μ(A△B)`" | citation resolves; supplier earlier in the merge order |

The rows of the previous review, of `2fe4929`, stand for the untouched statements.

- Source locators checked against the text: 2 (Hamkins–Seabold §8, p. 19; Karagila Theorem 4.16 with Definition 1.2 and the Remark after it), both as the README now says.
- Library declarations opened at the pin: `IsCofinal` and its dual `IsCoinitial` (`Mathlib/Order/Bounds/Defs.lean`, line 65), `LowerSet.Iic`; no declaration relating `IsCoinitial` to a pullback along an order embedding (`Mathlib/Order/Bounds/Image.lean` has only the image form for `IsCoinitialFor`, line 327).
- Cross-roadmap citations resolved: 1 (VonNeumannAlgebras Layer 2, on main).
- Dependency check: `depcheck: 133 roadmaps, 1474 edges, 0 problem(s)`; no UPWARD or CYCLE line. The merge order lists this roadmap last, after VonNeumannAlgebras.
- Elaboration of `TauCetiRoadmap/Forcing/Suggested.lean` at the pins: 20 `sorry` warnings and nothing else; no sorry'd data, no `set_option`. `#check @pullTest_isCoinitial` shows both `Preorder` binders and the embedding `e`.
- Pull request text against this head: 20 admitted statements and one proved (agrees); the VonNeumannAlgebras supplier is stated; nothing outside `TauCetiRoadmap/Forcing/` changes.
- Ownership against open pull requests: the measure algebra, essential suprema, Rasiowa–Sikorski, generic filters and ccc were searched over all open heads and main; BochnerSpaces also consumes the VonNeumannAlgebras measure algebra and does not own its completeness or ccc.
- Automatic checks: one about form (the layers state their targets as list items, N01); the note that the roadmap is not yet in the merge order is not a defect.

Overlap check: read VonNeumannAlgebras (main), HanfNumbers, ModalLogicCompleteness, SaturationAndQuantifierElimination (open), RandomGraphs, CountableStructureSpaces (main); nothing shared with the last five; the finite measure algebra is shared with VonNeumannAlgebras, its owner, and is now cited there.

Source independence: changed passages only; 2 passages compared with 2 sources (Hamkins–Seabold, Karagila), none shared; largest share Karagila, 21 of about 43 locators, as in the previous review; the diff adds, removes and reorders no layer, so the contents were not compared again.

Research link: The forcing theorem, ZFC preservation and the Cohen model of ¬CH are the prerequisites of independence results; Layers 3 and 6 are the setting of Hamkins–Seabold (2012) on Boolean ultrapowers and of Han–van Doorn (2019); rests on the README's references and the Hamkins–Seabold text.

## Not verifiable

- The claims about `cameronfreer/forcing` at `5d77761d` (that its `ForcesFormula` quantifies over a stated family of names, `MaterialGround.truth_lemma_maximal`, `InternalForcingPresentation`): the repository's declarations were not opened.
- Kunen, Jech and Bell are listed without locators and were not read; no statement rests on them alone.
- Fremlin's volumes were not read again; the row that cites them did not change.

Automatic checks set aside as false positives: the lead that `PName.val`, `PName.relabel` and `PName.val_relabel` lost the `Preorder` binder (they are order-free by design); the lead that `PName.val_relabel` is found nowhere (the roadmap's own `Suggested.lean` declares it); the lead that `MaterialGround.truth_lemma_maximal` is found nowhere (the README attributes it to the external repository it names).

## Source issues

- **Gap** in Karagila at Theorem 4.16, printed page 22–23: the source says a forcing is κ-distributive exactly when it adds no short sequences of ground elements, for any notion of forcing; it should be assume the order separative for the converse (the reversed order on ℕ is a counterexample); affects a stated result.

## For the human reviewers

- Licence: `TauCetiRoadmap/Forcing/Suggested.lean` lines 20–21 say its order and genericity prototypes draw on the Apache-2.0 repository `cameronfreer/forcing`, owned by the pull request's author; the declarations were not compared with that repository's code.
- Scope: the locators rest mainly on unpublished lecture notes on their authors' pages (Karagila, 21 locators; Eskew, 1) and a 2012 arXiv manuscript (Hamkins–Seabold); the refereed textbooks (Kunen, Jech, Bell) are listed without locators.
